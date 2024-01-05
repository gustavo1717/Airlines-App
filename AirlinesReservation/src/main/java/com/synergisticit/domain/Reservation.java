package com.synergisticit.domain;

import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Reservation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ticketNum;
	
	@OneToOne
	@JsonManagedReference
	private Passenger passenger;

	@ManyToOne
	//@JsonIgnore
	@JoinColumn(name = "flight_id")
	private Flight flight;
	
	private String checkedIn;
	
	private LocalDate issueDate;
	
	private String username;

	@Override
	public String toString() {
		return "Reservation [ticketNum=" + ticketNum + ", passenger=" + passenger + ", flight=" + flight
				+ ", checkedIn=" + checkedIn + ", issueDate=" + issueDate + "]";
	}
	
	
	
	
}
