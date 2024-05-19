<%-- 
    Document   : loadProducts
    Created on : Jan 22, 2024, 12:47:17 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="../../js/index.js"></script>
        <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
        <link href="https://tuk.dev/components/E-commerce/Components/carousels/carousel_2"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tw-elements/dist/css/tw-elements.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
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
    <body class="h-full w-screen overflow-x-hidden bg-gray-100">
        <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="../mainPages/header.jsp" %>
        </div>

        <!--breadcrumb start-->
        <div class="w-screen py-4">
            <nav class="flex" aria-label="Breadcrumb">
                <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
                    <li class="inline-flex items-center ml-8">
                        <a href="#"
                           class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
                            <!-- <svg class="w-3 h-3 me-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                              viewBox="0 0 20 20">
                              <path
                                d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z" />
                            </svg> -->
                            Home
                        </a>
                    </li>
                    <li>
                        <div class="flex items-center">
                            <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                 fill="none" viewBox="0 0 6 10">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="m1 9 4-4-4-4" />
                            </svg>
                            <a href="#"
                               class="ms-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ms-2 dark:text-gray-400 dark:hover:text-white">Projects</a>
                        </div>
                    </li>
                    <li aria-current="page">
                        <div class="flex items-center">
                            <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                 fill="none" viewBox="0 0 6 10">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="m1 9 4-4-4-4" />
                            </svg>
                            <span class="ms-1 text-sm font-medium text-gray-500 md:ms-2 dark:text-gray-400">Flowbite</span>
                        </div>
                    </li>
                </ol>
            </nav>
        </div>
        <!--breadcrumb ends-->

        <!--main content-->
        <div class="max-w-[1320px] lg:w-1/2 mx-auto text-center p-10 text-5xl">
            <h1>Liquid lipstic & liners</h1>
        </div>
        <div class="flex justify-between max-w-[1320px] mx-auto lg:space-x-10 sm:space-x-6 lg:w-screen ">
            <!-- filter -->
            <div class="p-1 w-[35%] h-screen">
                <div>
                    <div class="bg-white w-full flex justify-between p-2"  id="shortByDiv" onclick='showFilterOptions("angle-down", "filter-categories")'>
                        <p class="text-pink-500 ">Short By : <span id="filter-choice"></span></p>
                        <span><i class="fa-solid fa-angle-down" id="angle-down"></i></span>
                    </div>
                    <div id="filter-categories" class="hidden bg-gray-100 w-full flex-col p-2 mt-1">
                        <div class="flex justify-between p-2">
                            <p>Popularity</p>
                            <input type="radio" value="Popularity" id="rbPopularity" name="rb" class="w-4 h-4" onchange="applyFilter()">
                            <!-- <button onclick="applyFilter()">btn</button> -->
                        </div>
                        <div class="flex justify-between p-2">
                            <p>New Arrivals</p>
                            <input type="radio" value="New Arrivals" id="rbNew" name="rb" class="w-4 h-4" onchange="applyFilter()">
                        </div>
                        <div class="flex justify-between p-2">
                            <p>Price : High to low</p>
                            <input type="radio" value="Price : High to low" id="rbHightolow" name="rb" class="w-4 h-4" onchange="applyFilter()">
                        </div>
                        <div class="flex justify-between p-2">
                            <p>Price : Low to high</p>
                            <input type="radio" value="Price : Low to high" id="rbLowtohigh" name="rb" class="w-4 h-4" onchange="applyFilter()">
                        </div>
                    </div>
                </div>
                <div class="mt-3">
                    <div class="bg-white w-full flex justify-between p-2" onclick='showFilterOptions("angle-down1", "filter-categories1")'>
                        <p>Price : </p>
                        <span><i class="fa-solid fa-angle-down" id="angle-down1"></i></span>
                    </div>
                    <div id="filter-categories1" class="hidden bg-white w-full flex-col px-2 mt-1">
                        <div class="flex justify-between p-2">
                            <p>₹0 - ₹499</p>
                            <input type="checkbox" value="" class="w-4 h-4">
                        </div>
                        <div class="flex justify-between p-2">
                            <p>₹499 - ₹999</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>
                        <div class="flex justify-between p-2">
                            <p>₹999 - ₹1999</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>
                        <div class="flex justify-between p-2">
                            <p>₹1999 - ₹3999</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>

                    </div>
                </div>
                <div class="mt-1">
                    <div class="bg-white w-full flex justify-between p-2" onclick='showFilterOptions("angle-down2", "filter-categories2")'>
                        <p>Discount : </p>
                        <span><i class="fa-solid fa-angle-down" id="angle-down2"></i></span>
                    </div>
                    <div id="filter-categories2" class="hidden bg-white w-full flex-col px-2 mt-1">
                        <div class="flex justify-between p-2">
                            <p>50% and Above</p>
                            <input type="checkbox" value="" class="w-4 h-4">
                        </div>
                        <div class="flex justify-between p-2">
                            <p>40% to 50%</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>
                        <div class="flex justify-between p-2">
                            <p>30% to 40%</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>
                        <div class="flex justify-between p-2">
                            <p>20% to 30%</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>
                        <div class="flex justify-between p-2">
                            <p>10% to 20%</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>

                    </div>
                </div>
                <div class="mt-1">
                    <div class="bg-white w-full flex justify-between p-2" onclick='showFilterOptions("angle-down3", "filter-categories3")'>
                        <p>Category : </p>
                        <span><i class="fa-solid fa-angle-down" id="angle-down3"></i></span>
                    </div>
                    <div id="filter-categories3" class="hidden bg-white w-full flex-col px-2 mt-1">
                        <div class="flex justify-between p-2">
                            <p>Skin</p>
                            <input type="checkbox" value="" class="w-4 h-4">
                        </div>
                        <div class="flex justify-between p-2">
                            <p>Bath & Body</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>
                        <div class="flex justify-between p-2">
                            <p>Hair</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>
                        <div class="flex justify-between p-2">
                            <p>Makeup</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>
                    </div>
                </div>
            </div>

            <!-- products -->
            <div class="max-w-[1320px] mx-auto grid lg:grid-cols-3 md:grid-cols-2  gap-6 px-[20px] h-fit">
                <div class="text-center shadow-lg shadow-gray-400 overflow-hidden bg-white py-2 h-fit">
                    <div class="overflow-hidden">
                        <div>
                            <h1 class="text-left pl-1 text-xl text-green-600">Best Seller</h1>
                        </div>
                        <div class="h-56 w-full">
                            <img src="../../images/lakme/lakme_fond3.avif" class="hover:scale-110 duration-500 p-2 mx-auto h-full" />
                        </div>
                    </div>
                    <h1 class="text-xl">Naykaa Cosmetic GLAMOreyes
                        Coloured Liquid Eyeliner
                    </h1>
                    <div class="flex justify-center gap-2 p-1">
                        <p class="font-bold">₹399</p>
                        <p>MRP: <span class="line-through">₹499</span></p>
                        <p>25% off</p>
                    </div>
                    <div class="flex items-center justify-center">
                        <!--<p class="text-red-500">Extra 10% off</p>-->

                        <!-- 28/12/23 start -->

                        <!-- TW Elements is free under AGPL, with commercial license required for specific uses. See more details: https://tw-elements.com/license/ and contact us for queries at tailwind@mdbootstrap.com -->
                        <div class="flex justify-start p-2 gap-4">

                            <div class="flex">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-red-600" viewBox="0 0 16 16">
                                <path
                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-yellow-600"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-yellow-600"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>

                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-green-600"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z" />
                                </svg>

                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-green-600"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
                                </svg>
                            </div>
                        </div>
                        <!-- 28/12/23 close -->
                    </div>
                    <div class="h-[10%] border border-2 bg-black mx-auto w-3/4 rounded-md">
                        <button class="h-full border-bronze hover:bg-bronze text-white rounded w-full p-3">Add
                            to card
                        </button>
                    </div>
                </div>
                <div class="text-center shadow-lg shadow-gray-400 overflow-hidden bg-white py-2 h-fit">
                    <div class="overflow-hidden h-[50%]">
                        <div>
                            <h1 class="text-left pl-1 text-xl text-green-600">Best Seller</h1>
                        </div>
                        <div class="h-56 w-full">
                            <img src="../../images/lakme/lakme_lipbalm2.avif"
                                 class="hover:scale-110 duration-500 h-full p-2 mx-auto " />
                        </div>
                    </div>
                    <h1 class="text-xl">Naykaa Cosmetic GLAMOreyes
                        Coloured Liquid Eyeliner
                    </h1>
                    <div class="flex justify-center gap-2 p-1">
                        <p class="font-bold">₹399</p>
                        <p>MRP: <span class="line-through">₹499</span></p>
                        <p>25% off</p>
                    </div>
                    <div class="flex flex-col items-center">
                        <p class="text-red-500">Extra 10% off</p>

                        <!-- 28/12/23 start -->

                        <!-- TW Elements is free under AGPL, with commercial license required for specific uses. See more details: https://tw-elements.com/license/ and contact us for queries at tailwind@mdbootstrap.com -->
                        <div class="flex justify-start p-2 gap-4">

                            <div class="flex">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-red-600" viewBox="0 0 16 16">
                                <path
                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-yellow-600"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-yellow-600"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>

                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-green-600"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z" />
                                </svg>

                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-green-600"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
                                </svg>
                            </div>
                        </div>
                        <!-- 28/12/23 close -->
                    </div>
                    <div class="h-[10%] border border-2 bg-black mx-auto w-3/4 rounded-md">
                        <button class="h-full border-bronze hover:bg-bronze text-white rounded w-full p-3">Add
                            to card
                        </button>
                    </div>
                </div>
                <div class="text-center shadow-lg shadow-gray-400 overflow-hidden bg-white  py-2 h-fit">
                    <div class="overflow-hidden">
                        <div>
                            <h1 class="text-left pl-1 text-xl text-green-600">Best Seller</h1>
                        </div>
                        <div class="h-56 w-full">
                            <img src="../../images/lakme/lakme_liqlip1.webp"
                                 class="hover:scale-110 duration-500 h-full p-2 mx-auto" />
                        </div>
                    </div>
                    <h1 class="text-xl">Naykaa Cosmetic GLAMOreyes
                        Coloured Liquid Eyeliner
                    </h1>
                    <div class="flex justify-center gap-2 p-1">
                        <p class="font-bold">₹399</p>
                        <p>MRP: <span class="line-through">₹499</span></p>
                        <p>25% off</p>
                    </div>
                    <div class="flex flex-col items-center">
                        <p class="text-red-500">Extra 10% off</p>

                        <!-- 28/12/23 start -->

                        <!-- TW Elements is free under AGPL, with commercial license required for specific uses. See more details: https://tw-elements.com/license/ and contact us for queries at tailwind@mdbootstrap.com -->
                        <div class="flex justify-start p-2 gap-4">

                            <div class="flex">
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-red-600" viewBox="0 0 16 16">
                                <path
                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-yellow-600"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-yellow-600"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                </svg>

                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-green-600"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z" />
                                </svg>

                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="text-yellow-500 w-5 h-auto fill-current hover:text-green-600"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
                                </svg>
                            </div>
                        </div>
                        <!-- 28/12/23 close -->
                    </div>
                    <div class="h-[10%] border border-2 bg-black mx-auto w-3/4 rounded-md">
                        <button class="h-full border-bronze hover:bg-bronze text-white rounded w-full p-3">Add
                            to card
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
