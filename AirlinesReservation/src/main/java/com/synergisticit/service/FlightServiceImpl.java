package com.synergisticit.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergisticit.domain.Airport;
import com.synergisticit.domain.Flight;
import com.synergisticit.repository.FlightRepository;

@Service
public class FlightServiceImpl implements FlightService {

    @Autowired private FlightRepository flightRepository;

    @Override
    public Flight save(Flight flight) {
        return flightRepository.save(flight);
    }

    @Override
    public Flight findFlightById(Long flightId) {
        Optional<Flight> optionalFlight = flightRepository.findById(flightId);
        return optionalFlight.orElse(null);
    }

    @Override
    public List<Flight> findAll() {
        List<Flight> flights = new ArrayList<>();
        Iterator<Flight> iterator = flightRepository.findAll().iterator();
        while (iterator.hasNext()) {
            flights.add(iterator.next());
        }
        return flights;
    }

    @Override
    public void deleteFlightById(Long flightId) {
        flightRepository.deleteById(flightId);
    }
    
    @Override
    public List<Flight> findFlightsByCriteria(Airport departureCity, Airport arrivalCity, LocalDate departureDate) {
        // Implement flight search logic based on the provided criteria
        return flightRepository.findByDepartureCityAndArrivalCityAndDepartureDate(departureCity, arrivalCity, departureDate);
    }
    
    
    public List<Flight> findFlightsByCriteria(Airport departureCity, Airport arrivalCity) {
        // Implement flight search logic based on the provided criteria
        return flightRepository.findByDepartureCityAndArrivalCity(departureCity, arrivalCity);
    }
    
    public Flight updateFlight(Long id, Flight updatedFlight) {
        Flight existingFlight = flightRepository.findById(id).orElse(null);
        if (existingFlight != null) {
            
            existingFlight.setBooked(updatedFlight.getBooked());

            return flightRepository.save(existingFlight);
        }
        return null; // Flight with the given ID doesn't exist
    }
}