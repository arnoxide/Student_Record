<%-- 
    Document   : register
    Created on : May 28, 2023, 1:43:14 PM
    Author     : masut
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %> 
<% 

if(request.getParameter("submit")!=null)
{
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/student_record","root","");
        pst = con.prepareStatement("insert into users(username,email,password)values(?,?,?)");
        pst.setString(1, username);
        pst.setString(2, email);
        pst.setString(3, password);
        pst.executeUpdate();

// Prepare the SQL statement to check if the email already exists
        String emailQuery = "SELECT email FROM users WHERE email = ?";
        pst = con.prepareStatement(emailQuery);
        pst.setString(1, email);
        rs = pst.executeQuery();
        
        // Check if the user was registered successfully
if (rowsAffected > 0) {
        // The user was registered successfully
// Redirect to the home page
response.sendRedirect("index.jsp");

} else {

// The user was not registered successfully
// Display an error message
out.println("Registration failed");

}
        
        // Check if the email exists
        if (rs.next()) {
            out.println("Email already exists. Please choose a different email.");
        } else {
            // Prepare the SQL statement to check if the username already exists
            String usernameQuery = "SELECT username FROM users WHERE username = ?";
            pst = con.prepareStatement(usernameQuery);
            pst.setString(1, username);
            rs = pst.executeQuery();

            // Check if the username exists
            if (rs.next()) {
                out.println("Username already exists. Please choose a different username.");
            } else {
                // Both email and username are unique, proceed with storing to the database
                // Your code to store the email and username to the database goes here
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        // Close the database resources
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %> 
    <script>   
        alert("User Adddeddddd");     
    </script> 
    <%             
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
   <!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<!-- Main css 
<link rel="stylesheet" href="css/style.css">-->
</head>
<body>
    <div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="name" placeholder="Username" required/>
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" required />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="pass" placeholder="Password" required/>
							</div>
							
							
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="submit" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>



</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
