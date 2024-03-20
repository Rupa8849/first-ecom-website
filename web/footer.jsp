<%-- 
    Document   : footer
    Created on : Jan 7, 2024, 11:42:32 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="js/index.js"></script>
        <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
        <!--<link rel="stylesheet" href="https://demos.creative-tim.com/notus-js/assets/styles/tailwind.css">-->
        <link rel="stylesheet" href="https://demos.creative-tim.com/notus-js/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css">
        <link href="https://tuk.dev/components/E-commerce/Components/carousels/carousel_2"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            gold: '#f87171',
                            bronze: '#a87900'
                        }
                    }
                }
            }
        </script>
    </head>
    <body>
        <footer class="w-screen">
            <div class="bg-black text-white pt-8 pb-6 w-full overflow-x-hidden">
                <div class="container mx-auto px-4 flex-col">
                    <div class="flex w-screen">
                        <div class="flex flex-wrap text-left lg:text-left w-[45%]">
                            <div class="w-full lg:w-6/12 px-4">
                                <h4 class="text-3xl fonat-semibold text-white">Let's keep in touch!</h4>
                                <h5 class="text-lg mt-0 mb-2 text-white">
                                    Find us on any of these platforms, we respond 1-2 business days.
                                </h5>
                                <div class="mt-6 lg:mb-0 mb-6">
                                    <button
                                        class="bg-white text-blue-500 shadow-lg font-normal h-10 w-10 items-center justify-center align-center rounded-full outline-none focus:outline-none mr-2"
                                        type="button">
                                        <i class="fab fa-twitter"></i>
                                    </button>
                                    <button
                                        class="bg-white text-blue-600 shadow-lg font-normal h-10 w-10 items-center justify-center align-center rounded-full outline-none focus:outline-none mr-2"
                                        type="button">
                                        <i class="fab fa-facebook-square"></i>
                                    </button>
                                    <button
                                        class="bg-white text-pink-500 shadow-lg font-normal h-10 w-10 items-center justify-center align-center rounded-full outline-none focus:outline-none mr-2"
                                        type="button">
                                        <i class="fab fa-dribbble"></i>
                                    </button>
                                    <button
                                        class="bg-white text-gray-800 shadow-lg font-normal h-10 w-10 items-center justify-center align-center rounded-full outline-none focus:outline-none mr-2"
                                        type="button">
                                        <i class="fab fa-github"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!--links-->
                        <div class="w-[55%] lg:w-6/12 px-4">
                            <div class="flex flex-wrap items-top mb-6 bg-black">
                                <div class="lg:w-4/12 px-4">
                                    <span class="block uppercase text-white font-bold text-sm mb-2">Help</span>
                                    <ul class="list-unstyled">
                                        <li>
                                            <a class="text-white hover:text-white font-semibold block pb-2 text-sm"
                                               href="https://www.creative-tim.com/presentation?ref=njs-profile">FAQ</a>
                                        </li>
                                        <li>
                                            <a class="text-white hover:text-white font-semibold block pb-2 text-sm"
                                               href="aboutus.jsp">About Us</a>
                                        </li>
                                        <li>
                                            <a class="text-white hover:text-white font-semibold block pb-2 text-sm"
                                               href="contactus.jsp">Contact Us</a>
                                        </li>
                                        <li>
                                            <a class="text-white hover:text-white font-semibold block pb-2 text-sm"
                                               href="#">Cancel
                                                Order</a>
                                        </li>
                                        <li>
                                            <a class="text-white hover:text-white font-semibold block pb-2 text-sm"
                                               href="https://www.creative-tim.com/bootstrap-themes/free?ref=njs-profile">Terms
                                                & Conditions</a>
                                        </li>
                                        
                                    </ul>
                                </div>
                                <div class="lg:w-4/12 px-4">
                                    <span class="block uppercase font-bold  text-sm font-semibold mb-2">Accounts</span>
                                    <ul class="list-unstyled">
                                        <li>
                                            <a class="text-white hover:text-white font-semibold block pb-2 text-sm"
                                               href="https://github.com/creativetimofficial/notus-js/blob/main/LICENSE.md?ref=njs-profile">Accounts</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="lg:w-4/12 px-4">
                                    <span class="block uppercase font-bold  text-sm font-semibold mb-2">Need Help?</span>
                                    <ul class="list-unstyled">
                                        <li>
                                            <a class="text-white hover:text-white font-semibold block pb-2 text-sm"
                                               href="https://github.com/creativetimofficial/notus-js/blob/main/LICENSE.md?ref=njs-profile">
                                                prettyera4210@gmail.com</a>
                                        </li>
                                        <li>
                                            <a class="text-white hover:text-white font-semibold block pb-2 text-sm"
                                               href="https://creative-tim.com/terms?ref=njs-profile">1800-202-4243</a>
                                        </li>
                                        <li>
                                            <a class="text-white hover:text-white font-semibold block pb-2 text-sm"
                                               href="https://creative-tim.com/privacy?ref=njs-profile">Mon-Sun 9am to 6pm
                                            </a>
                                        </li>
                                        <li>
                                            <a class="text-white hover:text-white font-semibold block pb-2 text-sm"
                                               href="https://creative-tim.com/contact-us?ref=njs-profile"></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--</div>-->
                    <!--hr-->
                    <div>
                        <hr class="my-6 border-white">
                        <div class="flex flex-wrap items-center md:justify-between justify-center">
                            <div class="w-full md:w-4/12 px-4 mx-auto text-center">
                                <div class="text-sm  font-semibold py-1">
                                    Copyright © <span id="get-current-year">2023</span><a
                                        href="https://www.creative-tim.com/product/notus-js"
                                        class="text-white hover:text-gray-800" target="_blank"> Pretty Era. All rights Reserved
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
