package com.synergisticit.service;

import java.util.List;

import com.synergisticit.domain.Airport;

public interface AirportService {

	Airport save(Airport airport);
    Airport findAirportById(long airportId);
    List<Airport> findAll();
    void deleteAirportById(long airportId);
    
}
