<%-- 
    Document   : home
    Created on : Feb 15, 2024, 9:32:17 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home Page</title>

        <!--links-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
        <link href="https://tuk.dev/components/E-commerce/Components/carousels/carousel_2"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tw-elements/dist/css/tw-elements.min.css" />
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <!--link and script for sweet alert-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">

        <!--scripts-->
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="js/index.js"></script>
        <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
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
    <body class="h-full w-screen overflow-x-hidden" onload="trendingNow(); topBrands(); topDeals()">
        <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>
        <!-- 25/12/23 -->
        <!--============================================== sub-menu =========================================================-->
        <div
            class="w-screen flex space-x-10 items-center justify-center bg-black h-fit -z-10 border-b-2 border-bronze">
            <div class="h-fit flex flex-col items-center pt-1">
                <div class="h-12 w-12 bg-gray-900 rounded-full outline outline-2 outline-bronze">
                    <a href="kajal-liners-mascara.jsp">
                        <img src="images/category/eyes_icon.avif" class="rounded-full h-full w-full">
                    </a>
                </div>
                <p class="text-lg font-bold text-white">Eyes</p>
            </div>

            <div class="h-fit flex flex-col items-center pt-2">
                <div class="h-12 w-12 bg-gray-900 rounded-full outline outline-2 outline-bronze">
                    <a href="face-foundation-compact.jsp">
                        <img src="images/category/face-new.png" class="rounded-full h-full w-full">
                    </a>
                </div>
                <p class="text-lg font-bold text-white">Face</p>
            </div>

            <div class="h-fit flex flex-col items-center pt-2">
                <div class="h-12 w-12 bg-gray-900 rounded-full outline outline-2 outline-bronze">
                    <a href="lipstic-lipcare.jsp">
                        <img src="images/category/lips-new.jpg" class="rounded-full h-full w-full">
                    </a>
                </div>
                <p class="text-lg font-bold text-white">Lips</p>
            </div>

            <div class="h-fit flex flex-col items-center pt-2">
                <div class="h-12 w-12 bg-gray-900 rounded-full outline outline-2 outline-bronze">
                    <a href="nailpaints-remover.jsp">
                        <img src="images/category/nails.png" class="rounded-full h-full w-full">
                    </a>
                </div>
                <p class="text-lg font-bold text-white">Nails</p>
            </div>

            <div class="h-fit flex flex-col items-center pt-2">
                <div class="h-12 w-12 bg-gray-900 rounded-full outline outline-2 outline-bronze">
                    <a href="skincare.jsp">
                        <img src="images/category/skin.png" class="rounded-full h-full w-full">
                    </a>
                </div>
                <p class="text-lg font-bold text-white">Skin</p>
            </div>
        </div>

        <!--============================================== sub-menu ends=========================================================-->


        <!-- =========================================== main section ================================================-->

        <main class="w-screen sm:w-screen h-fit overflow-x-hidden pb-10 mx-auto" id="loadProducts">

            <!--======================================== carousel section starts ============================================-->

            <section class="block w-screen">
                <div id="default-carousel" class="relative w-screen mx-auto bg-gray-300" data-carousel="slide">
                    <!--Carousel wrapper--> 
                    <div class="relative overflow-hidden lg:h-96 sm:h-96 md:h-96 w-full bg-black max-h-full">
                        <!--Item 1--> 
                        <div class="duration-700 ease-in-out h-full" data-carousel-item >
                            <a href="brandProducts.jsp?brand=lakme">
                                <img src="images/carousel/lakme-banner.webp"
                                     class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                     alt="...">
                            </a>
                        </div>
                        <!--Item 2--> 
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <a href="brandProducts.jsp?brand=nykaa">
                                <img src="images/carousel/nykaa-carousel.jpg"
                                     class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                     alt="...">
                            </a>
                        </div>
                        <!--Item 3--> 
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <a href="brandProducts.jsp?brand=mac">

                                <img src="images/carousel/mac-carousel.avif"
                                     class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                     alt="...">
                            </a>
                        </div>
                        <!--Item 4--> 
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <a href="brandProducts.jsp?brand=maybelline">

                                <img src="images/carousel/maybelline.jpg"
                                     class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                     alt="...">
                            </a>
                        </div>
                        <!--Item 5--> 
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <a href="brandProducts.jsp?brand=sugar">

                                <img src="images/carousel/carousel-1.webp"
                                     class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                     alt="...">
                            </a>
                        </div>
                    </div>
                    <!--Slider indicators--> 
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
                    <!--Slider controls--> 
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
            <!--grid - 1--> 
            <section class="lg:h-fit w-screen" >
                <!--legend--> 
                <form class="lg:px-60 sm:px-12 md:px-40 mt-12">
                    <fieldset class="border-2 border-black border-x-white border-b-white">
                        <legend
                            class="lg:text-center md:text-center sm:text-center font-bold text-2xl text-bronze p-2 uppercase">
                            Trending Now</legend>
                    </fieldset>
                </form>
                <div
                    class="w-fit mx-auto grid sm:grid-cols-2 lg:grid-cols-4 gap-4" id="trendingSection">

                </div>
            </section>

            <!--======================================== carousel-2 section starts ============================================-->

            <section class="w-[90%] p-10 mx-auto">
                <div id="default-carousel" class="relative w-full mx-auto bg-gray-300" data-carousel="slide">
                    <!--Carousel wrapper--> 
                    <div class="relative overflow-hidden lg:h-96 sm:h-96 md:h-96 w-full bg-black max-h-full">
                        <!--Item 1--> 
                        <div class="duration-700 ease-in-out h-full" data-carousel-item >
                            <a href="brandProducts.jsp?brand=biotique">
                                <img src="images/biotique/bio_carousel3.webp"
                                     class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                     alt="...">
                            </a>
                        </div>
                        <!--Item 2--> 
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <a href="brandProducts.jsp?brand=lakme">
                                <img src="images/carousel/lakme-carousel-1.webp"
                                     class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                     alt="...">
                            </a>
                        </div>
                        <!--Item 3--> 
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <a href="brandProducts.jsp?brand=colorbar">

                                <img src="images/colorbar/carousel-2.avif"
                                     class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                     alt="...">
                            </a>
                        </div>
                        <!--Item 4--> 
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <a href="brandProducts.jsp?brand=huda beauty">

                                <img src="images/hudabeauty/carousel-3.avif"
                                     class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                     alt="...">
                            </a>
                        </div>
                        <!--Item 5--> 
                        <div class="duration-700 ease-in-out h-full" data-carousel-item>
                            <a href="brandProducts.jsp?brand=kay beauty">

                                <img src="images/kay/kay-carousel.jpg"
                                     class="absolute block w-full h-full -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"
                                     alt="...">
                            </a>
                        </div>
                    </div>
                    <!--Slider indicators--> 
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
                    <!--Slider controls--> 
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
            <!--======================================== carousel-2 section ends ============================================-->


            <!--grid - 2--> 
            <section class="lg:h-fit w-screen">
                <!--legend--> 
                <form class="lg:px-60 sm:px-12 md:px-40 mt-12">
                    <fieldset class="border-2 border-black border-x-white border-b-white">
                        <legend
                            class="lg:text-center md:text-center sm:text-center font-bold text-2xl text-bronze p-2 uppercase">
                            Deals you can't miss</legend>
                    </fieldset>
                </form>
                <div
                    class="w-fit mx-auto grid sm:grid-cols-2 lg:grid-cols-4 gap-4" id="topDealsSection">
                   

                </div>
            </section>

            <!--grid - 3--> 
            <section class="lg:h-fit w-screen">
                <!--legend--> 
                <form class="lg:px-60 sm:px-12 md:px-40 mt-12">
                    <fieldset class="border-2 border-black border-x-white border-b-white">
                        <legend
                            class="lg:text-center md:text-center sm:text-center font-bold text-2xl text-bronze p-2 uppercase">
                            Top rating Products</legend>
                    </fieldset>
                </form>
                <div
                    class="w-fit mx-auto grid sm:grid-cols-2 lg:grid-cols-4 gap-4" id="topBrandsSection">


                </div>
            </section>
            <!--===================================== grid-items section ends======================================================-->

        </main>
        <!-- =========================================== main section ends ================================================-->

        <!-- Back to top button -->
        <button
            type="button"
            data-te-ripple-init
            data-te-ripple-color="light"
            class="!fixed scroll-to-top-btn bottom-5 right-5 hidden rounded-full bg-white p-3 text-xs font-medium
            uppercase leading-tight text-gray-500 drop-shadow-xl transition duration-150 ease-in-out hover:bg-gray-200
            hover:shadow-2xl focus:bg-gray-200 focus:shadow-2xl focus:outline-none focus:ring-0 active:bg-gray-200 active:shadow-lg"
            id="scrollToTopButton">
            <svg
                aria-hidden="true"
                focusable="false"
                data-prefix="fas"
                class="h-5 w-5"
                role="img"
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 448 512">
            <path
                fill="currentColor"
                d="M34.9 289.5l-22.2-22.2c-9.4-9.4-9.4-24.6 0-33.9L207 39c9.4-9.4 24.6-9.4 33.9 0l194.3 194.3c9.4 9.4 9.4 24.6 0 33.9L413 289.4c-9.5 9.5-25 9.3-34.3-.4L264 168.6V456c0 13.3-10.7 24-24 24h-32c-13.3 0-24-10.7-24-24V168.6L69.2 289.1c-9.3 9.8-24.8 10-34.3.4z"></path>
            </svg>
        </button>

        <!--========================================= footer section starts=============================================-->
        <section class="w-screen">
            <%@include  file="footer.jsp"%>
        </section>
        <!--========================================= footer section ends=============================================-->

        <!--script for scroll to top btn coding-->
        <script>
            window.addEventListener('scroll', function () {
                var scrollHeight = window.scrollY;
                var screenHeight = window.innerHeight;

                var scrollToTopButton = document.getElementById('scrollToTopButton');

                if (scrollHeight > screenHeight) {
                    scrollToTopButton.classList.remove('hidden');
                    scrollToTopButton.classList.add('block');
                    scrollToTopButton.style.opacity = 1;
                } else {
                    scrollToTopButton.classList.remove('block');
                    scrollToTopButton.classList.add('hidden');
                    scrollToTopButton.style.opacity = 0;
                }
            });

            document.getElementById('scrollToTopButton').addEventListener('click', function (e) {
                e.preventDefault();
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            });

        </script>
    </body>
</html>
