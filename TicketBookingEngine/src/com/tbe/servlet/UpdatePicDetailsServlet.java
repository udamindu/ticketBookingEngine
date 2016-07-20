package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

import com.tbe.controller.LocationPicturesController;
import com.tbe.controller.Utilities;

/**
 * Servlet implementation class UpdatePicDetailsServlet
 */
@WebServlet("/UpdatePicDetailsServlet")
public class UpdatePicDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePicDetailsServlet() {
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
		String Id = request.getParameter("Id");
		String Name = request.getParameter("Name");
		String Desc = request.getParameter("Desc");
		String Loc = request.getParameter("Loc").toString();
		
		LocationPicturesController lpc = new LocationPicturesController();
		boolean state = lpc.updatePicDetails(Id, Name, Loc, Desc);
		
		if (state){
			Utilities util = new Utilities();
			util.addToHistory("EditLocationPicture",Id);
			request.setAttribute("message", "Information were changed successfully!");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/location-picture-view/location-picture-table.jsp");
	        rd.forward(request, response);
		} else {
			request.setAttribute("message", "Sorry. Our servers doesn't recognize your new settings!");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/location-picture-edit/location-picture-edit.jsp");
	        rd.forward(request, response);
		}
	}

}
