<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>User Home</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="<%=request.getContextPath()%>/assets/css/output.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/style.css">
    <!-- CSS here -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/boot/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/boot/css/price_rangs.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/boot/css/flaticon.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/boot/css/slicknav.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/boot/css/animate.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/boot/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/boot/css/themify-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/boot/css/slick.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/boot/css/style.css">
</head>

<body>
<nav class=" mt-0 fixed w-full z-10 top-0 bg-white">
    <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
        <div class="relative flex items-center justify-between h-24">
            <div class="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
                <div class="flex-shrink-0 flex items-center">
                    <img class="block lg:hidden h-8 w-auto"
                         src="<%=request.getContextPath()%>/assets/img/logo.png" alt="Logo"/>
                    <img class="hidden lg:block h-8 w-auto"
                         src="<%=request.getContextPath()%>/assets/img/logo.png" alt="Logo"/>
                </div>
                <div class="hidden sm:block sm:ml-6">
                    <div class="flex space-x-4">
                        <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                        <!-- <a href="#" class="bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium"
                            aria-current="page">User Portal</a> -->

                        <a href="<%=request.getContextPath()%>/home"
                           class="text-slate-800 hover:text-cyan-400 px-3 py-2 rounded-md text-sm font-medium">
                            Home</a>
                        <a href="#"
                           class="text-slate-800 hover:text-cyan-400 px-3 py-2 rounded-md text-sm font-medium">
                            About</a>
                        <a href="#"
                           class="text-slate-800 hover:text-cyan-400 px-3 py-2 rounded-md text-sm font-medium">
                            Contact </a>


                        <!-- <a href="#"
                            class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Calendar</a> -->
                    </div>
                </div>
            </div>
            <div class="ml-3 relative">
                <div class="flex space-x-4 ">
                    <div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
<!-- Preloader Start -->
<div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text">
                <img src="<%=request.getContextPath()%>/assets/img/logo.png" alt="">
            </div>
        </div>
    </div>
