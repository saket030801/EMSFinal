<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Search</title>
<style>
        body {
    font-family: 'Arial', sans-serif; 
    background-color: #f4f4f4; /* Consistent with your original */
    color: #333; 
    margin: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center; 
    min-height: 100vh; /* Keep for full page layout */
}

h1 {
    text-align: center;
    color: #0056b3; /* Hypothetical primary color */
    margin-bottom: 25px;
}

h2, h3 { /* Add styling for h2 and h3 if used elsewhere */
    color: #333;
    margin-bottom: 15px;
}

form {
    background-color: #fff;
    padding: 30px; 
    border-radius: 8px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1); /* More subtle shadow */
    width: 400px; /* Increased width for readability */
    margin-bottom: 20px;
    text-align: left;
}

label {
    display: block;
    margin-bottom: 8px;
    color: #555;
}

input[type="text"],
input[type="checkbox"] {
    width: 100%;
    padding: 10px; /* More padding */
    margin-bottom: 16px;
    box-sizing: border-box;
    border: 1px solid #ddd; /* Slightly lighter border */
    border-radius: 4px;
}

button {
    background-color: #0056b3; 
    color: #fff;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-right: 10px; /* Space between buttons */
}

button:hover {
    background-color: #003a8c; 
}

#searchResults {
    text-align: center;
    width: 80%;
    margin: 20px auto; 
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 10px; /* More padding in cells */
    text-align: left;
}

th {
    background-color: #0056b3;
    color: white;
}


    </style>
</head>
<body>
	<h1>Search Employees</h1>
	<br />
	<h3>Select any two fields</h1>
	<br/>
	<form action="/searchEmployees" method="post"
		modelAttribute="employeeSearchForm" id="mainForm">
		<label> First Name <input type="checkbox" name="firstName"
			onchange="toggleInput('fName')">
		</label> <input type="text" name="firstname" id="firstname" class="hidden"> 
		<label>
			Last Name <input type="checkbox" name="lastName"
			onchange="toggleInput('lName')">
		</label> <input type="text" name="lastname" id="lastname" class="hidden"> <label>
			Position <input type="checkbox" name="position"
			onchange="toggleInput('position')">
		</label> <input type="text" name="postion" id="position" class="hidden">

		<button type="submit" onclick="checkCheckboxes()">Search</button>
		<button type="button" onclick="clearSearch()">Clear</button>
	</form>
	<div id="searchResults">
		<!-- Display search results here -->
		<!--   <p>${employees}</p>-->
		<c:choose>
			<c:when test="${not empty employees}">
				<table border="1">
					<tr>
						<th>ID</th>
						<th>First Name</th>
						<th>Middle Name</th>
						<th>Last Name</th>
						<th>Position</th>
						<th>Date of Birth</th>
					</tr>
					<c:forEach var="employee" items="${employees}">
						<tr>
							<td>${employee.id}</td>
							<td>${employee.firstname}</td>
							<td>${employee.middlename}</td>
							<td>${employee.lastname}</td>
							<td>${employee.postion}</td>
							<td>${employee.dob}</td>
							<td>
								<form action="/viewEditEmployees" method="post"
									modelAttribute="editEmp">
									<input type="hidden" name="id" value="${employee.id}" />
									<input type="hidden" name="firstname" value="${employee.firstname}" />
									<input type="hidden" name="middlename" value="${employee.middlename}" />
									<input type="hidden" name="lastname" value="${employee.lastname}" />
									<input type="hidden" name="postion" value="${employee.postion}" />
									<input type="hidden" name="dob" value="${employee.dob}" />
									<button type="submit">Edit Employee</button>
								</form>
								<form action="/addComp" method="get">
								<input type="hidden" name="id" value="${employee.id}" />
									<button type="submit">Add Compensation</button>									
								</form>
								<form action="/viewComp" method="get">
									<button type="submit">View Compensation</button>									
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<h2>No data found</h2>
			</c:otherwise>
		</c:choose>
	</div>

	<script>
        function toggleInput(inputName) {
            const input = document.getElementById(inputName);
            input.classList.toggle('hidden', !input.classList.contains('hidden'));
        }

        function clearSearch() {
            // Clear all checkboxes and hide corresponding text inputs
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.checked = false;
                toggleInput(checkbox.name);
            });
        }
        function checkCheckboxes() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            var checkedCount = 0;

            checkboxes.forEach(function(checkbox) {
              if (checkbox.checked) {
                checkedCount++;
              }
            });

            if (checkedCount < 2) {
            	alert("Please check at least two checkboxes.");
            }

          }
    </script>

</body>
</html>