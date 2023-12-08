<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%
String login = "";
if(session.getAttribute("login")!=null){
    login = session.getAttribute("login").toString();
}else{
    response.sendRedirect("auth.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Gmail</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ecf0f1; 
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            width: 100%;
            background-color: #3498db; 
            padding: 10px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            animation: slideInDown 0.8s ease-in-out;
        }

        header a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            transition: color 0.3s ease-in-out;
        }

        header a:hover {
             color:#c0392b; 
        }

        form {
            background-color: #fff;
            padding: 40px; 
            border: 4px solid #3498db; 
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease-in-out;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
             border: none;
        }

        td {
            padding: 10px;
            border: none;
        }

        input[type="email"],
        input[type="password"],
        input[type="submit"],
        input[type="reset"] {
            width: 100%;
            padding: 15px; 
            margin-top: 10px; 
            margin-bottom: 20px; 
            box-sizing: border-box;
            font-size: 16px; 
        }

        input[type="submit"],
        input[type="reset"] {
            background-color: #2ecc71;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #27ae60;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideInDown {
            from {
                transform: translateY(-100%);
            }
            to {
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <header>
        Bonjour <%=login %>
        <nav>
 
            <a href="Logout">Logout</a>
        </nav>
    </header>
    <h1>Ajouter un Gmail</h1>
    <form method="POST" action="Ajouter">
        <table border="1">
            <tr>
                <td>Gmail</td>
                <td><input type="email" name="login" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" title="Enter a valid email address" required></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="pwd" required></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Ajouter">
                    <input type="reset" value="Retablir">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
