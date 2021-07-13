package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entities.User;
import com.helper.FactoryProvider;


public class LoginServlet extends HttpServlet {
	
       
   
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//coding area
			
			PrintWriter out=  response.getWriter();
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			//validations
			//authentication of user
			UserDao userDao=new UserDao(FactoryProvider.getFactory());
			User user =userDao.getUserByEmailAndPassword(email, password);
			//System.out.println(user);
			
			HttpSession httpSession=request.getSession();
            
			
			
			if(user==null) {
			
				httpSession.setAttribute("message","Invalid Details!! Try with another one ");
				response.sendRedirect("login.jsp");
				return;
				
				
			}
			else {
				
				out.println("<h1> Welcome "+user.getUserName()+"</h1>");
				//login
				httpSession.setAttribute("current-user",user);
				
				
				if(user.getUserType().equals("admin"))
				{	
					//admin: admin page
					response.sendRedirect("admin.jsp");
					
				}
				else if(user.getUserType().equals("normal")) {
					
					//normal: normal user page
					response.sendRedirect("normal.jsp");
				}
				else {
					out.println("we have not identified user type");
				}
	
			}
			
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
