<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Snippet - BBBootstrap</title>
        <link href="#" rel="stylesheet" />
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet"
            />
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
        ></script>
        <style>
            ::-webkit-scrollbar {
                width: 8px;
            }
            /* Track */
            ::-webkit-scrollbar-track {
                background: #f1f1f1;
            }

            /* Handle */
            ::-webkit-scrollbar-thumb {
                background: #888;
            }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }
            .warning {
                border: 1px solid red !important;
            }
            .green {
                background-color: green !important;
            }
        </style>
    </head>
    <body className="snippet-body">
        <div class="flex justify-center items-center bg-gray-400 min-h-screen">
            <div class="h-auto my-20 w-96 bg-white rounded-lg p-3">
                <div class="main sigin_input login_main">
                    <div class="flex justify-between mt-2">
                        <div class="flex items-center gap-2">
                            <span class="h-10 w-10 rounded-full bg-gray-200 flex justify-center items-center">
                                <i class="cursor-pointer text-green-800 fa fa-key"></i>
                            </span>
                            <p class="text-lg font-semibold">User Log in</p>
                        </div>
                        <span
                            class="h-10 w-10 border border-gray-200 flex justify-center items-center rounded-full"
                            ><i class="cursor-pointer text-green-500 text-lg fa fa-close"></i
                            ></span>
                    </div>
                    <hr class="mt-5" />
                    <form action="LogIn" method="post">
                        <div class="relative mt-9">
                            <input type="email" name="email" id="lemail" placeholder="Email" required
                                   class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"/>
                            <span class="absolute left-0 -top-7 text-gray-700">Email*</span>
                        </div>
                        <div class="relative mt-9">
                            <input  type="password" name="password" id="lpassword" placeholder="********"
                                    required
                                    class="log_in_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"/>
                            <span class="absolute left-0 -top-7 text-gray-700">Password*</span>

                        </div>

                        <div class="flex justify-between mt-4">

                            <a class="text-cyan-600 forgot" href="#">Forgot Password?</a>
                        </div>
                        <input type="submit" value="Sign In"
                               class="login_click mt-5 h-12 w-full rounded-lg text-white text-sm bg-cyan-400 cursor-pointer transition-all hover:bg-cyan-800">
                    </form>
                    <hr class="mt-5" />
                    <p class="my-5 text-center text-sm">
                        Don't have an account
                        <a class="signup text-cyan-600" href="#">Sign up</a>
                    </p>
                </div>
                <div class="forgot_slide hidden">
                    <div class="flex justify-between mt-2">
                        <div class="flex items-center gap-2">
                            <span
                                class="h-10 w-10 rounded-full bg-gray-200 flex justify-center items-center"
                                ><i class="cursor-pointer text-green-800 fa fa-lock"></i
                                ></span>
                            <p class="text-lg font-semibold">Forgot Password</p>
                        </div>
                        <span
                            class="h-10 w-10 border border-gray-200 flex justify-center items-center rounded-full"
                            ><i
                                class="close cursor-pointer text-green-500 text-lg fa fa-close"
                                ></i
                            ></span>
                    </div>
                    <p class="mt-3 text-gray-600 font-semibold">
                        Please enter the email address you used to create your account,and
                        we will send you a link to reset your password.
                    </p>
                    <hr class="mt-5" />
                    <div class="relative mt-9">
                        <input
                            class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                            type="text"
                            />
                        <span class="absolute left-0 -top-7 text-gray-700">Email*</span>
                    </div>
                    <button
                        class="my-5 h-12 w-full rounded-lg text-white text-sm bg-cyan-600 cursor-pointer transition-all hover:bg-cyan-800"
                        >
                        Submit
                    </button>
                </div>
                <div class="signup_page main hidden">
                    <div class="flex justify-between mt-2">
                        <div class="flex items-center gap-2">
                            <span
                                class="h-10 w-10 rounded-full bg-gray-200 flex justify-center items-center"
                                ><i
                                    class="cursor-pointer text-green-800 fa fa-cart-plus text-lg"
                                    ></i
                                ></span>
                            <p class="text-lg font-semibold">Sign up</p>
                        </div>
                        <span
                            class="h-10 w-10 border border-gray-200 flex justify-center items-center rounded-full"
                            ><i class="cursor-pointer text-green-500 text-lg fa fa-close"></i
                            ></span>
                    </div>
                    <hr class="mt-5" />
                    <div class="flex gap-5 relative mt-9">
                        <div class="flex flex-col">
                            <span class=" text-gray-700">Email*</span>
                            <input name="firstName" id="firstName" type="text" placeholder="First" pattern="[a-zA-Z]+"
                                   title="Please enter Alphabets." required 
                                   class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"/>

                        </div>
                        <div class="flex flex-col">
                            <div class="flex flex-col">
                                <span class="text-gray-700">Email*</span>
                                <input name="lastName"id="lastName" type="text" placeholder="Last" pattern="[a-zA-Z]+"
                                       title="Please enter Alphabets" required
                                       class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"/>

                            </div>
                        </div>
                    </div>
                    <div class="relative mt-9">
                        <input
                            class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                            type="password"
                            placeholder="Create your password"
                            />
                        <span class="absolute left-0 -top-7 text-gray-700"
                              >Create a Password*</span
                        >
                        <span
                            class="absolute right-3 top-3 h-6 w-6 bg-gray-200 rounded-full flex justify-center items-center cursor-pointer transition-all hover:bg-gray-300"
                            ><i class="up_eye fa fa-eye-slash"></i
                            ></span>
                    </div>
                    <div class="relative mt-9">
                        <input
                            class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                            type="date"
                            />
                        <span class="absolute left-0 -top-7 text-gray-700"
                              >Date of Birth*</span
                        >
                        <p class="text-sm text-gray-700">
                            We want to give you a special treat on your Birthday.
                        </p>
                    </div>
                    <div class="flex justify-between mt-4">
                    </div>
                    <button
                        class="member_btn mt-5 h-12 w-full rounded-lg text-white text-sm bg-cyan-600 cursor-pointer transition-all hover:bg-cyan-800"
                        >
                        Become a member
                    </button>
                    <hr class="mt-5" />
                    <p class="my-5 text-center text-sm">
                        Already have an account
                        <a class="text-cyan-600 signin" href="#">Log in</a>
                    </p>
                </div>
            </div>
        </div>
        <script
            type="text/javascript"
            src="https://cdn.tailwindcss.com/3.0.12"
        ></script>
        <script
            type="text/javascript"
            src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
        ></script>
        <script type="text/javascript" src="#"></script>
        <script type="text/javascript">
            var main = document.querySelectorAll(".main");
            var signup_page = document.querySelector(".signup");
            var signin_page = document.querySelector(".signin");
            var forgot_pass = document.querySelector(".forgot");
            var forgot_slide = document.querySelector(".forgot_slide");
            var login_main = document.querySelector(".login_main");
            var close_forgot = document.querySelector(".close");
            var login_click = document.querySelector(".login_click");
            var all_inputs = document.querySelectorAll(".sigin_input input");
            var log_eye = document.querySelector(".fa-eye-slash");
            var log_in_pass = document.querySelector(".log_in_pass");
            var logch_eye = document.querySelector(".log_eye");
            var login_check = document.querySelector(".login_check");
            var signup_main = document.querySelectorAll(".signup_page input");
            var member_btn = document.querySelector(".member_btn");
            var subscribe = document.querySelector(".subscribe");
            var up_eye = document.querySelector(".up_eye");
            var up_pass = document.querySelector(".up_pass");
            var upch_eye = document.querySelector(".up_eye");

            signup_page.addEventListener("click", function () {
                main.forEach(function (pages) {
                    pages.classList.toggle("hidden");
                });
            });

            signin_page.addEventListener("click", function () {
                main.forEach(function (pages) {
                    pages.classList.toggle("hidden");
                });
            });

            forgot_pass.addEventListener("click", function () {
                forgot_slide.classList.toggle("hidden");
                login_main.classList.add("hidden");
            });

            close_forgot.addEventListener("click", function () {
                forgot_slide.classList.toggle("hidden");
                login_main.classList.remove("hidden");
            });

            login_click.onclick = function () {
                all_inputs.forEach((e) => {
                    e.classList.remove("warning");
                    if (e.value.length < 1) {
                        e.classList.add("warning");
                    } else {
                        e.classList.remove("warning");
                    }
                });
            };
            all_inputs.forEach((e) => {
                e.addEventListener("keyup", function () {
                    if (e.value.length < 1) {
                        e.classList.add("warning");
                    } else {
                        e.classList.remove("warning");
                    }
                });
            });
            log_eye.onclick = function () {
                if (log_in_pass.type == "password") {
                    log_in_pass.type = "text";
                    log_eye.classList.remove("fa-eye-slash");
                    logch_eye.classList.add("fa-eye");
                } else {
                    log_in_pass.type = "password";
                    log_eye.classList.add("fa-eye-slash");
                    logch_eye.classList.remove("fa-eye");
                }
            };
            login_check.onclick = function () {
                login_check.classList.toggle("green");
            };
            member_btn.onclick = function () {
                signup_main.forEach((i) => {
                    i.classList.remove("warning");
                    if (i.value.length < 1) {
                        i.classList.add("warning");
                    }
                });
            };
            signup_main.forEach((i) => {
                i.addEventListener("keyup", function () {
                    if (i.value.length > 0) {
                        i.classList.remove("warning");
                    }
                });
            });

            subscribe.onclick = function () {
                subscribe.classList.toggle("green");
            };

            up_eye.onclick = function () {
                if (up_pass.type == "password") {
                    up_pass.type = "text";
                    up_eye.classList.remove("fa-eye-slash");
                    upch_eye.classList.add("fa-eye");
                } else {
                    up_pass.type = "password";
                    up_eye.classList.add("fa-eye-slash");
                    upch_eye.classList.remove("fa-eye");
                }
            };
        </script>
        <script type="text/javascript">
            var myLink = document.querySelector('a[href="#"]');
            myLink.addEventListener("click", function (e) {
                e.preventDefault();
            });
        </script>
    </body>
</html>
