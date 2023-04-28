package JobPortal.Controller.Admin;

import JobPortal.Model.Employee;
import JobPortal.Service.EmployeeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "Admin: Employee", value = "/admin/employee/*")
public class AdminEmployeeController extends HttpServlet {
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
        if (page.equals("delete")) {
            PrintWriter out = response.getWriter();
            String eid = pathInfo[2];
            EmployeeService e = new EmployeeService();
            if (e.deleteEmployee(eid) == 1) {
                out.println("<script>alert('Delete Successfully.')</script>");
            } else {
                out.println("<script>alert('Delete failed')</script>");
            }
            response.setHeader("Refresh", "1;" + request.getContextPath() + "/admin/employee");
        } else {
            //Call list() from EmployeeService and return the value in emp
            List<Employee> emp = EmployeeService.getEmployeeList();
            //Store emp in request to be passed
            request.setAttribute("EmployeeList", emp);
            //Redirect the page passing request and response
            request.getRequestDispatcher("/pages/Admin/AdminEmployees.jsp").forward(request, response);
        }
    }
}
