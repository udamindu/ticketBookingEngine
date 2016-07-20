package com.tbe.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.LocationPicturesController;

/**
 * Servlet implementation class SearchPictures
 */
@WebServlet("/SearchPictures")
public class SearchPictures extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPictures() {
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
		String kw = request.getParameter("search");
		String Loc = request.getParameter("Loc").toString();
		
		if (Loc.equalsIgnoreCase("Any")){
			Loc=null;
		}
		System.out.println(kw);
		request.setAttribute("kw", kw);
		request.setAttribute("Loc", Loc);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/location-picture-view/location-picture-table.jsp");
        rd.forward(request, response);
	}

}
