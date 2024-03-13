<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Compensation Form</title>
    <style>
        body {
    font-family: 'Arial', sans-serif; 
    background-color: #f4f4f4; /* Consistent with other files */
    color: #333; 
    margin: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center; 
    min-height: 100vh; /* Keep for full page layout */
}

h2 {
    text-align: center;
    color:  #0056b3; /* Use your primary color */
    margin-bottom: 20px; 
}

form {
    background-color: #fff;
    padding: 30px; 
    border-radius: 8px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1); /* More subtle shadow */
    width: 400px; /* Increased width for readability */
    margin-bottom: 20px;
    text-align: left; /* Align with other forms */
}

label {
    display: block;
    margin-bottom: 8px;
    color: #555;
}

select,
input { 
    width: 100%;
    padding: 10px; /* Increase padding */
    margin-bottom: 16px;
    box-sizing: border-box;
    border: 1px solid #ddd; /* Slightly lighter border */
    border-radius: 4px;
}

input[type="number"] {
    -moz-appearance: textfield; 
}

input[type="submit"] {
    background-color: #0056b3; 
    color: #fff;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 10px; /* Add spacing from inputs */
}

input[type="submit"]:hover {
    background-color: #003a8c; 
}

/* Specific styles for feedback */
div.success {
    color: #4caf50; /* A success green */
    margin-top: 10px;
}

div.error {
    color: #d9534f; /* A standard error red */
    margin-top: 10px;
} 

    </style>
</head>
<body>

<h2>Compensation Form</h2>

<form action="/addComp" method="post" modeAttribute="comp">
    <label for="type">Type of Compensation:</label>
    <select id="type" name="type">
        <option value="Salary">Salary</option>
        <option value="Bonus">Bonus</option>
        <option value="Commission">Commission</option>
        <option value="Allowance">Allowance</option>
        <option value="Adjustment">Adjustment</option>
    </select>
    <br>

    <label for="amount">Amount:</label>
    <input type="number" id="amount" name="amount" step="0.01" required>
    <br>
	<input type="hidden"  name="id" value="${employeeId}" >
	<input type="hidden"  name="compId" value="${compId}" >
    <label for="description">Description:</label>
    <input type="text" id="description" name="description" required>
    <br>

     <label for="selectedMonthYear">Date:</label>
     <input type="month" id="selectedMonthYear" name="selectedMonthYear" required>
    <br>

    <input type="submit" value="Submit">
</form>

    <c:if test="${not empty successMessage}">
        <div style="color: green;">${successMessage}</div>
    </c:if>

    <!-- Display error message -->
    <c:if test="${not empty errorMessage}">
        <div style="color: red;">${errorMessage}</div>
    </c:if>

</body>
</html>
