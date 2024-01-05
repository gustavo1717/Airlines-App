package com.synergisticit.service;

import java.time.LocalDate;
import java.util.List;

import com.synergisticit.domain.Airport;
import com.synergisticit.domain.Flight;

public interface FlightService {

	Flight save(Flight flight);
    Flight findFlightById(Long flightId);
    List<Flight> findAll();
    void deleteFlightById(Long flightId);
    
    List<Flight> findFlightsByCriteria(Airport departureCity, Airport arrivalCity, LocalDate departureDate);
    List<Flight> findFlightsByCriteria(Airport departureCity, Airport arrivalCity);
    Flight updateFlight(Long id, Flight updatedFlight);

    
}
