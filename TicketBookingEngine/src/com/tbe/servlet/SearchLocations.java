package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SearchLocations")
public class SearchLocations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SearchLocations() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String key = request.getParameter("txtsearch");

		System.out.println(key);
		request.setAttribute("key", key);
	
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/locations-view/view-locations.jsp");
        rd.forward(request, response);
	}

}
