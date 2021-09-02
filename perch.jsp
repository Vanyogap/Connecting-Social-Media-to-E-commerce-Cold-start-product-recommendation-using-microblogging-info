<%-- 
    Document   : perch
    Created on : Dec 13, 2016, 8:16:33 PM
    Author     : java4
--%>

<%@page import="java.util.UUID"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    String proid = (String) session.getAttribute("iddd");
    String proname = (String) session.getAttribute("pronames");
    String uname = (String) session.getAttribute("sssname");
    String review = request.getParameter("review");
    String rating = request.getParameter("rating");
    

    try {
        con = DbConnection.getConnection();
        st = con.createStatement();
        int i = st.executeUpdate("insert into pro_history(proid, proname, uname, review, rating) values ('" + proid + "','" + proname + "','" + uname + "','" + review + "','" + rating + "')");
        if (i != 0) {

            response.sendRedirect("recom.jsp?msg=success");
        } else {
            response.sendRedirect("recom.jsp?msgg=failed");
        }
    } catch (Exception ex) {
        response.sendRedirect("user_reg.jsp?msggg=failed");
    }

%>
