<%-- Document : heade Created on : Jan 7, 2024, 11:42:23 PM Author : dell --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
        <link href="https://icons8.com/icon/W0xu6u7K9A0F/search" />
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

    <body class="w-screen">
        <!--====================================== header ==================================================-->
        <!--<header class="">-->

        <!-- navbar -->
        <div class="flex flex-wrap place-items-center w-screen sticky">
            <section class="relative mx-auto h-full w-screen">
                <nav class="flex justify-between bg-bronze text-lg text-white border-b sm:h-32 lg:h-fit py-1">
                    <div class="flex w-screen items-center justify-between">
                        <div class="flex w-fit items-center h-full">
                            <a class="text-3xl font-bold font-heading pl-2" href="#">

                                <!--logo-->
                                <img class="lg:h-14 sm:h-24" src="images/pretty-eralogo.png" alt="logo"> 
                            </a>
                            <!-- Nav Links -->
                            <ul class="sm:hidden md:hidden lg:flex font-heading space-x-4">
                                <li data-dropdown-toggle="dropdownHover" data-dropdown-trigger="hover"><a
                                        class="py-1" href="home.jsp">Home</a></li>
                                <li data-dropdown-toggle="dropdownHover" data-dropdown-trigger="hover"><a
                                        class="py-1" href="#">Categories</a></li>
                                <li data-dropdown-toggle="brandhover" data-dropdown-trigger="hover">
                                    <a class="py-1" href="#">Brands</a>
                                </li>
                                <li><a class="py-1" href="#">Beauty Advice</a></li>
                                <li><a class="py-1" href="aboutus.jsp">About us</a></li>
                                <li><a class="py-1" href="contactus.jsp">Contact us</a></li>
                            </ul>
                        </div>

                        <!-- Header Icons -->
                        <div class="flex mr-12 space-x-6">
                            <!----------------------searchbar------------------------>

                            <div class="flex items-center w-80">
                                <div class="relative text-gray-600 mr-2 overflow-hidden w-full ">
                                    <button type="submit" class="absolute left-0 lg:top-0 sm:top-1 mt-3 lg:ml-4 sm:ml-2">
                                        <img src="images/search-icon.gif" alt="" class="bg-transparent lg:h-4 lg:w-4 sm:h-8 sm:w-8" />
                                    </button>
                                    <input type="search" name="search" placeholder="Search on PrettyEra"
                                           class="w-full lg:py-2 pl-10 sm:py-4 sm:text-2xl rounded-lg lg:text-sm focus:outline-none">
                                </div>
                            </div>

                            <div class="lg:flex space-x-2 sm:hidden items-center">

                                <!-- Sign In / Register  icon    -->
                                <a class="flex items-center  flex-row space-x-2" href="userLogin.jsp"
                                   id="profile">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 hover:text-gray-200"
                                         fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                    </svg>

                                    <!--if already registered-->
                                    <%
                                        if (session.getAttribute("userExists") != null) {
                                            String name = (String) session.getAttribute("name");
                                    %>
                                    <p class="hover:text-gray-200"><%= name%></p>
                                    <i class="fas fa-sign-out-alt text-white text-xl font-medium hover:text-gray-200" onclick="return logout()"></i>
                                    <%
                                    } else if (session.getAttribute("userName") != null) {
                                        String fname = (String) session.getAttribute("fname");
                                    %>
                                    <p class="hover:text-gray-200"><%= fname%></p>
                                    <i class="fas fa-sign-out-alt text-white text-xl font-medium" onclick="return logout()"></i>
                                    <%
                                    } else {
                                    %>
                                    <p>login</p>
                                    <%
                                        }
                                    %>
                                    <!--<p id="loadUserName"></p>-->
                                </a>


                                <!--                                <a class="hidden text-blue-500 items-center hover:text-gray-200 flex-col"
                                                                   id="profile2">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 hover:text-gray-200"
                                                                         fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                                          d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                                                    </svg>
                                                                </a>-->



                                <!--wishlist icon-->
                                <!-- <a class="hover:text-gray-200" href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none"
                                        viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke - linecap="round" stroke - linejoin="round" stroke - width="2"
                                            d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                    </svg>
                                </a> -->

                                <!--shopping bag icon-->
                                <a class="lg:flex items-center hover:text-gray-200" href="cartItems.jsp">
                                    <svg viewBox="0 0 72 72" class="lg:h-6 lg:w-6 sm:h-10 font-bold" xmlns="http://www.w3.org/2000/svg">
                                    <g style="fill:none;stroke:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;stroke-width:6;">
                                    <path d="m36.0015 60.9598h-25l5-39.9583h2.5697"/><path d="m25.7466 21.0015h10.2548"/>
                                    <path d="m36.0015 60.9598h25l-5-39.9583h-2.5697"/><path d="m46.2563 21.0015h-10.2547"/><path d="m22.049 27.662v-6.6199c0-7.7544 6.2862-14.0406 14.0406-14.0406s14.0406 6.2862 14.0406 14.0406v6.6199"/></g></svg>

                                    <span class="flex absolute -mt-4 ml-4">
                                        <%
                                            if (request.getParameter("productCount") != null) {
                                                String count = (String) request.getParameter("productCount");
                                        %>
                                        <span id="productCount" class="bg-red-500 text-white rounded-full text-xs w-4 h-4 flex
                                              items-center justify-center absolute -top-2 -right-3 border"><%= count%></span>
                                        <%
                                        } else {
                                        %>
                                        <span id="productCount" class="bg-red-500 text-white rounded-full text-xs w-4 h-4 flex
                                              items-center justify-center absolute -top-2 -right-3 border">0</span>
                                        <%
                                            }
                                        %>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Responsive navbar -->
                    <a class="lg:hidden  flex mr-6 items-center justify-center space-x-6" href="cartItems.jsp">
                        <div><svg viewBox="0 0 72 72" class="h-6 w-6 font-bold" xmlns="http://www.w3.org/2000/svg"><g style="fill:none;stroke:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;stroke-width:6"><path d="m36.0015 60.9598h-25l5-39.9583h2.5697"/><path d="m25.7466 21.0015h10.2548"/><path d="m36.0015 60.9598h25l-5-39.9583h-2.5697"/><path d="m46.2563 21.0015h-10.2547"/><path d="m22.049 27.662v-6.6199c0-7.7544 6.2862-14.0406 14.0406-14.0406s14.0406 6.2862 14.0406 14.0406v6.6199"/></g></svg>    
                            <span class="flex absolute -mt-4 ml-4">
                                <span id="productCount" class="bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center absolute -top-2 -right-4">0</span>
                            </span>
                        </div>
                        <i class="fas fa-sign-out-alt text-white text-xl font-medium hover:text-gray-200" onclick="return logout()"></i>

                    </a>

                    <a class="navbar-burger self-center mr-12 lg:hidden" href="#">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 hover:text-gray-200" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke - linecap="round" stroke - linejoin="round" stroke - width="2"
                              d="M4 6h16M4 12h16M4 18h16" />
                        </svg>
                    </a>
                </nav>

                <!--=============================================menus on categories hover=======================================-->
                <div id="dropdownHover"
                     class="z-10 hidden bg-white divide-x divide-gray-100 shadow w-fit dark:bg-gray-700 flex ">
                    <ul class="text-sm text-gray-700 dark:text-gray-200 bg-slate-100"
                        aria-labelledby="dropdownHoverButton pl-40">
                        <div>
                            <li class="font-bold text-center">Lip</li>
                        </div>
                        <a href="lipstic-lipcare.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">lipstick
                            & liners
                        </a>
                        <a href="lipstic-lipcare.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">lipbalm
                        </a>
                        <a href="lipstic-lipcare.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">gloss
                        </a>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownHoverButton">
                        <div>
                            <li class="font-bold text-center">Eyes</li>
                        </div>
                        <a href="kajal-liners-mascara.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Eyeliners
                        </a>
                        <a href="kajal-liners-mascara.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Kajal
                            & kohl
                        </a>
                        <a href="kajal-liners-mascara.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Mascara
                        </a>
                        <a href="kajal-liners-mascara.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Eye
                            shadow
                        </a>
                        </a>
                        </li>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200 bg-slate-100"
                        aria-labelledby="dropdownHoverButton">
                        <div>
                            <li class="font-bold text-center">Face</li>
                        </div>
                        <a href="face-foundation-compact.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Foundation
                        </a>
                        <a href="face-foundation-compact.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Primer
                        </a>
                        <a href="face-foundation-compact.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Blush
                        </a>
                        <a href="face-foundation-compact.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Highlighter
                        </a>
                        <a href="face-foundation-compact.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Conceler
                        </a>
                        <a href="face-foundation-compact.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Compact
                        </a>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200 bg-white"
                        aria-labelledby="dropdownHoverButton">
                        <div>
                            <li class="font-bold text-center">Nails</li>
                        </div>
                        <a href="nailpaints-remover.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Nail
                            colors
                        </a>
                        <a href="nailpaints-remover.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Polish
                            remover
                        </a>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200 bg-slate-100"
                        aria-labelledby="dropdownHoverButton">
                        <div>
                            <li class="font-bold text-center">Skincare</li>
                        </div>
                        <a href="skincare.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Moisturizers
                        </a>
                        <a href="skincare.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Serums
                        </a>
                        <a href="skincare.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Sun
                            protection
                        </a>
                        <a href="skincare.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Face
                            cleanness
                        </a>
                        <a href="skincare.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Makeup
                            remover
                        </a>
                        <a href="skincare.jsp"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Masks
                            & facial kits
                        </a>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200 bg-white"
                        aria-labelledby="dropdownHoverButton">
                        <div>
                            <li class="font-bold text-center">Shop by concern</li>
                        </div>
                        <a href="products/lipstick2.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Glowing
                            Skin
                        </a>
                        <a href="products/nayka_lipbalm.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Hydration
                        </a>
                        <a href="products/nayka_gloss.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Anti-Ageing
                        </a>
                        <a href="products/nayka_gloss.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Dryness
                            control
                        </a>
                        <a href="products/nayka_gloss.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Oil
                            control
                        </a>
                        <a href="products/nayka_gloss.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Eye
                            care
                        </a>
                        <a href="products/nayka_gloss.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Lip
                            care
                        </a>
                    </ul>
                </div>

                <!--===========================================menus on brand hover=====================================-->
                <div id="brandhover"
                     class="z-10 hidden bg-white divide-x divide-gray-100 shadow w-2/4 justify-center dark:bg-gray-700 flex">

                    <!-- searchbar -->
                    <!-- <ul class="text-sm text-gray-700 dark:text-gray-200 bg-slate-100" aria-labelledby="dropdownHoverButton">
                            <li>
                                <div class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                                    <div>component
                                        <div class="relative text-gray-600">
                                            <input type = "search" name = "serch" placeholder = "Search" class="bg-white h-10 px-5 pr-10 text-sm focus:outline-none">
                                            
                                            <a id = "searchbtn" onclick = "displayBrandProducts()" class="absolute right-0 top-0 mt-3 mr-4">
                                                <svg class="h-4 w-4 fill-current" xmlns="http://www.w3.org/2000/svg"
                                                        xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1"
                                                        x="0px" y="0px" viewBox="0 0 56.966 56.966"
                                                        style="enable-background:new 0 0 56.966 56.966;" xml:space="preserve"
                                                        width="512px" height="512px">
                                                        <path d = "M55.146,51.887L41.588,37.786c3.486-4.144,5.396-9.358,5.396-14.786c0-12.682-10.318-23-23-23s-23,10.318-23,23  s10.318,23,23,23c4.761,0,9.298-1.436,13.177-4.162l13.661,14.208c0.571,0.593,1.339,0.92,2.162,0.92  c0.779,0,1.518-0.297,2.079-0.837C56.255,54.982,56.293,53.08,55.146,51.887z M23.984,6c9.374,0,17,7.626,17,17s-7.626,17-17,17  s-17-7.626-17-17S14.61,6,23.984,6z" /> 
                                                </svg> 
                                            </a> 
                                        </div> 
                                    </div> 
                                </div> 
                            </li>
                        </ul> -->

                    <ul class="text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownHoverButton">
                        <a href="brandProducts.jsp?brand=lakme"
                           class="block px-8 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                            <div>
                                <img src="images/brands/Lakme_118x55pxls.avif">
                            </div>
                        </a>
                        <a href="brandProducts.jsp?brand=biotique"
                           class="block px-8 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                            <div>
                                <img src="images/brands/Biotique_new.avif">
                            </div>
                        </a>
                        <a href="brandProducts.jsp?brand=colorbar"
                           class="block px-8 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                            <div>
                                <img src="images/brands/colorbar-logoforui.avif">
                            </div>
                        </a>
                        <a href="brandProducts.jsp?brand=huda beauty"
                           class="block px-8 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                            <div>
                                <img src="images/brands/Huda.avif">
                            </div>
                        </a>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownHoverButton">
                        <a href="brandProducts.jsp?brand=kay beauty"
                           class="block px-8 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                            <div>
                                <img src="images/brands/kay-beauty.avif">
                            </div>
                        </a>
                        <a href="brandProducts.jsp?brand=sugar"
                           class="block px-8 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                            <div>
                                <img src="images/brands/1549261786_sugar.webp">
                            </div>
                        </a>
                        <a href="brandProducts.jsp?brand=loreal"
                           class="block px-8 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                            <div>
                                <img src="images/brands/lorealparis.avif">
                            </div>
                        </a>
                        <a href="brandProducts.jsp?brand=mac"
                           class="block px-8 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                            <div>
                                <img src="images/brands/mac.avif">
                            </div>
                        </a>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownHoverButton">
                        <a href="brandProducts.jsp?brand=lotus"
                           class="block px-8 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                            <div>
                                <img src="images/brands/LOTUS-HERBALS.avif">
                            </div>
                        </a>
                        <a href="brandProducts.jsp?brand=maybelline"
                           class="block px-8 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                            <div>
                                <img src="images/brands/Maybelline1211.avif">
                            </div>
                        </a>
                        <a href="brandProducts.jsp?brand=nykaa"
                           class="block px-8 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                            <div>
                                <img src="images/brands/nykaa-cosmetics.avif">
                            </div>
                        </a>
                        <a href="brandProducts.jsp?brand=nyx"
                           class="block px-8 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                            <div>
                                <img src="images/brands/nyx_New.avif">
                            </div>
                        </a>
                    </ul>
                </div>
                <!--=========================================== menus on luxe hover ======================================-->
                <div id="luxeHover"
                     class="z-10 hidden bg-white divide-x divide-gray-100 shadow w-fit dark:bg-gray-700 flex ">
                    <ul class="text-sm text-gray-700 dark:text-gray-200 bg-slate-100"
                        aria-labelledby="dropdownHoverButton pl-40">
                        <div>
                            <li class="font-bold text-center">Makeup
                        </div>
                        <div>
                            <a href="products/cat_liqlip.html"
                               class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Face
                            </a>
                            <a href="products/cat_liqlip.html"
                               class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Eyes
                            </a>
                            <a href="products/cat_liqlip.html"
                               class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Makeup
                                kit
                            </a>
                            <a href="products/cat_liqlip.html"
                               class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Lips
                            </a>
                            <a href="products/cat_liqlip.html"
                               class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Nails
                            </a>
                            <a href="products/cat_liqlip.html"
                               class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Tools
                                & Brushes
                            </a>
                            <a href="products/cat_liqlip.html"
                               class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Top
                                Brands
                            </a>
                        </div>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownHoverButton">
                        <div>
                            <li class="font-bold text-center">Skin</li>
                        </div>
                        <a href="products/cat_eyeliner.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Face
                        </a>
                        <a href="products/cat_kajal.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Lip
                            care
                        </a>
                        <a href="products/cat_mascara.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Shop
                            by concern
                        </a>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200 bg-slate-100"
                        aria-labelledby="dropdownHoverButton">
                        <div>
                            <li class="font-bold text-center">
                                Fragrance
                        </div>
                        <a href="lipstick2.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Men's
                            fragrance
                        </a>
                        <a href="products/nayka_lipbalm.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Women's
                            fragrance
                        </a>
                        <a href="products/nayka_gloss.html"
                           class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Deodorants
                        </a>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200"
                        aria-labelledby="dropdownHoverButton">
                        <div>
                            <li class="font-bold text-center">Hair
                        </div>
                        <a href="lipstick2.html"class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Hair care
                        </a>
                        <a href="products/nayka_lipbalm.html" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Tools
                        </a>
                        <a href="products/nayka_lipbalm.html" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Hair styling
                        </a>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200 bg-slate-100 px-4" aria-labelledby="dropdownHoverButton">
                        <div>
                            <li  class="font-bold text-center">Bath & Body
                        </div>
                        <a href="lipstick2.html" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Bath
                        </a>
                        <a href="products/nayka_lipbalm.html" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Body
                        </a>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200 px-4" aria-labelledby="dropdownHoverButton">
                        <div>
                            <li class="font-bold text-center">Trending now
                        </div>
                        <a href="products/lipstick2.html" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Natural
                        </a>
                        <a href="products/nayka_lipbalm.html" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Vitamin C
                        </a>
                        <a href="products/nayka_gloss.html" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Hyaluronic Acid
                        </a>
                    </ul>
                    <ul class="text-sm text-gray-700 dark:text-gray-200 bg-slate-100 px-4" aria-labelledby="dropdownHoverButton">
                        <div>
                            <li class="font-bold text-center">Appliances
                        </div>
                    </ul>
                </div>
            </section>
        </div>
        <!--<div id="loadUserData"></div>-->


    </body>
</html>