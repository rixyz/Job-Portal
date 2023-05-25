<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    if (null != session.getAttribute("Type")) {
        request.getRequestDispatcher("Home").forward(request, response);
    }
    if (request.getAttribute("errorMessage") != null) {
%>
<script>
    alert("<%= request.getAttribute("errorMessage") %>");
</script>
<%
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>User Login</title>
    <link href="<%=request.getContextPath()%>/assets/boot/css/fontawesome-all.min.css" rel="stylesheet"/>
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
    </style>
</head>

<body class="snippet-body">
<div class="flex justify-center items-center bg-gray-400 min-h-screen">
    <div class="h-auto my-20 w-96 bg-white rounded-lg p-3">
        <!-- Login -->
        <div class="main sigin_input login_main">
            <div class="flex justify-between mt-2">
                <div class="flex items-center gap-2">
                            <span
                                    class="h-10 w-10 rounded-full bg-gray-200 flex justify-center items-center"
                            >
                                <i class="cursor-pointer text-green-800 fa fa-key"></i>
                            </span>
                    <p class="text-lg font-semibold">User Log in</p>
                </div>
                <span
                        class="h-10 w-10 border border-gray-200 flex justify-center items-center rounded-full"
                >
                            <a href="<%=request.getContextPath()%>/home">
                                <i class="cursor-pointer text-green-500 text-lg fas fa-times"></i>
                            </a>
                        </span>
            </div>
            <hr class="mt-5"/>
            <form action="<%=request.getContextPath()%>/employee/auth/login" method="post">
                <div class="relative mt-9">
                    <input
                            type="email"
                            name="email"
                            id="lemail"
                            placeholder="Email"
                            required
                            class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                    />
                    <span class="absolute left-0 -top-7 text-gray-700">Email*</span>
                </div>
                <div class="relative mt-9">
                    <input
                            type="password"
                            name="password"
                            id="lpassword"
                            placeholder="********"
                            required
                            class="log_in_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                    />
                    <span class="absolute left-0 -top-7 text-gray-700"
                    >Password*</span
                    >
                </div>

                <div class="flex justify-between mt-4">
                    <a class="text-cyan-600 forgot" href="#">Forgot Password?</a>
                </div>
                <input
                        type="submit"
                        value="Sign In"
                        class="login_click mt-5 h-12 w-full rounded-lg text-white text-sm bg-cyan-400 cursor-pointer transition-all hover:bg-cyan-800"
                />
            </form>
            <hr class="mt-5"/>
            <p class="my-5 text-center text-sm">
                Don't have an account
                <a class="signup text-cyan-600" href="#">Sign up</a>
            </p>
        </div>
        <!-- Forget Password -->
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
                >
                            <a href="<%=request.getContextPath()%>/home">
                                <i
                                        class="cursor-pointer text-green-500 text-lg fas fa-times"
                                ></i>
                            </a>
                        </span>
            </div>
            <hr class="mt-5"/>
            <form action="<%=request.getContextPath()%>/employee/auth/forgot" method="post">
                <div class="relative mt-9">
                    <input
                            name="email"
                            type="email"
                            placeholder="Email"
                            required
                            class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                    />
                    <span class="absolute left-0 -top-7 text-gray-700">Email*</span>
                </div>
                <div class="relative mt-9">
                    <input
                            id="fphone"
                            type="tel "
                            placeholder="XXX-XXX-XXXX"
                            name="phone"
                            required
                            class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                    />
                    <span class="absolute left-0 -top-7 text-gray-700">Phone*</span>
                </div>
                <div class="relative mt-9">
                    <input
                            name="password"
                            id="fpassword"
                            type="password"
                            placeholder="********"
                            pattern=".{8,45}"
                            title="8-45 letters"
                            required
                            class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                    />
                    <span class="absolute left-0 -top-7 text-gray-700"
                    >Password*</span
                    >
                </div>
                <div class="relative mt-9">
                    <input
                            name="rep-password"
                            id="frep-password"
                            type="password"
                            placeholder="********"
                            required
                            class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                    />
                    <span class="absolute left-0 -top-7 text-gray-700"
                    >Confirm Password*</span
                    >
                </div>
                <input
                        class="my-5 h-12 w-full rounded-lg text-white text-sm bg-cyan-400 cursor-pointer transition-all hover:bg-cyan-800"
                        type="submit"
                        value="Proceed"
                        onclick="return Validate()"
                />
            </form>
        </div>
        <!-- Register -->
        <div class="signup_page main hidden">
            <div class="flex justify-between mt-2">
                <div class="flex items-center gap-2">
                            <span
                                    class="h-10 w-10 rounded-full bg-gray-200 flex justify-center items-center"
                            ><i
                                    class="cursor-pointer text-green-800 fa fa-cart-plus text-lg"
                            ></i
                            ></span>
                    <p class="text-lg font-semibold">User Sign up</p>
                </div>
                <span
                        class="h-10 w-10 border border-gray-200 flex justify-center items-center rounded-full"
                >
                            <a href="<%=request.getContextPath()%>/home">
                                <i
                                        class="cursor-pointer text-green-500 text-lg fas fa-times"
                                ></i>
                            </a>
                        </span>
            </div>
            <hr class="mt-5"/>
            <form action="<%=request.getContextPath()%>/employee/auth/register" method="post">
                <div class="flex gap-5 mb-6">
                    <div class="flex flex-col">
                        <label class="text-gray-700" for="firstName">
                            First Name
                        </label>
                        <input
                                name="firstName"
                                id="firstName"
                                type="text"
                                placeholder="First"
                                pattern="[a-zA-Z]+"
                                title="Please enter Alphabets."
                                required
                                class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                        />
                    </div>
                    <div class="flex flex-col">
                        <label class="text-gray-700" for="lastName"> Last Name </label>
                        <input
                                name="lastName"
                                class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                                id="lastName"
                                type="text"
                                placeholder="Last"
                                pattern="[a-zA-Z]+"
                                title="Please enter Alphabets"
                                required
                        />
                    </div>
                </div>
                <div class="mb-6">
                    <label class="text-gray-700" for="email"> Email </label>
                    <input
                            name="email"
                            class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                            id="email"
                            type="email"
                            placeholder="Email"
                            required
                    />
                </div>
                <div class="mb-6">
                    <label class="text-gray-700" for="phone"> Phone </label>
                    <input
                            name="phone"
                            class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                            id="phone"
                            type="tel"
                            placeholder="XXX-XXX-XXXX"
                            required
                            pattern="^[0-9]{7,10}"
                            title="Enter Valid phone number"
                    />
                </div>
                <div class="mb-6">
                    <label class="text-gray-700" for="userName"> Username </label>
                    <input
                            name="userName"
                            class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                            id="userName"
                            type="text"
                            placeholder="Username"
                            required
                            pattern=".{3,45}"
                            title="3-45 letters"
                    />
                </div>
                <div class="mb-6">
                    <label class="text-gray-700" for="password"> Password </label>
                    <input
                            name="password"
                            class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                            id="password"
                            type="password"
                            placeholder="********"
                            pattern=".{8,45}"
                            title="8-45 letters"
                            required
                    />
                </div>
                <div class="mb-6">
                    <label class="text-gray-700" for="rep-password">
                        Repeat Password
                    </label>
                    <input
                            name="rep-password"
                            class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                            id="rep-password"
                            type="password"
                            placeholder="********"
                            required
                    />
                </div>
                <div class="mb-6">
                    <label class="text-gray-700" for="userName"> About you</label>
                    <textarea
                            name="about"
                            class="up_pass py-2 h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"
                            id="about"
                            placeholder="About you"
                            required
                            maxlength="1000"
                            title="3-1000 letters"
                    ></textarea>
                </div>
                <div class="mb-6">
                    <label for="exp_in_years"
                           class="text-grey-darker text-sm font-bold mb-2"
                    >Experience:
                    </label>
                    <input
                            id="exp_in_years"
                            name="exp_in_years"
                            type="number"
                            min="0"
                            required
                            class="rounded-lg border-2 border-gray-200 outline-none focus:border-cyan-400 pl-2"
                    />
                </div>
                <div class="mb-6">
                    <p>
                        By creating an account you agree to our
                        <a href="#" style="color: dodgerblue">Terms & Privacy</a>.
                    </p>
                </div>
                <div class="flex justify-between mt-4"></div>
                <input
                        type="submit"
                        value="Become a member"
                        onclick="return Validate()"
                        class="member_btn mt-5 h-12 w-full rounded-lg text-white text-sm bg-cyan-400 cursor-pointer transition-all hover:bg-cyan-800"
                />
                <hr class="mt-5"/>
                <p class="my-5 text-center text-sm">
                    Already have an account
                    <a class="text-cyan-600 signin" href="#">Log in</a>
                </p>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/css/output.js"></script>
<script type="text/javascript">
    let main = document.querySelectorAll(".main");
    let signup_page = document.querySelector(".signup");
    let signin_page = document.querySelector(".signin");
    let forgot_pass = document.querySelector(".forgot");
    let forgot_slide = document.querySelector(".forgot_slide");
    let login_main = document.querySelector(".login_main");
    let close_forgot = document.querySelector(".close");
    let login_click = document.querySelector(".login_click");
    let all_inputs = document.querySelectorAll(".sigin_input input");
    let log_eye = document.querySelector(".fa-eye-slash");
    let log_in_pass = document.querySelector(".log_in_pass");
    let logch_eye = document.querySelector(".log_eye");
    let login_check = document.querySelector(".login_check");
    let signup_main = document.querySelectorAll(".signup_page input");
    let member_btn = document.querySelector(".member_btn");
    let up_pass = document.querySelector(".up_pass");

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

</script>
<script type="text/javascript">
    let myLink = document.querySelector('a[href="#"]');
    myLink.addEventListener("click", function (e) {
        e.preventDefault();
    });


</script>
</body>
</html>
