<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Passenger Form</title>
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div align="center">
        <h1>Passenger Form</h1>
        <f:form action="savePassenger" modelAttribute="passenger">
            <table border="1">
                <tr>
                    <td>First Name:</td>
                    <td><f:input path="fname" value="${passenger.fname}" />
                    <f:errors path="fname" cssClass="error" /></td>
                </tr>

                <tr>
                    <td>Last Name:</td>
                    <td><f:input path="lname" value="${passenger.lname}" />
                    <f:errors path="lname" cssClass="error" /></td>
                </tr>

                <tr>
                    <td>Email:</td>
                    <td><f:input path="email" value="${passenger.email}" />
                    <f:errors path="email" cssClass="error" /></td>
                </tr>

                <tr>
                    <td>Phone:</td>
                    <td><f:input path="phone" value="${passenger.phone}" />
                    <f:errors path="phone" cssClass="error" /></td>
                </tr>

                <tr>
                    <td>Gender:</td>
                    <td><f:input path="gender" value="${passenger.gender}" />
                    <f:errors path="gender" cssClass="error" /></td>
                </tr>

                <tr>
                    <td>Date of Birth:</td>
                    <td><f:input path="dateOfBirth" type="date" value="${passenger.dateOfBirth}" />
                    <f:errors path="dateOfBirth" cssClass="error" /></td>
                </tr>

                <tr>
                    <td>Identification Type:</td>
                    <td>
                        <f:select path="idType">
                            <f:options items="${identificationTypes}" />
                        </f:select>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Submit" /></td>
                </tr>
            </table>
        </f:form>

        <p />
        <p />
        <c:if test="${not empty passengers}">
            <table border="1">
                <tr>
                    <th>Passenger Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Gender</th>
                    <th>Date of Birth</th>
                    <th>Identification Type</th>
                </tr>
                <c:forEach items="${passengers}" var="passenger">
                    <tr>
                        <td>${passenger.passengerId}</td>
                        <td>${passenger.fname}</td>
                        <td>${passenger.lname}</td>
                        <td>${passenger.email}</td>
                        <td>${passenger.phone}</td>
                        <td>${passenger.gender}</td>
                        <td>${passenger.dateOfBirth}</td>
                        <td>${passenger.idType}</td>

                        <td>
                            <a href="updatePassenger?passengerId=${passenger.passengerId}">Update</a>
                            |
                            <a href="deletePassenger?passengerId=${passenger.passengerId}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>

    <nav>
        <ul>
            <li><a href="flightForm">Flight Form</a></li>
            <li><a href="searchFlightForm">About</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </nav>
</body>
</html>
