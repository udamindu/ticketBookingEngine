package com.tbe.servlet;

// Author - Sanju
import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.model.Package;
import com.tbe.controller.DBAccess;
import com.tbe.controller.PackageController;
/**
 * Servlet implementation class PAdd
 */
@WebServlet("/PAdd")
public class PAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PAdd() {
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
		
		// Initializing variables
		String pkgName = request.getParameter("pkgName").toString();
		String ename = request.getParameter("ename").toString();
		String RCat = request.getParameter("RCat").toString();
		String RName = request.getParameter("RName").toString();
		String Rquantity = request.getParameter("Rquantity").toString();
		String description = request.getParameter("description").toString();
		String tot = request.getParameter("tot").toString();
		boolean isEmpty = false;
		
		// check if category and brand values are not selected
		if(RCat.equals("? undefined:undefined ?") || RName.equals("? undefined:undefined ?"))
		{
			isEmpty = true;
		}
				
		if(isEmpty == true)
		{
			request.setAttribute("isEmpty", true);
			getServletContext().getRequestDispatcher("/views/package-create/createpackage.jsp").forward(request, response);
		}
				
		PackageController pc = new PackageController();
		
		// Getting no. of cover available
		String covers = pc.getLocationCovers(ename);
		boolean check = false;
		boolean wrongPkg = false;
		String totalCovers = null;
		
		// Getting all package names
		Vector<Vector<String>> Enquiry = pc.getPackageDetails();
		for (Vector<String> Enq : Enquiry) 
		{
			System.out.println("Pkg name -> "+Enq.get(1));
			
			// check if the new package name is already an added name
			if(pkgName.equals(Enq.get(1).toString()))
			{		
				System.out.println(pkgName);
				wrongPkg = true;
				break;
			}
			else
			{
				System.out.println("not matching");
			}			
		}
		
		// duplicate package name, display error msg
		if(wrongPkg == true)
		{
			request.setAttribute("wrongPkg", true);
			getServletContext().getRequestDispatcher("/views/package-create/createpackage.jsp").forward(request, response);
			
		}
		else
		{
			// check if quantity adding is greater than covers available
			if(Integer.parseInt(Rquantity) > Integer.parseInt(covers))
			{			
				// quantity more than cover, display error msg
				check = true;
				totalCovers = covers;
				request.setAttribute("check", true);
				request.setAttribute("totalCovers", covers);
				getServletContext().getRequestDispatcher("/views/package-create/createpackage.jsp").forward(request, response);
			}
			else
			{
				// insert package details
				Package rm = new Package(pkgName, ename, description, tot, RCat, RName, Rquantity);
				boolean isSuccess = rm.insertData();
				if(isSuccess == true)
				{
					request.setAttribute("isSuccess", true);
					getServletContext().getRequestDispatcher("/views/package-create/createpackage.jsp").forward(request, response);
				}
				else
				{
					request.setAttribute("isSuccess", false);
					getServletContext().getRequestDispatcher("/views/package-create/createpackage.jsp").forward(request, response);
						
				}
			}
		}
		
		
		
		
		
	}

}

