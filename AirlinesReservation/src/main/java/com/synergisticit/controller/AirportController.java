package com.synergisticit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.synergisticit.domain.Airport;
import com.synergisticit.service.AirportService;

import jakarta.validation.Valid;

@Controller
public class AirportController {

    @Autowired
    private AirportService airportService;

    @RequestMapping("airportForm")
    public String airportForm(Airport airport, Model model) {
        model.addAttribute("airports", airportService.findAll());
        return "airportForm";
    }

    @RequestMapping("saveAirport")
    public String saveAirport(@Valid @ModelAttribute Airport airport, BindingResult br, Model model) {
        if (!br.hasErrors()) {
            airportService.save(airport);
            return "redirect:airportForm";
        } else {
            model.addAttribute("airports", airportService.findAll());
            return "airportForm";
        }
    }

    @RequestMapping("updateAirport")
    public String updateAirport(Airport airport, Model model) {
        airport = airportService.findAirportById(airport.getAirportId());
        model.addAttribute("airport", airport);
        model.addAttribute("airports", airportService.findAll());
        return "airportForm";
    }

    @RequestMapping("deleteAirport")
    public String deleteAirport(Airport airport, Model model) {
        airportService.deleteAirportById(airport.getAirportId());
        model.addAttribute("airports", airportService.findAll());
        return "airportForm";
    }
}