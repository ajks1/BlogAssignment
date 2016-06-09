<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@ page language="java" import="java.sql.*,java.util.List,java.util.ArrayList" %>
<%@ page import="simplewebapp.Article,simplewebapp.UserVo" %>


<html>
  <head>
    <title>Simple Blog</title>
    <link href="bootstrap.min.css" rel="stylesheet">
  <link href="wucustom.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
  </head>

<%@ page language="java"%>

  <body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Portfolio</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Gallery</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
       
<% 
UserVo userDetails = null;
//get the user details from the session 
if(session.getAttribute("userDetails") != null ){
	
	 userDetails = (UserVo) session.getAttribute("userDetails");
}
%>
<% if ( userDetails != null){ %>
 <li><a href="?logout=1"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
<li><a href="Register.jsp"><span class="glyphicon glyphicon-log-in">
   <%= userDetails.getUserName() %> 
</a></span></li>
<%}else{ %>
 <li><a href="Register.jsp"><span class="glyphicon glyphicon-log-in"></span> Register</a></li>
<li><a href="#"><span class="glyphicon glyphicon-log-in" data-toggle="modal" data-target="#myModal">
    Log in
</a></span></li>

<%} %>
        
      </ul>
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Log in</h4>
			</div> <!-- /.modal-header -->

			<div class="modal-body">
				<form role="form" action="SimpleBlog" method="post">
					<div class="form-group">
						<div class="input-group">
							<input type="text" class="form-control" id="uLogin" placeholder="Login" name="username">
							<label for="uLogin" class="input-group-addon glyphicon glyphicon-user"></label>
						</div>
					</div> <!-- /.form-group -->

					<div class="form-group">
						<div class="input-group">
							<input type="password" class="form-control" id="uPassword" placeholder="Password" name="password">
							<label for="uPassword" class="input-group-addon glyphicon glyphicon-lock"></label>
						</div> <!-- /.input-group -->
					</div> <!-- /.form-group -->

					<div class="checkbox">
						<label>
							<input type="checkbox"> Remember me
						</label>
					</div> <!-- /.checkbox -->
					<button type="submit" class="form-control btn btn-primary">Ok</button>
				</form>

			</div> <!-- /.modal-body -->


		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
    </div>
  </div>
</nav>
    <div class="col-sm-9">
      <h4><small>RECENT POSTS</small></h4>
      <hr>
      <h2>I Love Food</h2>
      <h5><span class="glyphicon glyphicon-time"></span> Post by Jane Dane, Sep 27, 2015.</h5>
      <h5><span class="label label-danger">Food</span> <span class="label label-primary">Ipsum</span></h5><br>
      <p>Food is my passion. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <br><br>
      
      <h4><small>RECENT POSTS</small></h4>
      <hr>
      <h2>Officially Blogging</h2>
      <h5><span class="glyphicon glyphicon-time"></span> Post by John Doe, Sep 24, 2015.</h5>
      <h5><span class="label label-success">Lorem</span></h5><br>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <hr>

      <h4>Leave a Comment:</h4>
      <form role="form">
        <div class="form-group">
          <textarea class="form-control" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn btn-success">Submit</button>
      </form>
      <br><br>
      
      <p><span class="badge">2</span> Comments:</p><br>
      
      <div class="row">
        <div class="col-sm-2 text-center">
          <img src="bandmember.jpg" class="img-circle" height="65" width="65" alt="Avatar">
        </div>
        <div class="col-sm-10">
          <h4>Anja <small>Sep 29, 2015, 9:12 PM</small></h4>
          <p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          <br>
        </div>
        <div class="col-sm-2 text-center">
          <img src="bird.jpg" class="img-circle" height="65" width="65" alt="Avatar">
        </div>
        <div class="col-sm-10">
          <h4>John Row <small>Sep 25, 2015, 8:25 PM</small></h4>
          <p>I am so happy for you man! Finally. I am looking forward to read about your trendy life. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
          <br>
          <p><span class="badge">1</span> Comment:</p><br>
          <div class="row">
            <div class="col-sm-2 text-center">
              <img src="bird.jpg" class="img-circle" height="65" width="65" alt="Avatar">
            </div>
            <div class="col-xs-10">
              <h4>Nested Bro <small>Sep 25, 2015, 8:28 PM</small></h4>
              <p>Me too! WOW!</p>
              <br>
            </div>
          </div>
        </div>
      </div>
    <section id="view" class="container">
      <%
      List<Article> articles = (List<Article>) request.getAttribute("Articles");

      for (Article a : articles) {
        String articleTitle = a.getTitle();
        int articleID = a.getID();
        String linkURI = String.format("?article=%d", articleID);
        out.println("<section class=\"article\">");
        out.println("<p>");
        out.println("<a href=\"" + linkURI + "\">" + articleTitle + "</a>");
        out.println("</p>");
        out.println("</section>");
      }
      %>
    </section>
    <SCRIPT type="text/javascript" src="jquery-1.9.1.min.js"></SCRIPT>
    <script>
    $(document).ready(function(){
        $('.modal-footer button').click(function(){
    		var button = $(this);

    		if ( button.attr("data-dismiss") != "modal" ){
    			var inputs = $('form input');
    			var title = $('.modal-title');
    			var progress = $('.progress');
    			var progressBar = $('.progress-bar');

    			inputs.attr("disabled", "disabled");

    			button.hide();

    			progress.show();

    			progressBar.animate({width : "100%"}, 100);

    			progress.delay(1000)
    					.fadeOut(600);

    			button.text("Close")
    					.removeClass("btn-primary")
    					.addClass("btn-success")
        				.blur()
    					.delay(1600)
    					.fadeIn(function(){
    						title.text("Log in is successful");
    						button.attr("data-dismiss", "modal");
    					});
    		}
    	});

    	$('#myModal').on('hidden.bs.modal', function (e) {
    		var inputs = $('form input');
    		var title = $('.modal-title');
    		var progressBar = $('.progress-bar');
    		var button = $('.modal-footer button');

    		inputs.removeAttr("disabled");

    		title.text("Log in");

    		progressBar.css({ "width" : "0%" });

    		button.removeClass("btn-success")
    				.addClass("btn-primary")
    				.text("Ok")
    				.removeAttr("data-dismiss");
                    
    	});
    });
        
    </script>
    <script type="text/javascript" src="bootstrap.js"></script>
	<script type="text/javascript" src="validator.js"></script>
	<script type="text/javascript" src="custom.js"></script>	
  </body>
</html>
