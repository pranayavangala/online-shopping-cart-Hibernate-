package com.voidmain.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voidmain.dao.DAO;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=request.getParameter("username").trim();
		String password=request.getParameter("password").trim();
		
		if(username.equals("admin") && password.equals("admin"))
		{
			response.sendRedirect("adminhome.jsp");
		}
		else
		{
			if(DAO.isValidStudent(username, password))
			{
				request.getSession().setAttribute("username",username);
				
				response.sendRedirect("studenthome.jsp");
			}
			else
			{
				response.sendRedirect("login.jsp?status=Invalid Username and Password");
			}
		}
	}
}
