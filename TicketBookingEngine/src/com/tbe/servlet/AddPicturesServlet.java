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
import com.tbe.model.LocationPictures;

/**
 * Servlet implementation class AddPicturesServlet
 */
@WebServlet("/AddPicturesServlet")
public class AddPicturesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddPicturesServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LocationPicturesController LPC = new LocationPicturesController();
		if (request.getParameter("btnAd") != null) {
			String Id = request.getParameter("btnAd");

			String Name = request.getParameter("Name_" + Id);
			String Desc = request.getParameter("Desc_" + Id);
			String Loc = request.getParameter("Loc_" + Id);
			String Url = request.getParameter("Url_" + Id);

			LocationPictures lp = new LocationPictures(Name, Url, Loc, Desc);
			boolean state = lp.insertData();
			boolean state2 = LPC.deleteFromTemp(Id);

			request.setAttribute("Loc", Loc);
			
			if (state && state2) {
				Utilities util = new Utilities();
				util.addToHistory("AddLocationPicture");
				
				request.setAttribute("message",
						"Information were added successfully!");
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher("/views/location-picture-add/location-picture-details-new.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("message",
						"Sorry. Our servers doesn't recognize your data!");
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher("/views/location-picture-add/location-picture-details-new.jsp");
				rd.forward(request, response);
			}
		}
		
		if (request.getParameter("btnDel")!=null) {
			boolean state = LPC.deleteFromTemp(request.getParameter("btnDel").toString());
			if (state){
				request.setAttribute("message",
						"Successfully Deleted the Picture");
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher("/views/location-picture-add/location-picture-details-new.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("message",
						"Sorry. Our servers doesn't recognize your data!");
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher("/views/location-picture-add/location-picture-details-new.jsp");
				rd.forward(request, response);
			}
			
		}

		if (request.getParameter("btnDone")!=null) {
				Vector<Vector<String>> TId = LPC.getTempPicId();
				String Id = request.getParameter("btnAd");

				String Name; 
				String Desc;
				String Loc;
				String Url; 

				for (Vector<String> id : TId){
					Id = id.get(0);
					if (request.getParameter("Name_" + Id)!=null) {
					 Name = request.getParameter("Name_" + Id);
					 Desc = request.getParameter("Desc_" + Id);
					 Loc = request.getParameter("Loc_" + Id); 
					 Url = request.getParameter("Url_" + Id);
					
					 LocationPictures lp = new LocationPictures(Name, Url, Loc, Desc);
						boolean state = lp.insertData();
						boolean state2 = LPC.deleteFromTemp(Id);
					}
				}
				
				Utilities util = new Utilities();
				util.addToHistory("AddLocationPicture");
				
				request.setAttribute("message", "Images were uploaded successfully");
				
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher("/views/location-picture-view/location-picture-table.jsp");
				rd.forward(request, response);			
		}
	}

}
