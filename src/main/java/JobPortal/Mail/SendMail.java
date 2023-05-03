package JobPortal.Mail;

import JobPortal.Creds;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.util.Properties;

public class SendMail extends Creds {
    private final static String host = "smtp.gmail.com";

    public SendMail(String to, String subject, String text) {

        if (!checkInternetConnection()) {
            System.out.println("SMTP not available, Skipping mail!");
            return;
        }

        // Get system properties
        Properties properties = System.getProperties();
        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_EMAIL, SMTP_PASS);
            }
        });
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(SMTP_EMAIL));
            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // Set Subject: header field
            message.setSubject(subject);
            // Now set the actual message
            message.setContent(text, "text/html");
            System.out.println("Sending mail....");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException Ex) {
            Ex.printStackTrace();
        }
    }

    public static boolean checkInternetConnection() {
        try {
            // Use Google's SMTP server address to check internet connectivity
            SocketAddress sockaddr = new InetSocketAddress(host, 587);
            // Create an unconnected socket object
            Socket socket = new Socket();
            // Connect to the socket with a timeout of 3 seconds
            socket.connect(sockaddr, 3000);
            // Close the socket connection
            socket.close();
            return true;
        } catch (IOException e) {
            return false;
        }
    }
}