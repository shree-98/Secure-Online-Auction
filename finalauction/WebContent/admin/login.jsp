<%@include file="../mylib.jsp"%>
<%
mylib l1=new mylib();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 20%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 50%; /* Full width */
  height: 50%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>
<body style="background-image: url('images/n2.jpg'); no-repeat; background-size:cover; opacity:;">
<%
String btn=request.getParameter("btnlogin");

if(btn!=null)
{
	
	String pass=request.getParameter("txtpass");
	String email=request.getParameter("txtemail");
	if(l1.exists("select * from tbladmin where email='"+email+"' and upass='"+pass+"'"))
	{
			String name=l1.filllabel("select * from tbladmin where email='"+email+"'", "uname");
			String uid=l1.filllabel("select * from tbladmin where email='"+email+"'", "uid");
			
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			session.setAttribute("uid", uid);
			
			response.sendRedirect("index.jsp");
	}
	else
	{
		%>
		<script>
		alert("Error");
		</script>
		<% 
	}
}
%>
<font color="white"><h2><center><strong>Admin Login</strong></center></h2></font>
  <div class=col-md-4>
  <form class="modal-content animate"  method="post">
    <div class="imgcontainer">
      <img src="images/img_avatar2.png" width=50px height=150px colspan=2 alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="txtemail" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="txtpass" required>
        
      <button type="submit" name="btnlogin">Login</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
    
      <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
  </form>
  </div>


</body>
</html>
