/*package com.synergisticit.controller;

import java.io.Console;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.synergisticit.domain.Role;
import com.synergisticit.domain.User;
import com.synergisticit.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;

//@WebServlet("/home")
@Controller
public class homeController {
	
    private static final Logger logger = LoggerFactory.getLogger(homeController.class);
    
    @Autowired UserService userService;
	
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the home.jsp page
        request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
    }*/
	
	/*@GetMapping("/home")
    public String homepages(Model model, Principal principal) {
        model.addAttribute("principalName", principal.getName());

		if (principal != null) {
    	    logger.info("User email: {}", principal.getName());
	        model.addAttribute("principalName", principal.getName());

    	    return "redirect:/home";
    	} 
        else {
    	    logger.error("Principal is null");
    	}
    	
        return "home";

}
}*/
