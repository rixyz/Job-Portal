package JobPortal.Controller.Company;

import JobPortal.Mail.SendMail;
import JobPortal.Model.Employee;
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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "Company: Application", value = "/company/application/*")
public class CompanyApplicationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Type") != "Company") {
            response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        String[] pathInfo = request.getPathInfo() == null ? new String[0] : request.getPathInfo().toLowerCase().split("/");
        String page = pathInfo.length < 2 ? "" : pathInfo[1];
        System.out.println("Goto:" + page + " " + request.getPathInfo());
        String ComID = (String) session.getAttribute("ID");
        PrintWriter out = response.getWriter();
        if (page.equals("update")) {
            JobService job = new JobService();
            String jid = request.getParameter("jid");
            String eid = request.getParameter("eid");
            String time = LocalDateTime.parse(request.getParameter("datetime"), DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm")).format(DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm"));
            String approve = request.getParameter("approve");


            if (job.updateApprove(jid, eid, approve) == 1) {
                Employee e = EmployeeService.getEmployeeById(eid);
                Job j = JobService.getJobById(jid);
                String msg;
                if (approve.equals("YES"))
                    msg = "<h1>" + j.getCompany() + "<h2><p>Your application for the job <b>" + j.getTitle() + "</b> has been accepted</p><p>Interview place:" + j.getIplace() + "<br><p>Time: " + time + "</p>";
                else
                    msg = j.getCompany() + ": Your application for for the job " + j.getTitle() + "was declined";
                new SendMail(e.getUemail(), "Job Application", msg);

            } else
                out.println("<script>alert('Approve failed')</script>");

            response.setHeader("Refresh", "1;" + request.getContextPath() + "/company/application");
        } else {
            {
//                    Store variable applied in request to be passed
                List<JobApplication> applied = JobService.getCompanyApplications(ComID);
                request.setAttribute("AppliedList", applied);
//                    Redirect the page passing request and response
                request.getRequestDispatcher("/pages/Company/CompanyApplicationList.jsp").forward(request, response);
            }
        }
    }
}



