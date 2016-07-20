// uthpala damindu bandara
package com.tbe.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class SendEmails {

	// method used to send a simple email using smtp authenticator
	public int sendMails(String to,String message,String subject){

		final String login= "udamindu@gmail.com";
		final String password= "helloimudaminduongmail";
	    
		try{
	    	  
	    	  Properties props = new Properties();
	          props.setProperty("mail.host", "smtp.gmail.com");
	          props.setProperty("mail.smtp.port", "587");
	          props.setProperty("mail.smtp.auth", "true");
	          props.setProperty("mail.smtp.starttls.enable", "true");
	          props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	          
	          System.out.println("before authentication");

	          Authenticator auth = new SMTPAuthenticator(login, password);
	          
	          System.out.println("after authentication");

	          Session session = Session.getInstance(props,new javax.mail.Authenticator() {
	  			protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(login, password);
				}
			  });
	          
	          System.out.println("after authentication1");

	          MimeMessage msg = new MimeMessage(session);
	          msg.setText(message); //message
	          msg.setSubject(subject); //subject
	          msg.setFrom(new InternetAddress("udamindu@gmail.com"));
	          msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	          Transport.send(msg);
		}
		catch (AuthenticationFailedException e) {
			e.printStackTrace();
			System.out.println("Authenrication failed");
			return -1;

		}catch (AddressException e) {
			e.printStackTrace();
			System.out.println("Wrong email address");
			return -2;
   	 
		}catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("Error");
			return -3; 	 
		}
		return 1;
	        
	}
}
