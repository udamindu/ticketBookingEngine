/*
 * Servlet to clear the activity log
 * Author : ashenkleo@gmail.com
 */

package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.Utilities;

@WebServlet("/ClearHistory")
public class ClearHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ClearHistory() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utilities util = new Utilities();
		boolean isSuccess = util.clearHistory();
		util.addToHistory("ClearHistory");
		request.setAttribute("isSuccess", true);
		RequestDispatcher rd = getServletContext()
					.getRequestDispatcher(
							"/views/history/history.jsp");
			rd.forward(request, response);
	}

}
