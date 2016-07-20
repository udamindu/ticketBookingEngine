package com.tbe.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.LocationController;

/**
 * Servlet implementation class LocationGroups
 */
@WebServlet("/LocationGroups")
public class LocationGroups extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LocationGroups() {
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
		
		LocationController lc = new LocationController();
		Vector<Vector<String>> LId = lc.getLocDetailsToTable();
		
		String gName=null;
		String lId=null;
		String lName=null;		
		
		gName=request.getParameter("groupName");
		boolean state = false;
		for (Vector<String> id : LId)
		{
			lId=id.get(0);
			if(request.getParameter("cbGrp"+lId)!=null){				
				lName=id.get(1);
								
				state = lc.AddGroups(gName, lId, lName);		
				
			}
		}
		getServletContext().getRequestDispatcher("/views/locations-groups-view/view-groups.jsp").forward(
				request, response);
	}
}


