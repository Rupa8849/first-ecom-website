<%-- 
    Document   : grids
    Created on : Jan 11, 2024, 10:46:00 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grids Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
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
    <body class="w-screen h-full overflow-x-hidden">
        <%@include file="header.jsp" %>
        <main class="w-fit">
            <!--===================================== grid-items section start======================================================-->
            <!-- grid - 1 -->
            <section class="lg:h-fit w-screen">
                <!-- legend -->
                <form class="lg:px-60 sm:px-12 md:px-40">
                    <fieldset class="border border-2 border-black border-x-0 border-b-0">
                        <legend
                            class="lg:text-center md:text-center sm:text-center font-bold text-2xl text-bronze p-2 uppercase">
                            Trending Now</legend>
                    </fieldset>
                </form>                <!-- product-cards -->
                <div
                    class="w-fit mx-auto grid grid-cols-3 lg:grid-cols-5 md:grid-cols-3 gap-x-4 justify-items-center justify-center mb-5">
                    <!-- col - 1 -->
                    <div class="py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip2.webp"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!-- col - 2 -->
                    <div class="py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip1.webp"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!-- col - 3 -->
                    <div class=" py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip.avif"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!-- col - 4 -->
                    <div class=" py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip.avif"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!-- col - 5 -->
                    <div class=" py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip.avif"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- grid - 2 -->
            <section class="lg:h-fit w-screen">
                <!--legend--> 
                <form class="lg:px-60 sm:px-12 md:px-40">
                    <fieldset class="border border-2 border-black border-x-0 border-b-0">
                        <legend
                            class="lg:text-center md:text-center sm:text-center font-bold text-2xl text-bronze p-2 uppercase">
                            Trending Now</legend>
                    </fieldset>
                </form>                 
                <!--product-cards--> 
                <div
                    class="w-fit mx-auto grid grid-cols-3 lg:grid-cols-5 md:grid-cols-3 gap-x-4 justify-items-center justify-center mb-5">
                    <!--col - 1--> 
                    <div class="py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip2.webp"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!--col - 2--> 
                    <div class="py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip1.webp"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!--col - 3--> 
                    <div class=" py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip.avif"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!--col - 4--> 
                    <div class=" py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip.avif"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!--col - 5--> 
                    <div class=" py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip.avif"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- grid - 3 -->
            <section class="lg:h-fit w-screen">
                <!-- legend -->
                <form class="lg:px-60 sm:px-12 md:px-40">
                    <fieldset class="border border-2 border-black border-x-0 border-b-0">
                        <legend
                            class="lg:text-center md:text-center sm:text-center font-bold text-2xl text-bronze p-2 uppercase">
                            Trending Now</legend>
                    </fieldset>
                </form>                
                <!-- product-cards -->
                <div
                    class="w-fit mx-auto grid grid-cols-3 lg:grid-cols-5 md:grid-cols-3 gap-x-4 justify-items-center justify-center mb-5">
                    <!-- col - 1 -->
                    <div class="py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip2.webp"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!-- col - 2 -->
                    <div class="py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip1.webp"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!-- col - 3 -->
                    <div class=" py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip.avif"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!-- col - 4 -->
                    <div class=" py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip.avif"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!-- col - 5 -->
                    <div class=" py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../images/lakme/lakme_liqlip.avif"
                                     class="h-full hover:scale-105 hover:shadow-md duration-500 border border-gray-200 border-2">
                            </div>
                            <div class="h-[30%] flex-col w-full bg-black text-white text-center pt-2 pb-8">
                                <h1>highlighter</h1>
                                <h1>price :</h1>
                            </div>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </body>
</html>
