<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Flight Form</title>
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div align="center">
        <h1>Flight Form</h1>
        <f:form action="saveFlight" modelAttribute="flight">
            <table border="1">

                <tr>
                    <td>Operating Airline:</td>
                    <td>
                        <f:select path="operatingAirline.airlineId">
                            <c:forEach items="${airlines}" var="airline">
                                <f:option value="${airline.airlineId}" label="${airline.airlineName}" />
                            </c:forEach>
                        </f:select>
                    
                    <f:errors path="operatingAirline" cssClass="error" /></td>
                </tr>
                
                <tr>
                    <td>Departure City:</td>
                    <td>
                        <f:select path="departureCity.airportId">
                            <c:forEach items="${airports}" var="airport">
                                <f:option value="${airport.airportId}" label="${airport.airportCity}" />
                            </c:forEach>
                        </f:select>
                    
                    <f:errors path="departureCity" cssClass="error" /></td>
                </tr>

                <tr>
                    <td>Arrival City:</td>
                    <td>
                        <f:select path="arrivalCity.airportId">
                            <c:forEach items="${airports}" var="airport">
                                <f:option value="${airport.airportId}" label="${airport.airportCity}" />
                            </c:forEach>
                        </f:select>
                    
                    <f:errors path="arrivalCity" cssClass="error" /></td>
                </tr>
                
                <tr>
                    <td>Ticket Price: </td>
                    <td><f:input path="ticketPrice" value="${flight.ticketPrice}" />
                    <f:errors path="ticketPrice" cssClass="error" /></td>
                </tr>
                

                <tr>
                    <td>Capacity: </td>
                    <td><f:input path="capacity" value="${flight.capacity}" />
                    <f:errors path="capacity" cssClass="error" /></td>
                </tr>


                <tr>
                    <td>Departure Date:</td>
                    <td><f:input path="departureDate" type="date" value="${flight.departureDate}" />
                    <f:errors path="departureDate" cssClass="error" /></td>
                </tr>

                <tr>
                    <td>Departure Time:</td>
                    <td><f:input path="departureTime" type="time" value="${flight.departureTime}" />
                    <f:errors path="departureTime" cssClass="error" /></td>
                </tr>

                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Submit" /></td>
                </tr>
            </table>
        </f:form>

        <p />
        <p />
        <c:if test="${not empty flights}">
            <table border="1">
                <tr>
                    <th>Flight Id</th>
                    <th>Ticket Price</th>
                    <th>Departure City</th>
                    <th>Arrival City</th>
                    <th>Operating Airline</th>
                    <th>Departure Date</th>
                    <th>Departure Time</th>
                </tr>
                <c:forEach items="${flights}" var="flight">
                    <tr>
                        <td>${flight.flightId}</td>
                        <td>${flight.ticketPrice}</td>
                        <td>${flight.departureCity.airportCity}</td>
                        <td>${flight.arrivalCity.airportCity}</td>
                        <td>${flight.operatingAirline.airlineName}</td>
                        <td>${flight.departureDate}</td>
                        <td>${flight.departureTime}</td>

                        <td>
                            <a href="updateFlight?flightId=${flight.flightId}">Update</a>
                            |
                            <a href="deleteFlight?flightId=${flight.flightId}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
</body>
</html>
