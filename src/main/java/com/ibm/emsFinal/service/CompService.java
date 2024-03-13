package com.ibm.emsFinal.service;

import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.emsFinal.model.CompModel;
import com.ibm.emsFinal.model.EmpModel;
import com.ibm.emsFinal.repo.compensationRepoDb;
import com.ibm.emsFinal.repo.employeeRepoDb;

@Service
public class CompService {
	@Autowired
	private compensationRepoDb repo;
	public Boolean addComp(CompModel com) {
		try {
			if(com.getType().equals("salary") && com.getAmount().size()>1)
				return false;
			repo.save(com);
			return true;
		}
		catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
	public List<CompModel> getComp(YearMonth startDate,YearMonth endDate){
		return repo.findBySelectedMonthYearBetween(startDate, endDate);

	}

	 public boolean addAmountToList(int id, List<Integer> amounts,CompModel com) {
		 CompModel compModel=repo.findByidAndType(id,com.getType());
		 	System.out.println(amounts);
		 	List<Integer> emptyList = new ArrayList<>();
		 	System.out.println(compModel);
	        if (compModel== null) {
	        	System.out.println("1st time");
	            com.setAmount(amounts);
	            repo.save(com);
	        } else {
	        	System.out.println("2nd time");
	        	compModel.getAmount().add(amounts.get(0));
	        	repo.save(compModel);
	        }

	        return true;
	    }

	public boolean edit(int id, int amt, String desc) {
		try {
			List<CompModel> existingCompensation=repo.findById(id);
			System.out.println(existingCompensation+"DSADS"+id);
			List<Integer> myList = new ArrayList<>();
			 if (existingCompensation != null) {
				 myList.add(amt);
				 existingCompensation.get(0).setAmount(myList);
            	  existingCompensation.get(0).setDescription(desc);
		           repo.saveAll(existingCompensation);
		        }
			
			return true;
		}
		catch(Exception e) {
			System.out.println(e);
			return false;
		}
		
	}

}
