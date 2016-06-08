<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@ page language="java" import="java.sql.*,java.util.List,java.util.ArrayList" %>
<%@ page import="simplewebapp.Article" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
<style type="text/css">
		input[type=number]{
		width: 30px;
    	}
    	
    	body  {
    	background-image: url("assets/images/profile.jpg");
    	background-size: cover;
    	color: white;
    	padding-left: 30%;
    	padding-right: 30%;
    	}
   	</style>
</head>
<%@ page language="java"%>
<body>
<h1>Blogger Profile</h1>

	
	<form>
	<p><label for="userID">UserName:</label><input type="text" required = "required" id="userID" name="user"/></p>
	
	<fieldset><legend>Your Details</legend>
		<p> *All following fields are optional, however more details are more interesting!</p>
		<p>Profile photo<p/>
		<p><label for= "titleID">Title:</label>
		<select id="titleID" name="title">
			<option value="Mr" selected>Mr</option>
			<option value="Mrs">Mrs</option>
			<option value="Miss">Miss</option>
			<option value="Ms">Ms</option>
			<option value="Dr">Dr</option>
		</select>
		
		<p><label for="birthdayID">Birthday:</label><input type="date" id="birthdayID" name="birthday"></p>
		
		<p><label for="nameID">Name:</label><input type="text" id="nameID" name="name"/></p>
		
		<p><label for="emailID">Contact E-mail:</label><input type="email" id="emailID" name="email"/></p>
		
		<p><label for="occupationID">Occupation:</label><input type="text" id="occupationID" name="occupation"/></p>
		
		<p><label for="hometownID">Hometown:</label><input type="text" id="hometownID" name="hometown"/><label for="homeCountryID">Home Country:</label><input type="text" id="homeCountryID" name="homeCountry"/></p>
		
		<p><label for="currentCityID">Current city:</label><input type="text" id="currentCityID" name="currentCity"/><label for="currentCountryID">Current Country:</label><input type="text" id="currentCountryID" name="currentCountry"/></p>
		
	</fieldset>
	<!-- hello. test 22-->
	<fieldset><legend>About me</legend>
		<p><label for="about">On my travels I blog about....</label><textarea id="aboutID" name="about" rows="6" cols="90"></textarea></p>
		
		<p><label for="favourites">Some of my favourite things are....</label><textarea id="favouriteID" name="favourite" rows="6" cols="90"></textarea></p>
	
	</fieldset>
	<input type="submit" value="Update!">
	<input type="reset" value="Clear">
	</form>
</body>
</html>