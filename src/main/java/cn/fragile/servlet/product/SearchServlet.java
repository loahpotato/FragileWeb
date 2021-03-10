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

public class SearchServlet extends HttpServlet {


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
        if(method != null && method.equals("querygame")){
            this.query(request,response);
            request.getRequestDispatcher("gamelist.jsp").forward(request, response);
        }else if(method != null && method.equals("casual")){
            this.query(request,response);
            request.getRequestDispatcher("casuallist.jsp").forward(request, response);
        }else if(method != null && method.equals("cooperation")){
            this.query(request,response);
            request.getRequestDispatcher("cooperationlist.jsp").forward(request, response);
        }else if(method != null && method.equals("rpg")){
            this.query(request,response);
            request.getRequestDispatcher("RPGlist.jsp").forward(request, response);
        }else if(method != null && method.equals("strategy")){
            this.query(request,response);
            request.getRequestDispatcher("strategylist.jsp").forward(request, response);
        }
        else if(method != null && method.equals("game")){
            this.getProductById(request,response,"showgame.jsp");
        }else{
            this.antiQuery(request,response);
            request.getRequestDispatcher("index.jsp").forward(request, response);
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

    }

    private void antiQuery(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String queryProName = request.getParameter("queryProName");
        String queryProCode = request.getParameter("queryProCode");
        if(StringUtils.isNullOrEmpty(queryProName)){
            queryProName = "";
        }
        if(StringUtils.isNullOrEmpty(queryProCode)){
            queryProCode = "";
        }
        List<Product> productAntiList = new ArrayList<Product>();
        ProductService productService = new ProductServiceImpl();
        productAntiList = productService.getAntiList(queryProName,queryProCode);
        request.setAttribute("productAntiList", productAntiList);
        request.setAttribute("queryProName", queryProName);
        request.setAttribute("queryProCode", queryProCode);

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

    /**
     * Initialization of the servlet. <br>
     *
     * @throws ServletException if an error occurs
     */
    public void init() throws ServletException {
    }

}
