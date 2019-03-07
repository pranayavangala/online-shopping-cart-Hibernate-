package com.voidmain.servlets;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voidmain.dao.DAO;
import com.voidmain.pojo.Student;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userName=(String)request.getSession().getAttribute("username");
		
		Student object=null;
		
		String operation=request.getParameter("operation");
		
		if(operation!=null && operation.equals("update"))
		{
			object=DAO.getStudentById(userName);
		}
		else
		{
			object=new Student();
		}
		
		Enumeration<String> enumeration=request.getParameterNames();
		
		while(enumeration.hasMoreElements())
		{
			String parameterName=enumeration.nextElement();
			
			Method[] methods=Student.class.getDeclaredMethods();

			for(Method method : methods)
			{
				String methodName=method.getName();
				if(methodName.equalsIgnoreCase("set"+parameterName))
				{
					try {
						method.setAccessible(true);
						method.invoke(object,request.getParameter(parameterName));
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

		}

		if(operation!=null && operation.equals("update"))
		{
			int result=DAO.updateStudent(object);

			if(result==1)
			{
				response.sendRedirect("editprofile.jsp?status=succes");
			}
			else
			{
				response.sendRedirect("editprofile.jsp?status=failed");
			}
		}
		else
		{
			int result=DAO.addStudent(object);

			if(result==1)
			{
				response.sendRedirect("userregistration.jsp?status=succes");
			}
			else
			{
				response.sendRedirect("userregistration.jsp?status=failed");
			}
		}
	}
}
