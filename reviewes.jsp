<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
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
<style> 

            .inputs {
                background: #B2E1F5;
                font-size: 16px;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                border-radius: 3px;
                border: none;
                padding: 10px 10px;
                width: 240px;
                margin-bottom: 20px;
                box-shadow: inset 0 2px 3px rgba( 0, 0, 0, 0.1 );
                clear: both;
            }

            .inputs:focus {
                background: #fff;
                box-shadow: 0 0 0 3px #fff38e, inset 0 2px 3px rgba( 0, 0, 0, 0.2 ), 0px 5px 5px rgba( 0, 0, 0, 0.15 );
                outline: none;
            }
            .inputss {
                background: #B2E1F5;
                font-size: 1.9rem;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                border-radius: 3px;
                border: none;
                padding: 10px 10px;
                width: 220px;
                margin-bottom: 20px;
                box-shadow: inset 0 2px 3px rgba( 0, 0, 0, 0.1 );
                clear: both;
            }

            .inputss:focus {
                background: #fff;
                box-shadow: 0 0 0 3px #fff38e, inset 0 2px 3px rgba( 0, 0, 0, 0.2 ), 0px 5px 5px rgba( 0, 0, 0, 0.15 );
                outline: none;
            }
            .button {
                background-color: forestgreen; /* Green */
                border: none;
                color: white;
                padding: 10px 90px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }
        </style>
        
<%
    String cat=request.getParameter("pcat");
    String pname=request.getParameter("pname");
    String pid=request.getParameter("pid");
    String uname=session.getAttribute("sssname").toString();
    String email=session.getAttribute("sssemail").toString();
    String rate=request.getParameter("prate");
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
                <li><a href="e_commerce.jsp" >E-Commerce Home</a></li>
                <li><a href="recommend.jsp" >Recommendation</a></li>
                <li><a href="recom_de.jsp">Recommended Details</a></li>
                <li><a href="index.jsp">Logout</a></li>

            </ul>
        </div>
        <div id="content">

            <div class="inner" style="min-height: 700px;">
                
           <!---@1 part Start--->
            <center><div class="col_w300">
                     <!---@1 part Start--->
                     <h3 class="service2" style="color: orange">Write a review</h3>
                     <%
                   // String cat=request.getParameter("cat");
                   // session.setAttribute("cat1", cat);
    String cat1="";
    int pdid=Integer.parseInt(pid);
                 Connection con=Dbcon.DbConnection.getConnection();
        Statement stes=con.createStatement();
        
        Statement st=con.createStatement();
        System.out.println("cat====="+cat);
        ResultSet rs=st.executeQuery("select * from recomend where id="+pdid+"");
        while(rs.next())
        {
            int id=rs.getInt("id");
            String content=rs.getString("content");
            cat1=rs.getString("cat");
            String pname1=rs.getString("pname");
            String rate1=rs.getString("rate");
            System.out.println("pname====="+pname);
                %>
            
                                                                <%

                                                                    System.out.println("image id" + rs.getInt("id"));
                                                                %>
                                                               
                                                                        <img src="view5.jsp?id=<%=rs.getInt("id")%>" alt="" width="180" height="130" />
                                                                       
                                                                    
        <% }
                
                
                %>
                     <form action="reviewstore.jsp"  method="post"> 
                         <table>
                             <tr>
                                 <td>Product name</td>
                                 <td><input type="text" name="pname" value="<%=pname%>" size="30" /></td>
                             </tr>
                             <tr>
                                 <td>Ratings</td>
                                 <td><select name="rating">
                                         <option value="1">1</option>
                                         <option value="2">2</option>
                                         <option value="3">3</option>
                                         <option value="4">4</option>
                                         <option value="5">5</option>
                                     </select></td>
                             </tr>
                             <tr>
                                 <td>Reviews</td>
                                 <td>
                                    <input type="text" name="review" value="" size="20" /> 
                                 </td>
                             </tr>
                             <tr>
                                 <td><input type="hidden" name="pcat" value="<%=cat1%>" size="20" /></td>
                                 <td><input type="hidden" name="pid" value="<%=pid%>" size="20" /></td>
                             </tr>
                             <tr>
                                 <td>
                                     <input type="submit" value="Review" name="submit" />
                                 </td>
                                 <td><input type="reset" value="Clear" name="reset" /></td>
                             </tr>
                         </table>
<!--                         
                        
                           
                         
                           <input type="Submit" value="submit" class="button" >
                     </form>
                     <!---@1 part End--->
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
               <img width="180" height="150" src="img\e3.png"/>
            </div><br>
            <div class="well well-small">
               <img width="180" height="150" src="img\e2.png"/>
            </div><br>
            <div class="well well-small">
                <img width="180" height="150" src="img\e1.png"/>
                
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
</html>
