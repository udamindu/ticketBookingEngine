package com.tbe.controller;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.io.File;

import java.util.Vector;

public class XMLfile {

	//returns a vector contains node values 
	public Vector<String> readXML(){
		
		Vector<String> vec = new Vector<String>();
		
		 try {			 	
				File fXmlFile = new File("E:/SEP1/TicketBookingEngine/TicketBookingEngine/WebContent/WEB-INF/config.xml");
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(fXmlFile);
						
				
				doc.getDocumentElement().normalize();
						
				NodeList nList = doc.getElementsByTagName("email");

				for (int temp = 0; temp < nList.getLength(); temp++) {

					Node nNode = nList.item(temp);
							
					System.out.println("\nCurrent Element :" + nNode.getNodeName());
							
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {

						Element eElement = (Element) nNode;
						vec.add(eElement.getElementsByTagName("subject").item(0).getTextContent());
						vec.add(eElement.getElementsByTagName("message").item(0).getTextContent());
					}
				}
			}catch(Exception e){
			    	System.out.println(e.getMessage());
			}
		 return vec;
	}
	
	public void writeToXML(){
		
	}
}
