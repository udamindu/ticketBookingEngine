package com.tbe.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbe.controller.Events;
import com.tbe.controller.ResourseController;

/**
 * Servlet implementation class AddQuantity
 */
@WebServlet("/AddQuantity")
public class AddQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuantity() {
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
		
		ResourseController e = new ResourseController();
		boolean booltot = false;
		boolean booldamage = false;
		boolean higherDmgAmt = false;
		String totalAmt = request.getParameter("id1");//totalAmount
		String id = request.getParameter("id");// itemId
		String damageAmt = request.getParameter("id2");//damageAmount
		
		System.out.println("totalAmount - "+totalAmt);
		System.out.println("damageAmount - "+damageAmt);
		
		// get total amount for that item id from db
		String getTotAmt = e.getTotalAmt(id);
		
		// get damage amount for that item id from db
		String getDmgAmt = e.getDmgAmt(id);
		
		// check if total amt is null in db
		if(getTotAmt == null)
		{
			// if so, make it 0
			getTotAmt = "0";
			System.out.println("Get Tot - "+getTotAmt);			
		}
		// check if damage amt is null in db
		if(getDmgAmt == null)
		{	
			// if so, make it 0
			getDmgAmt = "0";
			System.out.println("Get Dmg - "+getDmgAmt);
		}
		
		// check if total amt not null and damage amt is null
		if(totalAmt != null && damageAmt == null)
		{			
			// check if total amt greater than damage amt available
			if(Integer.parseInt(totalAmt) > Integer.parseInt(getDmgAmt))
			{
				// update total quantity amt
				booltot = e.updateQuantityTotal(totalAmt, id);
				if(booltot)
				{
					higherDmgAmt = false;
					request.setAttribute("message", "Total Amount Changed Successfully");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/quantity-add/add-quantity.jsp");
					rd.forward(request, response);
				}	
			}
			// error
			else
			{
				higherDmgAmt = true;
			}
		}
		
		// check if total amt is null and damage amt is not null
		if(totalAmt == null && damageAmt != null)
		{			
			// check if damage amt less than total amt available
			if(Integer.parseInt(getTotAmt) > Integer.parseInt(damageAmt))
			{
				// update damage amt
				booldamage = e.updateQuantityDamage(damageAmt, id);
				if(booldamage)
				{
					higherDmgAmt = false;
					request.setAttribute("message", "Damage Amount Changed Successfully");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/quantity-add/add-quantity.jsp");
					rd.forward(request, response);
				}				
			}
			// error
			else
			{
				higherDmgAmt = true;
			}
		}
		
		// error, diplay error: dagame amt > total amt
		if(higherDmgAmt == true)
		{
			request.setAttribute("higherDmgAmt", true);
			getServletContext().getRequestDispatcher("/views/quantity-add/add-quantity.jsp").forward(request, response);			
		}	
	}

}
