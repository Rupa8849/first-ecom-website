<%-- 
    Document   : homepage
    Created on : Jan 7, 2024, 11:42:02 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="../../js/index.js"></script>
        <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
        <link href="https://tuk.dev/components/E-commerce/Components/carousels/carousel_2"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tw-elements/dist/css/tw-elements.min.css" />

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
    <body class="h-full w-screen overflow-x-hidden">
        <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>
        <!-- 25/12/23 -->
        <!--============================================== sub-menu =========================================================-->
        <div
            class="hidden w-screen lg:flex space-x-10 lg:items-center lg:justify-center bg-black h-fit -z-10 border-b-2 border-bronze">
            <div class="h-fit flex flex-col items-center pt-1">
                <div class="h-12 w-12 bg-gray-900 rounded-full outline outline-2 outline-bronze">
                    <a href="">
                        <img src="../../images/category/eyes_icon.avif" class="rounded-full h-full w-full">
                    </a>
                </div>
                <p class="text-lg font-bold text-white">Eyes</p>
            </div>
            <div class="h-fit flex flex-col items-center pt-2">
                <div class="h-12 w-12 bg-gray-900 rounded-full outline outline-2 outline-bronze">
                    <a href="">
                        <img src="../../images/category/face-new.png" class="rounded-full h-full w-full">
                    </a>
                </div>
                <p class="text-lg font-bold text-white">Face</p>
            </div>
            <div class="h-fit flex flex-col items-center pt-2">
                <div class="h-12 w-12 bg-gray-900 rounded-full outline outline-2 outline-bronze">
                    <a href="">
                        <img src="../../images/category/lips-new.jpg" class="rounded-full h-full w-full">
                    </a>
                </div>
                <p class="text-lg font-bold text-white">Lips</p>
            </div>
            <div class="h-fit flex flex-col items-center pt-2">
                <div class="h-12 w-12 bg-gray-900 rounded-full outline outline-2 outline-bronze">
                    <a href="">
                        <img src="../../images/category/nails.png" class="rounded-full h-full w-full">
                    </a>
                </div>
                <p class="text-lg font-bold text-white">Nails</p>
            </div>
            <div class="h-fit flex flex-col items-center pt-2">
                <div class="h-12 w-12 bg-gray-900 rounded-full outline outline-2 outline-bronze">
                    <a href="l">
                        <img src="../../images/category/skin.png" class="rounded-full h-full w-full">
                    </a>
                </div>
                <p class="text-lg font-bold text-white">Skin</p>
            </div>
        </div>

        <!--============================================== sub-menu ends=========================================================-->


        <!-- =========================================== main section ================================================-->

        <main class="w-screen sm:w-screen h-fit overflow-x-hidden">

            <!--======================================== carousel section starts ============================================-->

            <section class="block w-screen">
                <div id="default-carousel" class="relative w-screen mx-auto" data-carousel="slide">
                    <!-- Carousel wrapper -->
                    <div class="relative overflow-hidden sm:h-96 md:h-96 lg:h-80 w-full">
                        <!-- Item 1 -->
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <img src="../../images/carousel/lakme-banner.webp"
                                 class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                 alt="...">
                        </div>
                        <!-- Item 2 -->
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <img src="../../images/carousel/nykaa-carousel.jpg"
                                 class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                 alt="...">
                        </div>
                        <!-- Item 3 -->
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <img src="../../images/carousel/mac-carousel.avif"
                                 class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                 alt="...">
                        </div>
                        <!-- Item 4 -->
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <img src="../../images/carousel/maybelline.jpg"
                                 class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                 alt="...">
                        </div>
                        <!-- Item 5 -->
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <img src="../../images/carousel/carousel-1.webp"
                                 class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                 alt="...">
                        </div>
                    </div>
                    <!-- Slider indicators -->
                    <div class="absolute z-30 flex -translate-x-1/2 bottom-5 left-1/2 space-x-3 rtl:space-x-reverse">
                        <button type="button" class="w-3 h-3 rounded-full" aria-current="true" aria-label="Slide 1"
                                data-carousel-slide-to="0"></button>
                        <button type="button" class="w-3 h-3 rounded-full" aria-current="false" aria-label="Slide 2"
                                data-carousel-slide-to="1"></button>
                        <button type="button" class="w-3 h-3 rounded-full" aria-current="false" aria-label="Slide 3"
                                data-carousel-slide-to="2"></button>
                        <button type="button" class="w-3 h-3 rounded-full" aria-current="false" aria-label="Slide 4"
                                data-carousel-slide-to="3"></button>
                        <button type="button" class="w-3 h-3 rounded-full" aria-current="false" aria-label="Slide 5"
                                data-carousel-slide-to="4"></button>
                    </div>
                    <!-- Slider controls -->
                    <button type="button"
                            class="absolute top-0 start-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none"
                            data-carousel-prev>
                        <span
                            class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
                            <svg class="w-4 h-4 text-white dark:text-gray-800 rtl:rotate-180" aria-hidden="true"
                                 xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M5 1 1 5l4 4" />
                            </svg>
                            <span class="sr-only">Previous</span>
                        </span>
                    </button>
                    <button type="button"
                            class="absolute top-0 end-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none"
                            data-carousel-next>
                        <span
                            class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
                            <svg class="w-4 h-4 text-white dark:text-gray-800 rtl:rotate-180" aria-hidden="true"
                                 xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="m1 9 4-4-4-4" />
                            </svg>
                            <span class="sr-only">Next</span>
                        </span>
                    </button>
                </div>
            </section>
            <!--======================================== carousel section ends ============================================-->



            <!--===================================== grid-items section start======================================================-->
            <!-- grid - 1 -->
            <section class="lg:h-fit w-screen">
                <!-- legend -->
                <form class="lg:px-60 sm:px-12 md:px-40 mt-12">
                    <fieldset class="border-2 border-black border-x-white border-b-white">
                        <legend
                            class="lg:text-center md:text-center sm:text-center font-bold text-2xl text-bronze p-2 uppercase">
                            Trending Now</legend>
                    </fieldset>
                </form>
                <div
                    class="w-fit m-auto grid grid-cols-4 lg:grid-cols-4 gap-x-4 justify-items-center justify-center mb-5">
                    <!-- col - 1 -->
                    <div class="py-6 px-2 h-50 w-72">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit text-left bg-white ">
                            <div class="overflow-hidden w-full">
                                <!--                                <div>
                                                                    <h1 class="text-left pl-1 text-xl text-green-600">Best Seller</h1>
                                                                </div>-->
                                <div class="h-56 w-full p-2">
                                    <img src="../../images/lakme/lakme_liqlip2.webp" class="w-full hover:scale-105 duration-500 rounded-t-xl mx-auto h-full" />
                                </div>
                            </div>
                            <h1 class="bg-black text-white font-medium pl-2 p-4">Naykaa Cosmetic Glamoreyes</h1>
                            <div class="flex gap-2 p-1 pl-2 bg-black text-white">
                                <p class="font-bold">₹399</p>
                                <p>MRP :<span class="line-through pl-2">₹499</span></p>
                            </div>
                            <h1 class="bg-black text-yellow-300 pl-2">25% off</h1>
                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4 pt-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!-- col - 2 -->
                    <div class="py-6 px-2 h-50 w-72">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit text-left bg-white ">
                            <div class="overflow-hidden w-full">
                                <!--                                <div>
                                                                    <h1 class="text-left pl-1 text-xl text-green-600">Best Seller</h1>
                                                                </div>-->
                                <div class="h-56 w-full p-2">
                                    <img src="../../images/lotus/lotus_liqlip3.avif" class="w-full hover:scale-105 duration-500 rounded-t-xl mx-auto h-full" />
                                </div>
                            </div>
                           <h1 class="bg-black text-white font-medium pl-2 p-4">Naykaa Cosmetic Glamoreyes</h1>
                            <div class="flex gap-2 p-1 pl-2 bg-black text-white">
                                <p class="font-bold">₹399</p>
                                <p>MRP :<span class="line-through pl-2">₹499</span></p>
                            </div>
                            <h1 class="bg-black text-yellow-300 pl-2">25% off</h1>

                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4 pt-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!-- col - 3 -->
                    <div class="py-6 px-2 h-50 w-72">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit text-left bg-white ">
                            <div class="overflow-hidden w-full">
                                <!--                                <div>
                                                                    <h1 class="text-left pl-1 text-xl text-green-600">Best Seller</h1>
                                                                </div>-->
                                <div class="h-56 w-full p-2">
                                    <img src="../../images/maybelline/maybelline_liqlip4.avif" class="w-full hover:scale-105 duration-500 rounded-t-xl mx-auto h-full" />
                                </div>
                            </div>
                            <h1 class="bg-black text-white font-medium pl-2 p-4">Naykaa Cosmetic Glamoreyes</h1>
                            <div class="flex gap-2 p-1 pl-2 bg-black text-white">
                                <p class="font-bold">₹399</p>
                                <p>MRP :<span class="line-through pl-2">₹499</span></p>
                            </div>
                            <h1 class="bg-black text-yellow-300 pl-2">25% off</h1>

                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4 pt-4">
                                <button
                                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4">Add
                                    to Bag</button>
                            </div>
                        </div>
                    </div>

                    <!-- col - 4 -->
                    <div class="py-6 px-2 h-50 w-72">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit text-left bg-white ">
                            <div class="overflow-hidden w-full">
                                <!--                                <div>
                                                                    <h1 class="text-left pl-1 text-xl text-green-600">Best Seller</h1>
                                                                </div>-->
                                <div class="h-56 w-full p-2">
                                    <img src="../../images/nykaa/gloss2.avif" class="w-full hover:scale-105 duration-500 rounded-t-xl mx-auto h-full" />
                                </div>
                            </div>
                            <h1 class="bg-black text-white font-medium pl-2 p-4">Naykaa Cosmetic Glamoreyes</h1>
                            <div class="flex gap-2 p-1 pl-2 bg-black text-white">
                                <p class="font-bold">₹399</p>
                                <p>MRP :<span class="line-through pl-2">₹499</span></p>
                            </div>
                            <h1 class="bg-black text-yellow-300 pl-2">25% off</h1>

                            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4 pt-4">
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
                <!-- legend -->
                <form class="lg:px-60 sm:px-12 md:px-40">
                    <fieldset class="border-2 border-black border-x-white border-b-white">
                        <legend
                            class="lg:text-center md:text-center sm:text-center font-bold text-2xl text-bronze p-2 uppercase">
                            Deal's you can't miss</legend>
                    </fieldset>
                </form>
                <div
                    class="w-fit m-auto grid grid-cols-4 lg:grid-cols-4 gap-x-4 justify-items-center justify-center mb-5">
                    <!-- col - 1 -->
                    <div class="py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../../images/sugar/sugar_shadow3.avif"
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
                                <img src="../../images/hudabeauty/huda_shadow4.avif"
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
                                <img src="../../images/lakme/lakme_shadow2.avif"
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
                                <img src="../../images/biotique/biotique_shadow1.avif"
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
                    <fieldset class="border-2 border-black border-x-white border-b-white">
                        <legend
                            class="lg:text-center md:text-center sm:text-center font-bold text-2xl text-bronze p-2 uppercase">
                            Top rating products</legend>
                    </fieldset>
                </form>
                <div
                    class="w-fit m-auto grid grid-cols-4 lg:grid-cols-4 gap-x-4 justify-items-center justify-center mb-5">
                    <!-- col - 1 -->
                    <div class="py-6 px-2 h-50 w-60">
                        <div class="border border-2 border-bronze rounded-xl w-fit h-fit">
                            <div class="overflow-hidden h-[60%] flex justify-center items-center rounded-t-xl w-full">
                                <img src="../../images/lakme/lakme_fond1.avif"
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
                                <img src="../../images/lotus/lotus_fond4.avif"
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
                                <img src="../../images/nykaa/foundation3.avif"
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
                                <img src="../../images/biotique/bio_fond1.avif"
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
            <!--===================================== grid-items section ends======================================================-->

        </main>
        <!-- =========================================== main section ends ================================================-->

        <!--========================================= footer section =============================================-->
        
        <!--<div id="loadImage" class="bg-gray-100"></div>-->
        <section class="w-screen">
            <%@include  file="footer.jsp"%>
        </section>
    </body>
</html>
