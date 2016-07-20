/* 
 * Author : ashenkleo@gmail.com
 * Servlet to load search results
 *  */

package com.tbe.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.Utilities;

@WebServlet("/SearchResults")
public class SearchResults extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public SearchResults() {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String keyword = request.getParameter("kw").toString();
		request.setAttribute("kw",keyword);
		Utilities util = new Utilities();
		if (keyword != null && keyword != ""){
			Vector<Vector<String>> data = util.getHistory();
			Vector<String> lastRecord = data.firstElement();
			String lastKeyword = lastRecord.get(3);
			String lastType = lastRecord.get(1);
			if (lastType.equalsIgnoreCase("Search") && lastKeyword.equalsIgnoreCase(keyword)){
				// Do nothing
			} else {
				util.addToHistory("Search", keyword);
			}
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/search-results/search-results.jsp");
		rd.forward(request, response);
	}

}
