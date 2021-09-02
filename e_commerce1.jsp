<%-- 
    Document   : e_commerce
    Created on : Dec 13, 2016, 2:55:06 PM
    Author     : java4
--%>

<%@ page  language="java" import="java.sql.*" errorPage="" %>
<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8" />
    <title>Connecting Social Media to E-Commerce</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/theme.css" />
    <link rel="stylesheet" href="assets/css/MoneAdmin.css" />
    <link rel="stylesheet" href="assets/plugins/Font-Awesome/css/font-awesome.css" />
    <link href="assets/css/layout2.css" rel="stylesheet" />
    <link href="assets/plugins/flot/examples/examples.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/plugins/timeline/timeline.css" />
</head>
<body class="padTop53 " >
    <div id="wrap" >
        <div id="top">
            <nav class="navbar navbar-inverse navbar-fixed-top " style="padding-top: 10px;">
                <a data-original-title="Show/Hide Menu" data-placement="bottom" data-tooltip="tooltip" class="accordion-toggle btn btn-primary btn-sm visible-xs" data-toggle="collapse" href="#menu" id="menu-toggle">
                    <i class="icon-align-justify"></i>
                </a>
                <header class="navbar-header">
                    <H4><font style="font-family: fantasy; font-size: 20px ">Connecting Social Media to E-Commerce: Cold-Start Product Recommendation Using Microblogging Information</font></H4>
                </header>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <span class="label label-success">2</span>    <i class="icon-envelope-alt"></i>&nbsp; <i class="icon-chevron-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>John Smith</strong>
                                        <span class="pull-right text-muted">
                                            <em>Today</em>
                                        </span>
                                    </div>
                                    <div>Lorem ipsum dolor sit amet, consectetur adipiscing.
                                        <br />
                                        <span class="label label-primary">Important</span> 

                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>Raphel Jonson</strong>
                                        <span class="pull-right text-muted">
                                            <em>Yesterday</em>
                                        </span>
                                    </div>
                                    <div>Lorem ipsum dolor sit amet, consectetur adipiscing.
                                        <br />
                                        <span class="label label-success"> Moderate </span> 
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>Chi Ley Suk</strong>
                                        <span class="pull-right text-muted">
                                            <em>26 Jan 2014</em>
                                        </span>
                                    </div>
                                    <div>Lorem ipsum dolor sit amet, consectetur adipiscing.
                                        <br />
                                        <span class="label label-danger"> Low </span> 
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a class="text-center" href="#">
                                    <strong>Read All Messages</strong>
                                    <i class="icon-angle-right"></i>
                                </a>
                            </li>
                        </ul>

                    </li>
                   
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="icon-user "></i>&nbsp; <i class="icon-chevron-down "></i>
                        </a>

                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="icon-user"></i> User Profile </a>
                            </li>
                            <li><a href="#"><i class="icon-gear"></i> Settings </a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="index.jsp"><i class="icon-signout"></i> Logout </a>
                            </li>
                        </ul>

                    </li>
                </ul>

            </nav>

        </div>
        <div id="left" >
            <div class="media user-media well-small">
                <a class="user-link" href="#">
                </a>
                <br />
                <div class="media-body">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img  alt="User Picture" src="img/mon.jpg" width="120" height="120" />
                    <h5 class="media-heading">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-Commerce</h5>
                    <ul class="list-unstyled user-info">

                        
                    </ul>
                </div>

                <br />
            </div>
            <!--START MENU SECTION -->
            <ul id="menu" class="collapse">
                <li><a href="e_commerce1.jsp" >E-Commerce Home</a></li>
                <li><a href="recommend1.jsp" >Add product</a></li>
                <li><a href="recom_de1.jsp">View product details</a></li>
                <li><a href="index.jsp">Logout</a></li>

            </ul>
        </div>
        <div id="content">

            <div class="inner" style="min-height: 700px;" id="display">
                
           <!---@1 part Start--->
           <img src="img\e5.png" width="890" height="680"/>
           <!---@1 part End--->
                                                    

                <div class="row">
                    <div class="col-lg-12">
                       
                    </div>
                </div>
                <div class="row">
                    
                </div>
           
            </div>
            
        </div>
        <div id="right">
            <div>
            <form action="display1.jsp" method="get" >
             Search<input type="text" name="cat">
             <input type="submit" value="submit"></form></div>
             <h7> Items Based on your Interest</h7>
            <%
                    Connection con=Dbcon.DbConnection.getConnection();
        Statement stes=con.createStatement();
      String email=session.getAttribute("sssemail").toString();
    
        
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select MAX(likess) from recbase where uname='"+email+"'");
//       ResultSet rs=st.executeQuery("select * from recbase where likess IN(select MAX(likess) from recbase  ");
        if(rs.next())
        {
            String cat=rs.getString(1);
            System.out.println("productcat====="+cat);
            ResultSet rs12=st.executeQuery("select * from recbase where uname='"+email+"' and likess='"+cat+"'");
            if(rs12.next())
            {
               
            String cat1=rs12.getString(1);
            ResultSet rs1=st.executeQuery("select * from timeline where cat='"+cat1+"'");
            if(rs1.next())
            {
                %>
                <%

                                                                    System.out.println("image id" + rs1.getInt("id"));
                                                                %>
                                                                
        
            <br><div class="well well-small">
                <a href="display1.jsp?cat=<%=cat1%>"> <img src="viewes4.jsp?id=<%=rs1.getInt("id")%>&cat=<%=cat1%>" alt="" width="180" height="150" /></a>
            </div><br>
            
             <h7> Below items were previously searched by you</h7>                                                      <%  }}
        }
        System.out.println("previously userached in ec1");
        Statement st1=con.createStatement();
        if(session.getAttribute("cat1")!=null)
        {
        String cat2=  session.getAttribute("cat1").toString();
        System.out.println("cat====="+cat2);
        ResultSet rs23=st1.executeQuery("select * from recomend1 where cat='"+cat2+"'");
        if(rs23.next())
        {
            int id=rs23.getInt("id");
            String content=rs23.getString("content");
            String cat1=rs23.getString("cat");
            String pname=rs23.getString("pname");
            String rate=rs23.getString("rate");
            System.out.println("pname====="+pname+"cat11111"+cat1);
                %>
             
                                                                <%

                                                                    System.out.println("image id" + rs23.getInt("id"));
                                                                %>
                                                               <br>
                                                               <a href="display1.jsp?cat=<%=cat1%>">  <img src="view6.jsp?id=<%=rs23.getInt("id")%>" alt="" width="180" height="130" /><br></a>
                                                                        <!--<a href="cart.jsp?cat=<%=cat2%>&pname=<%=pname%>&id=<%=id%>&rate=<%=rate%>">Add To cart</a>-->
                                                      
           <!--  <h7> above items or Previously You Searched in Ecommerce 1 </h7> -->         
            <% }
        }
            %>
            
            
              
            
<!--            <div class="well well-small">
               <img width="180" height="150" src="img\e2.png"/>
            </div><br>
            <div class="well well-small">
                <img width="180" height="150" src="img\e1.png"/>
                
            </div>-->

<div id="search">
    
</div>
        </div>
    </div>
    <div id="footer">
        <p>&copy;  CopyRight &nbsp;2017 &nbsp;</p>
    </div>
    <script src="assets/plugins/jquery-2.0.3.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.js"></script>
    <script src="assets/plugins/flot/jquery.flot.resize.js"></script>
    <script src="assets/plugins/flot/jquery.flot.time.js"></script>
    <script  src="assets/plugins/flot/jquery.flot.stack.js"></script>
    <script src="assets/js/for_index.js"></script>

</body>
