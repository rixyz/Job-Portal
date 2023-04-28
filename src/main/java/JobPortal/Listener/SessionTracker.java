package JobPortal.Listener;

import JobPortal.Service.AdminService;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

public class SessionTracker implements HttpSessionListener {

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        AdminService.invalidateSession((String) se.getSession().getAttribute("ID"), (String) se.getSession().getAttribute("Type"));
    }
}