</div>
<!-- Preloader Start -->
<main>
    <!-- Hero Area End -->
    <!-- Job List Area Start -->
    <div class="job-listing-area pt-120 pb-120">
        <div class="container">
            <div class="row">
                <!-- Left content -->
                <div class="col-xl-3 col-lg-3 col-md-4">
                    <!-- Job Category Listing start -->
                    <div class="job-category-listing mb-50">
                        <!-- single three -->
                        <div class="text-xl my-3 text-center ">
                            <%= session.getAttribute("Name")%>
                        </div>
                        <div class="single-listing">
                            <div class="select-Categories pb-50">
                                <div class="small-section-tittle2 ">
                                    <h4 class="p-2 pb-1 pl-3 rounded bg-cyan-400  text-white">
                                        <a>
                                            <i class="fas fa-home"></i>
                                            Dashboard
                                        </a>
                                    </h4>
                                </div>
                                <div class="small-section-tittle2">
                                    <h4 class="p-2 pl-3 pb-1 rounded">
                                        <a href="<%=request.getContextPath()%>/employee/jobs"
                                           class="hover:text-cyan-400">
                                            <i class="fas fa-list"></i>
                                            Jobs
                                        </a>
                                    </h4>
                                </div>
                                <div class="small-section-tittle2">
                                    <h4 class="p-2 pl-3 pb-1 rounded">
                                        <a href="<%=request.getContextPath()%>/employee/jobs/applied"
                                           class="hover:text-cyan-400">
                                            <i class="fas fa-list"></i>
                                            Applied Jobs
                                        </a>
                                    </h4>
                                </div>
                                <div class="small-section-tittle2">
                                    <h4 class="p-2 pl-3 pb-1 rounded">
                                        <a href="<%=request.getContextPath()%>/employee/profile"
                                           class="hover:text-cyan-400">
                                            <i class="fas fa-user"></i>
                                            Profile
                                        </a>
                                    </h4>
                                </div>
                            </div>

                        </div>
                        <div class="single-listing">
                            <!-- Range Slider Start -->
                            <aside class="left_widgets p_filter_widgets price_rangs_aside sidebar_box_shadow">
                                <div class="small-section-tittle2">
                                    <a href="<%=request.getContextPath()%>/employee/auth/logout"
                                       class="bg-red-500 hover:bg-red-600 p-2 px-3 rounded text-white text-center">
                                        Log Out
                                    </a>
                                </div>

                            </aside>
                            <!-- Range Slider End -->
                        </div>
                    </div>
                    <!-- Job Category Listing End -->
                </div>
                <!-- Right content -->
                <div class="col-xl-9 col-lg-9 col-md-8">
                    <!-- Blog Area Start -->
                    <div class="home-blog-area">
                        <div class="container">
                            <!-- Section Tittle -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section-tittle text-center">
                                        <span>Our latest blog</span>
                                        <h2>Our recent news</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-md-6">
                                    <div class="home-blog-single mb-30">
                                        <div class="blog-img-cap">
                                            <div class="blog-img">
                                                <img src="<%=request.getContextPath()%>/assets/img/page-images/home-blog1.jpg"
                                                     alt="">
                                                <!-- Blog date -->
                                                <div class="blog-date text-center">
                                                    <span>24</span>
                                                    <p>Now</p>
                                                </div>
                                            </div>
                                            <div class="blog-cap">
                                                <p>| Properties</p>
                                                <h3><a href="#">Footprints in Time is perfect House in Kurashiki</a>
                                                </h3>
                                                <a href="#" class="more-btn">Read more »</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6">
                                    <div class="home-blog-single mb-30">
                                        <div class="blog-img-cap">
                                            <div class="blog-img">
                                                <img src="<%=request.getContextPath()%>/assets/img/page-images/home-blog2.jpg"
                                                     alt="">
                                                <!-- Blog date -->
                                                <div class="blog-date text-center">
                                                    <span>24</span>
                                                    <p>Now</p>
                                                </div>
                                            </div>
                                            <div class="blog-cap">
                                                <p>| Properties</p>
                                                <h3><a href="#">Footprints in Time is perfect House in Kurashiki</a>
                                                </h3>
                                                <a href="#" class="more-btn">Read more »</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Blog Area End -->
                    <!-- Testimonial Start -->
                    <div class="testimonial-area testimonial-padding">
                        <div class="container">
                            <!-- Testimonial contents -->
                            <div class="row d-flex justify-content-center">
                                <div class="col-xl-8 col-lg-8 col-md-10">
                                    <div class="h1-testimonial-active dot-style">
                                        <!-- Single Testimonial -->
                                        <div class="single-testimonial text-center">
                                            <!-- Testimonial Content -->
                                            <div class="testimonial-caption ">
                                                <!-- founder -->
                                                <div class="testimonial-founder  ">
                                                    <div class="founder-img mb-30">
                                                        <img src="<%=request.getContextPath()%>/assets/img/page-images/testimonial-founder.png"
                                                             alt="">
                                                        <span>Margaret Lawson</span>
                                                        <p>Creative Director</p>
                                                    </div>
                                                </div>
                                                <div class="testimonial-top-cap">
                                                    <p>“I am at an age where I just want to be fit and healthy our
                                                        bodies are our
                                                        responsibility! So start caring for your body, and it will care
                                                        for you. Eat
                                                        clean it will care for you and workout hard.”</p>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Single Testimonial -->
                                        <div class="single-testimonial text-center">
                                            <!-- Testimonial Content -->
                                            <div class="testimonial-caption ">
                                                <!-- founder -->
                                                <div class="testimonial-founder  ">
                                                    <div class="founder-img mb-30">
                                                        <img src="<%=request.getContextPath()%>/assets/img/page-images/testimonial-founder.png"
                                                             alt="">
                                                        <span>Margaret Lawson</span>
                                                        <p>Creative Director</p>
                                                    </div>
                                                </div>
                                                <div class="testimonial-top-cap">
                                                    <p>“I am at an age where I just want to be fit and healthy our
                                                        bodies are our
                                                        responsibility! So start caring for your body, and it will care
                                                        for you. Eat
                                                        clean it will care for you and workout hard.”</p>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Single Testimonial -->
                                        <div class="single-testimonial text-center">
                                            <!-- Testimonial Content -->
                                            <div class="testimonial-caption ">
                                                <!-- founder -->
                                                <div class="testimonial-founder  ">
                                                    <div class="founder-img mb-30">
                                                        <img src="<%=request.getContextPath()%>/assets/img/page-images/testimonial-founder.png"
                                                             alt="">
                                                        <span>Margaret Lawson</span>
                                                        <p>Creative Director</p>
                                                    </div>
                                                </div>
                                                <div class="testimonial-top-cap">
                                                    <p>“I am at an age where I just want to be fit and healthy our
                                                        bodies are our
                                                        responsibility! So start caring for your body, and it will care
                                                        for you. Eat
                                                        clean it will care for you and workout hard.”</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Testimonial End -->

                </div>
            </div>
        </div>
    </div>
    <!-- Job List Area End -->
