package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.*;

/**
 * Servlet implementation class EditEventName
 */
@WebServlet("/EditEventName")
public class EditEventName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEventName() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Events e = new Events();
		boolean k = false;
		String name = request.getParameter("id1");//Event name
		String id = request.getParameter("id");// event id
		String des = request.getParameter("id2");//description
		
		if(name!=null){
			k = e.updateEventName(name, id);
			System.out.println(k);
			request.setAttribute("message", "Name Changed Successfully");//dan ara wade hari namuth response.sendredirect karaddi request attribute ekata set karanna ba session ekakata set karala eka ara page eke null karapan
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/event-searchevents/searchevents.jsp");
			rd.forward(request, response);
//			response.sendRedirect("views/event-searchevents/searchevents.jsp");
		}
		else if(des!=null){
			k = e.updateEventDescription(des, id);
			System.out.println(k);
			if(k){
			request.setAttribute("message", "Description Changed Successfully");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/event-searchevents/searchevents.jsp");
			rd.forward(request, response);
//			response.sendRedirect("views/event-searchevents/searchevents.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Events e = new Events();
		boolean k = false;
		String name = request.getParameter("id1");//Event name
		String id = request.getParameter("id");// event id
		String des = request.getParameter("id2");//description
		
		if(name!=null){
			k = e.updateEventName(name, id);
			System.out.println(k);
			request.setAttribute("message", "Name Changed Successfully");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/event-searchevents/searchevents.jsp");
			rd.forward(request, response);
//			response.sendRedirect("views/event-searchevents/searchevents.jsp");
		}
		else if(des!=null){
			k = e.updateEventDescription(des, id);
			System.out.println(k);
			if(k){
			request.setAttribute("message", "Description Changed Successfully");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/event-searchevents/searchevents.jsp");
			rd.forward(request, response);
//			response.sendRedirect("views/event-searchevents/searchevents.jsp");
			}
		}
	}

}
