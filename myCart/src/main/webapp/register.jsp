<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
	<div class ="container-fluid">
	<div class="row mt-5">

	<div class="col-md-4 offset-md-4">
		<div class="card">
		
		<%@include file="components/message.jsp" %>
			<div class="card-body px-5">
				
					<h3 class="text-center my-3">Sign Up</h3>
		<form action="RegisterServlet" method="post">
			<div class="form-group">
    			<label for="name">Name</label>
    			<input name="user_name" type="text" class="form-control" id="name"  placeholder="Enter Your name">
    			
  			</div>
  			<div class="form-group">
    			<label for="email">Email</label>
    			<input name="user_email" type="email" class="form-control" id="email"  placeholder="Enter Your email">
    			
  			</div>
  			<div class="form-group">
    			<label for="password">Password</label>
    			<input name="user_password" type="password" class="form-control" id="password"  placeholder="Enter Your password">
    			
  			</div>
  			
  			<div class="form-group">
    			<label for="phone">Phone</label>
    			<input name="user_phone" type="number" class="form-control" id="phone"  placeholder="Enter Your phone number">
    			
  			</div>
  			<div class="form-group">
    			<label for="phone">Address</label>
    			<textarea name="user_address" style="height:100px" class="form-control" rows="" cols="" placeholder="Enter Your Address"></textarea>
    			
  			</div>
  			
  			<div class="container text-center">
  			<button class="btn btn-outline-success">Register Here</button>
  			<button class="btn btn-outline-warning">Reset</button>
  			</div>
		
		
		

		</form>
					
			
			
			
			</div>
		
		
		</div>
	
		


		</div>
	</div>
	
	
	
	
	</div>
</body>
</html>