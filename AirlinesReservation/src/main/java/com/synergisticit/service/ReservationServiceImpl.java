package com.synergisticit.service;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.loader.ast.internal.MultiKeyLoadChunker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergisticit.domain.Flight;
import com.synergisticit.domain.Reservation;
import com.synergisticit.repository.ReservationRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
    private FlightService flightService;

    @Autowired
    private ReservationRepository reservationRepository;
    
    @PersistenceContext
    private EntityManager entityManager;

    /*@Override
    public List<Flight> searchFlights(String departureCity, String arrivalCity, LocalDate departureDate) {
        // Use FlightService to get flights based on the criteria
        return flightService.findFlightsByCriteria(departureCity, arrivalCity, departureDate);
    }*/

    @Transactional
    @Override
    public Reservation reserveFlight(Long flightId/*, int numPassengers*/) {
        // Retrieve the flight based on the flightId
    	Flight flight = entityManager.find(Flight.class, flightId); // Use your entity manager
        if (flight == null) {
            throw new IllegalArgumentException("Flight with ID " + flightId + " not found.");
        }

        // Create a new reservation
        Reservation reservation = new Reservation();
        
        reservation.setFlight(flight);
        //reservation.setPassenger(numPassengers);
        reservation.setIssueDate(LocalDate.now());

        // Save the reservation
        return reservationRepository.save(reservation);
    }
    
    @Override
    public Reservation createReservation(Reservation reservation) {
        // You can add additional logic or validation here if needed.
        return reservationRepository.save(reservation);
    }
    
    public List<Reservation> getReservationByUser(String user) {
        return reservationRepository.findByUsername(user);
    }
    
    public Reservation reviewReservation(Long ticketNum, Reservation updatedReservation) {
        Reservation existingReservation = reservationRepository.findById(ticketNum).orElse(null);
        if (existingReservation != null) {
            
        	existingReservation.setCheckedIn(updatedReservation.getCheckedIn() );

            return reservationRepository.save(existingReservation);
        }
        return null; // Policy with the given ID doesn't exist
    }
    
    public Reservation findReservationById(Long ticketNum) {
        // TODO Auto-generated method stub
        var optClaim = reservationRepository.findById(ticketNum);
        return optClaim.isPresent()?optClaim.get():null;
    }
    
    
}
