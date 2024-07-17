<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*,jakarta.servlet.*,java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<style>
        table {
            border-collapse: collapse;
            width: 10%;
            justify-content:center;
            margin:auto;
        }
         th,td {
         color:aqua;
         background-color:#598076;
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px; /* Adjust the padding as needed */
        }
        h1{
           color:yellow;
           text-align:center;
        }
    body{
       background-color: #596476;
       }
    </style>
</head>
<body>
<%!
   Connection conn;
   Statement st;
   
%>
<%try{
	 if(session.getAttribute("username")==null)
	      response.sendRedirect("login.html");
	    out.println("<h1>YOUR ORDERS</h1><br>");
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","","");
	   st=conn.createStatement();
	   ResultSet rs=st.executeQuery("select * from orders where username='"+session.getAttribute("username")+"'");
      ResultSetMetaData rmd=rs.getMetaData();
      int columnCount = rmd.getColumnCount();
      out.println("<table >");
      out.println("<tr>");
      for (int i = 1; i <= columnCount; i++)
      {
    	  out.println("<th>"+rmd.getColumnName(i)+"</th>");
      }
      out.println("<th>Design details</th>");
      out.println("</tr>");
      while(rs.next()){
    	  out.println("<tr>");
      for (int i = 1; i <= columnCount; i++) {
         
    	 out.println("<td>"+rs.getString(i)+"</td>");
    	 
    	
         }
        ResultSet rs1=st.executeQuery("select p.pname,p.price,p.imagepath,p.rating from products p,orders o where o.pid=p.pid" );
       rs1.next();
        out.println("<td>");
        out.println("<h1>"+rs1.getString(1)+"</h1>");
        out.println("<img src='"+rs1.getString(3)+"'>");
        out.println("<br>Rating:"+rs1.getString(4)+"/5");
        out.println("<br>Price:"+rs1.getString(2));
        out.println("</td>");
        out.println("</tr>");
      }
      out.println("</table>");
      
      conn.close();
}catch(Exception e){
	out.println(e.getMessage());
}
	   %>
</body>
</html>
