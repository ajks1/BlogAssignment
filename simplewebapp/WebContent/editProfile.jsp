<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@ page language="java"
	import="java.sql.*,java.util.List,java.util.ArrayList"%>
<%@ page import="simplewebapp.Article,simplewebapp.UserVo"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
<style type="text/css">
input[type=number] {
	width: 30px;
}

body {
	background-image: url("assets/images/profile.jpg");
	background-size: cover;
	color: white;
	padding-left: 30%;
	padding-right: 30%;
}

.pp-selector input {
	margin: 0;
	padding: 0;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.nz {
	background-image: url("assets/images/nz.jpg");
}

.tropic {
	background-image: url("assets/images/tropic.jpg");
}

.asia {
	background-image: url("assets/images/asia.jpg");
}

.africa {
	background-image: url("assets/images/africa.jpg");
}

.america {
	background-image: url("assets/images/america.jpg");
}

.european {
	background-image: url("assets/images/european.jpg");
}

.pp-selector input:active+.photo-pp {
	opacity: .9;
}

.pp-selector input:checked+.photo-pp {
	-webkit-filter: none;
	-moz-filter: none;
	filter: none;
}

.photo-pp {
	cursor: pointer;
	background-size: contain;
	background-repeat: no-repeat;
	display: inline-block;
	width: 100px;
	height: 70px;
	-webkit-transition: all 100ms ease-in;
	-moz-transition: all 100ms ease-in;
	transition: all 100ms ease-in;
	-webkit-filter: brightness(1.8) grayscale(1) opacity(.7);
	-moz-filter: brightness(1.8) grayscale(1) opacity(.7);
	filter: brightness(1.8) grayscale(1) opacity(.7);
}

.photo-pp:hover {
	-webkit-filter: brightness(1.2) grayscale(.5) opacity(.9);
	-moz-filter: brightness(1.2) grayscale(.5) opacity(.9);
	filter: brightness(1.2) grayscale(.5) opacity(.9);
}
</style>
</head>
<%@ page language="java"%>

<body>
	<%
		UserVo userDetails = null;
		//get the user details from the session 
		if (session.getAttribute("userDetails") != null) {

			userDetails = (UserVo) session.getAttribute("userDetails");
		}
	%>
	<c:set var="user" value="<%=userDetails%>" />

	<h1>Blogger Profile</h1>


	<form method="post" action="SimpleBlog">
		<p>
			<label for="userID">UserName:</label><input type="text"
				required="required" id="userID" name="username"
				value="<c:out value="${user.userName}"/>" />
		</p>

		<fieldset>
			<legend>Your Details</legend>
			<p>*All following fields are optional, however more details are
				more interesting!</p>

			<p>Select your profile photo</p>
			<div class="pp-selector">
				<input id="nz" type="radio" name="profilePic" /> <label
					class="photo-pp nz" for="nz"></label> <input id="tropic"
					type="radio" name="profilePic" value="tropic" /> <label
					class="photo-pp tropic" for="tropic"></label> <input id="asia"
					type="radio" name="profilePic" value="asia" /> <label
					class="photo-pp asia" for="asia"></label> <input id="africa"
					type="radio" name="profilePic" value="africa" /> <label
					class="photo-pp africa" for="africa"></label> <input id="america"
					type="radio" name="profilePic" value="america" /> <label
					class="photo-pp america" for="america"></label> <input
					id="european" type="radio" name="profilePic" value="european" /> <label
					class="photo-pp european" for="european"></label>
			</div>

			<p>
				<label for="titleID">Title:</label> <select id="titleID"
					name="title" selected="${user.title}">
					<option value="Mr"
						${user.title == 'Mr' ? 'selected="selected"' : '' }>Mr</option>
					<option value="Mrs"
						${user.title == 'Mrs' ? 'selected="selected"' : '' }>Mrs</option>
					<option value="Miss"
						${user.title == 'Miss' ? 'selected="selected"' : '' }>Miss</option>
					<option value="Ms"
						${user.title == 'Ms' ? 'selected="selected"' : '' }>Ms</option>
					<option value="Dr"
						${user.title == 'Dr' ? 'selected="selected"' : '' }>Dr</option>
				</select>
			<p>
				<label for="birthdayID">Birthday:</label><input type="date"
					id="birthdayID" name="birthday" value="${user.birthday}" />
			</p>

			<p>
				<label for="nameID">Name:</label><input type="text" id="nameID"
					name="name" value="${user.name}" />
			</p>

			<p>
				<label for="emailID">Contact E-mail:</label><input type="email"
					id="emailID" name="email" value="${user.userEmail}" />
			</p>

			<p>
				<label for="occupationID">Occupation:</label><input type="text"
					id="occupationID" name="occupation" value="${user.occupation}" />
			</p>



			<p>
				<label for="currentCityID"> city:</label> <input type="text"
					id="currentCityID" name="city" value="${user.city}" />

			</p>
			<p>
				<label for="currentCountryID"> Country:</label><input type="text"
					id="currentCountryID" name="country" value="${user.country}" />
			</p>
			<!-- sdfgsfdsg -->
		</fieldset>
		<fieldset>
			<legend>About me</legend>
			<p>
				<label for="about">On my travels I blog about....</label>
				<textarea id="aboutID" name="travel" rows="6" cols="90" > 
				<c:out value="${user.travel}" /></textarea>

			</p>

			<p>
				<label for="favourites">Some of my favourite things are....</label>
				<textarea id="favouriteID" name="favourite" rows="6" cols="90">
				<c:out value="${user.favourite}" /></textarea>
			</p>

		</fieldset>
		<%
			if (userDetails != null)
		%>
		<input type = "hidden" name="action" value=update>
		<button type="submit"> Update</button><input
			type="reset" value="Clear">
	</form>
</body>
</html>