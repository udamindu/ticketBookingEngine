package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.model.Package;

/**
 * Servlet implementation class updatePackRes
 */
@WebServlet("/updatePackRes")
public class updatePackRes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePackRes() {
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
		String id = request.getParameter("itemID");
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		String type = request.getParameter("Type");
		String company = request.getParameter("company");
		String tot = request.getParameter("tot");
		String description = request.getParameter("description");
		
		
		
					
				Package rm = new Package(id,type,name,location,company,description,tot);
				boolean val=rm.updateData();
				if(val==true)
				{
					request.setAttribute("message","Successfully Added! ");
					getServletContext().getRequestDispatcher("/views/package-update/package-update.jsp").forward(request, response);
					
					//getServletContext().getRequestDispatcher("/RAdd.jsp").forward(request, response);
					//response.getWriter().println("suceessful");
				}
				else
				{
					response.getWriter().println("Failed");
				}
	}

}
