package com.synergisticit.domain;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter 
@Entity
public class Passenger {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long passengerId;
	
	private String fname;
	private String lname;
	@Email
	private String email;
	private String phone;
	
	private String gender;
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate dateOfBirth;
	
	@Enumerated(EnumType.STRING)
	private IdentificationType idType;
	
	@OneToOne(mappedBy = "passenger") // Add this to specify the owning side of the relationship
    @JsonBackReference
    private Reservation reservation;
	
	@Override
	public String toString() {
		return "Passenger [passengerId=" + passengerId + ", fname=" + fname + ", lname=" + lname + ", email=" + email
				+ ", phone=" + phone + ", gender=" + gender + ", dateOfBirth=" + dateOfBirth + ", idType=" + idType
				+ "]";
	}
	
	
	
}
