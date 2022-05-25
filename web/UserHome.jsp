<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.jobportal.project.Job.Bean.Job"%>
<%@page import="com.jobportal.project.Job.dao.JobDao"%>
<%@page import="com.jobportal.project.Job.Bean.TotalApplication"%>
<%@page import="com.jobportal.project.Company.dao.CompanyDao"%>
<%@page import="com.jobportal.project.Company.Bean.Company"%>
<%@page import="com.jobportal.project.Employee.dao.EmployeeDao"%>
<%@page import="com.jobportal.project.Employee.Bean.Employee"%>
<!DOCTYPE html>
<html>

    <head>
        <title>User: Home</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="css/output.js"></script>
    </head>

    <body class="bg-slate-600">
        <div class="... ">
            <nav class="bg-gray-800 fixed mt-0 w-full z-10 top-0">
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

                                </div>
                            </div>
                        </div>
                        <div
                            class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
                            <div class="hidden relative mr-3 md:mr-0 md:block">
                                <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                    <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20"
                                         xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                          clip-rule="evenodd"></path>
                                    </svg>
                                </div>
                                <input type="text" id="email-adress-icon"
                                       class="block p-2 pl-10 w-full text-gray-900 bg-gray-50 rounded-lg border border-gray-300 sm:text-sm focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                       placeholder="Search..." />
                            </div>


                            <div class="ml-3 relative">
                                <a href="UserProfile.jsp">
                                    <div>
                                        <button type="button"
                                                class="bg-gray-800 flex text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white"
                                                id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                                            <span class="sr-only">Open user menu</span>
                                            <img class="h-8 w-8 rounded-full"
                                                 src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=forma"
                                                 alt="" />
                                        </button>
                                    </div>
                                </a>

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

                                    <a href="#"
                                       class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Jobs</a>


                                </div>
                            </div>
                        </div>
                        <div
                            class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
                            <div class="hidden relative mr-3 md:mr-0 md:block">
                                <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                    <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20"
                                         xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                          clip-rule="evenodd"></path>
                                    </svg>
                                </div>
                                <input type="text" id="email-adress-icon"
                                       class="block p-2 pl-10 w-full text-gray-900 bg-gray-50 rounded-lg border border-gray-300 sm:text-sm focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                       placeholder="Search..." />
                            </div>


                            <div class="ml-3 relative">
                                <div>
                                    <button type="button"
                                            class="bg-gray-800 flex text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white"
                                            id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                                        <span class="sr-only">Open user menu</span>
                                        <img class="h-8 w-8 rounded-full"
                                             src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=forma"
                                             alt="" />
                                    </button>
                                </div>
                                <div class=" hidden origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none"
                                     role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button"
                                     tabindex="-1">

                                    <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1"
                                       id="user-menu-item-0">Your Profile</a>
                                    <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1"
                                       id="user-menu-item-1">Settings</a>
                                    <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1"
                                       id="user-menu-item-2">Sign out</a>
                                </div>
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

            <div class=" ... h-8/9 sm:flex justify-center hidden ">
                <div class="border-solid border-2 m-1 bg-white rounded-lg mt-4 w-fit h-min">
                    <div class="... m-1 mt-10">
                        <div class="flex justify-center">
                            <img src="assets/img/user/profile.png" alt="" class="w-20" />
                        </div>
                        <div class="text-center my-2 mx-5">
                            <%
                                String id = (String) session.getAttribute("ID");
                                Employee e = EmployeeDao.getEmployeeById(id);
                            %>
                            <h1 class="text-2xl font-bold"><%=e.getUfname()%> <%=e.getUlname()%></h1>
                            <h2 class="text-sm">Unemployed | Student</h2>
                            <table class="table mb-0 mt-4">
                                <tbody>
                                    <tr id="progress-card" class="" style="display: none;">
                                        <td class="px-1 text-muted"><span class="icon-user-warning rm-2"></span></td>
                                        <td class="px-1 text-muted text-xs">Profile Completion<span
                                                class="float-right">:</span></td>
                                        <td width="40%" class="px-1">
                                            <div class="text-muted">
                                                <div class="progress">
                                                    <div title="15%" class="progress-bar bg-danger" role="progressbar"
                                                         style="width: 15%" aria-valuenow="15" aria-valuemin="0"
                                                         aria-valuemax="100">
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>


                    </div>
                </div>
            </div>
            <div class=" ...  col-span-4">
                <div class="m-1 border-2 border-white rounded-lg mt-5 w-fit p-2">
                    <div>
                        <div class="flex justify-center text-3xl strong font-bold m-5 text-white">Recently added job</div>
                        <div class="leftmar m-1 grid grid-cols-2">
                            <%
                                List<Job> J = (List<Job>) request.getAttribute("JobList");
                                int count = 0;
                                if (!J.isEmpty()) {
                                    for (Job j : J) {
                                        count++;
                                        if (count == 3) {
                                            break;
                                        }

                                        Company c = CompanyDao.getCompanyById(j.getCompany());
                            %>
                            <div class="flex font-sans bg-white m-1">
                                <div class="flex-none w-48 relative">
                                    <img src="assets/img/company/download.png" alt=""
                                         class="absolute inset-0 h-full object-cover" />
                                </div>
                                <form class="flex-auto p-6" action="JobInfo.jsp" method="post">
                                    <input type="number" name="id" hidden value="<%=j.getJid()%>">
                                    <div class="flex flex-wrap">
                                        <h1 class="flex-auto text-lg font-semibold text-slate-900">
                                            <%=j.getSkills()%>
                                        </h1>

                                        <div class="w-full flex-none text-sm font-medium text-slate-700 mt-2">
                                            <%=c.getCname()%>
                                        </div>
                                    </div>
                                    <div class="flex m-3"></div>
                                    <div class="flex space-x-4 mb-6 text-sm font-medium">
                                        <div class="flex-auto flex space-x-4">

                                            <button class="h-10 px-6 font-semibold rounded-md bg-black text-white "
                                                    type="submit">
                                                Apply Now
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <%
                                }
                            } else {
                            %>
                            <div class="flex justify-center text-2xl strong m-5 text-white">No Active Jobs</div>
                            <%
                                }
                            %>
                        </div>
                    </div>

                </div>
                <div class="m-1 border-2 border-white rounded-lg mt-5 w-fit p-2">
                    <div>
                        <div class="flex justify-center text-3xl strong font-bold m-5 text-white">Applied Jobs</div>
                        <div class="leftmar m-1 grid grid-cols-2">
                            <%
                                List<TotalApplication> A = (List<TotalApplication>) request.getAttribute("AppliedList");
                                if (!A.isEmpty()) {
                                    for (TotalApplication a : A) {
                                        Job j = JobDao.getJobById(a.getJid());
                                        Company c = CompanyDao.getCompanyById(j.getCompany());


                            %>
                            <div class="flex font-sans bg-white m-1">
                                <div class="flex-none w-48 relative">
                                    <img src="assets/img/company/download.png" alt=""
                                         class="absolute inset-0 h-full object-cover" />
                                </div>
                                <form class="flex-auto p-6" action="JobInfo.jsp" method="post">
                                    <div class="flex flex-wrap">
                                        <h1 class="flex-auto text-lg font-semibold text-slate-900">
                                            <%=c.getCname()%>
                                        </h1>
                                        <div class="w-full flex-none font-medium text-slate-700 mt-2">
                                            <%=j.getSkills()%>
                                        </div>
                                    </div>
                                    <% if (a.getApproved().equals("YES")) {%>
                                    <div class="flex space-x-4 mt-2 mb-6 text-sm font-medium">
                                        <div class="flex-auto flex space-x-4 w-5">
                                            Accepted! Waiting for Interview at <%=j.getIplace()%>
                                        </div>
                                    </div>
                                    <%}%>
                                </form>
                            </div>

                            <%
                                }
                            } else {
                            %>
                            <div class="flex justify-center text-2xl strong m-5 text-white">No Applied Jobs</div>
                            <%
                                }
                            %>

                        </div>
                    </div>

                </div>


            </div>
        </div>
    </body>

</html>