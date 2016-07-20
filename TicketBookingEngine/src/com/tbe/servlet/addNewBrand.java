package com.tbe.servlet;
// Author: Sanju
import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.brandController;
import com.tbe.controller.categoryController;
import com.tbe.model.Brand;
import com.tbe.model.Category;

/**
 * Servlet implementation class addNewBrand
 */
@WebServlet("/addNewBrand")
public class addNewBrand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewBrand() {
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
		
		String Brand = request.getParameter("Brand").toString();
		String cat = request.getParameter("category").toString();
		boolean wrongBrand = false;
		
		brandController bc = new brandController();
		
		// get all available brand names
		Vector<Vector<String>> Enquiry = bc.getBrandNames();
		for (Vector<String> Enq : Enquiry) 
		{
			System.out.println("Brand name -> "+Enq.get(0));
			
			// check new brand name is a duplicate name
			if(Brand.equals(Enq.get(0).toString()))
			{		
				System.out.println(Brand);
				wrongBrand = true;
				break;
			}
			else
			{
				System.out.println("not matching");
			}
			
		}
		
		// duplicate name, display error msg
		if(wrongBrand == true){
			request.setAttribute("wrongBrand", true);
			getServletContext().getRequestDispatcher("/views/resourse-add/resourse-add.jsp").forward(request, response);
			
		}
		else
		{
			// add new brand name
			categoryController con = new categoryController();
			String catID = con.getCategoryID(cat);
			Brand cm = new Brand(Brand, catID);
			boolean isSuccess=cm.insertData();
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
