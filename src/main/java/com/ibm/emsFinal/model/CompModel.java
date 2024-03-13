package com.ibm.emsFinal.model;

import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.MapsId;
import jakarta.persistence.OneToOne;

@Component
@Entity
public class CompModel {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int comid;
	@Column(name = "id")
	private int id;
	private String type;
	//private List<Integer> amount;
	private List<Integer> amount = new ArrayList<>();
	private String description;
	private YearMonth selectedMonthYear;

	public int getComid() {
		return comid;
	}
	public void setComid(int comid) {
		this.comid = comid;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public YearMonth getSelectedMonthYear() {
		return selectedMonthYear;
	}
	public void setSelectedMonthYear(YearMonth selectedMonthYear) {
		this.selectedMonthYear = selectedMonthYear;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<Integer> getAmount() {
		return amount;
	}
	public void setAmount(List<Integer> amount) {
		this.amount=amount;
	}
	 public void addAmount(Integer amount) {
		 	System.out.println(amount);
		 	System.out.println(this.amount+"amasdsasa");
		 	//this.getAmount().add(amount);
	        this.amount.add(amount);
	    }
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public CompModel() {
		super();
	}
	@Override
	public String toString() {
		return "CompModel [comid=" + comid + ", id=" + id + ", type=" + type + ", amount=" + amount + ", description="
				+ description + ", selectedMonthYear=" + selectedMonthYear + "]";
	}
	public CompModel(int comid, int id, String type, List<Integer> amount, String description,
			YearMonth selectedMonthYear) {
		super();
		this.comid = comid;
		this.id = id;
		this.type = type;
		this.amount = amount;
		this.description = description;
		this.selectedMonthYear = selectedMonthYear;
	}
}