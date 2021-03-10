package cn.fragile.tools;

import com.sun.mail.util.MailSSLSocketFactory;
import cn.fragile.pojo.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class Sendmail implements Runnable{
    private String from = "2940318113@qq.com";
    private String username = "2940318113@qq.com";
    private String password = "xenbwvpcfvwjdcjb";

    private User user;
    public Sendmail(User user) {
        this.user = user;
    }

    @Override
    public void run() {
        try {
            Properties prop = new Properties();
            prop.setProperty("mail.host", "smtp.qq.com");
            prop.setProperty("mail.transport.protocol", "smtp");
            prop.setProperty("mail.smtp.auth", "true");

            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            prop.put("mail.smtp.ssl.enable", "true");
            prop.put("mail.smtp.ssl.socketFactory", sf);

            Session session = Session.getDefaultInstance(prop, new Authenticator() {//获取和SMTP服务器的连接对象
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            session.setDebug(true);

            Transport ts = session.getTransport();

            ts.connect("smtp.qq.com", username, password);

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
            message.setSubject("Welcome to Fragile Games!");
            message.setContent("<p>Hello, <b>"+user.getUserName()+"<b/></p>" +
                    "<p>You've successfully become a member of Fragile Games! Your UserID is ：</p>" +
                    "<h2>"+user.getUserCode()+"</h2> This UserID can be used as your account to login our Website." +
                    "Best Regards,<p>" +
                    "Fragile Team", "text/html;charset=UTF-8");

            ts.sendMessage(message, message.getAllRecipients());

            ts.close();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        }
    }
}
