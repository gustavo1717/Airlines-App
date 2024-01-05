<!DOCTYPE html>
<html>
	
	
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='./js/profile.js'></script>
<input type="hidden" id="principalName" value="${principalName}">

<script src="https://js.stripe.com/v3/"></script>
<html xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security"></html>
<style>    
    .modal-content {
      margin: auto;
      display: block;
      max-width: 90%;
      max-height: 90%;
    }
    
    .close {
      position: absolute;
      top: 15px;
      right: 25px;
      font-size: 35px;
      cursor: pointer;
      color: #fff;
    }
    .img-container img {
            max-width: 150px; /* Set the maximum width for the images */
            max-height: auto; /* Let the height adjust automatically to maintain aspect ratio */
        }
    </style>

	<!DOCTYPE html>
<html>
<head>
    <jsp:include page="header.jsp" />

    <script>
        $(document).ready(function() {
            
                $('#login').hide();
            
        })
    </script>
</head>
<body>

  <div class="row justify-content-center">
    <div id="listPolicyContainer" class="col-7 border rounded" style="margin-left: 50px; margin-bottom: 20px; margin-top: 20px;">
        <div class="text-center">
            <div style="font-size: 20px; font-family: 'Trebuchet MS', Helvetica, sans-serif;">Your Reservations:</div>  
        
            <div id="listReservations" class="row justify-content-center">
                <table id="plansTbl" border="1">
                    <tr class="header">
                        <th>Ticket Number</th>
                        <th>Passenger</th>
                        <th>Flight Id</th>
                        <th>Checked In</th>
                        <th>Issue Date</th>
                        <th>Flight Date</th>

                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

>

  <jsp:include page="footer.jsp" />

</body>
</html>

</body>
</html>