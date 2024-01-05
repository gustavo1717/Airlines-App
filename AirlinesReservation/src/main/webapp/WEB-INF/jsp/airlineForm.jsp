<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Airline Form</title>
<style>
    .error {
        color: red;
    }
</style>
</head>
<body>
<div align="center">
<h1>Airline Form</h1>
<f:form action="saveAirline" modelAttribute="airline">
<table border="1">

<tr>
    <td>Airline Name: </td><td><f:input path="airlineName" value="${airline.airlineName}" />
        <f:errors path="airlineName" cssClass="error" /></td>
</tr>

<tr>
    <td>Airline Code: </td><td><f:input path="airlineCode" value="${airline.airlineCode}" />
    <f:errors path="airlineCode" cssClass="error" /></td>
</tr>

<!-- Add your other fields here -->

<tr>
    <td colspan="2" align="center"><input type="submit" value="submit"></td>
</tr>

</table>
</f:form>



<c:if test="${not empty airlines}">

<table border="1">
 <tr>
    <th>Airline Id</th><th>Name</th><th>Code</th>
</tr>
<c:forEach items="${airlines}" var="airline">
    <tr>
        <td>${airline.airlineId}</td>
        <td>${airline.airlineName}</td>
        <td>${airline.airlineCode}</td>
        
        <td>
            <a href="updateAirline?airlineId=${airline.airlineId}">Update</a>
            |
            <a href="deleteAirline?airlineId=${airline.airlineId}">Delete</a>
        </td>            
    </tr>
</c:forEach>
</table>
</c:if>

</div>
</body>
</html>
