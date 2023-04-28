package JobPortal.Controller.Admin;

import JobPortal.Model.Company;
import JobPortal.Service.CompanyService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "Admin: Company", value = "/admin/company/*")
public class AdminCompanyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Type") != "Admin") {
            response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        String[] pathInfo = request.getPathInfo() == null ? new String[0] : request.getPathInfo().toLowerCase().split("/");
        String page = pathInfo.length < 2 ? "" : pathInfo[1];
        System.out.println("Goto:" + page + " " + request.getPathInfo());
        switch (page) {
            case "delete": {
                try (PrintWriter out = response.getWriter()) {
                    String ComID = pathInfo[2];
                    //Call deleteCompany()
                    CompanyService c = new CompanyService();
                    if (c.deleteCompany(ComID) == 1) {
                        out.println("<script>alert('Delete Successfully.')</script>");
                    } else {
                        out.println("<script>alert('Delete failed')</script>");
                    }
                    response.setHeader("Refresh", "1;" + request.getContextPath() + "/admin/company");
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            }
            case "creditadd": {
                try (PrintWriter out = response.getWriter()) {
                    String ComID = pathInfo[2];
                    //Call deleteCompany()
                    CompanyService c = new CompanyService();
                    if (c.addCredit(ComID) == 1) {
                        out.println("<script>alert('Added credit.')</script>");
                    } else {
                        out.println("<script>alert('Failed to add credit')</script>");
                    }
                    response.setHeader("Refresh", "2;" + request.getContextPath() + "/admin/company");
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            }
            default:
                try {
                    //Call list() from CompanyService and return the value in c
                    List<Company> c = CompanyService.getCompanyList();
                    //Store c in request to be passed
                    request.setAttribute("CompanyList", c);
                    //Redirect the page passing request and response
                    request.getRequestDispatcher("/pages/Admin/AdminCompany.jsp").forward(request, response);
                } catch (Exception ex) {
                    ex.printStackTrace();

                }
        }
    }
}
