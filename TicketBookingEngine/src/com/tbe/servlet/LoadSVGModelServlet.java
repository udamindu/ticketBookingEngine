package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.SVGEditor;
import com.tbe.model.SVGPopUp;

/**
 * Servlet implementation class LoadSVGModelServlet
 */
@WebServlet("/LoadSVGModelServlet")
public class LoadSVGModelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadSVGModelServlet() {
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
		SVGEditor svgE = new SVGEditor();
		SVGPopUp svgP = new SVGPopUp();
		String [] locDetails = new String[4];

		svgP.settWidth(Double.parseDouble(request.getParameter("width")));
		svgP.settLength(Double.parseDouble(request.getParameter("length")));
		svgP.setCoversPerTable(Integer.parseInt(request.getParameter("covers")));
		svgP.setNoOfCovers(Integer.parseInt(request.getParameter("tables")
				.toString()));
		svgP.setLocation(3); // FIXME : Hardcoded
		svgP.setMetric("cm"); // FIXME : Hardcoded
		
		boolean state = svgE.setPopUpData(svgP);
		locDetails = svgE.getLocDetails(svgP.getLocation()+"");
		
		request.setAttribute("width", svgP.gettWidth());
		request.setAttribute("length", svgP.gettLength());
		request.setAttribute("covers", svgP.getCoversPerTable());
		request.setAttribute("tables", svgP.getNoOfCovers());
		request.setAttribute("location", svgP.getLocation());
		request.setAttribute("metric", svgP.getMetric());
		request.setAttribute("locationName", locDetails[3]);
		request.setAttribute("locationWidth", locDetails[1]);
		request.setAttribute("locationLength", locDetails[0]);
		request.setAttribute("locationMaxCovers", locDetails[2]);
		if (state) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/views/table-arrangement/table-arrangement.jsp");
			rd.forward(request, response);
		}
	}

}
