package util;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {
	 public void sendEmailTo(String recipent,String fullName,int pin) {
	    	try {  
	        String mail="Hello Mr:"+fullName
	                + "\nYour Password Recuperation Code is:"+pin;
	                ;
	        
	               Properties props = new Properties();
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.port", "587");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.starttls.enable", "true");

	        Session session = Session.getInstance(props,
	                new javax.mail.Authenticator() {
	                    protected PasswordAuthentication getPasswordAuthentication() {
	                        return new PasswordAuthentication("haitambessi1@gmail.com", "vegantvqmofhrmdu");
	                    }
	                });

	        
	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress("Admin@gmail.com"));
	            message.setRecipients(Message.RecipientType.TO,
	                    InternetAddress.parse(recipent));
	            message.setSubject("Password Restauration");
	            
	           message.setText(mail);
	            Transport.send(message);

	            System.out.println("Email sent successfully.");

	        } catch (MessagingException e) {
	        	System.out.println(e.getMessage());
	            throw new RuntimeException(e);
	        }
	    }
}
