// Author:Sanju

package com.tbe.servlet;

import java.io.IOException;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.naming.RefAddr;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.tbe.controller.DBAccess;
import com.tbe.controller.ResourseController;
import com.tbe.model.Items;
import com.tbe.model.ItemsFactory;
import com.tbe.model.Resourse;


/**
 * Servlet implementation class Rfileupload
 */
@WebServlet("/Rfileupload")
public class Rfileupload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// location to store file uploaded
	private static final String UPLOAD_DIRECTORY = "upload";

	// upload settings
	private static final int MEMORY_THRESHOLD 	= 1024 * 1024 * 3; 	// 3MB
	private static final int MAX_FILE_SIZE 		= 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE	= 1024 * 1024 * 50; // 50MB
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Rfileupload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		// Common variable initialization		
		
		String cat = request.getParameter("Maincategory").toString();
		String brand = request.getParameter("MainBrand").toString();	
		String cost = request.getParameter("cost").toString();
		String description = request.getParameter("description").toString();
		String length = request.getParameter("L-Length").toString();
		String width = request.getParameter("W-Width").toString();	
		boolean isEmpty = false;
		
		// check if category and brand values are not selected
		if(cat.equals("? undefined:undefined ?") || brand.equals("? undefined:undefined ?"))
		{
			isEmpty = true;
		}
		
		if(isEmpty == true)
		{
			request.setAttribute("isEmpty", true);
			getServletContext().getRequestDispatcher("/views/resourse-add/resourse-add.jsp").forward(request, response);
			
		}
		
		
		// return object according to the category
		ItemsFactory itemfactory = new ItemsFactory();
		
		Items items = itemfactory.getItem(cat, brand, cost, description, length, width);
		boolean isSuccess = items.insertData();
		boolean isQtySuccess = items.insertQuantity();
		
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
