package JobPortal.Controller.Company;

import JobPortal.Model.Job;
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

@WebServlet(name = "Company: Job", value = "/company/job/*")
public class CompanyJobController extends HttpServlet {
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
        JobService jobService = new JobService();
        PrintWriter out = response.getWriter();
        switch (page) {
            case "add": {
                Job job = new Job();
                job.setLocation(request.getParameter("loc"));
                job.setVacancy(Integer.parseInt(request.getParameter("vac")));
                job.setIplace(request.getParameter("ivl"));
                job.setDeadline(request.getParameter("deadline"));
                job.setSalary(request.getParameter("sal"));
                job.setTitle(request.getParameter("title"));
                job.setAbout(request.getParameter("about"));
                job.setRequirement(request.getParameter("requirement"));
                job.setType(request.getParameter("type"));
                job.setBoosted(Integer.parseInt(request.getParameter("boosted")));
                job.setComID((String) session.getAttribute("ID"));
                //Call update() to add new job
                if (jobService.addJob(job) == 1) {
                    out.println("<script>alert('Job Added Successfully.')</script>");
                } else {
                    out.println("<script>alert('Job Post Failed!! Try Again')</script>");
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/company/job/addjob");
                break;

            }
            case "remove": {
                String jid = pathInfo[2];
                if (jobService.deleteJob(jid) == 1) {
                    out.println("<script>alert('Delete Successfully.')</script>");
                } else {
                    out.println("<script>alert('Delete failed')</script>");
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/company/job");
                break;

            }
            case "addjob": {
                request.getRequestDispatcher("/pages/Company/CompanyAddJob.jsp").forward(request, response);
                break;

            }
            default:
                try {
                    List<Job> jobs = JobService.getJobList(ComID);
                    //Store jobs in request to be passed
                    request.setAttribute("JobList", jobs);
                    //Redirect the page passing request and response
                    request.getRequestDispatcher("/pages/Company/CompanyRemoveJob.jsp").forward(request, response);
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
        }
    }

}


