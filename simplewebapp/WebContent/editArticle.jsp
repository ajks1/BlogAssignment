<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@ page language="java" import="java.sql.*,java.util.List,java.util.ArrayList" %>
<%@ page import="simplewebapp.Article" %>
<html>
  <head>
    <title>Edit Article</title>
    <style type="text/css">
		input[type=number]{
		width: 30px;
    	}
    	
    	body  {
    	background-image: url("assets/images/article.jpg");
    	background-size: cover;
    	color: black;
    	padding-left: 30%;
    	padding-right: 30%;
    	}
   	</style>
  </head>

<%@ page language="java"%>

  <body>
	<form>
	<fieldset>
	<p><label for="titleID">Title:</label><input type="text" required="required" id="titleID" name="title"/></p>
	
	<p><label for="dateID">Date:</label><input type="date" value="2016-06-01" required="required" id="dateID" name="date"></p>
	
	<p><label for="article">Todays blog....</label><textarea id="articleID" name="article" rows="6" cols="90"></textarea></p>
	
  <script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script>
  <script type="text/javascript">
			//<![CDATA[ 
            bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
  			//]]>
  </script>
  	

	</fieldset>
   
   <fieldset>
   <p> File Uploader </p>
   </fieldset>
   	<input type="submit" value="Update!">
	<input type="reset" value="Clear">
   </form>
  </body>
</html>
