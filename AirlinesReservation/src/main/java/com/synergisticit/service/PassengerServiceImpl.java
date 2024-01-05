package com.synergisticit.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.synergisticit.domain.Passenger;
import com.synergisticit.repository.PassengerRepository;

@Service
public class PassengerServiceImpl implements PassengerService {

    @Autowired
    private PassengerRepository passengerRepository;

    @Override
    public Passenger save(Passenger passenger) {
        return passengerRepository.save(passenger);
    }

    @Override
    public List<Passenger> findAll() {
        List<Passenger> passengers = new ArrayList<>();
        Iterator<Passenger> iterator = passengerRepository.findAll().iterator();
        while (iterator.hasNext()) {
            passengers.add(iterator.next());
        }
        return passengers;
    }

    @Override
    public Passenger findPassengerById(Long passengerId) {
        Optional<Passenger> optionalPassenger = passengerRepository.findById(passengerId);
        return optionalPassenger.orElse(null);
    }

    @Override
    public void deletePassengerById(Long passengerId) {
        passengerRepository.deleteById(passengerId);
    }
}
