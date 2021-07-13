package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.User;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String userName=request.getParameter("user_name");
			String userEmail=request.getParameter("user_email");
			String userPassword=request.getParameter("user_password");
			String userPhone=request.getParameter("user_phone");
			String userAddress=request.getParameter("user_address");
			PrintWriter out=response.getWriter();
			
			
		//	validations
			if(userName.isEmpty()) {
				out.println("Name Is Blank");
				return;
			}
			
			//creating user object to store data
			User user=new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,"normal");
			Session hibernateSession=FactoryProvider.getFactory().openSession();
			Transaction tx=hibernateSession.beginTransaction();
			
			int userId =   (Integer) hibernateSession.save(user);
			
			tx.commit();
			hibernateSession.close();
			
			HttpSession httpSession =request.getSession();
			httpSession.setAttribute("message", "Registration Successful!!  User id is "+userId);
			response.sendRedirect("register.jsp");
			return;
			
			
			
			
			
			
			
			
			
			
		}
		catch(Exception e){
			e.printStackTrace();
			
			HttpSession httpSession=request.getSession();
            httpSession.setAttribute("message", "Something went Wrong ! ! Either you used alphabets in place of number or email is already registered with us.");
            response.sendRedirect("register.jsp");
		}
		
	}

}
