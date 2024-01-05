	package com.synergisticit.domain;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter 
@Entity
public class Airport {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long airportId;
	
	private String airportCity;
	
	private String airportCode;
	
	@OneToMany(mappedBy="arrivalCity")
	private  List<Flight> arrivalFlights = new ArrayList<>();
	
	@OneToMany(mappedBy="departureCity")
	private List<Flight> departureFlights = new ArrayList<>();

	@Override
	public String toString() {
		return "Airport [airportId=" + airportId + ", airportCity=" + airportCity + ", airportCode=" + airportCode
				+ ", arrivalFlights=" + arrivalFlights + ", departureFlights=" + departureFlights + "]";
	}

	
	
	
}
