package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.model.Package;

/**
 * Servlet implementation class updatePackage
 */
@WebServlet("/updatePackage")
public class updatePackage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePackage() {
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
				// initialing variables
		
				String id = request.getParameter("pid");
				String name = request.getParameter("name");
				String tot = request.getParameter("tot");
				String description = request.getParameter("description");
				String RCat = request.getParameter("RCat");
				String RName = request.getParameter("RName");
				String RQty = request.getParameter("itemQty");
		
				boolean isEmpty = false;
				
				// check if category and brand values are not selected
				if(RCat.equals("? undefined:undefined ?") || RName.equals("? undefined:undefined ?"))
				{
					isEmpty = true;
				}
						
				if(isEmpty == true)
				{
					request.setAttribute("isEmpty", true);
					getServletContext().getRequestDispatcher("/views/package-update/package-update.jsp").forward(request, response);
				}
				// update package details
				Package rm = new Package(id,name,description,tot, RCat, RName, RQty);
				boolean isSuccess = rm.updateData();
				// update success
				if(isSuccess == true)
				{
					request.setAttribute("isSuccess", true);
					getServletContext().getRequestDispatcher("/views/package-update/package-update.jsp").forward(request, response);
					
				}
				// update fail
				else
				{
					response.getWriter().println("Failed");
				}
	}

}
