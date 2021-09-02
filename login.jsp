<%-- 
    Document   : loginaction
    Created on : Feb 23, 2016, 3:43:53 PM
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

    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    String Email = request.getParameter("email");
    System.out.println("User Details" + Email + name + pass);
    //Update
    String uname = request.getParameter("name");
    String smail = request.getParameter("smail");
    String age = request.getParameter("age");
    String marital = request.getParameter("marital");
    String edu = request.getParameter("edu");
    String interest = request.getParameter("interest");
    int status = Integer.parseInt(request.getParameter("status"));

    try {
        con = DbConnection.getConnection();
        st = con.createStatement();
        switch (status) {
            case 1:
                try {
                    rs = st.executeQuery("select * from reg where email='" + Email + "' AND pass='" + pass + "'");
                    if (rs.next()) {
                        session.setAttribute("sssid", rs.getString("id"));
                        session.setAttribute("sssname", rs.getString("uname"));
                        session.setAttribute("sssemail", rs.getString("email"));
                        
                        session.setAttribute("sage", rs.getString("age"));
                        session.setAttribute("sedu", rs.getString("edu"));
                        session.setAttribute("sinterest", rs.getString("interest"));
                        session.setAttribute("sgen", rs.getString("gen"));
                        session.setAttribute("smarital", rs.getString("marital"));
                        session.setAttribute("cat1", "es");
                        response.sendRedirect("uhome.jsp?uhome=success");
                    } else {
                        response.sendRedirect("index.jsp?loginf=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:

                try {
                    con = DbConnection.getConnection();
                    st = con.createStatement();
                    int i = st.executeUpdate("update reg set uname = '" + uname + "', age='" + age + "', marital='" + marital + "', edu='" + edu + "', interest='" + interest + "' where email='" + smail + "'");
                    if (i != 0) {

                        response.sendRedirect("edit_profile.jsp?msg=success");
                    } else {
                        response.sendRedirect("edit_profile.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    response.sendRedirect("user_reg.jsp?msggg=failed");
                }
                break;

            case 3:
                try {
                     rs = st.executeQuery("select * from reg where email='" + Email + "' AND pass='" + pass + "'");
                    if (rs.next()) {
                        session.setAttribute("sssid", rs.getString("id"));
                        session.setAttribute("sssname", rs.getString("uname"));
                        session.setAttribute("sssemail", rs.getString("email"));
                                               
                        session.setAttribute("sage", rs.getString("age"));
                        session.setAttribute("sedu", rs.getString("edu"));
                        session.setAttribute("sinterest", rs.getString("interest"));
                        session.setAttribute("sgen", rs.getString("gen"));
                        session.setAttribute("smarital", rs.getString("marital"));
                        
                        response.sendRedirect("e_commerce.jsp?ehome=success");
                    } else {
                        response.sendRedirect("index.jsp?loginf=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                 case 4:
                try {
                     rs = st.executeQuery("select * from reg where email='" + Email + "' AND pass='" + pass + "'");
                    if (rs.next()) {
                        session.setAttribute("sssid", rs.getString("id"));
                        session.setAttribute("sssname", rs.getString("uname"));
                        session.setAttribute("sssemail", rs.getString("email"));
                        
                        session.setAttribute("sage", rs.getString("age"));
                        session.setAttribute("sedu", rs.getString("edu"));
                        session.setAttribute("sinterest", rs.getString("interest"));
                        session.setAttribute("sgen", rs.getString("gen"));
                        session.setAttribute("smarital", rs.getString("marital"));
                        
                        response.sendRedirect("e_commerce1.jsp?ehome=success");
                    } else {
                        response.sendRedirect("index.jsp?loginf=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;



            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>