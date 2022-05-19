<!DOCTYPE html>
<html>

    <head>
        <title>Forget Password</title>
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
                                aria-controls="mobile-menu" aria-expanded="false">
                            <span class="sr-only">Open main menu</span>

                            <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                 stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M4 6h16M4 12h16M4 18h16" />
                            </svg>

                            <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                 stroke="currentColor" aria-hidden="true">
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

                                <a href="index.jsp"
                                   class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium ">User Portal</a>

                                <a href="CompanyLogin.jsp"
                                   class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Company
                                    Portal</a>

                                <a href="#"
                                   class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Contact
                                    Us</a>

                            </div>
                        </div>
                    </div>
                    <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">

                        <div class="hidden origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none"
                             role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" tabindex="-1">

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
    <div class="bg-sky-300 h-screen grid place-items-center">
        <div class="bg-opacity-25 bg-white h-min">
            <div class="border-2 rounded-md px-8 pt-6 pb-8 flex flex-col m-10">
                <div class="grid place-content-center m-1 mb-3">
                    <h1 class="text-2xl font-bold">Forgot Password</h1>
                </div>
                <form action="ForgotPassword" method="post">
                    <div class="mb-4">
                        <label class="block text-grey-darker text-sm font-bold mb-2" for="email">
                            Email
                        </label>
                        <input name="email"
                               class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" id="email"
                               type="email" placeholder="Email" required>
                    </div>
                    <div class="mb-6">
                        <label class="block text-grey-darker text-sm font-bold mb-2" for="phone">
                            Phone
                        </label>
                        <input name="phone"
                               class="shadow appearance-none border border-red rounded w-full py-2 px-3 text-grey-darker mb-3"
                               id="phone" type="tel " placeholder="XXX-XXX-XXXX" required>
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
                    </div>
                    <div class="flex items-center justify-between">
                        <input class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
                               type="submit" value="Proceed" onclick="return Validate()" >
                    </div>
                </form>
            </div>
        </div>

    </div>



</body>

</html>