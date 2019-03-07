<!DOCTYPE HTML>
<%@page import="com.voidmain.pojo.Student"%>
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
							class="logo_colour"> Online Student Voting</span></a></font>
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
		<div id="content_header"></div>
		<div id="site_content">
			
			<div id="content">
				<br /> <br /> <br /> <br />

				<%
					String status = request.getParameter("status");

											if (status != null) {
				%>
				<h3>
					<font color="red" size="2"><%=status%></font>
				</h3>
				<%
					} else {
				%>
				<h3>Edit Your Profile</h3>
				<%
					}
				%>

				<%
					String studentName=(String)request.getSession().getAttribute("username");
																		
							Student student=DAO.getStudentById(studentName);
				%>

				<div class="form_settings">
					<form method="post" action="UserServlet" name="login">
						<input type="hidden" value="update" name="operation">

						<p>
							<span>Mobile</span><input name="mobile" type="text"
								class="contact" value="<%=student.getMobile()%>">
						</p>
						<p>
							<span>Email</span><input name="email" type="text"
								class="contact" value="<%=student.getEmail()%>">
						</p>
						
						<p>
							<span>Having Nomination</span> <select name="havingNomination" style="width: 50%">
								<option value="no">no</option>
								<option value="yes">yes</option>
							</select>
						</p>

						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="submit"
								onclick="return validate()" />
						</p>
					</form>
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


