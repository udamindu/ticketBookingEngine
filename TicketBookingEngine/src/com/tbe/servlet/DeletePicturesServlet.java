// Author : Ashen

package com.tbe.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.LocationPicturesController;
import com.tbe.controller.Utilities;

@WebServlet("/DeletePicturesServlet")
public class DeletePicturesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeletePicturesServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LocationPicturesController lpc = new LocationPicturesController();
		Utilities util = new Utilities();
		util.addToHistory("DeleteLocationPicture");
		Vector<Vector<String>> PicId = lpc.getPicIds();
		String Picture=null;
		boolean state = false;
		for (Vector<String> Pic : PicId)
		{
			Picture =  Pic.get(0);
			if(request.getParameter("btnDel_"+Picture)!=null){
				state = lpc.deletePicture(Picture);
			}
			if(request.getParameter("btnDelAll")!=null && request.getParameter("cb_"+Picture)!=null){
				state = lpc.deletePicture(Picture);
			}
		}
		if (state)
		{
			request.setAttribute("message", "Succesfuly deleted the picture (Id : "+Picture);			
		}
		else {
			request.setAttribute("message", "Sorry, an internal error. Failed to delete the picture (Id : "+Picture+")");
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/location-picture-view/location-picture-table.jsp");
        rd.forward(request, response);;
	}

}
