<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight Search</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src='./js/reservation2.js'></script>

    <script>
        $(document).ready(function() {
            
                $('#login').hide();
            
        })
    </script>
</head>
<body>
    <input type="hidden" id="principalName" value="${principalName}">
    <jsp:include page="header.jsp" />


    <h1>Flight Search</h1>
    <form action="/searchFlights" method="post">
        <div class="form-group">
            <label for="departureCity">Departure City:</label>
            <select id="departureCity" name="departureCity" class="form-control">
                <c:forEach items="${airports}" var="airport">
                    <option value="${airport.airportId}">${airport.airportCity}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="departureCity">Arrival City:</label>
            <select id="arrivalCity" name="arrivalCity" class="form-control">
                <c:forEach items="${airports}" var="airport">
                    <option value="${airport.airportId}">${airport.airportCity}</option>
                </c:forEach>
            </select>
        </div>


        <div class="form-group">
            <label for="departureDate">Departure Date:</label>
            <input type="date" id="departureDate" name="departureDate">
        </div>
        <div id="noGuestsDiv">No. Passengers To Book: <input class="form-control" type="number" id="noGuestsInput"/></div>

        <button type="submit" class="btn btn-primary">Search Flights</button>
        <a href="/searchFlightForm" class="btn btn-primary">Retrieve All Flights</a>

    </form>


    <c:if test="${not empty flights}">
        <h2>Search Results:</h2>
        <table class="table table-bordered">
            <tr>
                <th>Flight Number</th>
                <th>Departure City</th>
                <th>Arrival City</th>
                <th>Departure Date</th>
                <th>Ticket Price</th>
                <th>Operating Airline</th>                
                <th>Available Seats</th>
                <th>Book</th>
            </tr>
            
            <c:forEach items="${flights}" var="flight">
                <tr>
                    <td>${flight.flightId}</td>
                    <td>${flight.departureCity.airportCity}</td>
                    <td>${flight.arrivalCity.airportCity}</td>
                    <td>${flight.departureDate}</td>
                    <td>${flight.ticketPrice}</td>
                    <td>
                        <c:out value="${flight.operatingAirline.airlineName}" />
                    </td>
                    <td>${flight.capacity - flight.booked}</td>
                    <td>
                        <button class="btn btn-primary book-button" data-flight-id="${flight.flightId}" data-ticket-price="${flight.ticketPrice}">Book</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty flights}">
        <p>No flights found. Please perform a search.</p>
    </c:if>



    
    <div class="modal" id="guestInfoModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Passenger Information</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <form id="guestInfoForm">
                <div class="form-group">
                    <label for="fname">First Name:</label>
                    <input type="text" id="fname" name="fname" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="guestLastName">Last Name:</label>
                  <input type="text" class="form-control" id="lname" placeholder="Enter last name" required>
                </div>
                <div class="form-group">
                    <label for="fname">Email:</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="fname">Phone:</label>
                    <input type="number" id="phone" name="phone" class="form-control" required>
                </div>
                <div class="form-group">
                  <label for="guestGender">Gender:</label>
                  <select class="form-control" id="guestGender" required>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                  </select>
                </div>
                <div class="form-group">
                    <label for="dateOfBirth">Date of Birth:</label>
                    <input type="date" id="dateOfBirth" name="dateOfBirth" class="form-control">
                </div>
                <div class="form-group">
                    <label for="idType">Type ID:</label>
                    <select class="form-control" id="idType" required>
                      <option value="REALID">Real Id</option>
                      <option value="DRIVERS_LICENSE">Driver License</option>
                      <option value="PASSPORT">Passport</option>
                      <option value="SOCIAL_SECURITY_NUM">Social Security Num</option>
                    </select>
                  </div>
                <button type="submit" class="btn btn-primary" id="submitGuest">Submit</button>
              </form>
            </div>
          </div>
        </div>
      </div>


      <jsp:include page="footer.jsp" />

    

    
</body>
</html>