<%-- Document : contactus Created on : Jan 10, 2024, 12:23:14 AM Author : dell --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Contact us Page</title>
            <script src="https://cdn.tailwindcss.com"></script>
            <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
            <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>-->
            <script type="text/javascript"
                src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
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

        <body class="lg:h-full w-screen overflow-x-hidden sm:h-screen ">
            <!--header-->
            <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
                <%@include file="header.jsp" %>
            </div>
            <div class="flex w-screen h-screen">
                <!-- COMPONENT CODE -->
                <div class="container mx-auto my-auto px-4 lg:px-20 h-fit p-4">

                    <form id="contactForm">
                        <div
                            class="mx-auto my-auto sm:w-full p-12 py-8 w-3/5 lg:w-3/5 bg-[url('images/blob-scene-haikei.png')] bg-cover shadow-xl border border-bronze rounded-xl">
                            <div class="">
                                <h1 class="uppercase text-3xl text-center font-heading text-zinc-600">Contact Us</h1>
                            </div>
                            <div class="grid grid-cols-1 gap-5 lg:grid-cols-2 mt-5">
                                <div class="flex-col w-full">
                                    <input name="firstname" id="firstname"
                                        class="w-full bg-transparent text-gray-900 mt-2 p-3 border border-gray-600 placeholder-gray-600"
                                        type="text" placeholder="First Name*" />
                                    <span id="fnameSpan" class="text-red-500"></span>
                                </div>
                                <div class="flex-col w-full">
                                    <input name="lastname" id="lastname"
                                        class="w-full bg-transparent text-gray-900 mt-2 p-3 border border-gray-600 placeholder-gray-600"
                                        type="text" placeholder="Last Name*" />
                                    <span id="lnameSpan" class="text-red-500"></span>
                                </div>
                                <div class="flex-col w-full">
                                    <input name="email" id="email"
                                        class="w-full bg-transparent text-gray-900 mt-2 p-3 border border-gray-600 placeholder-gray-600"
                                        type="text" placeholder="Email*" />
                                    <span id="emailSpan" class="text-red-500"></span>
                                </div>
                                <div class="flex-col w-full">
                                    <input name="subject" id="subject"
                                        class="w-full bg-transparent text-gray-900 mt-2 p-3 border border-gray-600 placeholder-gray-600"
                                        type="text" placeholder="Subject*" />
                                    <span id="subjectSpan" class="text-red-500"></span>
                                </div>
                            </div>
                            <div class="my-4 flex-col w-full">
                                <textarea placeholder="Message*" rows="5" class="w-full bg-transparent text-gray-900 mt-2 p-3
                                      border border-gray-600 placeholder-gray-600 focus:outline-pink-900"
                                    name="message" id="message"></textarea>
                                <span id="messageSpan" class="text-red-500"></span>
                            </div>
                            <div class="my-2 w-full lg:w-full mx-auto">
                                <button class="uppercase text-sm font-bold tracking-wide bg-black text-gray-100 p-3 rounded-lg w-full
                                    focus:outline-none focus:shadow-outline hover:bg-zinc-800"
                                    onclick="return sendMessage()">Send Message
                                </button>
                            </div>
                        </div>
                    </form>
                    <div id="loadMessage"></div>
                </div>
            </div>
            <!--========================================= footer section starts=============================================-->
            <section class="w-screen">
                <%@include file="footer.jsp" %>
            </section>
            <!--========================================= footer section ends=============================================-->

        </body>

        </html>