
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Edit Employee</title>
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

h1 { /* Add if you use h1 on other pages */
	text-align: center;
	color: #0056b3; /* Hypothetical primary color */
	margin-bottom: 25px;
}

form {
	background-color: #fff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1); /* More subtle shadow */
	width: 400px; /* Increased width */
	margin-bottom: 20px;
	text-align: left; /* Align with other forms */
}

label {
	display: block;
	margin-bottom: 8px;
	color: #555;
}

input {
	width: 100%;
	padding: 10px; /* Increase padding */
	margin-bottom: 16px;
	box-sizing: border-box;
	border: 1px solid #ddd; /* Slightly lighter border */
	border-radius: 4px;
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

	<form action="/editEmployees" method="post" modelAttribute="editEmp">
		<input type="hidden" name="id" value="${editEmp.id}" /> <label
			for="FName">First Name:</label> <input type="text" id="firstname"
			name="firstname" value="${editEmp.firstname}" required><br>

		<label for="MName">Middle Name:</label> <input type="text"
			id="middlename" name="middlename" value="${editEmp.middlename}"
			required><br> <label for="LName">Last Name:</label> <input
			type="text" id="lastname" name="lastname" value="${editEmp.lastname}"
			required><br> <label for="position">Position:</label> <input
			type="text" id="position" name="postion" value="${editEmp.postion}"
			required><br> <label for="dob">Date of Birth:</label> <input
			type="text" id="dob" name="dob" value="${editEmp.dob}" required><br>

		<input type="submit" value="Update">
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
