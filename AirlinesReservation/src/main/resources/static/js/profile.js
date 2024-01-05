$(document).ready(function() {
	   	var username = $("#principalName").val();
		
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "http://localhost:8282/reservations/byUser/" + username,
            success: function(result) {
                console.log("AJAX request success!");
                $("#plansTbl tr").not(".header").remove();
                $.each(result, function(key1, value1) {
               		console.log(result)
	 				if (value1.checkedIn !== "Done") {
						var changeStatusButton = '<button style="background-color: #007BFF; color: #fff; border: none; padding: 8px 16px; border-radius: 4px; cursor: pointer;" onclick="acceptReservation(' + value1.ticketNum + ')">Do Check In</button>';
	                } else {
	                    var changeStatusButton = ''; // Empty string if checked in
	                }

                $("#plansTbl").append("<tr><td>" + value1.ticketNum + "</td><td>" + value1.passenger.fname + " " + value1.passenger.lname + "</td><td>" + value1.flight.flightId + "</td><td>" + value1.checkedIn + "</td><td>" + value1.issueDate + "</td><td>" + value1.flight.departureDate  + "</td><td>" + changeStatusButton + "</td></tr>");
                    
                });
            },
            error: function(e) {
            }
        });
});

function acceptReservation(ticketNum) {
    $.ajax({
        type: "PUT",
        contentType: "application/json",
        url: "http://localhost:8282/reservations/reviewReservation/" + ticketNum, // Updated URL
        data: JSON.stringify({ checkedIn: "Done" }),
        success: function(result) {
            alert("CheckId Done")
        },
        error: function(e) {
            // Handle error
        }
    });
}
