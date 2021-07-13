package com.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.entities.Category;
import com.entities.Product;
import com.helper.FactoryProvider;


@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String op =request.getParameter("operation");
		PrintWriter out=response.getWriter();
		if(op.trim().contentEquals("addcategory")) {
			//add category
			//fetching category data
			String title= request.getParameter("catTitle");
			String description= request.getParameter("catDescription");
			Category category=new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(description);
			
			//saving to database
			CategoryDao categoryDao= new CategoryDao(FactoryProvider.getFactory());
			
			int catId= categoryDao.saveCategory(category);
//			PrintWriter out=response.getWriter();
//			out.println("Category Saved");
			
			HttpSession httpsession=request.getSession();
			httpsession.setAttribute("message", "Category Added SuccessFully");
			response.sendRedirect("admin.jsp");
			return;
			
			
		}
		else if (op.trim().contentEquals("addproduct")) {
			//add product to db
			
			String pName =request.getParameter("pName");
			String pDesc =request.getParameter("pDesc");
			int pPrice=Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
			int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
			
			int catId=Integer.parseInt(request.getParameter("catId"));
			Part part=request.getPart("pPic");
			
			Product p =new Product();
			p.setpName(pName);
			p.setpDesc(pDesc);
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuantity(pQuantity);
			p.setpPhoto(part.getSubmittedFileName());
			
			CategoryDao cDao= new CategoryDao(FactoryProvider.getFactory());
			Category category=cDao.getCategoryById(catId);
			p.setCategory(category);
			
			//saving product
			
			ProductDao pDao=new ProductDao(FactoryProvider.getFactory());
			pDao.saveProduct(p);
			
			//uploading pic 
			//find out the path to upload photo
			
			String path=request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
			System.out.println(path);
			try {
			//uploading code
			FileOutputStream fos= new FileOutputStream(path);
			
			InputStream is= part.getInputStream();
			//reading data
			
			byte []data= new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
				
			}
			
			
			
			
			
			
			//out.println("Saved");
			HttpSession httpsession=request.getSession();
			httpsession.setAttribute("message", "Product Added SuccessFully");
			response.sendRedirect("admin.jsp");
			return;
			
	
			
			
			
			
		}
		
		
		
		
		
		
		
		
	}

}
