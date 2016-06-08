<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@ page language="java" import="java.sql.*,java.util.List,java.util.ArrayList" %>
<%@ page import="simplewebapp.Article" %>
<html>
  <head>
    <title>Simple Blog</title>
  </head>

<%@ page language="java"%>

  <body>

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
  </body>
</html>
