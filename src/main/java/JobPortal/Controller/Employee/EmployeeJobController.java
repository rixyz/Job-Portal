package JobPortal.Controller.Employee;

import JobPortal.Model.Job;
import JobPortal.Model.JobApplication;
import JobPortal.Service.EmployeeService;
import JobPortal.Service.JobService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "Employee: Job", value = "/employee/jobs/*")
public class EmployeeJobController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Type") != "Employee") {
            response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        String[] pathInfo = request.getPathInfo() == null ? new String[0] : request.getPathInfo().toLowerCase().split("/");
        String page = pathInfo.length < 2 ? "" : pathInfo[1];
        System.out.println("Goto:" + page + " " + request.getPathInfo());
        String EmpID = (String) session.getAttribute("ID");
        PrintWriter out = response.getWriter();
        EmployeeService dao = new EmployeeService();
        switch (page) {
            case "apply": {
                String Jid = pathInfo[2];
                JobService j = new JobService();
                switch (j.applyToJob(Jid, EmpID)) {
                    case 1:
                        out.println("<script>alert('Applied To Job  Successfully.')</script>");
                        break;
                    case 2:
                        out.println("<script>alert('You have already applied')</script>");
                        break;
                    default:
                        out.println("<script>alert('Failed to Apply!! Try Again..')</script>");
                        break;
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/employee/jobs");
                break;

            }
            case "info": {
                Job j = JobService.getJobById(pathInfo[2]);
                request.setAttribute("job", j);
                request.getRequestDispatcher("/pages/Employee/JobInfo.jsp").forward(request, response);

                break;

            }
            case "recommend": {
                String email = request.getParameter("email");
                String Jid = request.getParameter("jid");

                switch (dao.recommend(Jid, EmpID, email)) {
                    case 1:
                        out.println("<script>alert('Successfully Recommended.')</script>");
                        break;
                    case 2:
                        out.println("<script>alert('Already recommended')</script>");
                        break;
                    default:
                        out.println("<script>alert('Failed to recommend!! Try Again..')</script>");
                        break;
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/employee/jobs/info/" + Jid);

                break;

            }
            case "unapply": {
                JobService j = new JobService();
                String Jid = pathInfo[2];

                if (j.unapplyToJob(Jid, EmpID) == 1) {
                    out.println("<script>alert('Unapplied Successfully.')</script>");
                } else {
                    out.println("<script>alert('Failed to Unapply')</script>");
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/employee/jobs/applied");

                break;

            }
            case "applied": {
                List<JobApplication> applied = JobService.getUserApplications(EmpID);
                request.setAttribute("AppliedList", applied);
                request.getRequestDispatcher("/pages/Employee/UserAppliedJobs.jsp").forward(request, response);

                break;

            }
            default: {
                try {
                    String spageid = Objects.requireNonNullElse(request.getParameter("paging"), "1");
                    String search = Objects.requireNonNullElse(request.getParameter("search"), "");
                    String sort = Objects.requireNonNullElse(request.getParameter("sort"), "");

                    if (sort.equalsIgnoreCase("Name")) sort = "Title";
                    else if (sort.equalsIgnoreCase("Salary")) sort = "Salary DESC";
                    else if (sort.equalsIgnoreCase("Location")) sort = "Location";
                    else sort = "Boosted Desc";

                    int pageid = Integer.parseInt(spageid);
                    int total = 7;
                    if (pageid != 1) {
                        pageid = pageid - 1;
                        pageid = pageid * total + 1;
                    }
                    List<Job> jobs = JobService.getJobList(pageid, total, search, sort);

                    request.setAttribute("JobList", jobs);
                    request.getRequestDispatcher("/pages/Employee/UserJobsList.jsp").forward(request, response);
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
                break;
            }
        }
    }
}

