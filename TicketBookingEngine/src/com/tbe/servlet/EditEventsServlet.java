package com.tbe.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.DateValidation;
import com.tbe.controller.Events;

/**
 * Servlet implementation class EditEventsServlet
 */
@WebServlet("/EditEventsServlet")
public class EditEventsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEventsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Events event = new Events();
		DateValidation dateValidation = new DateValidation();
		boolean i = false;	
		int eCId = 3;
		
		String eName = request.getParameter("name");
		String eType = request.getParameter("type");
		String eLocation = request.getParameter("location");
		String eSdate = request.getParameter("startingtime");
		String eEdate = request.getParameter("endingtime");
		String eDescription = request.getParameter("description");
		String id = request.getParameter("idd");
		
		int validatedStatus = dateValidation.validateDateTime(eSdate, eEdate);
		System.out.println("validatedStatus is "+validatedStatus);
			
		if(validatedStatus==-1){	
			request.setAttribute("message", "Please check the Starting Date again");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/event-editevents/editevents.jsp");
			rd.forward(request, response);
		}
		else if(validatedStatus==-2){
			request.setAttribute("message", "Please check the Starting and Ending Dates");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/event-editevents/editevents.jsp");
			rd.forward(request, response);
		}
		else if(validatedStatus==1){
			
			i = event.editEvent(eType, eName, eLocation, eSdate, eEdate, eCId, eDescription,id);
				
			if(i){					
				//newEmail.sendEmailMessage();
				request.setAttribute("message1", "Event Edited Successfully");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/event-editevents/editevents.jsp");
				rd.forward(request, response);
			}
			else{
				request.setAttribute("message", "There's an Event alredy created for the Location");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/event-editevents/editevents.jsp");
				rd.forward(request, response);
			}
		}		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
