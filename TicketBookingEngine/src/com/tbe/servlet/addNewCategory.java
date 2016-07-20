package com.tbe.servlet;
// Author : Sanju
import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.categoryController;
import com.tbe.model.Category;
import com.tbe.model.Resourse;

/**
 * Servlet implementation class addNewCategory
 */
@WebServlet("/addNewCategory")
public class addNewCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewCategory() {
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
		// Initializing variables
		
		String cat = request.getParameter("Catergory").toString();
		
		boolean wrongCat = false;
		categoryController cc = new categoryController();
		
		// return all category types available
		Vector<Vector<String>> Enquiry = cc.getCategoryNames();
		for (Vector<String> Enq : Enquiry) 
		{
			System.out.println("Category name -> "+Enq.get(0));
			// check for duplicate category types
			if(cat.equals(Enq.get(0).toString()))
			{		
				System.out.println(cat);
				wrongCat = true;
				break;
			}
			else{
				System.out.println("not matching");
			}
			
		}
		
		// duplicate category, display error msg
		if(wrongCat == true){
			request.setAttribute("wrongCat", true);
			getServletContext().getRequestDispatcher("/views/resourse-add/resourse-add.jsp").forward(request, response);
			
		}
		else
		{
			// add new category
			Category cm = new Category(cat);
			boolean isSuccess = cm.insertData();
			if(isSuccess == true)
			{		
				request.setAttribute("isSuccess", true);
				getServletContext().getRequestDispatcher("/views/resourse-add/resourse-add.jsp").forward(request, response);
			
			}
			else
			{
				response.getWriter().println("Failed");
			}
		}
		
		
	}

}
