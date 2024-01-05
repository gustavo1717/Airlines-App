package com.synergisticit.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.synergisticit.domain.Airline;
import com.synergisticit.domain.Airport;
import com.synergisticit.domain.Flight;
import com.synergisticit.service.AirlineService;
import com.synergisticit.service.AirportService;
import com.synergisticit.service.FlightService;

import jakarta.validation.Valid;

@Controller
public class FlightController {

    @Autowired private FlightService flightService;
    @Autowired private AirportService airportService;
    @Autowired private AirlineService airlineService;


    @GetMapping("/flightForm")
    public String flightForm(Flight flight, Model model) {
        model.addAttribute("flights", flightService.findAll());
        List<Airport> airports = airportService.findAll();
        List<Airline> airlines = airlineService.findAll();
        model.addAttribute("airlines", airlines);
        
        model.addAttribute("airports", airports);
        return "flightForm";
    }

    @PostMapping("/saveFlight")
    public String saveFlight(@Valid @ModelAttribute Flight flight, Model model) {
        flightService.save(flight);
        return "redirect:/flightForm";
    }

    /*@GetMapping("/updateFlight")
    public String updateFlight(Flight flight, Model model) {
        flight = flightService.findFlightById(flight.getFlightId());
        model.addAttribute("flight", flight);
        model.addAttribute("flights", flightService.findAll());
        return "flightForm";
    }*/
    @PutMapping("/updateFlight")
    public ResponseEntity<Flight> updateFlight(@PathVariable Long id, @RequestBody Flight flight) {
        Flight updatedFlight = flightService.updateFlight(id, flight);
        if (updatedFlight != null) {
            return ResponseEntity.ok(updatedFlight);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/deleteFlight")
    public String deleteFlight(Flight flight, Model model) {
        flightService.deleteFlightById(flight.getFlightId());
        model.addAttribute("flights", flightService.findAll());
        return "flightForm";
    }
    
    @PostMapping("/searchFlights")
    public String searchFlights(@RequestParam Long departureCity,
                                @RequestParam Long arrivalCity,
                                @RequestParam(required = false) @DateTimeFormat(iso = ISO.DATE) LocalDate departureDate,
                                Model model, Principal principal) {
    	model.addAttribute("principalName", principal.getName());
        List<Airport> airports = airportService.findAll();
        List<Airline> airlines = airlineService.findAll();
        model.addAttribute("airlines", airlines);
        model.addAttribute("airports", airports);
        Airport departureAirport = airportService.findAirportById(departureCity);
        Airport arrivalAirport = airportService.findAirportById(arrivalCity);

        List<Flight> flights;
        if (departureDate != null) {
            // Call the flight service to find flights based on the criteria
            flights = flightService.findFlightsByCriteria(departureAirport, arrivalAirport, departureDate);
        } else {
            // If departureDate is not provided, you can handle it differently, e.g., by showing all available flights.
            flights = flightService.findFlightsByCriteria(departureAirport, arrivalAirport);
        }

        // Add the flights to the model to display in the searchFlightForm
        model.addAttribute("flights", flights);

        return "searchFlightForm"; // Return the JSP page to display search results
    }



    
    @GetMapping("/searchFlightForm")
    public String searchFlighs(Principal principal, Flight flight, Model model) {
        model.addAttribute("flights", flightService.findAll());
        model.addAttribute("principalName", principal.getName());
        List<Airport> airports = airportService.findAll();
        List<Airline> airlines = airlineService.findAll();
        model.addAttribute("airlines", airlines);
        model.addAttribute("airports", airports);
        return "searchFlightForm"; // Return the JSP page for flight form
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