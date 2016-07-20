package com.tbe.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.LocationController;
import com.tbe.controller.Utilities;


@WebServlet("/UpdateLocations")
public class UpdateLocations extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
   
    public UpdateLocations() {
        super();       
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 
				
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("lblID");
		String LName = request.getParameter("txtLName");
		int lLength = Integer.parseInt(request.getParameter("txtLLength"));		
		int lWidth = Integer.parseInt(request.getParameter("txtLWidth"));
		String scale = request.getParameter("txtUnit");
		int covers = Integer.parseInt(request.getParameter("txtCovers"));
		String comName = request.getParameter("txtComName");				
		String category = request.getParameter("combCat").toString();
		String description = request.getParameter("txtDes").toString();
			
		
	LocationController lc = new LocationController();
	boolean s = lc.UpdateLocations(LName, lLength, lWidth, scale, covers, comName, category, description, id);
	
	Utilities util = new Utilities();
	util.addToHistory("UpdateLocation",id);
	
	RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/locations-view/view-locations.jsp");
    rd.forward(request, response);;
	}

}