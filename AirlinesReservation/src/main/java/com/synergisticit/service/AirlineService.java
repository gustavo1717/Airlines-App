package com.synergisticit.service;

import java.util.List;

import com.synergisticit.domain.Airline;

public interface AirlineService {
	
	Airline save(Airline airline);

    Airline findAirlineById(Long airlineId);

    List<Airline> findAll();

    void deleteAirlineById(Long airlineId);
    

}
