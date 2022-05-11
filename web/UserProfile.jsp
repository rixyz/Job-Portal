<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

    <head>
        <title>User: Profile</title>
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

                                    <a href="Home" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Home</a>

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


                            </div>
                        </div>
                    </div>


                    <div class="sm:hidden" id="mobile-menu">
                        <div class="px-2 pt-2 pb-3 space-y-1">

                            <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Home</a>

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

                                    <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Home</a>

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
                            <h1 class="text-2xl font-bold">Name</h1>
                            <h2 class="text-sm">Unemployed | Student</h2>
                            <h2 class="text-sm m-2 mb-5">Update Profile</h2>
                            <h2 class="text-sm m-2 mb-5"><a href="UserAppliedJobs">Applied Job</a></h2>
                            <h2 class="text-sm m-2 mb-5"><a href="LogOut">Logout</a></h2>
                        </div>


                    </div>
                </div>
            </div>
            <div class=" ...  col-span-4">
                <div class="flex justify-center text-3xl strong font-bold m-5 text-white">Welcome User</div>
                <div class="border-2 rounded-md px-8 pt-6 pb-8 flex flex-col m-10">
                    <div class="grid place-content-center m-1 mb-3">
                        <h1 class="text-2xl font-bold text-white">Update Profile</h1>
                    </div>
                    <form action="UserUpdated" method="post">
                        <div class="flex gap-5">
                            <div class="flex flex-col mb-2 w-half">
                                <label class="block text-grey-darker text-sm font-bold text-white" for="firstName">
                                    First Name
                                </label>
                                <input name="firstName"
                                       class="shadow appearance-none border rounded py-2 px-3 text-grey-darker"
                                       id="firstName" type="text" placeholder="First" pattern="[a-zA-Z]+"
                                       title="Please enter Alphabets." required>
                            </div>
                            <div class="flex flex-col">
                                <label class="block text-grey-darker text-sm font-bold text-white" for="lastName">
                                    Last Name
                                </label>
                                <input name="lastName"
                                       class="shadow appearance-none border rounded py-2 px-3 text-grey-darker"
                                       id="lastName" type="text" placeholder="Last" pattern="[a-zA-Z]+"
                                       title="Please enter Alphabets" required>
                            </div>
                        </div>
                        <div class="mb-6">
                            <label class="block text-grey-darker text-sm font-bold mb-2 text-white" for="email">
                                Email
                            </label>
                            <input name="email"
                                   class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker mb-2"
                                   id="email" type="email" placeholder="Email" required>
                            <label class="block text-grey-darker text-sm font-bold mb-2 text-white" for="phone">
                                Phone
                            </label>
                            <input name="phone"
                                   class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker mb-2"
                                   id="phone" type="tel" placeholder="XXX-XXX-XXXX" required>
                            <label class="block text-grey-darker text-sm font-bold mb-2 text-white" for="userName">
                                Username
                            </label>
                            <input name="userName"
                                   class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker mb-2"
                                   id="userName" type="text" placeholder="Username" required>
                            <label class="block text-grey-darker text-sm font-bold mb-2 text-white" for="passwd">
                                Password
                            </label>
                            <input name="passwd"
                                   class="shadow appearance-none border border-red rounded w-full py-2 px-3 text-grey-darker mb-3"
                                   id="passwd" type="password" placeholder="********" pattern=".{8,}"
                                   title="Please enter 8 letters" required>
                            <label class="block text-grey-darker text-sm font-bold mb-2 text-white" for="rep-password">
                                Repeat Password
                            </label> <input name="rep-password"
                                            class="shadow appearance-none border border-red rounded w-full py-2 px-3 text-grey-darker mb-3"
                                            id="rep-password" type="password" placeholder="********" pattern=".{8,}"
                                            title="Please enter 8 letters" required>
                            <div>
                                <label for="gender" class="text-grey-darker text-sm font-bold mb-2 text-white">Gender: </label>
                                <input name="gender" type="radio" class="ml-3 mb-2 text-white" value="Male"> <span class="text-white"> Male </span>
                                <input name="gender" type="radio" class="ml-5 mb-2 text-white" value="Female"> <span class="text-white"> Female </span>
                            </div>
                            <label for="exp_in_years" class="text-grey-darker text-sm font-bold mb-2 text-white">Experience:
                            </label>
                            <input name="exp_in_years" type="number" min="0"
                                   class="shadow appearance-none border border-red w-1/5 rounded text-grey-darker mb-3">
                            <div class="mb-3">
                                <label class="block text-grey-darker text-sm font-bold mb-2 text-white">Preferred Industry</label>
                                <select multiple name="keySkills" id="keySkills"
                                        class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                                    <option value='65'>Any</option>
                                    <option value='8'>Devops</option>
                                    <option value='16'>Trainer</option>
                                    <option value='17'>Developer</option>
                                    <option value='27'>Software Testing</option>
                                    <option value='30'>UI/Ux Designer</option>
                                    <option value='31'>FullStack Developer</option>
                                    <option value='32'>DB Admin</option>
                                    <option value='34'>Animator.</option>
                                    <option value='55'>Other</option>
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
                        </div>
                        <div class="flex items-center justify-between">
                            <input class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
                                   type="submit" value="Update">
                        </div>
                    </form>
                </div>

            </div>
        </div>

    </body>

</html>