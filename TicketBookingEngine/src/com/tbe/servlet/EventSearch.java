package com.tbe.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.Events;

/**
 * Servlet implementation class EventSearch
 */
@WebServlet("/EventSearch")
public class EventSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Events ev = new Events();
		PrintWriter out = response.getWriter();
		String search = request.getParameter("querry");//
		Vector<Vector<String>> results = ev.QuickSearch(search);
		String ename="";
		String etype="";
		String elocation="";
		String esdate="";
		String eedate="";
		String estatus="";
		String edescription="";
		//String tableRow="<tr>"+"<td>"+"Dear customer, "+"</td>"+"</tr>";
		
		String tableRow="";
		for(Vector<String> Enq:results){
			
			ename = Enq.get(0);
			etype = Enq.get(1);
			elocation = Enq.get(2);
			esdate = Enq.get(3);
			eedate = Enq.get(4);
			estatus = Enq.get(5);
			edescription = Enq.get(6);
		
			tableRow += "<tr>"+"<td>"+ename+"</td>"+"<td>"+etype+"</td>"+"<td>"+elocation+"</td>"+"<td>"+esdate+"<td>"+"<td>"+eedate+"<td>"+"<td>"+estatus+"<td>"+"<td>"+edescription+"<td>"+"</tr>";
		}
		
		out.write(tableRow);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Events event = new Events();
		
		String filterBy = request.getParameter("filter");// Location or Event Name
		String search = request.getParameter("querry");
		String query ="";
		//filter by location
		if(filterBy.equals("Location")){
			query = "select \"ename\",\"etype\",\"esdate\",\"eedate\",\"estatus\",\"edescription\" from \"event\" where \"elocation\" = '"+search+"' or \"elocation\" = '"+search+"';";
		}
		//filter by Event Name
		else if(filterBy.equals("Event Name")){
			query = "select \"ename\",\"etype\",\"esdate\",\"eedate\",\"estatus\",\"edescription\" from \"event\" where \"ename\" = '"+search+"' or \"ename\" = '"+search+"';";
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
