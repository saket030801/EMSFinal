<!DOCTYPE html>
<html>
<head>
    <title>Employment System</title>
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
            text-align: center;
        }

        h1 {
            color: #0056b3; /* Darker blue for heading */
        }

        form { 
            margin-top: 25px;
        }

        button {
            background-color: #0056b3; 
            color: #fff;
            padding: 12px 25px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            margin-bottom: 15px; /* Space between buttons */
        }

        button:hover {
            background-color: #003a8c; /* Slightly darker on hover */
        }
    </style>
</head>
<body>
    <div class="container"> 
        <h1>Employment System</h1>

        <form action="/addEmployee" method="get">
            <button type="submit">Add Employee</button>
        </form>

        <form action="/searchEmployees" method="get">
            <button type="submit">Search Employee</button>
        </form>
    </div>
</body>
</html>
