package com.ibm.emsFinal.service;

import java.util.List;
import java.util.Optional;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.emsFinal.model.EmpModel;
import com.ibm.emsFinal.repo.employeeRepoDb;

@Service
public class empService {
	@Autowired
	private employeeRepoDb repo;
	public Boolean addEmp(EmpModel emp) {
		try {
			if(repo.findByFirstname(emp.getFirstname()).size()>0 && repo.findByMiddlename(emp.getMiddlename()).size()>0 && repo.findByLastname(emp.getLastname()).size()>0 && repo.findByDob(emp.getDob()).size()>0) {
				return false;
			}
			repo.save(emp);
			return true;
		}
		catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
	public Boolean updateEmp(EmpModel emp) {
		try {
			EmpModel existingEmployee=repo.findById(emp.getId()).orElse(null);
			System.out.println(existingEmployee);
			 if (existingEmployee != null) {
				 System.out.println("IF");
		            // Update fields based on the editedEmployee
		            existingEmployee.setFirstname(emp.getFirstname());
		            existingEmployee.setMiddlename(emp.getMiddlename());
		            existingEmployee.setLastname(emp.getLastname());
		            existingEmployee.setPostion(emp.getPostion());
		            existingEmployee.setDob(emp.getDob());
		            
		            // Save the changes
		            repo.save(existingEmployee);
		        }
			
			return true;
		}
		catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
	public List<EmpModel> searchEmp(EmpModel emp){
		System.out.println(emp);
		//return repo.findAll();
		if(emp.getFirstname().length()>0&&emp.getLastname().length()>0 &&emp.getPostion().length()>0)
		{
			System.out.println("DODODODO");
			return repo.findByFirstnameAndLastnameAndPostion(emp.getFirstname(),emp.getLastname(),emp.getPostion());
	}
	if(emp.getFirstname().length()>0&&emp.getLastname().length()>0)
		{
			return repo.findByFirstnameAndLastname(emp.getFirstname(),emp.getLastname());
	}
		if(emp.getLastname().length()>0&&emp.getPostion().length()>0)
		{
			return repo.findByLastnameAndPostion(emp.getLastname(), emp.getPostion());
	}
		if(emp.getFirstname().length()>0&&emp.getPostion().length()>0)
		{
		return repo.findByFirstnameAndPostion(emp.getFirstname(),emp.getPostion());
		}
		return null;
	}
}
