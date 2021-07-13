<%@page import="com.dao.CategoryDao"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.helper.*"%>
<%@page import="java.util.*"%>
<%@page import="com.entities.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> Shopiee.com-Home</title>

<%@include file="components/common_css_js.jsp" %>

</head>
<body>

<%@include file="components/navbar.jsp" %>

		<div class="container-fluid">
	<div class="row mt-3 mx-2">
	
	<%
	
	String cat =request.getParameter("category");
	List<Product> list=null;
	
	ProductDao dao= new ProductDao(FactoryProvider.getFactory());
	
	if(cat==null || cat.trim().equals("all"))
	{
	 list = dao.getAllProducts();
	}
	else {
		
	 int cid=Integer.parseInt(cat.trim());
	 list= dao.getAllProductsById(cid);
		
	}
	
	CategoryDao cDao= new CategoryDao(FactoryProvider.getFactory());
	List<Category> list1 = cDao.getCategories();
	
	
	%>
	
		<!--Show categories  -->
		<div class="col-md-2">
		
		
		 <div class="list-group mt-4">
  			<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
    			All Products
  			</a>
  			
  			 
			
		<%
	    
	    for(Category c : list1)
	    {
	    	
	     %>
	    	<a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
	   		
	   
	   	<%
	    }
	    
	    
	    
	    %>
	    
	    </div>
	
		</div>
		
		
		<!--Show Products  -->
		<div class="col-md-10">
		
			<div class="row mt-4">
			
				<div class="col-md-12">
					
					<div class="card-columns">
						
						<!--traversing products-->
						<%
						
						for(Product p:list){
						
						%>
						
						
						<!--Product card  -->
						<div class="card product-card">
						
							<div class="container text-center">
						
						<img src="img/products/<%=p.getpPhoto() %> " style="max-height:200px; max-width: 100%;width: auto; " class="card-img-top m-2" alt=" "> 
							</div>
							<div class="card-body">
								
								<h5 class="card-title"><%=p.getpName()%></h5>
								<p class="card-text">
								
								<%= Helper.get10Words(p.getpDesc())%>
								
								</p>
							
							</div>
							
							
							
							<div class="card-footer text-center">
								<button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>,'<%= p.getpName() %>',<%= p.getPriceAfterApplyingDiscount()%>)"> Add To Cart</button>
								<button class="btn btn-outline-success"> &#8377;<%=p.getPriceAfterApplyingDiscount() %> /-<span class="text-secondary discount-label"> <%=p.getpPrice() %>&#8377; <%= p.getpDiscount()%>% off </span></button>
							
							</div>
						
						
						
						</div>
						
						
						
						
						<%
							}
							
							if(list.size()==0){
								
								out.println("<h4>No Items, in this Category</h4>");
								
							}
						
						%>
	
					</div>
					
				
				
				
				</div>
			
			
			
			
			</div>
	    
		
		
		
		</div>




	</div>
	</div>

<%@include file="components/common_modals.jsp"%>

</body>
</html>