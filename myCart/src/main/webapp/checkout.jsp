<%
			
User user =(User)session.getAttribute("current-user");
if(user==null){
	session.setAttribute("message","You Are Not Logged In!! Login First To Order the items");
	response.sendRedirect("login.jsp");
	
	return;
	
}


%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
	<div class="container">
		<div class="row mt-5">
			
			<div class="col-md-6">
				<!--card-->
				<div class="card">
						<div class="card-body">
						
							<h2 class="text-center mb-5"> Selected Items</h2>
							<div class="cart-body">
			
							</div>
						
						
						</div>
				</div>
			
			</div>
		
		
			<div class="col-md-6">
				<!-- form details  -->
				
				<div class="card">
						<div class="card-body">
						
							<h2 class="text-center mb-5"> Your Details For Order</h2>
							<form>
								  <div class="mb-3">
  								  	<label for="exampleInputEmail1" class="form-label">Email address</label>
   									<input value="<%= user.getUserEmail()%>"type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
    								
  								  </div>
  								  
  								  
  								  <div class="mb-3">
  								  	<label for="name" class="form-label">Name</label>
   									<input value="<%= user.getUserName() %>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
    								
  								  </div>
  								  
  								  <div class="mb-3">
  								  	<label for="name" class="form-label">Contact No.</label>
   									<input value="<%= user.getUserPhone() %>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Contact number">
    								
  								  </div>
  								  
  								  <div class="mb-3">
  								  	<label for="exampleInputEmail1" class="form-label">Your Shipping Address</label>
   									<textarea value="<%= user.getUserAddress() %>" class="form-control" id="exampleFormTextArea" placeholder="Enter Your Address" rows="3"> </textarea>
    								
  								  </div>
  								  
  								  <div class="container text-center" >
  								  
  								  <button class="btn btn-outline-success">Order Now</button>
  								  <button class="btn btn-outline-primary">Continue Shopping</button>
  								  
  								  </div>
								
							
							
							
							</form>
						
						
						</div>
				</div>
				
				
				
			
			</div>

		</div>

	</div>


<%@include file="components/common_modals.jsp"%>
</body>
</html>