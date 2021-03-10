package cn.fragile.servlet.cart;

import cn.fragile.pojo.Product;
import cn.fragile.pojo.Cart;
import cn.fragile.pojo.User;
import cn.fragile.service.cart.CartService;
import cn.fragile.service.cart.CartServiceImpl;
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
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class CartServlet extends HttpServlet {

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
        if(method != null && method.equals("querycart")){
            this.query(request,response);
        }else if(method != null && method.equals("addcart")){
            this.add(request,response);
        }else if(method != null && method.equals("delcart")){
            this.delProduct(request,response);
        }
    }

    private void delProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("cartid");
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if(!StringUtils.isNullOrEmpty(id)){
            CartService cartService = new CartServiceImpl();
            boolean flag = cartService.deleteCartById(id);
            if(flag){
                resultMap.put("delResult", "true");
                response.sendRedirect(request.getContextPath()+"/jsp/cart.do?method=querycart");
            }else{
                resultMap.put("delResult", "false");
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

        Cart cart = new Cart();
        cart.setCart_uid(((User)request.getSession().getAttribute(Constants.USER_SESSION)).getId());

        String pId = request.getParameter("pId");
        String pImage = request.getParameter("pImage");
        String pName = request.getParameter("pName");
        String pPrice = request.getParameter("pPrice");
        System.out.println(pPrice);
        System.out.println(pName);
        System.out.println(pImage);

        cart.setCart_pid(Integer.parseInt(pId));
        cart.setCart_pimage(pImage);
        cart.setCart_pname(pName);
        cart.setCart_pprice(Integer.parseInt(pPrice));

        boolean flag = false;
        CartService cartService = new CartServiceImpl();
        flag = cartService.add(cart);
        if(flag){
            response.sendRedirect(request.getContextPath()+"/jsp/cart.do?method=querycart");
        }else{
            request.getRequestDispatcher("/jsp/cart.do?method=querycart").forward(request, response);

        }
    }

    private void query(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uid = request.getParameter("cartUid");
        if(StringUtils.isNullOrEmpty(uid)){
            uid = "";
        }
        List<Cart> cartList = new ArrayList<Cart>();
        CartService cartService = new CartServiceImpl();
        cartList = cartService.getCartList(uid);
        request.setAttribute("cartList", cartList);
        request.setAttribute("cartUid", uid);
        request.getRequestDispatcher("/jsp/cart.jsp").forward(request, response);
    }


    /**
     * Initialization of the servlet. <br>
     *
     * @throws ServletException if an error occurs
     */
    public void init() throws ServletException {
    }

}