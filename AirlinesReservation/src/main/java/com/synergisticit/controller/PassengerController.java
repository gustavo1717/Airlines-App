package com.synergisticit.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.synergisticit.domain.Airport;
import com.synergisticit.domain.Passenger;
import com.synergisticit.service.AirportService;
import com.synergisticit.service.PassengerService;

import jakarta.validation.Valid;

@RestController
public class PassengerController {

	@Autowired
    private PassengerService passengerService;

    @GetMapping("/passengerForm")
    public String passengerForm(Passenger passenger, Model model) {
        model.addAttribute("passengers", passengerService.findAll());
        return "passengerForm";
    }

    /*@PostMapping("/savePassenger")
    public ResponseEntity<Passenger> savePassenger(@RequestBody Passenger passenger) {
        Passenger savedPassenger = passengerService.saver(passenger);
        return ResponseEntity.ok(savedPassenger);
    }*/
    
    /*@RequestMapping(value = "/savePassenger", method = RequestMethod.POST)
    public Passenger savePassenger(@RequestBody Passenger passenger) {
        return passengerService.save(passenger);
    }*/
    
    @PostMapping("/savePassenger")
    public ResponseEntity<Passenger> savePassenger(@RequestBody Passenger passenger) {
        Passenger savedPassenger = passengerService.save(passenger);
        return ResponseEntity.ok(savedPassenger);
    }
}