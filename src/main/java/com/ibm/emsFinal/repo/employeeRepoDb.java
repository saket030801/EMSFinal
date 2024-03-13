package com.ibm.emsFinal.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ibm.emsFinal.model.EmpModel;
import java.time.LocalDate;


@Repository
public interface employeeRepoDb extends JpaRepository<EmpModel, Integer> {
	List<EmpModel> findByFirstname(String firstname);
	List<EmpModel> findByDob(LocalDate dob);
	List<EmpModel> findByLastname(String lastname);
	List<EmpModel> findByMiddlename(String middlename);
	
	List<EmpModel> findByFirstnameAndLastnameAndPostion(String firstname, String lastname,String position);
	List<EmpModel> findByFirstnameAndLastname(String firstname, String lastname);
	List<EmpModel> findByLastnameAndPostion(String lastname, String position);
	List<EmpModel> findByFirstnameAndPostion(String firstname, String position);
	//@Query("select c from emp_model c where c.FName=? and c.LName=?")
	//List<EmpModel> findByfNameAndlName(String fName,String lName);
	//List<EmpModel> findByFNameAndLName(String fName, String lName);
//	List<EmpModel> findBylNameAndpostion(String lName,String postion);
//	List<EmpModel> findByfNameAndpostion(String fName,String postion);
//	List<EmpModel> findByfNameAndlNameAndpostion(String fName,String lName,String postion);

}
