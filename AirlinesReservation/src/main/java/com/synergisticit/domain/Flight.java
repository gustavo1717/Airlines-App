package com.synergisticit.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter 
@Entity
public class Flight {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long flightId;
		
	private Double ticketPrice;
	
	private int capacity;
	
	private int booked;
	
    @JsonBackReference(value = "departureCity")
	@ManyToOne
	private Airport departureCity;
	
    @JsonBackReference(value = "arrivalCity")
	@ManyToOne
	private Airport arrivalCity;
	
	@JsonBackReference("airline-name")
	@ManyToOne
	private Airline operatingAirline;
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate departureDate;
	
	@DateTimeFormat(iso = ISO.TIME)
	private LocalTime departureTime;
	
	/*@OneToOne(mappedBy = "flight") 
    @JsonBackReference
    private Reservation reservation;*/

	@Override
	public String toString() {
		return "Flight [flightId=" + flightId + ", ticketPrice=" + ticketPrice
				+ ", capacity=" + capacity + ", booked=" + booked + ", departureCity=" + departureCity.getAirportCode()
				+ ", arrivalCity=" + arrivalCity.getAirportCode() + ", operatingAirline=" + operatingAirline.getAirlineName() + ", departureDate="
				+ departureDate + ", departureTime=" + departureTime + "]";
	}
	
	
	
}
