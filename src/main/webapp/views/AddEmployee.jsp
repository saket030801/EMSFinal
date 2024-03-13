<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Information Form</title>
    <style>
        body {
            font-family: 'Helvetica', sans-serif;
            background-color: #e8f0fe; /* Light blue background */
            color: #333; 
            margin: 0;
            display: flex;
            flex-direction: column; 
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .container { 
            background-color: #fff;
            padding: 30px;
            border-radius: 10px; 
            box-shadow: 0 3px 10px rgba(0,0,0,0.15);
            text-align: left; 
            max-width: 400px; 
        }

        h1 {
            text-align: center; 
            color: #0056b3; 
            margin-bottom: 25px; 
        }

        form {
            background: transparent;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600; 
        }

        input {
            width: 100%;
            padding: 10px; 
            margin-bottom: 15px; 
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #0056b3; 
            color: #fff;
            padding: 12px 20px; 
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #003a8c; 
        }

        .message-container { 
          margin-top: 15px;
          padding: 10px;
          border-radius: 4px;
          text-align: center;
        }

        .success-message { 
         background-color: #e0f7d3;
         border: 1px solid #c3e6a7;
         color: #2e7d32;
        }

        .error-message { 
         background-color: #f8d7da;
         border: 1px solid #f5c6cb;
         color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container"> 
        <h1>Employee Information Form</h1>

        <form action="addEmployee" method="post" modelAttribute="emp">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstname" name="firstname" required><br>

            <label for="middleName">Middle Name:</label>
            <input type="text" id="middlename" name="middlename"><br>

            <label for="lastName">Last Name:</label>
            <input type="text" id="lastname" name="lastname" required><br>

            <label for="birthdate">Birthdate:</label>
            <input type="date" id="dob" name="dob" required><br>

            <label for="position">Position:</label>
            <input type="text" id="postion" name="postion" required><br>

            <input type="submit" value="Submit">
        </form>

        <c:if test="${not empty successMessage}">
            <div class="message-container success-message">${successMessage}</div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="message-container error-message">${errorMessage}</div>
        </c:if>
    </div>
</body>
</html>

