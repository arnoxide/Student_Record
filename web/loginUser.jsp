<%-- 
    Document   : loginUser
    Created on : May 28, 2023, 1:46:08 PM
    Author     : masut
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Status</title>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_record", "root", "");
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("username", username);
                response.sendRedirect("index.jsp");
            } else {
            } else {
                out.println("Invalid username or password.");
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("Login failed: " + e);
        }
    %>
</body>
</html>
