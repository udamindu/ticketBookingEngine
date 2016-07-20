package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.Events;

/**
 * Servlet implementation class EventType
 */
@WebServlet("/EventType")
public class EventType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventType() {
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
		Events newEvents = new Events();
		boolean i = false;
		int cid = 3;
		
		String eType = request.getParameter("ttype");
		String eDescription = request.getParameter("tdescription");
		
		
		System.out.println("eType"+eType);
		System.out.println("eDescription"+eDescription);
		
		i = newEvents.addEventTypes(eType, eDescription,cid);
		System.out.println("Status"+i);
		
		//success message
		if(i){
			request.setAttribute("message1", "Type Added Successfully");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/admin-add_event_types.jsp");
			rd.forward(request, response);
		}
		//failure message
		else{
			request.setAttribute("message", "Type already Exists");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/admin-add_event_types.jsp");
			rd.forward(request, response);
		}
		
		//NOTE: unhandled exception ocuurs when trying to violate primary key  
		
		
	}

}
