package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.model.Items;
import com.tbe.model.ItemsFactory;
import com.tbe.model.Resourse;

/**
 * Servlet implementation class UpdateTables
 */
@WebServlet("/UpdateTables")
public class UpdateTables extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTables() {
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
		String cat = "3";
		String name = request.getParameter("name");
		String cost = request.getParameter("cost");
		String description = request.getParameter("description");	
		String length = request.getParameter("Length");
		String width = request.getParameter("Width");	
		
		
		ItemsFactory itemfactory = new ItemsFactory();
		
		Items items = itemfactory.getItem(id, cat, name, cost, description, length, width);
		boolean isSuccess = items.updateData();
		if(isSuccess == true)
		{
			request.setAttribute("isSuccess", true);
			getServletContext().getRequestDispatcher("/views/resourse-edit/table-update.jsp").forward(request, response);
			
		}
		else
		{
			response.getWriter().println("Failed");
		}
		
	}
	

}
