<%-- 
    Document   : delete
    Created on : May 28, 2023, 1:33:00 PM
    Author     : masutha
--%>

<%@page import="java.sql.*" %> 


<% 
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/student_record","root","");
        pst = con.prepareStatement("delete from records where id = ?");
         pst.setString(1, id);
        pst.executeUpdate();  
        
        %>
        
        <%
if (request.getParameter("submit") != null) {
    // Delete operation code here
    
    // Assuming the delete operation is successful, redirect to another page
    response.sendRedirect("index.jsp");
}
%>
        
        <script>
            
            alert("Record Deletee");
            
       </script>