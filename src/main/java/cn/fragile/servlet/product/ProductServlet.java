package cn.fragile.servlet.product;

import cn.fragile.pojo.Product;
import cn.fragile.pojo.User;
import cn.fragile.service.product.ProductService;
import cn.fragile.service.product.ProductServiceImpl;
import cn.fragile.tools.Constants;
import com.alibaba.fastjson.JSONArray;
import com.jspsmart.upload.*;
import com.mysql.jdbc.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class ProductServlet extends HttpServlet {


	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if(method != null && method.equals("query")){
			this.query(request,response);
		}else if(method != null && method.equals("add")){
			this.add(request,response);
		}else if(method != null && method.equals("view")){
			this.getProductById(request,response,"productview.jsp");
		}else if(method != null && method.equals("modify")){
			this.getProductById(request,response,"productmodify.jsp");
		}else if(method != null && method.equals("image")){
			this.getProductById(request,response,"pictureadd.jsp");
		}else if(method != null && method.equals("modifysave")){
			this.modify(request,response);
		}else if(method != null && method.equals("delproduct")){
			this.delProduct(request,response);
		}
	}
	
	private void delProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("proid");
		HashMap<String, String> resultMap = new HashMap<String, String>();
		if(!StringUtils.isNullOrEmpty(id)){
			ProductService productService = new ProductServiceImpl();
			int flag = productService.deleteProductById(id);
			if(flag == 0){
				resultMap.put("delResult", "true");
			}else if(flag == -1){
				resultMap.put("delResult", "false");
			}else if(flag > 0){
				resultMap.put("delResult", String.valueOf(flag));
			}
		}else{
			resultMap.put("delResult", "notexit");
		}
		//把resultMap转换成json对象输出
		response.setContentType("application/json");
		PrintWriter outPrintWriter = response.getWriter();
		outPrintWriter.write(JSONArray.toJSONString(resultMap));
		outPrintWriter.flush();
		outPrintWriter.close();
	}
	
	private void modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String proDeveloper = request.getParameter("proDeveloper");
		String proPublisher = request.getParameter("proPublisher");
		String proDate = request.getParameter("proDate");
		Integer proPrice = Integer.valueOf(request.getParameter("proPrice"));
		String proDesc = request.getParameter("proDesc");
		String id = request.getParameter("pid");
		String proName = request.getParameter("proName");
		String proFilename = request.getParameter("proFilename");
		Integer proCate = Integer.valueOf(request.getParameter("proCate"));

		Product product = new Product();
		product.setId(Integer.valueOf(id));
		product.setProName(proName);
		product.setProDeveloper(proDeveloper);
		product.setProPublisher(proPublisher);
		try {
			product.setProDate(new SimpleDateFormat("yyyy-MM-dd").parse(proDate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		product.setProPrice(proPrice);
		product.setProDesc(proDesc);
		product.setModifyBy(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());
		product.setModifyDate(new Date());
		product.setProFilename(proFilename);
		product.setProCate(proCate);

		boolean flag = false;
		ProductService productService = new ProductServiceImpl();
		flag = productService.modify(product);
		if(flag){
			response.sendRedirect(request.getContextPath()+"/jsp/product.do?method=query");
		}else{
			request.getRequestDispatcher("productmodify.jsp").forward(request, response);
		}
	}
	
	private void getProductById(HttpServletRequest request, HttpServletResponse response,String url)
			throws ServletException, IOException {
		String id = request.getParameter("proid");
		if(!StringUtils.isNullOrEmpty(id)){
			ProductService productService = new ProductServiceImpl();
			Product product = null;
			product = productService.getProductById(id);
			request.setAttribute("product", product);
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
	private void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		Product product = new Product();
		product.setCreatedBy(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());

		String proCode = request.getParameter("proCode");
		String proName = request.getParameter("proName");
		String proDeveloper = request.getParameter("proDeveloper");
		String proPublisher = request.getParameter("proPublisher");
		String proDate = request.getParameter("proDate");
		Integer proPrice = Integer.valueOf(request.getParameter("proPrice"));
		String proDesc = request.getParameter("proDesc");
		Integer proCate = Integer.valueOf(request.getParameter("proCate"));
		String proFilename = request.getParameter("proFilename");


		product.setProCode(proCode);
		product.setProName(proName);
		product.setProDeveloper(proDeveloper);
		product.setProPublisher(proPublisher);
		try {
			product.setProDate(new SimpleDateFormat("yyyy-MM-dd").parse(proDate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		product.setProPrice(proPrice);
		product.setProDesc(proDesc);

		product.setCreationDate(new Date());
		product.setProCate(proCate);
		product.setProFilename(proFilename);

		boolean flag = false;
		ProductService productService = new ProductServiceImpl();
		flag = productService.add(product);
		if(flag){
			response.sendRedirect(request.getContextPath()+"/jsp/product.do?method=query");
		}else{
			request.getRequestDispatcher("productadd.jsp").forward(request, response);

		}
	}

	private void query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String queryProName = request.getParameter("queryProName");
		String queryProCode = request.getParameter("queryProCode");
		if(StringUtils.isNullOrEmpty(queryProName)){
			queryProName = "";
		}
		if(StringUtils.isNullOrEmpty(queryProCode)){
			queryProCode = "";
		}
		List<Product> productList = new ArrayList<Product>();
		ProductService productService = new ProductServiceImpl();
		productList = productService.getProductList(queryProName,queryProCode);
		request.setAttribute("productList", productList);
		request.setAttribute("queryProName", queryProName);
		request.setAttribute("queryProCode", queryProCode);
		request.getRequestDispatcher("productlist.jsp").forward(request, response);
	}
	
	
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
	}

}
