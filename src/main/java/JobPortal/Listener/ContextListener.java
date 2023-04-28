package JobPortal.Listener;

import JobPortal.Service.AdminService;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        System.out.println("======================================");
        System.out.println("Shutting down");
        System.out.println("======================================");
    }

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        System.out.println("======================================");
        System.out.println("Turning on");
        System.out.println("======================================");
        AdminService.clearSession();
    }
}