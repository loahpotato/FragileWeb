package cn.fragile.servlet.user;

import cn.fragile.pojo.User;
import cn.fragile.service.user.UserService;
import cn.fragile.service.user.UserServiceImpl;
import cn.fragile.tools.Constants;
import cn.fragile.tools.Sendmail;
import com.alibaba.fastjson.JSONArray;
import com.mysql.jdbc.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

public class RegisterServlet extends HttpServlet{

    public RegisterServlet() {
        super();
    }

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String method = request.getParameter("method");

        System.out.println("method----> " + method);

        if(method != null && method.equals("ucexist")){
            this.userCodeExist(request, response);
        }
        else{
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html charset=utf-8");
            String userCode = request.getParameter("userCode");
            String userName = request.getParameter("userName");
            String userPassword = request.getParameter("userPassword");
            String gender = request.getParameter("gender");
            String birthday = request.getParameter("birthday");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            User user = new User();

            Sendmail sendmail = new Sendmail(user);
            new Thread(sendmail).start();

            int count = 0;
            user.setUserCode(userCode);
            user.setUserName(userName);
            user.setUserPassword(userPassword);
            user.setEmail(email);
            try {
                user.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse(birthday));
            } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            user.setGender(Integer.valueOf(gender));
            user.setPhone(phone);
            user.setUserRole(2);
            user.setCreationDate(new Date());
            user.setCreatedBy(null);

            UserService userService = new UserServiceImpl();
            count = userService.reg(user);
            request.getSession().setAttribute(Constants.USER_SESSION, user);

            if(count > 0){
                response.sendRedirect(request.getContextPath()+"/search.do");
            } else {
                PrintWriter out = response.getWriter();
                out.write("<script>");
                out.write("alter('Register Fail')");
                out.write("location.href='register.jsp'");
                out.write("</script>");

            }
        }
    }
    private void userCodeExist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userCode = request.getParameter("userCode");

        HashMap<String, String> resultMap = new HashMap<String, String>();
        if(StringUtils.isNullOrEmpty(userCode)){
            //userCode == null || userCode.equals("")
            resultMap.put("userCode", "exist");
        }else{
            UserService userService = new UserServiceImpl();
            User user = userService.selectUserCodeExist(userCode);
            if(null != user){
                resultMap.put("userCode","exist");
            }else{
                resultMap.put("userCode", "notexist");
            }
        }

        response.setContentType("application/json");
        PrintWriter outPrintWriter = response.getWriter();
        outPrintWriter.write(JSONArray.toJSONString(resultMap));
        outPrintWriter.flush();
        outPrintWriter.close();
    }
}
