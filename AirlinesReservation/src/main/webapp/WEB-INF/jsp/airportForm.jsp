<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Airport Form</title>
<style>
    .error {
        color: red;
    }
</style>
</head>
<body>
<div align="center">
<h1>Airport Form</h1>
<f:form action="saveAirport" modelAttribute="airport">
<table border="1">

<tr>
    <td>Airport City: </td><td><f:input path="airportCity" value="${airport.airportCity}" />
    <f:errors path="airportCity" cssClass="error" /></td>
</tr>

<tr>
    <td>Airport Code: </td><td><f:input path="airportCode" value="${airport.airportCode}" />
    <f:errors path="airportCode" cssClass="error" /></td>
</tr>

<!-- Add your other fields here -->
<!--
<tr>
    <td>Arrival Flights: </td>
    <td>
        <c:forEach items="${airport.arrivalFlights}" var="flight">
            <f:input path="arrivalFlights[${status.index}].flightId" value="${flight.flightId}" />
        </c:forEach>
    </td>
    <td><f:errors path="arrivalFlights" cssClass="error" /></td>
</tr>

<tr>
    <td>Departure Flights: </td>
    <td>
        <c:forEach items="${airport.departureFlights}" var="flight">
            <f:input path="departureFlights[${status.index}].flightId" value="${flight.flightId}" />
        </c:forEach>
    </td>
    <td><f:errors path="departureFlights" cssClass="error" /></td>
</tr>
-->
<tr>
    <td colspan="2" align="center"><input type="submit" value="submit"></td>
</tr>



</table>
</f:form>


<p/>
<p/>
<c:if test="${not empty airports}">

<table border="1">
 <tr>
    <th>Airport Id</th><th>City</th><th>Code</th>
</tr>
<c:forEach items="${airports}" var="airport">
    <tr>
        <td>${airport.airportId}</td>
        <td>${airport.airportCity}</td>
        <td>${airport.airportCode}</td>
        
        <td>
            <a href="updateAirport?airportId=${airport.airportId}">Update</a>
            |
            <a href="deleteAirport?airportId=${airport.airportId}">Delete</a>
        </td>            
    </tr>
</c:forEach>
</table>
</c:if>

</div>
</body>
</html>
