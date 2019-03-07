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
					<li><a href="adminhome.jsp">Home</a></li>
					<li class="selected"><a href="viewstudents.jsp">View Students</a></li>
					<li><a href="logout.jsp">logout</a></li>
				</ul>
			</div>
		</div>
		<div id="site_content">

			<div id="content">
				<br /> <br /> <br /> <br />

				<%
				
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
							<th>Votes</th>
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
								<%=DAO.getVotingCountByUserName(student.getUserName())%>
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


