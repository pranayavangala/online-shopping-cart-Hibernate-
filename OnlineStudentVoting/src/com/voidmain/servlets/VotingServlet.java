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
import com.voidmain.pojo.Voting;

@WebServlet("/VotingServlet")
public class VotingServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Voting object=new Voting();

		Enumeration<String> enumeration=request.getParameterNames();

		while(enumeration.hasMoreElements())
		{
			String parameterName=enumeration.nextElement();

			Method[] methods=Voting.class.getDeclaredMethods();

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

		object.setVotedBy((String)request.getSession().getAttribute("username"));

		int result=DAO.addVoting(object);

		if(result==1)
		{
			response.sendRedirect("studenthome.jsp?status=succes");
		}
		else
		{
			response.sendRedirect("studenthome.jsp?status=failed");
		}
	}
}
