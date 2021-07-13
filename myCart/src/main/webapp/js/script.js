/**
 * 
 */
function add_to_cart(pid,pname,price)
{
	let cart= localStorage.getItem("cart");
	if(cart==null){
		//no cart yet
		let products=[];
		let product={ productId:pid, productName:pname, productQuantity:1, productPrice:price}
		
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		//console.log("Product is added for the first time")
		showToast("Item is Added To Cart")
	}
	else{
		
		// cart is already there
		let pcart=JSON.parse(cart);
		let oldProduct= pcart.find((item)=> item.productId==pid)
		
		if(oldProduct)
		{
			//only increase the quantity
			oldProduct.productQuantity= oldProduct.productQuantity+1
			pcart.map((item)=>{
				
				if(item.productId==oldProduct.productId){
					item.productQuantity= oldProduct.productQuantity;
					
				}
	
			})
			
			localStorage.setItem("cart",JSON.stringify(pcart));
			//console.log("Product quantity is incresed")
			showToast(oldProduct.productName +" "+"quantity is incresed, Quantity = " + oldProduct.productQuantity)
			

		}
		else{
			// we have to add the quantity
			let product={ productId:pid, productName:pname, productQuantity:1, productPrice:price}
			pcart.push(product)
			localStorage.setItem("cart",JSON.stringify(pcart));
			//console.log("Product is added")
			showToast("Product is added to Cart")
			
		}
		
	}
	
	
	
	updateCart();


}

//update cart

function updateCart(){
	
	let cartString= localStorage.getItem("cart");
	let cart =JSON.parse(cartString);
	if(cart==null || cart.length==0){
		
		console.log("Cart Is Empty")
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h3> Cart Does Not Have Any Item </h3>");
		$(".checkout-btn").attr('disabled',true)
		
		
		
	}
	else{
		
		//there is some in cart to show 
		console.log(cart)
		$(".cart-items").html(`( ${cart.length} ) `);
		let table= `
		<table class='table'>
			<thead class='thead-light'>
				<tr>
					<th> Item Name </th>		
					<th> Item Price </th>
					<th> Item Quantity </th>			
					<th> Total Price </th>
					<th> Action </th>
				</tr>
			
			</thead>
			
	
		
		`;
		
		let totalPrice=0;
		
		cart.map((item)=>{
			
			table += `
			
			<tr>
				<td> ${item.productName} </td>
				<td> ${item.productPrice} </td>
				<td> ${item.productQuantity} </td>
				<td> ${item.productQuantity*item.productPrice} </td>
				<td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'> Remove </button></td>
				
			
			</tr>
			`
			
			totalPrice +=item.productPrice*item.productQuantity;
		
		})
		
		
		
		
		table = table + ` 
		<tr><td colspan='5' class='text-right font-weight-bold'> Total Price : ${totalPrice} </td></tr>
		
		</table> `
		
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false)
		
		
	}
	
}
//delete item
function deleteItemFromCart(pid){
	let cart= JSON.parse(localStorage.getItem('cart'));
	
	let newcart= cart.filter((item)=> item.productId != pid)
	localStorage.setItem('cart',JSON.stringify(newcart))
	

	updateCart();
	
	showToast("Item is Removed From Cart")
}






$(document).ready(function(){
	
	updateCart()
	
})

function showToast(content){
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(()=>{
		$("#toast").removeClass("display");
	},2000);
		
		
}
	
function goToCheckout(){
	window.location="checkout.jsp"
	
	
	
}
	
	
	
	











