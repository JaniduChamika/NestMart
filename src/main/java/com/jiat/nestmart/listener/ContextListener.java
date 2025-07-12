package com.jiat.nestmart.listener;


import com.jiat.nestmart.dao.SiteSettingDao;
import com.jiat.nestmart.entity.SiteSetting;
import com.jiat.nestmart.provider.MailServiceProvider;
import com.jiat.nestmart.util.BSUtil;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 *
 * @author Achintha
 */
@WebListener
public class ContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        context.setAttribute("base_url", context.getContextPath() + "/");
        SiteSetting currency = new SiteSettingDao().getSettingsByName("default_currency");
        context.setAttribute("currency", currency.getValue());
        context.setAttribute("BS", new BSUtil(context));
        MailServiceProvider.getInstance().start();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        MailServiceProvider.getInstance().stop();
    }

}
