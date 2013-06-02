package com.jiren.eshop.domain;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class Mail {

	final static String senderEmailID = "eshopeshop34@gmail.com";
	final static String senderPassword = "mongoDB1";
	final static String emailSMTPserver = "smtp.gmail.com";
	final static String emailServerPort = "465";

	static String receiverEmailID = null;
	static String emailSubject = null;
	static String emailBody = null;
	
	public static class SMTPAuthenticator extends javax.mail.Authenticator{
		public PasswordAuthentication getPasswordAuthentication(){
			return new PasswordAuthentication(senderEmailID, senderPassword);
		}
	}
	
	public static void envoiMail(String receiverEmailID2, String emailSubject2, String emailBody2)
	{
		receiverEmailID=receiverEmailID2;
		emailSubject=emailSubject2;
		emailBody=emailBody2;


		Properties props = new Properties();
		props.put("mail.smtp.user",senderEmailID);
		props.put("mail.smtp.host", emailSMTPserver);
		props.put("mail.smtp.port", emailServerPort);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		// props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", emailServerPort);
		props.put("mail.smtp.socketFactory.class",
		"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
	
		System.getSecurityManager();
	
		try{
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(props, auth);
			// session.setDebug(true);

			MimeMessage msg = new MimeMessage(session);
			msg.setText(emailBody);
			msg.setSubject(emailSubject);
			msg.setFrom(new InternetAddress(senderEmailID));
			msg.addRecipient(Message.RecipientType.TO,
			new InternetAddress(receiverEmailID));
			Transport.send(msg);
			System.out.println("message envoyer..");
		}catch (Exception mex){
			mex.printStackTrace();
			System.out.println("message non envoyer..");
		}
	}
	
}
