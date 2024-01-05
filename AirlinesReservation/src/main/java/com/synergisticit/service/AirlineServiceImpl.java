package com.synergisticit.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergisticit.domain.Airline;
import com.synergisticit.repository.AirlineRepository;

@Service
public class AirlineServiceImpl implements AirlineService {

    @Autowired private AirlineRepository airlineRepository;

    @Override
    public Airline save(Airline airline) {
        return airlineRepository.save(airline);
    }

    @Override
    public Airline findAirlineById(Long airlineId) {
        Optional<Airline> optAirline = airlineRepository.findById(airlineId);
        return optAirline.orElse(null);
    }

    @Override
    public List<Airline> findAll() {
        List<Airline> airlines = new ArrayList<>();
        airlineRepository.findAll().forEach(airlines::add);
        return airlines;
    }

    @Override
    public void deleteAirlineById(Long airlineId) {
        airlineRepository.deleteById(airlineId);
    }
}
