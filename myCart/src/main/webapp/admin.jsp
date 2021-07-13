<%@ page import="com.entities.*"%>
<%@ page import="com.dao.*"%>
<%@ page import="com.helper.*"%>
<%@ page import="java.util.*"%>
<% 
	//checking if someone already logged in 
	User user =(User)session.getAttribute("current-user");
	if(user==null){
		session.setAttribute("message","You Are Not Logged In!! Login First");
		response.sendRedirect("login.jsp");
		
		return;
		
	}
	else{
		// check if he/she is admin or not 
		if(user.getUserType().equals("normal")){
			session.setAttribute("message","You Are Not Admin!! Can't Access This Page");
			response.sendRedirect("login.jsp");
			
			return;
		}
		
	}


%>

 <%
        CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
        List<Category> list= cDao.getCategories();
   	    /* getting count */
        Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());
   	    
        
        %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp" %>

</head>
<body>

<%@include file="components/navbar.jsp" %>
<div class="container admin">
	<div class="container-fluid mt-3">
	
	<%@include file="components/message.jsp" %>
	
	 </div>

	<div class="row mt-3">
	
		<!-- //first col -->
		<div class="col-md-4">
			<!--First box  -->
			<div class="card">
				<div class="card-body text-center">
					<div class="container">
					
					<img style ="max-width:130px" class="img-fluid rounded-circle" src="img/user.png" alt="user_icon">
					
					
					</div>
					<h1><%= m.get("userCount")%></h1>
					<h1 class="text-uppercase text-muted">Users</h1>
				
				
				</div>
			
			
			</div>
		
		
		
		</div>
		
		
		<!--second col  -->
		<div class="col-md-4">
		
			<div class="card">
				<div class="card-body text-center">
				
				<div class="container">
					
					<img style ="max-width:130px" class="img-fluid" src="img/list.png" alt="user_icon">
					
					
					</div>
					
					<h1><%= list.size() %></h1>
					<h1 class="text-uppercase text-muted">Categories</h1>
				
				
				</div>
			
			
			</div>
		
		
		</div>
		
		<!--third col  -->
		<div class="col-md-4">
		
		
		
			<div class="card">
				<div class="card-body text-center">
				
				<div class="container">
					
					<img style ="max-width:130px" class="img-fluid " src="img/package.png" alt="user_icon">
					
					
					</div>
					<h1><%= m.get("productCount") %></h1>
					<h1 class="text-uppercase text-muted">Products</h1>
				
				
				</div>
			
			
			</div>
		
		</div>
	
	
	
	</div> 
	
	<!--Second Row  -->
		<div class="row mt-3">
		
		<!-- Second row first column -->
			<div class="col-md-6">
			
				<div class="card" data-toggle="modal" data-target="#add-category-modal">
				<div class="card-body text-center">
					<div class="container">
					
					<img style ="max-width:130px" class="img-fluid" src="img/keys.png" alt="user_icon">
					
					
					</div>
					<p class="mt-2"> Click here to add new Category</p>
					
					<h1 class="text-uppercase text-muted">Add Category</h1>
				
				
				</div>
			
			
			</div>
				
			
			</div>
			
			<div class="col-md-6">
			
			
			
			<div class="card" data-toggle="modal" data-target="#add-product-modal">
				<div class="card-body text-center">
					<div class="container">
					
					<img style ="max-width:130px" class="img-fluid" src="img/plus.png" alt="user_icon">
					
					
					</div>
					<p class="mt-2">Click Here to add products</p>
					<h1 class="text-uppercase text-muted">Add Products</h1>
				
				
				</div>
			
			
			</div>
			
			
			</div>
		
		
		
		
		</div>


<!--main container closing  -->
</div>

<!--Add Category modal  -->
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="ProductOperationServlet" method="post">
        
        <input type="hidden" name="operation" value="addcategory">
        
        <div class="form-group">
        <input type="text" class="form-control" name="catTitle" placeholder="enter category title" required/>        
        
        
        </div>
        
        <div class="form-group">
        <textarea style="height:150px;" class="form-control" placeholder="Enter category Description" name="catDescription" required></textarea>
        
        
        </div>
        
        <div class="container text-center">
        	<button class="btn btn-outline-success">Add Category</button>
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
        </div>
        

        </form>
 
        
      </div>
      
    </div>
  </div>
</div>




<!--End category modal  -->

<!--Modal for adding product  -->

<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Enter Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        
        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
        
        <input type="hidden" name="operation" value="addproduct"/>
        
        <div class="form-group">
        <input type="text" class="form-control" name="pName" placeholder="enter product title" required/>        
        </div>
        
        <div class="form-group">
        <textarea style="height:150px;" class="form-control" placeholder="Enter product Description" name="pDesc" required></textarea>

        </div>
        
        <div class="form-group">
        <input type="number" class="form-control" name="pPrice" placeholder="enter product price" required/>        
        </div>
        
        <div class="form-group">
        <input type="number" class="form-control" name="pDiscount" placeholder="enter product Discount" required/>        
        </div>
        
        <div class="form-group">
        <input type="number" class="form-control" name="pQuantity" placeholder="enter product Quantity" required/>        
        </div>
        
        <!--Categories  -->
       
        
        <div class="form-group">
        <select name="catId" class="form-control"  id="">
        <%
        for(Category c:list){
      
        %>
          <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
          
        <% } %>
        </select>    
        </div>
        
        <!--Product file  -->
        <div class="form-group">
        	<label for="pPic">Select Product Snaps</label>
        	<input type="file" id="pPic" name="pPic" required/>
        
        
        
        
        </div>
        
 
        <div class="container text-center">
        	<button class="btn btn-outline-success">Add Product</button>
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
        </div>
    
        

        </form>
 
        
      </div>
      
    </div>
  </div>
</div>







<%@include file="components/common_modals.jsp"%>
</body>
</html>