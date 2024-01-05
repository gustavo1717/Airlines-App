package com.synergisticit.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.synergisticit.domain.Airport;
import com.synergisticit.domain.Flight;

public interface FlightRepository extends JpaRepository <Flight, Long> {
    List<Flight> findByDepartureCityAndArrivalCityAndDepartureDate(Airport departureCity, Airport arrivalCity, LocalDate departureDate);

	List<Flight> findByDepartureCityAndArrivalCity(Airport departureCity, Airport arrivalCity);
}
