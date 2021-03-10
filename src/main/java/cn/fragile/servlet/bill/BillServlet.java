package cn.fragile.servlet.bill;

import cn.fragile.pojo.Bill;
import cn.fragile.pojo.Product;
import cn.fragile.pojo.User;
import cn.fragile.service.bill.BillService;
import cn.fragile.service.bill.BillServiceImpl;
import cn.fragile.service.product.ProductService;
import cn.fragile.service.product.ProductServiceImpl;
import cn.fragile.tools.Constants;
import com.alibaba.fastjson.JSONArray;
import com.mysql.jdbc.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class BillServlet extends HttpServlet {

	@Override
	public void destroy() {
		super.destroy();
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String method = request.getParameter("method");
		if(method != null && method.equals("query")){
			this.query(request,response);
		}else if(method != null && method.equals("add")){
			this.add(request,response);
		}else if(method != null && method.equals("view")){
			this.getBillById(request,response,"billview.jsp");
		}else if(method != null && method.equals("modify")){
			this.getBillById(request,response,"billmodify.jsp");
		}else if(method != null && method.equals("modifysave")){
			this.modify(request,response);
		}else if(method != null && method.equals("delbill")){
			this.delBill(request,response);
		}else if(method != null && method.equals("getproviderlist")){
			this.getProviderlist(request,response);
		}
		
	}
	
	private void getProviderlist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("getproviderlist ========================= ");
		
		List<Product> productList = new ArrayList<Product>();
		ProductService productService = new ProductServiceImpl();
		productList = productService.getProductList("","");
		response.setContentType("application/json");
		PrintWriter outPrintWriter = response.getWriter();
		outPrintWriter.write(JSONArray.toJSONString(productList));
		outPrintWriter.flush();
		outPrintWriter.close();
	}
	private void getBillById(HttpServletRequest request, HttpServletResponse response,String url)
			throws ServletException, IOException {
		String id = request.getParameter("billid");
		if(!StringUtils.isNullOrEmpty(id)){
			BillService billService = new BillServiceImpl();
			Bill bill = null;
			bill = billService.getBillById(id);
			request.setAttribute("bill", bill);
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
	
	private void modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("modify===============");
		String id = request.getParameter("id");
		String productName = request.getParameter("productName");
		String productDesc = request.getParameter("productDesc");
		String productUnit = request.getParameter("productUnit");
		String productCount = request.getParameter("productCount");
		String totalPrice = request.getParameter("totalPrice");
		String providerId = request.getParameter("providerId");
		String isPayment = request.getParameter("isPayment");
		
		Bill bill = new Bill();
		bill.setId(Integer.valueOf(id));
		bill.setProductName(productName);
		bill.setProductDesc(productDesc);
		bill.setProductUnit(productUnit);
		bill.setProductCount(new BigDecimal(productCount).setScale(2,BigDecimal.ROUND_DOWN));
		bill.setIsPayment(Integer.parseInt(isPayment));
		bill.setTotalPrice(new BigDecimal(totalPrice).setScale(2,BigDecimal.ROUND_DOWN));
		bill.setProviderId(Integer.parseInt(providerId));
		
		bill.setModifyBy(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());
		bill.setModifyDate(new Date());
		boolean flag = false;
		BillService billService = new BillServiceImpl();
		flag = billService.modify(bill);
		if(flag){
			response.sendRedirect(request.getContextPath()+"/jsp/bill.do?method=query");
		}else{
			request.getRequestDispatcher("billmodify.jsp").forward(request, response);
		}
	}
	private void delBill(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("billid");
		HashMap<String, String> resultMap = new HashMap<String, String>();
		if(!StringUtils.isNullOrEmpty(id)){
			BillService billService = new BillServiceImpl();
			boolean flag = billService.deleteBillById(id);
			if(flag){
				resultMap.put("delResult", "true");
			}else{
				resultMap.put("delResult", "false");
			}
		}else{
			resultMap.put("delResult", "notexit");
		}
		response.setContentType("application/json");
		PrintWriter outPrintWriter = response.getWriter();
		outPrintWriter.write(JSONArray.toJSONString(resultMap));
		outPrintWriter.flush();
		outPrintWriter.close();
	}
	private void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String billCode = request.getParameter("billCode");
		String productName = request.getParameter("productName");
		String productDesc = request.getParameter("productDesc");
		String productUnit = request.getParameter("productUnit");
		
		String productCount = request.getParameter("productCount");
		String totalPrice = request.getParameter("totalPrice");
		String providerId = request.getParameter("providerId");
		String isPayment = request.getParameter("isPayment");
		
		Bill bill = new Bill();
		bill.setBillCode(billCode);
		bill.setProductName(productName);
		bill.setProductDesc(productDesc);
		bill.setProductUnit(productUnit);
		bill.setProductCount(new BigDecimal(productCount).setScale(2,BigDecimal.ROUND_DOWN));
		bill.setIsPayment(Integer.parseInt(isPayment));
		bill.setTotalPrice(new BigDecimal(totalPrice).setScale(2,BigDecimal.ROUND_DOWN));
		bill.setProviderId(Integer.parseInt(providerId));
		bill.setCreatedBy(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());
		bill.setCreationDate(new Date());
		boolean flag = false;
		BillService billService = new BillServiceImpl();
		flag = billService.add(bill);
		System.out.println("add flag -- > " + flag);
		if(flag){
			response.sendRedirect(request.getContextPath()+"/jsp/bill.do?method=query");
		}else{
			request.getRequestDispatcher("billadd.jsp").forward(request, response);
		}
	}
	private void query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<Product> productList = new ArrayList<Product>();
		ProductService productService = new ProductServiceImpl();
		productList = productService.getProductList("","");
		request.setAttribute("providerList", productList);
		
		String queryProductName = request.getParameter("queryProductName");
		String queryProviderId = request.getParameter("queryProviderId");
		String queryIsPayment = request.getParameter("queryIsPayment");
		if(StringUtils.isNullOrEmpty(queryProductName)){
			queryProductName = "";
		}
		
		List<Bill> billList = new ArrayList<Bill>();
		BillService billService = new BillServiceImpl();
		Bill bill = new Bill();
		if(StringUtils.isNullOrEmpty(queryIsPayment)){
			bill.setIsPayment(0);
		}else{
			bill.setIsPayment(Integer.parseInt(queryIsPayment));
		}
		
		if(StringUtils.isNullOrEmpty(queryProviderId)){
			bill.setProviderId(0);
		}else{
			bill.setProviderId(Integer.parseInt(queryProviderId));
		}
		bill.setProductName(queryProductName);
		billList = billService.getBillList(bill);
		request.setAttribute("billList", billList);
		request.setAttribute("queryProductName", queryProductName);
		request.setAttribute("queryProviderId", queryProviderId);
		request.setAttribute("queryIsPayment", queryIsPayment);
		request.getRequestDispatcher("billlist.jsp").forward(request, response);
		
	}
	
	public static void main(String[] args) {
		System.out.println(new BigDecimal("23.235").setScale(2,BigDecimal.ROUND_HALF_DOWN));
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
	}

}