</main>
<footer class="bg-gray-800">
    <div class="grid grid-cols-2 gap-8 py-8 px-6 md:grid-cols-4">
        <div>
            <h3 class="mb-6 text-sm font-semibold text-gray-400 uppercase">Company</h3>
            <ul>
                <li class="mb-4">
                    <a href="https://about.google" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">About</a>
                </li>
                <li class="mb-4">
                    <a href="https://careers.google.com" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">Careers</a>
                </li>
                <li class="mb-4">
                    <a href="https://about.google/brand-resource-center" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">Brand
                        Center</a>
                </li>
                <li class="mb-4">
                    <a href="https://blog.google/" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">Blog</a>
                </li>
            </ul>
        </div>
        <div>
            <h3 class="mb-6 text-sm font-semibold text-gray-400 uppercase">Help center</h3>
            <ul>
                <li class="mb-4">
                    <a href="#" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">Discord
                        Server</a>
                </li>
                <li class="mb-4">
                    <a href="#" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">Twitter</a>
                </li>
                <li class="mb-4">
                    <a href="#" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">Facebook
                    </a>
                </li>
                <li class="mb-4"><a href="#" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">
                </a><a href="#" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">Contact
                    Us</a>
                </li>
            </ul>
        </div>
        <div>
            <h3 class="mb-6 text-sm font-semibold text-gray-400 uppercase">Legal</h3>
            <ul>
                <li class="mb-4">
                    <a href="#" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">Privacy
                        Policy</a>
                </li>
                <li class="mb-4">
                    <a href="#" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">Licensing</a>
                </li>
                <li class="mb-4">
                    <a href="#" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">Terms
                        &amp;
                        Conditions</a>
                </li>
            </ul>
        </div>
        <div>
            <h3 class="mb-6 text-sm font-semibold text-gray-400 uppercase">Download</h3>
            <ul>
                <li class="mb-4">
                    <a href="#" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">iOS</a>
                </li>
                <li class="mb-4">
                    <a href="#" target="_blank" rel="noreferrer" class="text-gray-300 hover:underline">Android</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="py-6 px-4 bg-gray-700 md:flex md:items-center md:justify-between">
            <span class="text-sm text-gray-300 sm:text-center">© 2022. All
                Rights Reserved.
            </span>
        <div class="flex mt-4 space-x-6 sm:justify-center md:mt-0">
            <a href="#" class="text-gray-400 hover:text-white">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                    <path fill-rule="evenodd"
                          d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z"
                          clip-rule="evenodd"></path>
                </svg>
            </a>
            <a href="#" class="text-gray-400 hover:text-white">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                    <path fill-rule="evenodd"
                          d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z"
                          clip-rule="evenodd"></path>
                </svg>
            </a>
            <a href="#" class="text-gray-400 hover:text-white">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                    <path
                            d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84">
                    </path>
                </svg>
            </a>
            <a href="#" class="text-gray-400 hover:text-white">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                    <path fill-rule="evenodd"
                          d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                          clip-rule="evenodd"></path>
                </svg>
            </a>
            <a href="#" class="text-gray-400 hover:text-white">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                    <path fill-rule="evenodd"
                          d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10c5.51 0 10-4.48 10-10S17.51 2 12 2zm6.605 4.61a8.502 8.502 0 011.93 5.314c-.281-.054-3.101-.629-5.943-.271-.065-.141-.12-.293-.184-.445a25.416 25.416 0 00-.564-1.236c3.145-1.28 4.577-3.124 4.761-3.362zM12 3.475c2.17 0 4.154.813 5.662 2.148-.152.216-1.443 1.941-4.48 3.08-1.399-2.57-2.95-4.675-3.189-5A8.687 8.687 0 0112 3.475zm-3.633.803a53.896 53.896 0 013.167 4.935c-3.992 1.063-7.517 1.04-7.896 1.04a8.581 8.581 0 014.729-5.975zM3.453 12.01v-.26c.37.01 4.512.065 8.775-1.215.25.477.477.965.694 1.453-.109.033-.228.065-.336.098-4.404 1.42-6.747 5.303-6.942 5.629a8.522 8.522 0 01-2.19-5.705zM12 20.547a8.482 8.482 0 01-5.239-1.8c.152-.315 1.888-3.656 6.703-5.337.022-.01.033-.01.054-.022a35.318 35.318 0 011.823 6.475 8.4 8.4 0 01-3.341.684zm4.761-1.465c-.086-.52-.542-3.015-1.659-6.084 2.679-.423 5.022.271 5.314.369a8.468 8.468 0 01-3.655 5.715z"
                          clip-rule="evenodd"></path>
                </svg>
            </a>
        </div>
    </div>
</footer>
<!-- JS here -->

<!-- All JS Custom Plugins Link Here here -->
<script src="<%=request.getContextPath()%>/assets/boot/js/vendor/modernizr-3.5.0.min.js"></script>
<!-- Jquery, Popper, Bootstrap -->
<script src="<%=request.getContextPath()%>/assets/boot/js/vendor/jquery-1.12.4.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/boot/js/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/boot/js/bootstrap.min.js"></script>
<!-- Jquery Mobile Menu -->
<script src="<%=request.getContextPath()%>/assets/boot/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Range -->
<script src="<%=request.getContextPath()%>/assets/boot/js/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/boot/js/slick.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/boot/js/price_rangs.js"></script>
<!-- One Page, Animated-HeadLin -->
<script src="<%=request.getContextPath()%>/assets/boot/js/wow.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/boot/js/jquery.magnific-popup.js"></script>

<!-- Scrollup, nice-select, sticky -->
<script src="<%=request.getContextPath()%>/assets/boot/js/jquery.scrollUp.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/boot/js/jquery.nice-select.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/boot/js/jquery.sticky.js"></script>
<!-- Jquery Plugins, main Jquery -->
<script src="<%=request.getContextPath()%>/assets/boot/js/plugins.js"></script>
<script src="<%=request.getContextPath()%>/assets/boot/js/main.js"></script>

</body>

</html>