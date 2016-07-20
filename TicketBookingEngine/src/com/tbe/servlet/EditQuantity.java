package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.model.Category;

/**
 * Servlet implementation class EditQuantity
 */
@WebServlet("/EditQuantity")
public class EditQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditQuantity() {
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
		
		String cat = request.getParameter("Catergory").toString();
		
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
