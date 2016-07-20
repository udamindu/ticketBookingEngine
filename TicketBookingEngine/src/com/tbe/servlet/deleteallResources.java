package com.tbe.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.ResourseController;

/**
 * Servlet implementation class deleteallResources
 */
@WebServlet("/deleteallResources")
public class deleteallResources extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteallResources() {
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
		ResourseController rc = new ResourseController();
		
		// get all items details
		Vector<Vector<String>> itemID = rc.getResourseDetails();
		String IId=null;
		boolean state = false;
		
		for (Vector<String> Id : itemID)
		{
			IId =  Id.get(0);
			System.out.println(IId);
			System.out.println((request.getParameter("btnDel_"+IId)));
			if(request.getParameter("btnDel_"+IId)!=null){
				state = rc.deleteResource(IId);
			}
			if(request.getParameter("btnDelAll")!=null && request.getParameter("cb_"+IId)!=null){
				state = rc.deleteResource(IId);
			}
		}
		// delete success
		if (state)
		{
			request.setAttribute("message", "Succesfully deleted the resource (Id : "+IId+" )");			
		}
		// delete fail
		else {
			request.setAttribute("message", "Sorry, an internal error. Failed to delete the resource (Id : "+IId+")");
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/resourse-edit/resourse-update.jsp");
        rd.forward(request, response);
	}

}
