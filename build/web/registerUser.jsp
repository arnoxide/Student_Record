<%-- 
    Document   : registerUser
    Created on : May 28, 2023, 1:44:11 PM
    Author     : masut
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Status</title>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sudent_record", "root", "");
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)");
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, email);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            out.println("Registration successful!");
        } catch (Exception e) {
            out.println("Registration failed: " + e);
        }
    %>
</body>
</html>
