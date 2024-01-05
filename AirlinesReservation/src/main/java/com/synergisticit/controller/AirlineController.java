package com.synergisticit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.synergisticit.domain.Airline;
import com.synergisticit.service.AirlineService;

import jakarta.validation.Valid;

@Controller
public class AirlineController {

    @Autowired private AirlineService airlineService;

    @RequestMapping("airlineForm")
    public String airlineForm(Airline airline, Model model) {
        model.addAttribute("airlines", airlineService.findAll());
        return "airlineForm";
    }

    @RequestMapping("saveAirline")
    public String saveAirline(@Valid @ModelAttribute Airline airline, BindingResult br, Model model) {
        if (!br.hasErrors()) {
            airlineService.save(airline);
            return "redirect:airlineForm";
        } else {
            model.addAttribute("airlines", airlineService.findAll());
            return "airlineForm";
        }
    }

    @RequestMapping("updateAirline")
    public String updateAirline(Airline airline, Model model) {
        airline = airlineService.findAirlineById(airline.getAirlineId());
        model.addAttribute("airline", airline);
        model.addAttribute("airlines", airlineService.findAll());
        return "airlineForm";
    }

    @RequestMapping("deleteAirline")
    public String deleteAirline(Airline airline, Model model) {
        airlineService.deleteAirlineById(airline.getAirlineId());
        model.addAttribute("airlines", airlineService.findAll());
        return "airlineForm";
    }
}