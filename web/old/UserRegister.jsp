<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%  
    System.out.println(session);
        if (null == session.getAttribute("Type")) {
            System.out.println("No session found");
        } else {
            request.getRequestDispatcher("Home").forward(request, response);
    }
%>
<!DOCTYPE html>
<html>

    <head>
        <title>User Register</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="css/output.js"></script>
        <script src="js/validate.js"></script>
    </head>

    <body>
        <nav class="bg-gray-800 mt-0 fixed w-full z-10 top-0">
            <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
                <div class="relative flex items-center justify-between h-16">
                    <div class="absolute inset-y-0 left-0 flex items-center sm:hidden"> 
                        <button type="button"
                                class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white"
                                aria-controls="mobile-menu" aria-exp_in_yearsanded="false">
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
                            <div class="flex space-x-4"> <a href="#"
                                                            class="bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium"
                                                            aria-current="page">User Portal</a> <a href="CompanyLogin.jsp"
                                                            class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Company
                                    Portal</a> <a href="#"
                                              class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Contact
                                    Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="sm:hidden" id="mobile-menu">
            <div class="px-2 pt-2 pb-3 space-y-1"> 
                <a href="#"
                   class="bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium"
                   aria-current="page">User Portal</a> <a href="CompanyLogin.jsp"
                   class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Company
                    Portal</a>
                <a href="#"
                   class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Contact
                    Us</a>
            </div>
        </div>
    </nav>
    <div class="bg-sky-300 h-max grid place-items-center">
        <div class="bg-opacity-25 bg-white h-min">
            <div class="border-2 rounded-md px-8 pt-6 pb-8 flex flex-col m-10">
                <div class="grid place-content-center m-1 mb-3">
                    <h1 class="text-2xl font-bold">User Register</h1>
                </div>
                <form action="UserRegister" method="post">
                    <div class="flex gap-5">
                        <div class="flex flex-col mb-2">
                            <label class="block text-grey-darker text-sm font-bold" for="firstName">
                                First Name
                            </label>
                            <input name="firstName"
                                   class="shadow appearance-none border rounded py-2 px-3 text-grey-darker"
                                   id="firstName" type="text" placeholder="First" pattern="[a-zA-Z]+"
                                   title="Please enter Alphabets." required>
                        </div>
                        <div class="flex flex-col">
                            <label class="block text-grey-darker text-sm font-bold" for="lastName">
                                Last Name
                            </label>
                            <input name="lastName"
                                   class="shadow appearance-none border rounded py-2 px-3 text-grey-darker"
                                   id="lastName" type="text" placeholder="Last" pattern="[a-zA-Z]+"
                                   title="Please enter Alphabets" required>
                        </div>
                    </div>
                    <div class="mb-6">
                        <label class="block text-grey-darker text-sm font-bold mb-2" for="email">
                            Email
                        </label>
                        <input name="email"
                               class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker mb-2"
                               id="email" type="email" placeholder="Email" required>

                        <label class="block text-grey-darker text-sm font-bold mb-2" for="phone">
                            Phone
                        </label>
                        <input name="phone"
                               class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker mb-2"
                               id="phone" type="tel" placeholder="XXX-XXX-XXXX" required pattern="^[0-9]{7,10}" title="Enter Valid phone number">

                        <label class="block text-grey-darker text-sm font-bold mb-2" for="userName">
                            Username
                        </label>
                        <input name="userName"
                               class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker mb-2"
                               id="userName" type="text" placeholder="Username" required pattern=".{3,45}" title="3-45 letters">

                        <label class="block text-grey-darker text-sm font-bold mb-2" for="password">
                            Password
                        </label>
                        <input name="password"
                               class="shadow appearance-none border border-red rounded w-full py-2 px-3 text-grey-darker mb-3"
                               id="password" type="password" placeholder="********" pattern=".{8,45}"
                               title="8-45 letters" required>

                        <label class="block text-grey-darker text-sm font-bold mb-2" for="rep-password">
                            Repeat Password
                        </label>
                        <input name="rep-password"
                               class="shadow appearance-none border border-red rounded w-full py-2 px-3 text-grey-darker mb-3"
                               id="rep-password" type="password" placeholder="********" required>
                        <div>
                            <label for="gender" class="text-grey-darker text-sm font-bold mb-2">Gender: </label>
                            <input name="gender" type="radio" class="ml-3 mb-2" value="Male"> Male
                            <input name="gender" type="radio" class="ml-5 mb-2" value="Female"> Female
                        </div>
                        <label for="exp_in_years" class="text-grey-darker text-sm font-bold mb-2">Experience:
                        </label>
                        <input name="exp_in_years" type="number" min="0"
                               class="shadow appearance-none border border-red w-1/5 rounded text-grey-darker mb-3">
                        <div class="mb-3">
                            <label class="block text-grey-darker text-sm font-bold mb-2">Preferred Industry</label>
                            <select multiple name="keySkills" id="keySkills" required
                                    class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                                <option value="Devops">Devops</option>
                                <option value="Trainer">Trainer</option>
                                <option value="Developer">Developer</option>
                                <option value="Software Testing">Software Testing</option>
                                <option value="UI/UX Designer">UI/Ux Designer</option>
                                <option value="FullStack Developer">FullStack Developer</option>
                                <option value="DB Admin">DB Admin</option>
                                <option value="Animator">Animator</option>
                                <option value="Other">Other</option>
                            </select>
                            <div
                                class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                                <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg"
                                     viewBox="0 0 20 20">
                                <path
                                    d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
                                </svg>
                            </div>
                        </div>
                        <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms &
                                Privacy</a>.</p>
                    </div>
                    <div class="flex items-center justify-between">
                        <input class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
                               type="submit" value="Sign Up" onclick="return Validate()">
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>