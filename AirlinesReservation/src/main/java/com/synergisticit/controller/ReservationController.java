package com.synergisticit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.synergisticit.domain.Reservation;
import com.synergisticit.repository.ReservationRepository;
import com.synergisticit.service.ReservationService;

@RestController
@RequestMapping("/reservations")
public class ReservationController {

    private final ReservationService reservationService;
    private final ReservationRepository reservationRepository;


    @Autowired
    public ReservationController(ReservationService reservationService, ReservationRepository reservationRepository) {
        this.reservationService = reservationService;
        this.reservationRepository = reservationRepository;
    }

    // Create a new reservation
    @PostMapping
    public Reservation createReservation(@RequestBody Reservation reservation) {
        return reservationService.createReservation(reservation);
    }
    
    @GetMapping("/byUser/{username}")
    public List<Reservation> getReservationByUser(@PathVariable String username) {
        return reservationService.getReservationByUser(username);
    }
    
    @PutMapping("/reviewReservation/{ticketNum}")
    public ResponseEntity<Reservation> reviewReservation(@PathVariable Long ticketNum, @RequestBody Reservation updatedReservation) {
	 Reservation existingReservation = reservationService.findReservationById(ticketNum);
        if (existingReservation != null) {
        	existingReservation.setCheckedIn(updatedReservation.getCheckedIn());

            

            Reservation updatedReservationResult = reservationRepository.save(existingReservation);
            return ResponseEntity.ok(updatedReservationResult); // Successfully updated
        } else {
            return ResponseEntity.notFound().build(); // Claim not found
        }
    }
}

