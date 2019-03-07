<!DOCTYPE HTML>
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

		var username = document.login.username.value;
		var password = document.login.password.value;

		if (username == "" || username == null) {
			alert("please enter username");
			return false;
		}
		if (password == "" || password == null) {
			alert("please enter password");
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
					<li><a href="index.html">Home</a></li>
					<li><a href="login.jsp">Login</a></li>
					<li><a href="userregistration.jsp">User Registration</a></li>
				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="sidebar_container">
				<br /> <br /> <br /> <br />
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>Useful Links</h3>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="login.jsp">Login</a></li>
							<li><a href="userregistration.jsp">User Registration</a></li>
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
			</div>
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
				<h3>Login Here</h3>
				<%
					}
				%>

				<div class="form_settings">
					<form method="get" action="Login" name="login">
						<p>
							<span>User Name</span><input name="username" type="text"
								class="contact">
						</p>
						<br />
						<p>
							<span>Password</span><input name="password" type="password"
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

