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
 * Servlet implementation class deleteallPackage
 */
@WebServlet("/deleteallPackage")
public class deleteallPackage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteallPackage() {
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
		// return all package details
		PackageController rc = new PackageController();
		Vector<Vector<String>> itemID = rc.getPackageDetails();
		
		// initializing
		String pId=null;
		String Pname=null;
		boolean state = false;
		
		for (Vector<String> Id : itemID)
		{
			pId =  Id.get(0);
			Pname = Id.get(1);
			System.out.println(pId);
			System.out.println(Pname);
			String PItemID = rc.getPItemIDDetails(pId, Pname);
			System.out.println((request.getParameter("btnDel_"+pId)));
			
			// check if package is selected,
			if(request.getParameter("btnDel_"+pId)!=null)
			{
				// delete that package
				state = rc.deletePackage(pId, Pname, PItemID);
			}
			if(request.getParameter("btnDelAll")!=null && request.getParameter("cb_"+pId)!=null)
			{
				state = rc.deletePackage(pId, Pname, PItemID);
			}
		}
		
		// delete successful
		if (state)
		{
			request.setAttribute("message", "Succesfully deleted the package ");			
		}
		// delete fail
		else 
		{
			
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/package-update/package-update.jsp");
        rd.forward(request, response);
	}
	

}
