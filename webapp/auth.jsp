<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ecf0f1; 
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border: 4px solid #3498db; 
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease-in-out;
        }
         @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
        }

        input[type="email"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #2ecc71;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #27ae60; 
        }
    </style>
</head>
<body>
    <form method="POST" action="Login">
        <table>
            <tr>
                <td>Gmail</td>
                <td><input type="email" name="login" required></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="pwd" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Se Connecter"></td>
            </tr>
        </table>
        
    </form>
</body>
</html>
