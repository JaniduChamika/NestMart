package com.jiat.nestmart.mail;


import com.jiat.nestmart.provider.MailServiceProvider;
import com.jiat.nestmart.util.Env;
import io.rocketbase.mail.EmailTemplateBuilder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Achintha
 */
public abstract class Mailable implements Runnable {

    private MailServiceProvider mailServiceProvider;
    private EmailTemplateBuilder.EmailTemplateConfigBuilder emailTemplateBuilder;

    public Mailable() {
        mailServiceProvider = MailServiceProvider.getInstance();
        emailTemplateBuilder = EmailTemplateBuilder.builder();
    }

    @Override
    public void run() {
        try {
            Session session = Session.getInstance(mailServiceProvider.getProperties(),
                    mailServiceProvider.getAuthenticator());
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(Env.get("app.mail")));
            buid(message);
            if (message.getRecipients(Message.RecipientType.TO).length > 0) {
                Transport.send(message);
                System.out.println("Email Sent Successfully...");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public abstract void buid(Message message) throws MessagingException;

    public EmailTemplateBuilder.EmailTemplateConfigBuilder getEmailTemplateBuilder() {
        return emailTemplateBuilder;
    }

}
