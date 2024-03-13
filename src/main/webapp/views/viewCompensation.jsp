<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Compensation</title>
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

input[type="month"] {
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

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1); /* Subtle box shadow */
	border-radius: 8px;
}

th, td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: left;
}

th {
	background-color: #0056b3;
	color: white;
}

tbody tr:hover {
	background-color: #f5f5f5;
}

button {
	background-color: #0056b3; /* Use primary color */
	color: #fff;
	padding: 8px 12px; /* Add a little more padding */
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #003a8c;
}
</style>
</head>
<body>

	<h2>View Compensation</h2>
	<%
	out.println();
	%>
	<form action="/viewComp" method="post">
		<label for="startDate">Start Date:</label> <input type="month"
			id="startDate" name="startDate" required> <br> <label
			for="endDate">End Date:</label> <input type="month" id="endDate"
			name="endDate" required> <br> <input type="submit"
			value="Submit">
	</form>

	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>Type</th>
				<th>Amount</th>
				<th>Description</th>
				<th>Selected MonthYear</th>
				<!-- Add additional columns as needed -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="compensation" items="${dataComp}">
				<tr>
					<td>${compensation.id}</td>
					<td>${compensation.type}</td>
					<td>${compensation.amount}</td>
					<td>${compensation.description}</td>
					<td>${compensation.selectedMonthYear}</td>
					<!-- Add additional cells for other fields -->
					<td>
						<form action="/editComp" method="get">
							<input type="hidden" name="id" value="${compensation.comid}">
							<button type="submit">Edit Compensation</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>
