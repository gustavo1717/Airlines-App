<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page isELIgnored="false" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
 <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<head>
<meta charset="UTF-8">
</head>
	<body>

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" >Welcome!</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item active" id="homeButton">
                  <a class="nav-link" href="/home">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="book" href="/searchFlightForm">Book</a>
              </li>
                <li class="nav-item">
                    <a class="nav-link" id="login" href="/login">Log In</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="logout" href="/logout">Log Out</a>
                </li>
              </ul>
              <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link btn btn-light" id="profile" href="/profile">
                        <i class="fa fa-user"></i> Profile
                    </a>
                </li>
              </ul>
            </div>
          </nav>


	
	</body>
</html>