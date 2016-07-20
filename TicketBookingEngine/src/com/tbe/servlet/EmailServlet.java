//uthpala damindu bandara
package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.model.Email;

/**
 * Servlet implementation class EmailServlet
 */
@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//int cId = 3;  hardcoded company id, no use for now
		int code;
		String receiver = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		Email newEmail = new Email(receiver,message,subject);
		code = newEmail.sendCustomEmailMessage();
		
		if(code == -1){
			request.setAttribute("messageFL", "Authentication Failure occured");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/admin-email_manager.jsp");
			rd.forward(request, response);
		}
		else if(code == -2){
			request.setAttribute("messageFL", "Incorrect receiver mail.Re-check the address");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/admin-email_manager.jsp");
			rd.forward(request, response);
		}
		else if(code == -3){
			request.setAttribute("messageFL", "Messaging Failure occured.Re-check your connection");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/admin-email_manager.jsp");
			rd.forward(request, response);
		}
		else{
			request.setAttribute("messageOK", "Email Sent Successfully !");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/admin-email_manager.jsp");
			rd.forward(request, response);
		}
	}

}
