<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.jobportal.project.Company.Bean.Company"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Admin: Company List</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="css/output.js"></script>
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
                    </div>
                </div>
            </nav>
        </div>
        <div class="grid grid-cols-6">
            <div class="... h-8/9 sm:flex justify-center hidden">
                <div class="border-solid border-2 m-1 bg-white rounded-lg mt-4 w-fit h-min">
                    <div class="... m-1 mt-10">
                        <div class="text-center my-2 mx-5">
                            <h1 class="text-2xl font-bold m-2">Admin Portal</h1>
                            <h2 class="text-sm m-2"><a href="ListEmployees">List Employees</a></h2>
                            <h2 class="text-sm m-2"><a href="ListCompanies">List Companies</a></h2>
                            <h2 class="text-sm m-2 mb-5"><a href="ListJobs">List Jobs</a></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="... col-span-4">
                <div class="flex justify-center text-3xl strong font-bold m-5 text-white">
                    Company List
                </div>
                <div class="leftmar m-1 flex flex-wrap">
                    <div class="relative shadow-md sm:rounded-lg">
                        <!-- Initialize Company Object to display -->
                        <%
                            List<Company> C = (List<Company>) request.getAttribute("CompanyList");
                            System.out.println(C);
                            if (!C.isEmpty()) {
                        %>
                        <table class="m-3 w-full text-sm text-left text-gray-500 dark:text-gray-400">
                            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-6 py-3">
                                        ID
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Company Name
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Username
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Email
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        <span class="sr-only">Edit</span>
                                    </th>
                                </tr>
                            </thead>
                            <%
                                for (Company c : C) {
                            %>
                            <tbody>
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 dark:text-white whitespace-nowrap">
                                        <%=c.getCid()%>
                                    </th>
                                    <td class="px-6 py-4">
                                        <%=c.getCname()%>
                                    </td>
                                    <td class="px-6 py-4">
                                        <%=c.getUserName()%>
                                    </td>
                                    <td class="px-6 py-4">
                                        <%=c.getCemail()%>
                                    </td>
                                    <td class="px-6 py-4 text-right">
                                        <form method="post" action="RemoveCompany">
                                            <input type="hidden" name="cid" value=<%=c.getCid()%> /> 
                                            <a class="font-medium text-blue-600 dark:text-blue-500 hover:underline"
                                               onclick="this.parentNode.submit();">
                                                Delete</a>
                                        </form>
                                    </td>
                                </tr>
                            </tbody>
                            <%
                                }
                            } else {
                            %>
                            <div class="flex justify-center text-2xl strong m-5 text-white">No Company</div>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </body>

</html>