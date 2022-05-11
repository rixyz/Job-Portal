<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.jobportal.project.Job.Bean.Job"%>
<%@page import="com.jobportal.project.Job.dao.JobDao"%>
<%@page import="com.jobportal.project.Job.Bean.TotalApplication"%>
<%@page import="com.jobportal.project.Employee.Bean.Employee"%>
<%@page import="com.jobportal.project.Employee.dao.EmployeeDao"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Company: Application List</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="css/output.js"></script>
        <!-- <link href="css/output.css" rel="stylesheet" /> -->
    </head>

    <body class="bg-slate-600">
        <div class="...">
            <nav class="bg-gray-800 mt-0 w-full z-10 top-0">
                <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
                    <div class="relative flex items-center justify-between h-16">
                        <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
                            <button type="button"
                                    class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white"
                                    aria-controls="mobile-menu" aria-expanded="false">
                                <span class="sr-only">Open main menu</span>

                                <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none"
                                     viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M4 6h16M4 12h16M4 18h16" />
                                </svg>

                                <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none"
                                     viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M6 18L18 6M6 6l12 12" />
                                </svg>
                            </button>
                        </div>
                        <div class="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
                            <div class="flex-shrink-0 flex items-center">
                                <img class="block lg:hidden h-8 w-auto"
                                     src="assets/img/company/business-company-logo-C561B48365-seeklogo.com.png" alt="Logo" />
                                <img class="hidden lg:block h-8 w-auto"
                                     src="assets/img/company/business-company-logo-C561B48365-seeklogo.com.png" alt="Logo" />
                            </div>
                            <div class="hidden sm:block sm:ml-6">
                                <div class="flex space-x-4">
                                    <a href="#" class="bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium"
                                       aria-current="page">Home</a>

                                    <a href="Jobs"
                                       class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Jobs</a>

                                    <a href="#"
                                       class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">About</a>

                                    <a href="#"
                                       class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Contact</a>
                                </div>
                            </div>
                        </div>

                        <div class="ml-3 relative">
                            <div class="flex space-x-4">
                                <a href="LogOut"
                                   class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Log
                                    Out</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sm:hidden" id="mobile-menu">
                    <div class="px-2 pt-2 pb-3 space-y-1">
                        <a href="#" class="bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium"
                           aria-current="page">Home</a>

                        <a href="#"
                           class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Jobs</a>
                    </div>
                </div>
            </nav>
        </div>
        <div class="grid grid-cols-6">
            <div class="... h-8/9 sm:flex justify-center hidden">
                <div class="border-solid border-2 m-1 bg-white rounded-lg mt-4 w-fit h-min">
                    <div class="... m-1 mt-10">
                        <div class="text-center my-2 mx-5">
                            <h1 class="text-2xl font-bold m-2">Employer Portal</h1>
                            <h2 class="text-sm m-2"><a href="AddJob.jsp">Add Job</a></h2>
                            <h2 class="text-sm m-2"><a href="CompanyRemoveJob"> Remove Job</a></h2>
                            <h2 class="text-sm m-2 mb-5"><a href="CompanyApplicationList">View Application Job</a></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="... col-span-4">
                <div class=" ...  col-span-4">
                    <div class="m-1 border-2 border-white rounded-lg mt-5 w-fit p-2">
                        <div>
                            <div class="flex justify-center text-3xl strong font-bold m-5 text-white">Application List</div>
                            <div class="leftmar m-1 flex flex-wrap">
                                <%
                   
                                    List<TotalApplication> A = (List<TotalApplication>) request.getAttribute("AppliedList");    
                                    if(!A.isEmpty()){
                                        for (TotalApplication a : A) {
                                            if(!(a.getApproved().equals("WAIT"))) continue;
                                            Job j=JobDao.getJobById(a.getJid());
                                            Employee e=EmployeeDao.getEmployeeById(a.getEid());                                        
                                     
                                %>
                                <div class="flex font-sans bg-white m-1">
                                    <div class="flex-auto p-6">
                                        <h1 class="flex-auto text-lg font-semibold text-slate-900 ">
                                            <%=j.getSkills()%>                                                
                                        </h1>
                                        <div class="w-full flex-none font-medium text-slate-700 mt-2">
                                            <table>
                                                <tr>
                                                    <td>Name</td>
                                                    <td>:</td>
                                                    <td><%=e.getUfname()%> <%=e.getUlname()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Gender</td>
                                                    <td>:</td>
                                                    <td><%=e.getGen()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Experience</td>
                                                    <td>:</td>
                                                    <td><%=e.getExp()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Skills</td>
                                                    <td>:</td>
                                                    <td><%=e.getSkill()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Number</td>
                                                    <td>:</td>
                                                    <td><%=e.getNumber()%></td>
                                                </tr>
                                            </table>

                                        </div>
                                        <div class="flex space-x-4 mt-2 text-sm font-medium">
                                            <div class="flex-auto flex space-x-4">
                                                <form action="UpdateApplication" method="post">
                                                    <input type="text" name="eid" value="<%=e.getID()%>" hidden>
                                                    <input type="text" name="jid" value="<%=j.getJid()%>" hidden>
                                                    <input type="text" name="approve" value="YES" hidden>
                                                    <button class="h-10 px-6 font-semibold rounded-md bg-green-600 text-white" type="submit">
                                                        Accept
                                                    </button>
                                                </form>
                                                <form action="UpdateApplication" method="post">
                                                    <input type="text" name="eid" value="<%=e.getID()%>" hidden>
                                                    <input type="text" name="jid" value="<%=j.getJid()%>" hidden>
                                                    <input type="text" name="approve" value="NO" hidden>
                                                    <button class="h-10 px-6 font-semibold rounded-md bg-red-600 text-white" type="submit">
                                                        Decline
                                                    </button>
                                                </form>
                                            </div>
                                        </div>   
                                    </div>


                                </div>
                                <%
                                }} else {
                                %>
                                <div class="flex justify-center text-2xl strong m-5 text-white">No Active Job Application</div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>