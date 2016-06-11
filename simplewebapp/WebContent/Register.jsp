<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="simplewebapp.UserVo"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="bootstrap.min.css" rel="stylesheet">
<link href="wucustom.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<title>Insert title here</title>
<%
	UserVo userDetails = null;
	//get the user details from the session 
	if (session.getAttribute("userDetails") != null) {

		userDetails = (UserVo) session.getAttribute("userDetails");
	}
%>
</head>
<!-- test -->
<body>
	<%--   <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String user=request.getParameter("name"); 
 
String pwd=request.getParameter("password"); 
String confirm=request.getParameter("confirm"); 
 
String email=request.getParameter("email"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
"root","root"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into userTable values ('"+user+"','"+pwd+"','"+confirm+"','"+email+"')"); 

out.println("Registered");  --%>



	<div class="container" style="width: 300px">
		<div class="row main">
			<div class="panel-heading">
				<div class="panel-title text-center">
					<%
						if (userDetails != null) {
					%>
					<h1 class="title">User Profile</h1>
					<%
						}else{
					%>
					<h1 class="title">WebBlog Register</h1>
					<%} %>
					
					<hr />
				</div>
			</div>
			<div class="main-login main-center">
				<form class="form-horizontal" method="post" action="SimpleBlog">

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Your
							Name</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span>
								<%
									if (userDetails != null) {
								%>
								<input type="text" class="form-control" name="name" id="name"
									value="<%=userDetails.getUserName()%>" />
								<%
									} else {
								%>
								<input type="text" class="form-control" name="name" id="name"
									placeholder="Enter your Name" />
								<%
									}
								%>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">Your
							Email</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span>
								<%
									if (userDetails != null) {
								%>
								<input type="text" class="form-control" name="email" id="email" value="<%=userDetails.getUserEmail()%>" />
								<%
									} else {
								%>

								<input type="text" class="form-control" name="email" id="email"
									placeholder="Enter your Email" />
								<%
									}
								%>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="username" class="cols-sm-2 control-label">Username</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span> <input type="text" class="form-control"
									name="username" id="username" placeholder="Enter your Username" />
							</div>
						</div>
					</div>

					<div class="form-group" data-toggle="validator">
						<label for="password" class="cols-sm-2 control-label">Password</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="password"
									id="password" placeholder="Enter your Password" />
							</div>
						</div>
					</div>

					<div class="form-group" data-toggle="validator">
						<label for="confirm" class="cols-sm-2 control-label">Confirm
							Password</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="confirm"
									id="confirm" placeholder="Confirm your Password" />
							</div>
						</div>
					</div>

					<div class="form-group "><%
									if (userDetails != null) {
								%><input type="hidden" name="action" value="update">
						<button type="submit"
							class="btn btn-primary btn-lg btn-block login-button">Update</button>
							<%}else{ %> <input type="hidden" name="action" value="register">
							<button type="submit"
							class="btn btn-primary btn-lg btn-block login-button">Register</button>
						<%} %>
					</div>
				</form>
			</div>
		</div>
	</div>







	<script type="text/javascript" src="bootstrap.js"></script>
	<script type="text/javascript" src="validator.js"></script>

</body>
</html>