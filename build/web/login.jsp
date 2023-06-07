<%-- 
    Document   : login
    Created on : May 28, 2023, 1:43:41 PM
    Author     : masut
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

   

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    
    <%-- Check if the form has been submitted --%>
    <%
    if (request.getMethod().equalsIgnoreCase("post")) {
        // Get the submitted values
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Validate the credentials
        if (isValidCredentials(username, email, password)) {
            // Redirect to index.jsp
            response.sendRedirect("index.jsp");
        } else {
            // Invalid credentials, display an error message
            out.println("<p>Invalid credentials. Please try again.</p>");
        }
    }
    %>
    
    <form method="post" action="">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Login">
    </form>
</body>
</html>




