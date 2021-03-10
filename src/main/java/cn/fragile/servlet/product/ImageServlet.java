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


public class ImageServlet extends HttpServlet {


    public void destroy() {
        super.destroy();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Product product = new Product();

        SmartUpload su= new SmartUpload();

        //初使化
        su.initialize(this.getServletConfig(), request, response);

        //上传过程
        try {
            su.upload();
        } catch (SmartUploadException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        //获取上传的文件对象
        Files fs= su.getFiles();
        File f1 = fs.getFile(0);
        File f2 = fs.getFile(1);
        //获取上传的文件名称
        String fname1 = f1.getFileName();//图片
        String fname2 = f2.getFileName();//视频
        System.out.println(fname1+"1");
        System.out.println(fname2+"2");

        //原有的文件
        String fileName = su.getRequest().getParameter("fileName");
        String videoName = su.getRequest().getParameter("videoName");

        //视频链接
        String videoLink = su.getRequest().getParameter("videoLink");

        try {
            //图片没更新
            if(fname1.equals("")){
                product.setProFilename(fileName);
            }
            else{ //更新图片
                product.setProFilename(fname1);
                f1.saveAs("/images/product/"+fname1, su.SAVE_VIRTUAL);
            }

            //视频，优先采用链接
            if(videoLink.equals("")) //没传链接
            {
                if(fname2.equals("")){ //没更新文件
                    product.setProVideo(videoName);
                }
                else{ //更新文件
                    product.setProVideo(fname2);
                    f2.saveAs("/vedio/"+fname2, su.SAVE_VIRTUAL);
                }
            }
            else { //传了链接
                product.setProVideo(videoLink);
            }

        }
        catch (SmartUploadException e) {
            e.printStackTrace();
        }

        //su.downloadFile(this.getServletContext().getRealPath("/")+"images/product/"+fname);

        String proDeveloper = su.getRequest().getParameter("proDeveloper");
        String proPublisher = su.getRequest().getParameter("proPublisher");
        String proDate = su.getRequest().getParameter("proDate");
        Integer proPrice = Integer.valueOf(su.getRequest().getParameter("proPrice"));
        String proDesc = su.getRequest().getParameter("proDesc");
        String id = su.getRequest().getParameter("pid");
        String proName = su.getRequest().getParameter("proName");
        String cate = su.getRequest().getParameter("proCate");
        Integer proCate = 0;
        if(cate.equals("")){
            proCate = 0;
        }
        else{
            proCate = Integer.valueOf(su.getRequest().getParameter("proCate"));
        }
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
        product.setProCate(proCate);

        System.out.println(product.getId());

        boolean flag = false;
        ProductService productService = new ProductServiceImpl();
        flag = productService.addPic(product);
        if(flag){
        response.sendRedirect(request.getContextPath()+"/jsp/product.do?method=query");

        //request.getRequestDispatcher("productadd.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("jsp/pictureadd.jsp").forward(request, response);
        }
    }


    }

