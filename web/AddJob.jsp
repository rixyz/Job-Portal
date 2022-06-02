<!DOCTYPE html>
<html>

<head>
    <title>Company: Add Job</title>
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
                        <h2 class="text-sm m-2"><a href="#">Add Job</a></h2>
                        <h2 class="text-sm m-2"><a href="CompanyRemoveJob"> Remove Job</a></h2>
                        <h2 class="text-sm m-2 mb-5">View Application Job</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="... col-span-4">
            <div class="grid place-items-center">
                <div class="border-2 rounded-md px-8 pt-6 pb-8 flex flex-col m-10 w-2/3">
                    <div class="grid place-content-center m-1 mb-3">
                        <h1 class="text-2xl font-bold text-white">Add Job</h1>
                    </div>
                    <form action="AddJob" method="post">
                        <div class="mb-6">
                            <label class="block text-grey-darker text-sm font-bold mb-2 text-white" for="loc">
                                Location
                            </label>
                            <input name="loc" id="loc" type="text" placeholder="Location" required pattern=".{,50}"
                                title="Max 50 letters"
                                class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker mb-2" />

                            <label class="block text-grey-darker text-sm font-bold mb-2 text-white" for="vac">
                                Vacancy
                            </label>
                            <input name="vac" id="vac" type="number" placeholder="Vacancy" required
                                class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker mb-2" />

                            <label class="block text-grey-darker text-sm font-bold mb-2 text-white" for="ivl">
                                Interview Location
                            </label>
                            <input name="ivl" id="ivl" type="text" placeholder="Interview Location" required
                                pattern=".{,45}" title="Max 45 letters"
                                class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker mb-2" />

                            <label class="block text-grey-darker text-sm font-bold mb-2 text-white" for="deadline">
                                Job Deadline
                            </label>
                            <input name="deadline" id="deadline" type="date" required
                                class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker mb-2" />

                            <label class="block text-grey-darker text-sm font-bold mb-2 text-white" for="salary">
                                Salary
                            </label>
                            <input name="sal" id="salary" type="number" placeholder="in Nepali Rupees(NRS)" required
                                pattern=".{,45}" title="Max 45 digits"
                                class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker mb-2">
                        </div>
                        <div class="mb-3">
                            <label class="block text-grey-darker text-sm font-bold mb-2 text-white">Industry</label>
                            <select name="skill" id="skill" required
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
                        <div class="flex items-center justify-between">
                            <input class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded my-5"
                                type="submit" value="Add Job" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>