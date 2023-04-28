package JobPortal.Controller;

import JobPortal.Model.Sessions;
import JobPortal.Service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Home", value = "/home")
public class HomeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        try {
            if (session == null || session.getAttribute("Type") == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                String type = (String) session.getAttribute("Type");
                //Check type of account and redirect to the Page
                switch (type) {
                    case "Admin":
                        List<Sessions> S = AdminService.getActiveSessions();
                        request.setAttribute("Sessions", S);
                        request.getRequestDispatcher("/pages/Admin/AdminHome.jsp").forward(request, response);
                        break;
                    case "Employee":
                        request.getRequestDispatcher("/pages/Employee/UserHome.jsp").forward(request, response);
                        break;
                    case "Company":
                        request.getRequestDispatcher("/pages/Company/CompanyHome.jsp").forward(request, response);
                        break;
                    default:
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        break;
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
