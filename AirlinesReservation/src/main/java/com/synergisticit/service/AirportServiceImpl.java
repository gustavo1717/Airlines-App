package com.synergisticit.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergisticit.domain.Airport;
import com.synergisticit.repository.AirportRepository;

@Service
public class AirportServiceImpl implements AirportService {

    @Autowired private AirportRepository airportRepository;

    @Override
    public Airport save(Airport airport) {
        return airportRepository.save(airport);
    }

    @Override
    public Airport findAirportById(long airportId) {
        Optional<Airport> optAirport = airportRepository.findById(airportId);
        return optAirport.orElse(null);
    }

    @Override
    public List<Airport> findAll() {
        List<Airport> airports = new ArrayList<>();

        Iterable<Airport> iterable = airportRepository.findAll();
        Iterator<Airport> itr = iterable.iterator();

        while (itr.hasNext()) {
            airports.add(itr.next());
        }

        return airports;
    }

    @Override
    public void deleteAirportById(long airportId) {
        airportRepository.deleteById(airportId);
    }
}
