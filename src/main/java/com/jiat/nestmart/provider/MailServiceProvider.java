package com.jiat.nestmart.provider;


import com.jiat.nestmart.mail.Mailable;
import com.jiat.nestmart.util.Env;
import java.util.Properties;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
/**
 *
 * @author Achintha
 */
public class MailServiceProvider {
    private ThreadPoolExecutor executor;
    private Properties properties = new Properties();
    private Authenticator authenticator;
    private static MailServiceProvider mailServiceProvider;
    private BlockingQueue<Runnable> blockingQueue = new LinkedBlockingQueue<>();
    
    private MailServiceProvider(){
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", Env.get("mail.host"));
        properties.put("mail.smtp.port", Env.get("mail.port"));
    }
    
    public static MailServiceProvider getInstance(){
        if (mailServiceProvider == null) {
            mailServiceProvider = new MailServiceProvider();
        }
        return mailServiceProvider;
    }
    
    public void start(){
        authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Env.get("mail.username"), Env.get("mail.password"));
            }
            
        };
        
        executor = new ThreadPoolExecutor(2, 5, 5, TimeUnit.SECONDS, blockingQueue, 
                new ThreadPoolExecutor.AbortPolicy());
        
        executor.prestartAllCoreThreads();
        System.out.println("MailServiceProvider : Running...");
    }
    
    public void sendMail(Mailable mailable){
        blockingQueue.offer(mailable);
    }
    
    public Properties getProperties(){
        return properties;
    }
    
    public Authenticator getAuthenticator(){
        return authenticator;
    }
    
    public void stop(){
        if (executor != null) {
            executor.shutdown();
        }
    }
}
