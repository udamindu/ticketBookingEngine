package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.SVGEditor;
import com.tbe.controller.Utilities;
import com.tbe.model.SVGPopUp;

/**
 * Servlet implementation class AddNewArrangement
 */
@WebServlet("/AddNewArrangement")
public class AddNewArrangement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddNewArrangement() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SVGPopUp model = new SVGPopUp();
		SVGEditor cont = new SVGEditor();

		String name = request.getParameter("name").toString();
		String location = request.getParameter("location").toString();

		System.out.println(name + "---" + location);
		
		if (name != null && name!= "") {
			boolean state = cont.addNewArrangement(location, name);
			if (state) {
				
				Utilities util = new Utilities();
				util.addToHistory("AddTableArrangement");
				
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher(
								"/views/table-arrangement/table-arrangement-selecter.jsp");
				rd.forward(request, response);
			}
		}
	}

}
