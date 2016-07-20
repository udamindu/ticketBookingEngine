package com.tbe.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.PackageController;

/**
 * Servlet implementation class deleteallPackRes
 */
@WebServlet("/deleteallPackRes")
public class deleteallPackRes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteallPackRes() {
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
		String Pid = request.getParameter("pid");
		String Name = request.getParameter("name");
		
		PackageController rc = new PackageController();
		
		// get package item id
		String PitemID = rc.getPItemIDDetails(Pid, Name);		
		
		boolean state = false;				
			
		System.out.println((request.getParameter("btnDel_"+PitemID)));
		// check if pid selected
		if(request.getParameter("btnDel_"+PitemID)!=null)
		{
			state = rc.deletePackage(Pid, Name, PitemID);
		}
		if(request.getParameter("btnDelAll")!=null && request.getParameter("cb_"+PitemID)!=null)
		{
			state = rc.deletePackage(Pid, Name, PitemID);
		}
		
		// delete success
		if (state == true)
		{
			request.setAttribute("message", "Succesfully deleted the package ");			
		}
		// delete fail
		else {
			request.setAttribute("message","Failed to delete the Package");// Failed to delete the resource (Id : "+itemID+")");
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/package-update/package-update.jsp");
        rd.forward(request, response);
	
	}

}
