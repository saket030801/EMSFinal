<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Compensation</title>
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
	color: #0056b3; /* Use your primary color */
	margin-bottom: 20px;
}

form {
	background-color: #fff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1); /* Subtle box shadow */
	width: 400px; /* Increased width for readability */
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
</style>
</head>
<body>

	<h2>Edit Compensation</h2>

	<form action="/editComp" method="post" modeAttribute="comp">

		<label for="amount">Amount:</label> <input type="number" id="amount"
			name="amount" step="0.01" required> <br> <input
			type="hidden" name="id" value="${employeeId}"> <label
			for="description">Description:</label> <input type="text"
			id="description" name="description" required> <br> <input
			type="submit" value="Submit">
	</form>

</body>
</html>
