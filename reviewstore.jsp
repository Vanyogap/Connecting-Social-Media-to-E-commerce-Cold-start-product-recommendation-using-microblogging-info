<%-- 
    Document   : reviewstore
    Created on : 1 May, 2017, 8:12:11 AM
    Author     : Supreeth
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int pid=Integer.parseInt(request.getParameter("pid"));
    String pcat=request.getParameter("pcat");
    String uname=(String)session.getAttribute("sssname");
    System.out.println("Username===="+uname);
    int rating=Integer.parseInt(request.getParameter("rating"));
    String revi=request.getParameter("review");
    try{
        Connection con=DbConnection.getConnection();
        PreparedStatement pstm=con.prepareStatement("insert into review_(pid,pcat,uname,ratin,reviewss)values(?,?,?,?,?)");
        pstm.setInt(1, pid);
        pstm.setString(2, pcat);
        pstm.setString(3, uname);
        pstm.setInt(4, rating);
        pstm.setString(5, revi);
        int x=pstm.executeUpdate();
        if(x>0)
        {
            response.sendRedirect("e_commerce.jsp?msges=Reviews_added");
        }
        else
        {
            response.sendRedirect("reviewes.jsp?msg=some_error");
        }
    }catch(Exception e)
    {
        e.printStackTrace();
    }
%>
