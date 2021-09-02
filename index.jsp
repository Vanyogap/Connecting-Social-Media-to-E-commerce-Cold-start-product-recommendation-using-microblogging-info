<%-- 
    Document   : index
    Created on : Nov 25, 2016, 5:29:03 PM
    Author     : java4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en"> 
<head>
     <meta charset="UTF-8" />
    <title>Connecting Social Media to E-Commerce</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
   
     <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/login.css" />
    <link rel="stylesheet" href="assets/plugins/magic/magic.css" />
    
</head>
            <%
            if (request.getParameter("reg") != null) {
        %>
        <script>alert('Registration Done Successfully..');</script>
        <%
            }
        %>
                <%
            if (request.getParameter("loginf") != null) {
        %>
        <script>alert('Please Enter Correct Mail ID and Password');</script>
        <%
            }
        %>
         <%
            if (request.getParameter("loginef") != null) {
        %>
        <script>alert('Please Enter Correct ID and Password');</script>
        <%
            }
        %>
<body style="background-color: #9dc8e2">

    <div class="container">
    <div class="text-center">
        <H4><font style="font-family: fantasy; font-size: 20px ">Connecting Social Media to E-Commerce: Cold-Start Product Recommendation Using Microblogging Information</font></H4>
    </div>
    <div class="tab-content">
        <div id="login" class="tab-pane active">
            <form action="login.jsp" class="form-signin"><br><br><br><br><br><br>
                <p class="text-muted text-center btn-block btn btn-primary btn-rect">
                    User Login Here!!
                </p>
                <input type="email" name="email" required=""e placeholder="Your Email ID" class="form-control" />
                <input type="password" name="pass" required="" placeholder="Password" class="form-control" />
                <input type="hidden" value="1" name="status"/>
                <button class="btn text-muted text-center btn-danger" type="submit">Sign in</button>
            </form>
        </div>
        
        <div id="signup" class="tab-pane">
            <form action="uploadImage" class="form-signin" method="post" enctype="multipart/form-data">
                <p class="text-muted text-center btn-block btn btn-primary btn-rect">Please Fill Details To Register</p>
                <input type="text" placeholder="Your Name" name="uname" required="" class="form-control" />
                <input type="email" placeholder="Enter Your Email ID" name="email" required="" class="form-control" />
                <input type="password" placeholder="Enter Your Password" required="" name="pass" class="form-control" />
                <input type="number" placeholder="Enter your Age" name="age" required="" class="form-control" />
                <input type="text" placeholder="Education" name="edu" required="" class="form-control" />
                <input type="text" placeholder="Interests" name="interest" required="" class="form-control" />
                <input type="text" placeholder="Your Country" name="country" required="" class="form-control" /><br>
                <select name="gen" required="" class="form-control">
                    <option value="">Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option> 
                </select><br>
                <select name="marital" required="" class="form-control"> 
                    <option value="">Marital Status</option>
                    <option value="Single">Single</option>
                    <option value="Married">Married</option>
                </select>
                <br>
                <input type="file" name="photo"  required="" class="form-control" /><br>
                <button class="btn text-muted text-center btn-success" type="submit">Register</button>
            </form>
        </div>
    </div>
    <div class="text-center">
        <ul class="list-inline">
            <li><a class="text-muted" href="#login" data-toggle="tab">Login</a></li>
           
            <li><a class="text-muted" href="#signup" data-toggle="tab">Signup</a></li>
        </ul>
    </div>


</div>

      <script src="assets/plugins/jquery-2.0.3.min.js"></script>
      <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
   <script src="assets/js/login.js"></script>


</body>
    <!-- END BODY -->
</html>
