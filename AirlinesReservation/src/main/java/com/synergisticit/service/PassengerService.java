package com.synergisticit.service;

import java.util.List;

import com.synergisticit.domain.Passenger;

public interface PassengerService {
	Passenger save(Passenger passenger);
    List<Passenger> findAll();
    Passenger findPassengerById(Long passengerId);
    void deletePassengerById(Long passengerId);
}
