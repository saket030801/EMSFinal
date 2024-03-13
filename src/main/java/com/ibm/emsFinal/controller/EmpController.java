package com.ibm.emsFinal.controller;

import java.time.YearMonth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibm.emsFinal.model.CompModel;
import com.ibm.emsFinal.model.EmpModel;
import com.ibm.emsFinal.service.CompService;
import com.ibm.emsFinal.service.empService;
//import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmpController {
	@Autowired
	private empService service;
	@Autowired
	private CompService cService;
	
@GetMapping({"/","/home"})
public String home() {
	return "home";
}
@GetMapping("/addEmployee")
public String addEmployeePage() {
	return "AddEmployee";
}

@PostMapping("/addEmployee")
public String addEmployee(@ModelAttribute("emp") EmpModel emp,Model model ) {
	boolean isEmpAdded=service.addEmp(emp);
	System.out.println(isEmpAdded);
	if (isEmpAdded) {
        model.addAttribute("successMessage", "Employee added successfully!");
    } else {
        model.addAttribute("errorMessage", "Failed to add employee!!Employee already there in database");
    }

    return "AddEmployee";
}

@GetMapping("/searchEmployees")
public String searchEmployeesPage() {
    return "SearchEmployee";
}

@PostMapping("/searchEmployees")
public String searchEmployees(@ModelAttribute("employeeSearchForm") EmpModel emp,Model model ) {
	model.addAttribute("employees", service.searchEmp(emp));
	System.out.println(emp);
    return "SearchEmployee";
}
@GetMapping("/viewEditEmployees")
public String viewEditEmployees() {
    return "editEmployee";
}

@PostMapping("/viewEditEmployees")
public String viewEditEmployees(@ModelAttribute("editEmp") EmpModel emp,Model model ) {
	//System.out.println("IDDDD");
    return "editEmployee";
}

@PostMapping("/editEmployees")
public String editEmployees(@ModelAttribute("editEmp") EmpModel emp,Model model ) {
	System.out.println("HELLO");
	System.out.println(emp);
	boolean isEmpAdded=service.updateEmp(emp);
	if (isEmpAdded) {
        model.addAttribute("successMessage", "Employee updated successfully!");
    } else {
        model.addAttribute("errorMessage", "Failed to update employee!!Employee already there in database");
    }

    return "editEmployee";
}

@GetMapping("/addComp")
public String addCom(@RequestParam("id") int employeeId, Model model) {
	model.addAttribute("employeeId", employeeId);
	System.out.println(model);
    return "AddCompensation";
}

@PostMapping("/addComp")
public String addCom(@RequestParam("id") int id,@ModelAttribute("comp") CompModel com,Model model ) {
	model.addAttribute("compId",com.getId());
	if(cService.addAmountToList(id,com.getAmount(),com))
	{
		 model.addAttribute("successMessage", "Compensation added successfully!Go back to add again");
		System.out.println("Success");
	}
	else
	{
		System.out.println("Failed");
		model.addAttribute("errorMessage", "Failed to add compensation!!Go back");		
	}
    return "AddCompensation";
}

@GetMapping("/viewComp")
public String viewCom() {
    return "viewCompensation";
}
@PostMapping("/viewComp")
public String viewCom(@RequestParam("startDate") YearMonth startDate,
        @RequestParam("endDate") YearMonth endDate,Model model ) {
	System.out.println(startDate);
	model.addAttribute("dataComp", cService.getComp(startDate,endDate));
	System.out.println(cService.getComp(startDate,endDate));
    return "viewCompensation";
}

@GetMapping("/editComp")
public String editCom(@RequestParam("id") int id,Model model) {
	System.out.println(id);
	model.addAttribute("employeeId", id);
    return "viewEditCompensation";
}

@PostMapping("/editComp")
public String editCom(@RequestParam("id") int id,@RequestParam("amount") int amt,@RequestParam("description") String desc ) {
	
	if(cService.edit(id,amt,desc)) {
		System.out.println("Success");
	}
	else
		System.out.println("Failed");
    return "viewEditCompensation";
}



}
