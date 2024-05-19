<%-- 
    Document   : index
    Created on : Dec 29, 2023, 11:09:53 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
        <script src="js/index.js"></script>
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
    <body class="overflow-x-hidden w-screen">
        <div class="w-screen shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>

        <!--login section-->
        <section class="h-screen w-screen" >
            <div id="loginDiv" class="flex flex-col items-center flex-1 h-full justify-center px-4 sm:px-0 ">
                <div class="bg-black lg:flex rounded-lg shadow-xl sm:border-2 border-bronze sm:pt-20 lg:pt-0 sm:w-[90%] lg:h-[60%] lg:w-[50%] sm:h-1/2 sm:text-3xl sm:text-center bg-white sm:mx-0 sm: hover:shadow-xl overflow-hidden">
                    <div class="lg:w-full sm:hidden lg:block">
                        <img src="images/logo/pic3.jpg" class="lg:block sm:hidden h-full lg:w-full rounded-l-lg aspect-square"/>
                    </div>
                    <div class="flex lg:w-1/2 sm:w-full sm:flex md:w-full p-4">
                        <div class="flex flex-col flex-1 justify-start items-center">
                            <h1 class="lg:text-3xl sm:text-5xl text-center uppercase" style="font-family: 'Josefin Sans', sans-serif;">Sign in</h1>

                            <!--login form-->
                            <div class="w-full lg:mt-8 sm:mt-24" id="sendDiv">
                                <form class="form-horizontal w-3/4 mx-auto" method="POST" action="#">
                                    <div class="relative z-0 text-left block">

                                        <!--email input box-->
                                        <input type="text" id="emailInput" name="emailInput" class="block lg:py-2.5 sm:py-6 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none
                                               dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-gray-700 peer" placeholder=" " />
                                        <label for="floating_standard" class="absolute lg:text-sm sm:text-3xl  text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0]
                                               peer-focus:start-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75
                                               peer-focus:-translate-y-6 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto">Enter your email</label>
                                    </div>   
                                    <span id="loginspan" class="text-sm flex justify-start text-red-500"></span>
                                    <div class="flex flex-col lg:mt-8 sm:mt-12">
                                        <button type="" onclick="return sendOtp()" class="bg-black text-white lg:text-lg sm:text-4xl font-semibold lg:py-2 px-4 sm:py-8 rounded">
                                            Request OTP
                                        </button>
                                    </div>
                                </form>
                            </div>

                            <!--verify div-->
                            <div class="w-full lg:mt-8 sm:mt-24 hidden" id="verifyDiv">
                                <form class="form-horizontal w-3/4 mx-auto" method="POST" action="#">
                                    <div class="relative z-0 text-left " id="">
                                        <input type="text" id="verifyInput" class="block lg:py-2.5 sm:py-6 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none
                                               dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-gray-700 peer" placeholder=" " />
                                        <label for="floating_standard" class="absolute lg:text-sm sm:text-3xl  text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10
                                               origin-[0] peer-focus:start-0 peer-focus:text-gray-700 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0
                                               peer-focus:scale-75 peer-focus:-translate-y-6 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto">Enter OTP</label>
                                    </div>
                                    <span id="verifyOtpSpan" class="text-sm flex justify-start text-red-500"></span>
                                    <div class="flex flex-col lg:mt-8 sm:mt-12">
                                        <button type="" id="verifybtn" 
                                                onclick="return verifyOtp()" 
                                                class="bg-black text-white lg:text-lg sm:text-4xl font-semibold lg:py-2 px-4 sm:py-8 rounded">
                                            Verify OTP
                                        </button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!--profile form-->
            <div id="profile-form" class="hidden flex items-center flex-1 h-full justify-center px-4 sm:px-0 sm:h-screen sm:w-screen">
                <div class="lg:flex rounded-lg shadow-xl  lg:pt-0 sm:w-[90%] lg:h-fit
                     lg:w-[35%] sm:h-screen sm:text-5xl sm:text-center sm:flex sm:items-center sm:justify-center hover:shadow-xl overflow-hidden">
                    <div class="flex-col sm:w-full sm:flex md:w-full p-4 sm:border-2 border-bronze bg-[url('images/blob-scene-haikei.png')] bg-cover rounded-lg">
                        <div>
                            <h1 class="text-bronze">Create your profile</h1>
                        </div>
                        <div class="space-y-2 p-6">
                            <div class="flex w-full">
                                <div class="flex-col w-full">
                                    <input type="text" name="fname" id="fname" class="w-full rounded rounded" placeholder="*First name">
                                    <span id="fnameSpan" class="text-sm flex justify-start text-red-500"></span>
                                </div>
                            </div>
                            <div class="flex w-full">
                                <div class="flex-col w-full">
                                    <input type="text" name="lname" id="lname" class="w-full rounded rounded" placeholder="*Last name">
                                    <span id="lnameSpan" class="text-sm flex justify-start text-red-500"></span>
                                </div>
                            </div>
                            <div class="flex w-full">
                                <div class="flex-col w-full">
                                    <%      if (session.getAttribute("emailSession") != null) {
                                            String email = (String) session.getAttribute("emailSession");
                                    %>
                                    <input type="text" name="email" id="loademail" class="w-full rounded" placeholder="*Email" 
                                           value=<%= email%>>
                                    <%
                                    } else {
                                    %>
                                    <input type="text" name="email" id="loademail" class="w-full rounded" placeholder="*Email" >                                    <%
                                        }
                                    %>
                                    <span id="emailSpan" class="text-sm flex justify-start text-red-500"></span>
                                </div>
                            </div>
                            <div class="flex w-full">
                                <div class="flex-col w-full">
                                    <input type="text" name="mobile" id="mobile" class="w-full rounded" placeholder="*Mobile no ">
                                    <span id="mobileSpan" class="text-sm flex justify-start text-red-500"></span>
                                </div>
                            </div>
                        </div>
                        <div class="w-full flex justify-center space-x-4">
                            <button onclick="return validateProfileForm()"
                                    class="bg-black text-white uppercase
                                    lg:text-sm sm:text-4xl font-semibold lg:py-3 px-16 sm:py-8 rounded hover:bg-zinc-800">submit
                            </button>
                            <button class="bg-black text-white uppercase
                                    lg:text-sm sm:text-4xl font-semibold lg:py-3 px-16 sm:py-8 rounded hover:bg-zinc-800" onclick="cancelSubmission()">cancel
                            </button>
                        </div>
                        <span id="insertProfileSpan" class="text-sm flex justify-start text-red-500"></span>
                    </div>
                </div>
            </div>
            <div id="loadProfileData"></div>

        </section>

        <!--profile form-->
        <!--<section class="h-screen w-screen bg-gray-400 hidden"  >-->

        <!--</section>-->


        <!--========================================= footer section =============================================-->
        <section class="w-screen h-fit">
            <%@include  file="footer.jsp"%>
        </section>
        <!--<input id="login" class="bg-black text-white">-->

    </body>
</html>
