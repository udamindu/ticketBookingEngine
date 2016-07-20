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


@WebServlet("/DeleteGroups")
public class DeleteGroups extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteGroups() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String gName = request.getParameter("gName");
		
		LocationController lc = new LocationController();		
		Vector<Vector<String>> LId = lc.getGroupDetails();
	
		String group=null;
		boolean state = false;
		
		for (Vector<String> id : LId)
		{
			group =  id.get(0);			
			
			if(request.getParameter("btnDelAll")!=null && request.getParameter("ct_"+group)!=null)
			{
				state = lc.DeleteGroups(group);
			}
		}
		
		if (state)
		{
			request.setAttribute("message", "Succesfuly deleted. (Id : "+group);			
		}
		else 
		{
			request.setAttribute("message", "Sorry, an internal error. Failed to delete (Id : "+group+")");
		}
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/locations-groups-view/view-groups.jsp");
        rd.forward(request, response);;
	}

}
