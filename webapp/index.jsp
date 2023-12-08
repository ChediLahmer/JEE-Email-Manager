<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List" %>

<%
String login = "";
 if(session.getAttribute("login")!=null){
	 login = session.getAttribute("login").toString();
 }else{
	 response.sendRedirect("auth.jsp");
 }
%>
<%@ page import="Model.User" %>
<%@ page import="Service.UserService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #ecf0f1; 
        animation: fadeIn 0.5s ease-in-out;
    }

    h1 {
        text-align: center;
        animation: slideInDown 0.8s ease-in-out;
    }

    table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
        animation: slideInUp 1s ease-in-out;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #3498db;
        color: white;
    }

    div {
        text-align: right;
        background-color: #2c3e50;
        padding: 10px;
        color: white;
        animation: slideInRight 0.5s ease-in-out;
    }

    #ajouter {
    display: inline-block;
    padding: 10px 20px;
    background-color: #2ecc71; 
    color: white;
    text-decoration: none;
    border: 1px solid #27ae60;
    border-radius: 5px;
    transition: background-color 0.3s ease-in-out;
}

#ajouter:hover {
    background-color: #27ae60; 
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
            margin: 0 15px;
            transition: color 0.3s ease-in-out;
        }

        header a:hover {
            color:#c0392b; 
        }
	.logout-link:hover {
		color:#c0392b !important;
	}
    .logout-link {
        color: #e74c3c; 
        text-decoration: none;
        transition: color 0.3s ease-in-out;
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

    @keyframes slideInUp {
        from {
            transform: translateY(100%);
        }
        to {
            transform: translateY(0);
        }
    }

    @keyframes slideInRight {
        from {
            transform: translateX(100%);
        }
        to {
            transform: translateX(0);
        }
    }
</style>


<body>
   <header>
        Bonjour <%=login %>
        <nav>
           
            <a href="Logout">Logout</a>
        </nav>
    </header>
<h1>Liste des Emails</h1>
<%@ page import="Model.User" %>
<%@ page import="Service.UserService" %>


<table border="1" width="100%">
    <tr>
        <th>ID</th>
        <th>email</th>
        <th>supprimer</th>
    </tr>
<%
    UserService userService = (UserService) request.getAttribute("userService");
    if (userService == null) {
        userService = new UserService();
        request.setAttribute("userService", userService);
    }

    List<User> userList = userService.getAllUsers();

    for (User user : userList) {
%>
    <tr>
        <td><%=user.getId() %></td>
        <td><%=user.getEmail() %></td>
        <td><a class="logout-link" href="Delete?id=<%=user.getId() %>">Supprimer</a></td>
    </tr>
<%
    }
%>

</table>

<a href="ajouter.jsp" id="ajouter">Ajouter un Gmail</a>
</body>
</html>