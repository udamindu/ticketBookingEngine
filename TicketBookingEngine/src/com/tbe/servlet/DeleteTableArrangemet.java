package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.SVGEditor;

@WebServlet("/DeleteTableArrangemet")
public class DeleteTableArrangemet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteTableArrangemet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SVGEditor controller = new SVGEditor();
		//Vecttor<String> s = controller.getArrangements(Location)
		String id = (String) request.getParameter("arrangementId");
		boolean isSuccess = false;
		isSuccess = controller.deleteArrangement(id);
		if (isSuccess){
			RequestDispatcher rd = getServletContext()
					.getRequestDispatcher(
							"/views/table-arrangement/table-arrangement-selecter.jsp");
			rd.forward(request, response);
		}else{
			//TODO: Fail Function
		}
	}

}
