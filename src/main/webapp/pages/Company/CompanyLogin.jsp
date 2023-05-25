<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Company Login</title>
    <link href="#" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/assets/boot/css/fontawesome-all.min.css" rel="stylesheet"/>
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
                    <p class="text-lg font-semibold">Company Log in</p>
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
            <form action="<%=request.getContextPath()%>/company/auth/login" method="post">
                <div class="relative mt-9">
                    <input
                            type="email"
                            name="email"
                            id="lemail"
                            placeholder="Email"
                            required
                            class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-violet-700"
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
                            class="log_in_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-violet-700"
                    />
                    <span class="absolute left-0 -top-7 text-gray-700"
                    >Password*</span
                    >
                </div>
                <input
                        type="submit"
                        value="Sign In"
                        class="login_click mt-5 h-12 w-full rounded-lg text-white text-sm bg-violet-400 cursor-pointer transition-all hover:bg-violet-800"
                />
            </form>
            <hr class="mt-5"/>
            <p class="my-5 text-center text-sm">
                Don't have an account
                <a class="signup text-violet-600" href="#">Sign up</a>
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
                            <a href=>
                                <i
                                        class="cursor-pointer text-green-500 text-lg fas fa-times"
                                ></i>
                            </a>
                        </span>
            </div>
            <hr class="mt-5"/>
            <form action="<%=request.getContextPath()%>/company/auth/forgot" method="post">
                <div class="relative mt-9">
                    <input
                            name="email"
                            type="email"
                            placeholder="Email"
                            required
                            class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-violet-700"
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
                            class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-violet-700"
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
                            class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-violet-700"
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
                            class="h-12 w-full border rounded-lg outline-none transition-all px-2 focus:border-violet-700"
                    />
                    <span class="absolute left-0 -top-7 text-gray-700"
                    >Repeat Password*</span
                    >
                </div>
                <input
                        class="my-5 h-12 w-full rounded-lg text-white text-sm bg-violet-400 cursor-pointer transition-all hover:bg-violet-800"
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
                    <p class="text-lg font-semibold">Company Sign up</p>
                </div>
                <span
                        class="h-10 w-10 border border-gray-200 flex justify-center items-center rounded-full"
                >
                            <a href=>
                                <i
                                        class="cursor-pointer text-green-500 text-lg fas fa-times"
                                ></i>
                            </a>
                        </span>
            </div>
            <hr class="mt-5"/>
            <form action="<%=request.getContextPath()%>/company/auth/register" method="post">
                <div class="mb-6">
                    <label class="text-gray-700" for="cname"> Company Name </label>
                    <input
                            name="cname"
                            id="cname"
                            type="text"
                            placeholder="Company Name"
                            required
                            pattern=".{3,45}"
                            title="3-45 letters"
                            class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-violet-700"
                    />
                </div>
                <div class="mb-6">
                    <label class="text-gray-700" for="email"> Email </label>
                    <input
                            name="email"
                            id="email"
                            type="email"
                            placeholder="Email"
                            required
                            pattern=".{,45}"
                            title="Max 45 letters"
                            class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-violet-700"
                    />
                </div>
                <div class="mb-6">
                    <label class="text-gray-700" for="userName"> Username </label>
                    <input
                            name="username"
                            id="username"
                            type="text"
                            placeholder="Username"
                            required
                            pattern=".{3,16}"
                            title="3-16 letters"
                            class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-violet-700"
                    />
                </div>
                <div class="mb-6">
                    <label class="text-gray-700" for="password"> Password </label>
                    <input
                            name="password"
                            id="password"
                            type="password"
                            placeholder="********"
                            pattern=".{8,32}"
                            title="8-32 letters"
                            required
                            class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-violet-700"
                    />
                </div>
                <div class="mb-6">
                    <label class="text-gray-700" for="rep-password">
                        Repeat Password
                    </label>
                    <input
                            name="rep-password"
                            id="rep-password"
                            type="password"
                            placeholder="********"
                            pattern=".{8,32}"
                            title="8-32 letters"
                            required
                            class="up_pass h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-violet-700"
                    />
                </div>
                <div class="mb-6">
                    <label class="text-gray-700" for="userName"> About you</label>
                    <textarea
                            name="about" id="about" placeholder="About your company" required maxlength="1000"
                            title="3-1000 letters"
                            class="up_pass pt-2 h-12 pr-10 w-full border rounded-lg outline-none transition-all px-2 focus:border-cyan-700"

                    ></textarea>
                </div>
                <div class="mb-6">
                    <p>
                        By creating an account you agree to our
                        <a href="#" style="color: dodgerblue">Terms & Privacy</a>.
                    </p>
                </div>
                <div class="flex items-center justify-between">
                    <input
                            type="submit"
                            value="Become a member"
                            onclick="return Validate()"
                            class="member_btn mt-5 h-12 w-full rounded-lg text-white text-sm bg-violet-400 cursor-pointer transition-all hover:bg-violet-800"
                    />
                    <hr class="mt-5"/>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/css/output.js"></script>
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
    var up_pass = document.querySelector(".up_pass");

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
        if (log_in_pass.type === "password") {
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

</script>
<script type="text/javascript">
    var myLink = document.querySelector('a[href="#"]');
    myLink.addEventListener("click", function (e) {
        e.preventDefault();
    });
</script>
</body>
</html>
