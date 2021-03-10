package cn.fragile.servlet.user;

import cn.fragile.pojo.User;
import cn.fragile.service.user.UserService;
import cn.fragile.service.user.UserServiceImpl;
import cn.fragile.tools.Constants;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {


	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("login ============ " );
		String userCode = request.getParameter("userCode");
		String userPassword = request.getParameter("userPassword");
		UserService userService = new UserServiceImpl();
		User user = userService.login(userCode,userPassword);
		if(null != user){
			request.getSession().setAttribute(Constants.USER_SESSION, user);
			if(user.getUserRole()==1){
				response.sendRedirect("jsp/frame.jsp");
			}

			if(user.getUserRole()==2){
				response.sendRedirect(request.getContextPath()+"/search.do");
			}
		}else{
			request.setAttribute("error", "User name or password not correct");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

	}


}
