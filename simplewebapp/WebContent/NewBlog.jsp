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
<title>UserBlogPage</title>

</head>
<body>
	



	<div class="container" style="width: 800px">
		<div class="row main">
			<div class="panel-heading">
				<div class="panel-title text-center">
					
					<h1 class="title">User Blog</h1>
					
					
				

					<hr />
				</div>
			</div>
			<div class="main-login main-center" style="max-width: 800px">
				<form class="form-horizontal" method="post" action="SimpleBlog">

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Your
							Title</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span>
							
								<input type="text" class="form-control" name="name" id="name"
									 />
							
								<input type="text" class="form-control" name="name" id="name"
									placeholder="Enter your Title" />
								
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">
							Add Post</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span>
							

								<textarea name="comments" cols="100" rows="20">
Add your post here...
</textarea>
								<input type=submit value="Add Post">
							
							</div>
						</div>
					</div>

			

			

					
				</form>
			</div>
		</div>
	</div>







	<script type="text/javascript" src="bootstrap.js"></script>
	<script type="text/javascript" src="validator.js"></script>

</body>
</html>

