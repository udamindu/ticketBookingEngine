package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.DBAccess;
import com.tbe.model.Items;
import com.tbe.model.ItemsFactory;
import com.tbe.model.Resourse;

/**
 * Servlet implementation class updateResource
 */
@WebServlet("/updateResource")
public class updateResource extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateResource() {
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
		// initializing variables
		String id = request.getParameter("itemID");
		String cat = request.getParameter("Maincategory");
		String name = request.getParameter("MainBrand");
		String cost = request.getParameter("cost");
		String description = request.getParameter("description");	
		String length = "0";
		String width = "0";
		
		boolean empty = false;
		
		System.out.println("Check This");
		System.out.println(id);
		System.out.println(cat);
		System.out.println(name);
		System.out.println(cost);
		System.out.println(description);
		
		if(cat.equals("null"))
		{			
			empty = true;
		}
		else
		{		
			
			ItemsFactory itemfactory = new ItemsFactory();
			Items items = itemfactory.getItem(id, cat, name, cost, description, length, width);
			boolean isSuccess = items.updateData();
			if(isSuccess == true)
			{
				request.setAttribute("isSuccess", true);
				getServletContext().getRequestDispatcher("/views/resourse-edit/resourse-update.jsp").forward(request, response);
				
			}
			else
			{
				response.getWriter().println("Failed");
			}
		}
		
		if(empty == true){
			request.setAttribute("empty", true);
			getServletContext().getRequestDispatcher("/views/resourse-edit/resourse-editform.jsp?itemID="+ id).forward(request, response);
			
		}
		
	}

}
