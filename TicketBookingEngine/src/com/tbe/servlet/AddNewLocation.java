package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.LocationController;
import com.tbe.controller.Utilities;

/**
 * Servlet implementation class AddNewLocation
 */
@WebServlet("/AddNewLocation")
public class AddNewLocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewLocation() {
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
		
		String LName = request.getParameter("txtLName");
		int lLength = Integer.parseInt(request.getParameter("txtLLength"));		
		int lWidth = Integer.parseInt(request.getParameter("txtLWidth"));
		String scale = request.getParameter("combScale").toString();
		int covers = Integer.parseInt(request.getParameter("txtCovers"));
		String comName = request.getParameter("txtComName");				
		String category = request.getParameter("combCat").toString();
		String description = request.getParameter("txtDes").toString();
					
		LocationController lc = new LocationController();
		boolean s = lc.AddLocations(LName, lLength, lWidth, scale, covers, comName,  category, description);
		
		if(s)	
		{
			request.setAttribute("message", "Successfully Updated.");

		} else 
		{
			request.setAttribute("message", "Error updating.");
		}
		
		getServletContext().getRequestDispatcher("/views/locations-view/view-locations.jsp").forward(
				request, response);
		}
	

}
