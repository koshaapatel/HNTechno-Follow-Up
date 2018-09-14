package com.HNTechno.model;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class email {  
	  public static void send(String to,String subject,String msg) {  
	  
	  String host="smtp.gmail.com";  
	  String user="meetvalandm@gmail.com";//change accordingly  
	  String password="meet1234";//change accordingly  
	  Boolean sessionDebug=false;
	  
	   //Get the session object  
	   Properties props = System.getProperties();
	   props.put("mail.smtp.starttls.enable","true");
	   props.put("mail.smtp.host",host);
	   props.put("mail.smtp.port","587");
	   props.put("mail.smtp.auth","true");
	   props.put("mail.smtp.starttls.required","true");
	   
	     
	   Session session = Session.getDefaultInstance(props,null); 
	   session.setDebug(sessionDebug);
	   
	   //Compose the message  
	    try {  
	     Message message = new MimeMessage(session);  
	     message.setFrom(new InternetAddress(user));
	     InternetAddress[] address={new InternetAddress(to)};
	     message.setRecipients(Message.RecipientType.TO,address);  
	     message.setSubject(subject);
	     message.setSentDate(new Date());
	     message.setText(msg);
	     
	     Transport transport=session.getTransport("smtp");
	     transport.connect(host, user, password);
	     transport.sendMessage(message, message.getAllRecipients());
	     transport.close();  
	  
	     System.out.println("Sent");  
	    } 
	    catch (Exception e) {
	    	 System.out.println(e);
	    	 }  
	 }  
}  
