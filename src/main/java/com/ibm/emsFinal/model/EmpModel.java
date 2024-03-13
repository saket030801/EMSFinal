package com.ibm.emsFinal.model;

import java.time.LocalDate;
import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrimaryKeyJoinColumn;

@Component
@Entity
public class EmpModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name="id")
	private int id;
	@Column(nullable = false)
	private String firstname;
	private String middlename;
	@Column(nullable = false)
	private String lastname;
	@Column(nullable = false)
	private String postion;
	
	@Column(nullable = false)
	private LocalDate dob;
	

	public EmpModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public EmpModel(int id, String firstname, String middlename, String lastname, String postion, LocalDate dob) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.middlename = middlename;
		this.lastname = lastname;
		this.postion = postion;
		this.dob = dob;
	}
	
	
	public String getFirstname() {
		return firstname;
	}


	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}


	public String getMiddlename() {
		return middlename;
	}


	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}


	public String getLastname() {
		return lastname;
	}


	public void setLastname(String lastname) {
		this.lastname = lastname;
	}


	public LocalDate getDob() {
		return dob;
	}
	public void setDob(LocalDate dob) {
		this.dob = dob;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getPostion() {
		return postion;
	}
	public void setPostion(String postion) {
		this.postion = postion;
	}

	@Override
	public String toString() {
		return "EmpModel [id=" + id + ", firstname=" + firstname + ", middlename=" + middlename + ", lastname="
				+ lastname + ", postion=" + postion + ", dob=" + dob + "]";
	}
	
	

}
