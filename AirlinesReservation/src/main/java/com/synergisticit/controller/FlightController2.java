package com.synergisticit.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.synergisticit.domain.Airline;
import com.synergisticit.domain.Airport;
import com.synergisticit.domain.Flight;
import com.synergisticit.service.AirlineService;
import com.synergisticit.service.AirportService;
import com.synergisticit.service.FlightService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/flights")
public class FlightController2 {

    @Autowired
    private FlightService flightService;
    @Autowired
    private AirportService airportService;
    @Autowired
    private AirlineService airlineService;

    @GetMapping("/flightForm")
    public List<Flight> flightForm() {
        return flightService.findAll();
    }

    @PostMapping("/saveFlight")
    public ResponseEntity<Flight> saveFlight(@Valid @RequestBody Flight flight) {
        Flight savedFlight = flightService.save(flight);
        return ResponseEntity.ok(savedFlight);
    }

    @PutMapping(value = "/updateFlight/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Flight> updateFlight(@PathVariable Long id, @Valid @RequestBody Flight flight) {
        Flight updatedFlight = flightService.updateFlight(id, flight);
        if (updatedFlight != null) {
            return ResponseEntity.ok(updatedFlight);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/deleteFlight/{id}")
    public void deleteFlight(@PathVariable Long id) {
        flightService.deleteFlightById(id);
    }

    @GetMapping("/searchFlights")
    public List<Flight> searchFlights(@RequestParam Long departureCity, @RequestParam Long arrivalCity,
                                      @RequestParam(required = false) @DateTimeFormat(iso = ISO.DATE) LocalDate departureDate) {
        Airport departureAirport = airportService.findAirportById(departureCity);
        Airport arrivalAirport = airportService.findAirportById(arrivalCity);

        List<Flight> flights;
        if (departureDate != null) {
            flights = flightService.findFlightsByCriteria(departureAirport, arrivalAirport, departureDate);
        } else {
            flights = flightService.findFlightsByCriteria(departureAirport, arrivalAirport);
        }

        return flights;
    }

    @GetMapping("/getFlightById/{id}")
    public ResponseEntity<Flight> getFlightById(@PathVariable Long id) {
        Flight flight = flightService.findFlightById(id);
        if (flight != null) {
            return ResponseEntity.ok(flight);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
