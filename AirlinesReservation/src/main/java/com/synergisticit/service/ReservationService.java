package com.synergisticit.service;

import java.time.LocalDate;
import java.util.List;

import com.synergisticit.domain.Flight;
import com.synergisticit.domain.Reservation;

public interface ReservationService {
	
    Reservation reserveFlight(Long flightId);
    Reservation createReservation(Reservation reservation);
    public List<Reservation> getReservationByUser(String user); 
    Reservation reviewReservation (Long ticketNum, Reservation updatedReservation);
    Reservation findReservationById(Long ticketNum);

}
