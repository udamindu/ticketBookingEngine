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


@WebServlet("/DeleteLocations")
public class DeleteLocations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DeleteLocations() {
        super();
        
    }
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Lid = request.getParameter("lblID");
		
		LocationController lc = new LocationController();
		
		Vector<Vector<String>> LId = lc.getLocDetailsToTable();
	
		String location=null;
		boolean state = false;
		for (Vector<String> id : LId)
		{
			location =  id.get(0);
			if(request.getParameter("btnDel_"+location)!=null){
				state = lc.DeleteLocations(location);
			}
			if(request.getParameter("btnDelAll")!=null && request.getParameter("ct_"+location)!=null){
				state = lc.DeleteLocations(location);
			}
		}
		if (state)
		{
			request.setAttribute("message", "Succesfuly deleted. (Id : "+location);			
		}
		else {
			request.setAttribute("message", "Sorry, an internal error. Failed to delete (Id : "+location+")");
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/locations-view/view-locations.jsp");
        rd.forward(request, response);;
	}
		
		
	

}
