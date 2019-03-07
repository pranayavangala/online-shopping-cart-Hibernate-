<!DOCTYPE HTML>
<%@page import="com.voidmain.pojo.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.voidmain.dao.DAO"%>
<html>

<head>
<title>Fast</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css" />

</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<br /> <br /> <font size="5"><a href="index.html"><span
							class="logo_colour">Online Student Voting</span></a></font>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">
					<!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
					<li class="selected"><a href="studenthome.jsp">Home</a></li>
					<li><a href="editprofile.jsp">Update Profile</a></li>
					<li><a href="changepassword.jsp">Change Password</a></li>
					<li><a href="logout.jsp">logout</a></li>
				</ul>
			</div>
		</div>
		<div id="site_content">

			<div id="content">
				<br /> <br /> <br /> <br />

				<%String username=(String)request.getSession().getAttribute("username");
				
					String status = request.getParameter("status");

					if (status != null) {			%>
				<h3>
					<font color="red" size="2"><%=status%></font>
				</h3>
				<%}%>

				<div class="form_settings">

					<h3>View Members</h3>

					<table style="width: 100%; color: red;">
						<tr>
							<th>Name</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>Branch</th>
							<th>Vote</th>
						</tr>
						<%
							List<Student> students =DAO.getNominationStudentList();
							
							for(Student student : students)
							{		
						%>

						<tr>

							<td><%=student.getName()%></td>
							<td><%=student.getEmail()%></td>
							<td><%=student.getMobile()%></td>
							<td><%=student.getBranch()%></td>
							<td>
							
								<%
									if(!DAO.isVoted(username))
									{	
								%>
								<form action="VotingServlet">
									<input type="hidden" value="<%=student.getUserName()%>" name="votedTo">
									<input type="submit" value="Vote">
								</form>
								
								<%
									}
								%>
								
							</td>

						</tr>
						<%
							}
						%>
					</table>

				</div>
			</div>
		</div>
		<br /> <br /> <br /> <br />
		<div id="content_footer"></div>
		<div id="footer">
			<p>Copyright &copy; Voidmain Technologies</p>
		</div>
	</div>
</body>
</html>


