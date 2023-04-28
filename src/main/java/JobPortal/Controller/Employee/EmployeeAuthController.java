package JobPortal.Controller.Employee;

import JobPortal.Hashing.HashingPassword;
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

@WebServlet(name = "Employee: Auth", value = "/employee/auth/*")
public class EmployeeAuthController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String[] pathInfo = request.getPathInfo() == null ? new String[0] : request.getPathInfo().toLowerCase().split("/");
        String page = pathInfo.length < 2 ? "" : pathInfo[1];
        System.out.println("Goto:" + page + " " + request.getPathInfo());
        PrintWriter out = response.getWriter();
        EmployeeService dao = new EmployeeService();
        Employee employee = new Employee();
        switch (page) {
            case "register": {
                employee.setUemail(request.getParameter("email"));
                employee.setUfname(request.getParameter("firstName"));
                employee.setUlname(request.getParameter("lastName"));
                employee.setUserName(request.getParameter("userName"));
                employee.setPassword(HashingPassword.hashPassword(request.getParameter("password")));
                employee.setAbout(request.getParameter("about"));
                employee.setNumber(request.getParameter("phone"));
                //Call register()
                if (dao.register(employee) == 1) {
                    out.println("<script>alert('User Registered  Successfully.')</script>");
                } else {
                    out.println("<script>alert('Registration failed!! Try Again')</script>");
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/employee/auth");
                break;

            }
            case "login": {
                HttpSession session = request.getSession();
                String email = request.getParameter("email");
                String pass = HashingPassword.hashPassword(request.getParameter("password"));
                if (!dao.login(email, pass, session)) {
                    session.invalidate();
                    out.println("<script>alert('Login fail.')</script>");
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
                break;


            }
            case "logout": {
                HttpSession session = request.getSession();
                session.invalidate();
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
                break;

            }
            case "forgot": {
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String pass = HashingPassword.hashPassword(request.getParameter("password"));
                //Call forgetPass and return value in status
                int status = dao.forgetPass(email, phone, pass);
                //Check status code
                if (status > 0) {
                    out.println("<script>alert('Password changed successfully.')</script>");
                } else {
                    out.println("<script>alert('Failed to change Password. Check and resubmit')</script>");
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/employee/auth");
                break;

            }
            default: {
                request.getRequestDispatcher("/pages/Employee/UserLogin.jsp").forward(request, response);
            }
        }
    }
}

