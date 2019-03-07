package com.voidmain.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voidmain.dao.DAO;
import com.voidmain.pojo.Student;

@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=(String)request.getSession().getAttribute("username");

		String oldpassword=request.getParameter("oldpassword");
		String newpassword=request.getParameter("newpassword");
		
		Student user=DAO.getStudentById(username);
		
		if(user!=null && user.getPassword().equals(oldpassword))
		{
			user.setPassword(newpassword);
			
			int result=DAO.updateStudent(user);
			
			if(result==1)
			{
				response.sendRedirect("changepassword.jsp?status=success");
			}
			else
			{
				response.sendRedirect("changepassword.jsp?status=failed");
			}
		}
		else
		{
			response.sendRedirect("logout.jsp");
		}
	}
}
