package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.Configurations;

import org.apache.commons.io.FileUtils;

import java.io.File;

/**
 * Servlet implementation class ConfigurationsServlet
 */
@WebServlet("/ConfigurationsServlet")
public class ConfigurationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfigurationsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Location = request.getParameter("PicLoc");
		Configurations config = new Configurations();
		boolean state = false;
		
    	// Move the folder
    	String source = config.getLocPicPath();
    	File sourceDir = new File(source);
 
    	String destination = Location;
    	File targetDir = new File(destination);
 
    	try {
    		FileUtils.copyDirectory(sourceDir, targetDir);
    	} catch (IOException e) {
    		e.printStackTrace();
    	}
		
		state = config.setLocPicPath(Location);
		
		if (state){
			request.setAttribute("message", "Location for upload pictures is succesfully changed");
		} else {
			request.setAttribute("message", "An internal error occured while changing the upload directory");
		}

		RequestDispatcher rd = getServletContext().getRequestDispatcher("/ConfigManager.jsp");
        rd.forward(request, response);;
	}

}
