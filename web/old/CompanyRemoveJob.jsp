<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.jobportal.project.Job.Bean.Job"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Company: Remove Job</title>
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
                            <h2 class="text-sm m-2">Remove Job</h2>
                            <h2 class="text-sm m-2 mb-5"><a href="CompanyApplicationList">View Application Job</a></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="... col-span-4">
                <div class=" ...  col-span-4">
                    <div class="m-1 border-2 border-white rounded-lg mt-5 w-fit p-2">
                        <div>
                            <div class="flex justify-center text-3xl strong font-bold m-5 text-white">Jobs List</div>
                            <div class="leftmar m-1 grid ">
                                <%
                                    List<Job> J = (List<Job>) request.getAttribute("JobList");
                                    System.out.println(J);
                                    if(!J.isEmpty()){
                                        for (Job j : J) {
                                %>
                                <div class="flex font-sans bg-white m-1">
                                    <div class="flex-none w-48 relative">
                                        <img src="assets/img/company/download.png" alt=""
                                             class="absolute inset-0 h-full object-cover" />
                                    </div>
                                    <form class="flex-auto p-6" action="RemoveJob" method="post">
                                        <input type="number" name="jid" hidden value="<%=j.getJid()%>">
                                        <div class="flex flex-wrap">
                                            <h1 class="flex-auto text-lg font-semibold text-slate-900">
                                                <%=j.getSkills()%>
                                            </h1>

                                            <div class="w-full flex-none text-sm font-medium text-slate-700 mt-2">
                                                <table>
                                                    <tr>
                                                        <td>Location</td>
                                                        <td>:</td>
                                                        <td><%=j.getLocation()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Vacancy</td>
                                                        <td>:</td>
                                                        <td><%=j.getVacancy()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Salary</td>
                                                        <td>:</td>
                                                        <td><%=j.getSalary()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Deadline</td>
                                                        <td>:</td>
                                                        <td><%=j.getDeadline()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Interview Location</td>
                                                        <td>:</td>
                                                        <td><%=j.getIplace()%></td>
                                                    </tr>
                                                </table>

                                            </div>
                                        </div>
                                        <div class="flex space-x-4 mb-6 text-sm font-medium">
                                            <div class="flex-auto flex space-x-4">

                                                <button class="h-10 px-6 font-semibold rounded-md bg-black text-white "
                                                        type="submit">
                                                    Delete
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <%
                                }} else {
                                %>
                                <div class="flex justify-center text-2xl strong m-5 text-white">No Active Jobs</div>
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