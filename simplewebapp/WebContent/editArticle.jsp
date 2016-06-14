<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
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
   	
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>$(function() {
    $( "#datepicker" ).datepicker().datepicker("setDate", new Date());
  });
  </script>
  
  
  </head>

<%@ page language="java"%>

  <body>
  	<%
		Article articleDetails = null;
		//get the article details from request 
		if (request.getAttribute("Article") != null) {

			articleDetails = (Article) request.getAttribute("Article");
		}
	%>
	<c:set var="article" value="<%=articleDetails%>" />
  
  
	<form onreset="myreset()" method="post" action="SimpleBlog">
	<input type ="hidden" name="article" value="${article.id}"/>
	<fieldset>
	<p><label for="titleID">Title:</label><input type="text" required="required" id="titleID" name="title" value="${article.title}"
	/></p>

	<p>Date: <input type="text" id="datepicker" required="required" name="date"></p>
	
	<p><label for="body">Todays blog....</label>
	<textarea id="body" name="body" rows="6" cols="90"><c:out value="${article.body}" /></textarea></p>
		
  <script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script>
  <script type="text/javascript">
			//<![CDATA[ 
            bkLib.onDomLoaded(function(){
            	new nicEditor({buttonList : ['fontSize','fontFamily', 'fontFormat','bold','italic','underline','strikeThrough','center','right','left','justify','indent', 'outdent','forecolor','bgcolor','upload','hr']}).panelInstance('body');
            });
            
            function myreset(){
        	    var ne = nicEditors.findEditor("article");
        	    ne.setContent("");
        	}
            
  			//]]>
  </script>
  	

	</fieldset>
   
   <fieldset>
   <p> File Uploader </p>
   </fieldset>
   	<input type="submit" name="articleAction" value="update">
	<input type="reset" name="clear" value="Clear All">
   </form>
  </body>
</html>
