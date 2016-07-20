//uthpala damindu bandara
package com.tbe.model;

import java.util.Vector;

import com.tbe.controller.EmailCtrl;
import com.tbe.controller.SendEmails;
import com.tbe.controller.XMLfile;

public class Email {

	private String to;	
	private String message;
	private String subject;
	private Vector<String> emailContent;
	private int code;
	
	EmailCtrl ec = new EmailCtrl();
	SendEmails se = new SendEmails();
	XMLfile xmlf = new XMLfile();
	
	public Email(){}
	
	public Email(int cID){
		this.to = ec.getEmailAddress(cID);
		this.emailContent = xmlf.readXML();
		this.subject = emailContent.get(0);
		this.message = emailContent.get(1);
	}
	
	public Email(String receiver,String msg,String sub){
		this.to = receiver;
		this.subject = sub;
		this.message = msg;
	}
	
	//this method used to send automated email
	public void sendEmailMessage(){
		
		code = se.sendMails(to,message,subject);
		if(code==1)
			System.out.println("Email send successfully"); //successfull flow
		else if(code==-1)
			System.out.println("Authentification failed");
		else if(code==-2)
			System.out.println("Wrong email address");
		else
			System.out.println("Error");
	}
	
	//this method used to send customized emails
	public int sendCustomEmailMessage(){
		
		code = se.sendMails(to, message, subject);
		return code;
	}
	
	public String getTo(){
		return this.to;
	}
	
	public String getMessage(){
		return this.message;
	}
	
	public String getSubject(){
		return this.subject;
	}
}
