<%-- 
    Document   : share
    Created on : Dec 13, 2016, 1:48:26 PM
    Author     : java4
--%>

<%@ page  language="java" import="java.sql.*" errorPage="" %>
<%@page import="Dbcon.DbConnection"%>
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
  <%
            if (request.getParameter("msg") != null) {
        %>
        <script>alert('Image shared on TimeLine...');</script>
        <%
            }
        %>
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
                    <%
    String name = null, smail = null, id = null, pname = null;

    try {

        Connection con;
        con = DbConnection.getConnection();
        Statement st = con.createStatement();
        smail = (String) session.getAttribute("sssemail");
        String s = "select id,uname,email from reg where email='"+smail+"'";
        ResultSet rs = st.executeQuery(s);
        if (rs.next()) {
            id = rs.getString(1);
            name = rs.getString(2);
            smail = rs.getString(3);
            session.setAttribute("id", id);

        } else {
            out.print("Please check your login credentials");
        }


%>


              
                </a>
                <br />
                <div class="media-body">
                    <img  alt="User Picture" src="view.jsp?id=<%=id%>" width="120" height="120" />
                    <h5 class="media-heading">&nbsp;&nbsp;&nbsp;<%=name%></h5>
                    <ul class="list-unstyled user-info">

                        <li>
                            <a class="btn btn-success btn-xs btn-circle" style="width: 10px;height: 12px;"></a> Online

                        </li>
                    </ul>
                </div>
                     <%

                                        } catch (Exception e) {
                                            System.out.println(e);
                                        }
                                    %>
                <br />
            </div>
            <!--START MENU SECTION -->
            <ul id="menu" class="collapse">
                <li><a href="uhome.jsp" >Home Page</a></li>
                <li><a href="view_profile.jsp" > View Profile</a></li>
                <li><a href="find_friends.jsp"> Find Friends </a></li>
                <li><a href="edit_profile.jsp"> Edit Profile </a></li>
                <li><a href="share.jsp"> Share Photo on Timeline </a></li>
                <li><a href="view_request.jsp"> View Request </a></li>
               <!-- <li><a href="recom.jsp">Your Recommendation</a></li> -->
            </ul>
        </div>
        <div id="content">

            <div class="inner" style="min-height: 700px;">
                
           <!---@1 part Start--->
           <center>
               <div class="col_w300 last_col">
                        &nbsp;&nbsp;&nbsp;&nbsp;<br><br><br><h3 class="service3">Upload your post here</h3>
<form id="contactform" enctype="multipart/form-data" action="Timeline" method="post"> 
    			<p class="contact"><label for="photo"><br>TimeLine Photo Upload</label></p> 
                        <br><input id="name" name="photo" value="" tabindex="1" type="file"><br>
                        <p> Category<select name="cat">
                                <%
                               Connection con;
        con = DbConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs=st.executeQuery("select distinct cat from recomend UNION select distinct cat from recomend1");
        while(rs.next())
        {
                                %>
                                <option value="<%=rs.getString("cat")%>"><%=rs.getString("cat")%></option>
                                <%}
                                %>
                            </select> </p>
                        <textarea cols="33" name="content" rows="5" required="" ></textarea><br>
                        <br>
            <input class="buttom" name="submit" id="submit" tabindex="5" value="Upload!" type="submit"> 	 
   </form> 

                                                    </div></center>
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
            <br><div class="well well-small">
               <img width="180" height="150" src="img\osn3.png"/>
            </div><br>
            <div class="well well-small">
               <img width="180" height="150" src="img\osn2.jpg"/>
            </div><br>
            <div class="well well-small">
                <img width="180" height="150" src="img\osn1.jpg"/>  
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
