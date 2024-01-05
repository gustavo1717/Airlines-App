$(document).ready(function() {
	    console.log($("#principalName").val());

	    let flightId; // Declare flightId in a higher scope

   $('.book-button').click(function() {
    flightId = $(this).data('flight-id');
    // Show the Guest Information modal for the specified number of guests
    numGuests = parseInt($("#noGuestsInput").val()) || 0; // Get the number of guests from input
    showGuestInfoModal();
    $("#selectedFlightId").val(flightId);
    console.log(flightId);
});

    function showGuestInfoModal() {
        if (numGuests > 0) {
            // Show the Guest Information modal
            $("#guestInfoModal").modal("show");
        } else {
            $("#booking_noGuests").val($("#noGuestsInput").val());
        }
    }
    
    
    $("#submitGuest").click(function(event) {
        event.preventDefault();

		console.log($("#principalName").val());
        // Create an object representing the guest
        var guestData = {
            fname: $("#fname").val(),
            lname: $("#lname").val(),
            dateOfBirth: $("#dateOfBirth").val(),
            email: $("#email").val(),
            phone: $("#phone").val(),
            gender: $("#guestGender").val(),
            idType: $("#idType").val(),
        };

        console.log(guestData);
        //var flightId = $("#selectedFlightId").val();

        // POST request to save passenger
        $.ajax({
            type: "POST",
            url: "/savePassenger",
            contentType: "application/json",
            data: JSON.stringify(guestData),
            success: function(response) {
                console.log("Guest information saved successfully:", response);
                // Once the passenger is saved, retrieve the passenger ID and flight ID
                var passengerId = response.id; // Update with the actual field name in your response
                console.log(flightId);
                                console.log('Using flightId in success callback:', flightId); // Log the flightId value


				  $.ajax({
                            type: "GET",
                            url: "/getFlightById/" + flightId, // Adjust the URL as needed
                            dataType: 'json',
	
                            success: function(flight) {
								
                // Create an object representing the reservation
                var reservationData = {
                    passenger: response, // Set the passenger ID
                    flight: flight, // Set the flight ID or relevant flight information
                    checkedIn: "Pending",
                    issueDate: new Date(),
                    username: $("#principalName").val()

                };

                // POST request to save reservation
                $.ajax({
                    type: "POST",
                    url: "/reservations",
                    contentType: "application/json",
                    data: JSON.stringify(reservationData),
                    success: function(reservationResponse) {
                        console.log("Reservation saved successfully:", reservationResponse);
						
						console.log(flightId)
                        // Now, fetch the flight associated with the reservation and increment 'booked'
                      
                                flight.booked++;
                                console.log(flight)
                                // Update the flight's 'booked' count
                                $.ajax({
                                    type: "PUT",
                                    url: "api/flights/updateFlight/" + flightId, // Adjust the URL as needed
                                    contentType: "application/json",
                                    data: JSON.stringify(flight),
                                    success: function(updatedFlight) {
                                        console.log("Flight updated successfully:", updatedFlight);
                                    },
                                    error: function(flightError) {
                                        console.error("Error updating flight:", flightError);
                                    },
                                });
                            },
                            error: function(flightError) {
                                console.error("Error fetching flight:", flightError);
                            },
                        });
                    },
                    error: function(reservationError) {
                        console.error("Error saving reservation:", reservationError);
                        // Handle error
                    },
                });
            },
            error: function(error) {
                console.error("Error saving guest information:", error);
            },
        });

        numGuests--;
        if (numGuests > 0) {
            $("#guestInfoForm")[0].reset();
        } else {
            $("#guestInfoModal").modal("hide");
            alert("Information entered for all Passengers.");
        }
    });
});
