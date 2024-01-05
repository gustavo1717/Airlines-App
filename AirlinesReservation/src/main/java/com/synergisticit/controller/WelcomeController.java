package com.synergisticit.controller;

import java.io.Console;
import java.security.Principal;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.synergisticit.domain.Airline;
import com.synergisticit.domain.Airport;
import com.synergisticit.domain.Flight;
import com.synergisticit.domain.User;
import com.synergisticit.service.AirlineService;
import com.synergisticit.service.AirportService;
import com.synergisticit.service.FlightService;
import com.synergisticit.service.UserService;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

@Controller
public class WelcomeController {

	@Autowired UserService userService;
	
    @Autowired private FlightService flightService;
    @Autowired private AirportService airportService;
    @Autowired private AirlineService airlineService;

	
	@RequestMapping(value = "/home",method = RequestMethod.GET)
	public String home(Principal principal, Model model, Flight flight) {
		
		Authentication authentication = (Authentication) principal;

        if (authentication != null) {
            // Check if the principal is an instance of UserDetails
            if (authentication.getPrincipal() instanceof org.springframework.security.core.userdetails.UserDetails) {
                org.springframework.security.core.userdetails.UserDetails userDetails =
                    (org.springframework.security.core.userdetails.UserDetails) authentication.getPrincipal();

                // Get the authorities (roles) from UserDetails
                Collection<? extends GrantedAuthority> authorities = userDetails.getAuthorities();

                // Now you can use the authorities (roles) as needed
                for (GrantedAuthority authority : authorities) {
                    String role = authority.getAuthority();
                    // Add the roles to the model or perform any other actions
                    model.addAttribute("role", role);
                }
            }
        }
        
		//model.addAttribute("userIsAuthenticated", false);
		if (principal != null) {
			
			
			//model.addAttribute("userIsAuthenticated", true);
	        model.addAttribute("principalName", principal.getName());
	        
	        System.out.println(principal.getName());
	        String username = principal.getName();
	        User user = userService.findByUserName(username);
	        //model.addAttribute("userEmail", user.getEmail());
	    }
		List<Flight> allFlights = flightService.findAll();
		System.out.println("All Flights: " + allFlights);
		
		List<Airport> airports = airportService.findAll();
        List<Airline> airlines = airlineService.findAll();
        model.addAttribute("airlines", airlines);
        model.addAttribute("airports", airports);
        model.addAttribute("flights", allFlights);
		return "home";
		
	}
	
	@GetMapping("/register")
		public String register() {
		return "signup";
	}
	
	@RequestMapping(value = "/profile",method = RequestMethod.GET)
	public String profile(Principal principal, Model model) {
		
		model.addAttribute("principalName", principal.getName());
		
		return "profile";
		
	}
	
	
	
}
