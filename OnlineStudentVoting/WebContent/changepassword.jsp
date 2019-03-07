<!DOCTYPE HTML>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<html>

<head>
<title>Fast</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css" />

<script type="text/javascript">
	function validate() {

		var oldpassword = document.passwordchange.oldpassword.value;
		var newpassword = document.passwordchange.newpassword.value;

		if (oldpassword == "" || oldpassword == null) {
			alert("please enter oldpassword");
			return false;
		}

		if (newpassword == "" || newpassword == null) {
			alert("please enter newpassword");
			return false;
		}
	}
</script>

</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<br /> <br /> <font size="5"><a href="index.html"><span
							class="logo_colour">
								Online Student Voting</span></a></font>
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
				<h3>Change Password</h3>
				<%
					}
				%>

				<div class="form_settings">

					<form name="passwordchange" action="UpdatePassword" method="get">

						<p>
							<span>Old Password</span><input name="oldpassword" type="text"
								class="contact">
						</p>
						<p>
							<span>New Password</span><input name="newpassword" type="text"
								class="contact">
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



