<%-- Document : admin Created on : Feb 24, 2024, 11:13:36 PM Author : dell --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin Dashboard</title>

        <!--links-->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
              rel="stylesheet" />
        <link rel="stylesheet" href="css/tailwind.output.css" />
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" 
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://unpkg.com/@themesberg/flowbite@1.2.0/dist/flowbite.min.css" />

        <!--scripts-->
        <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
        <script src="js/init-alpine.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
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
        <style>
            #slider::-webkit-scrollbar {
                display: none;
                /* Chrome, Safari, Opera */
            }
        </style>
    </head>

    <body onload="return getAdminData(<%=session.getAttribute("admin_id")%>)">
        <%
            if (session.getAttribute("adminLoggedin") == null) {
                response.sendRedirect("adminLogin.jsp");
            }
        %>
        <div class="flex h-screen bg-gray-50 dark:bg-gray-700" :class="{ 'overflow-hidden': isSideMenuOpen }">
            <!-- Desktop sidebar -->
            <aside class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0">
                <div class="py-4 text-gray-500 dark:text-gray-400">

                    <div class="text-xl ml-4 text-purple-600 flex space-x-2">
                        <p>Welcome</p>
                        <span id="loadAdmin"></span>
                    </div>
                    <ul class="mt-6">
                        <li class="relative px-6 py-3">
                            <span class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                                  aria-hidden="true"></span>
                            <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                               href="#">
                                <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round"
                                     stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
                                     stroke="currentColor">
                                <path
                                    d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6">
                                </path>
                                </svg>
                                <span class="ml-4">Dashboard</span>
                            </a>
                        </li>
                    </ul>
                    <!-- menu options -->

                    <ul onclick="">
                        <!-- products operations-->
                        <li class="relative px-6 py-2 hover:bg-gray-100  dark:hover:bg-gray-800" @click="togglePagesMenu" aria-haspopup="true">
                            <button class="inline-flex items-center justify-between w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <span class="inline-flex items-center">
                                    <img src="images/products.png" class="h-5 w-5">
                                    <span class="ml-4">Products</span>
                                </span>
                                <svg class="w-4 h-4" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                </svg>
                            </button>
                            <template x-if="isPagesMenuOpen">
                                <ul x-transition:enter="transition-all ease-in-out duration-300" x-transition:enter-start="opacity-25 max-h-0" x-transition:enter-end="opacity-100 max-h-xl" x-transition:leave="transition-all ease-in-out duration-300" x-transition:leave-start="opacity-100 max-h-xl" x-transition:leave-end="opacity-0 max-h-0" class="p-2 mt-2 space-y-2 overflow-hidden text-sm font-medium text-gray-500 rounded-md shadow-inner bg-white dark:text-gray-400 dark:bg-gray-900" aria-label="submenu">
                                    <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" 
                                        onclick="return viewProducts('viewProducts')">
                                        <a class="w-full">View Products</a>
                                    </li>
                                    <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" 
                                        onclick="return insertItemForm()">
                                        <a class="w-full">
                                            Insert Products
                                        </a>
                                    </li>
                                    <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" 
                                        onclick="return viewProducts('editProducts')">
                                        <a class="w-full">
                                            Update Products
                                        </a>
                                    </li>
                                    <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" 
                                        onclick="return viewProducts('deleteProducts')">
                                        <a class="w-full">
                                            Delete Products
                                        </a>
                                    </li>

                                </ul>
                            </template>
                        </li>

                        <!-- orders operations-->
                        <li class="relative px-6 py-2 hover:bg-gray-100" onclick="return getOrderDetails()">
                            <button class="inline-flex items-center justify-between w-full text-sm font-semibold  transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <span class="inline-flex items-center">
                                    <img src="images/order2.png" class="h-5 w-5">
                                    <span class="ml-4">Orders</span>
                                </span>
                            </button>
                        </li>

                        <!-- Categories operations-->
                        <li class="relative px-6 py-2 hover:bg-gray-100" onclick="return getCategoryList()">
                            <button class="inline-flex items-center justify-between w-full text-sm font-semibold  transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <span class="inline-flex items-center">
                                    <img src="images/list.png" class="h-5 w-5">
                                    <span class="ml-4">Product Categories</span>
                                </span>
                            </button>
                        </li>

                        <!-- Users operations-->
                        <li class="relative px-6 py-2 hover:bg-gray-100" onclick="return getUserList()">
                            <button class="inline-flex items-center justify-between w-full text-sm font-semibold  transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <span class="inline-flex items-center">
                                    <img src="images/users.png" class="h-6 w-6">
                                    <span class="ml-4">User list</span>
                                </span>
                            </button>
                        </li>

                        <!-- User inquiries-->
                        <li class="relative px-6 py-2 hover:bg-gray-100" onclick="return getInquiryList()">
                            <button class="inline-flex items-center justify-between w-full text-sm font-semibold  transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <span class="inline-flex items-center">
                                    <img src="images/user-inquiries.png" class="h-5 w-5">
                                    <span class="ml-4">User inquiries</span>
                                </span>
                            </button>
                        </li>
                    </ul>

                </div>
            </aside>

            <!-- Mobile sidebar -->
            <!-- Backdrop -->
            <div x-show="isSideMenuOpen" x-transition:enter="transition ease-in-out duration-150"
                 x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
                 x-transition:leave="transition ease-in-out duration-150" x-transition:leave-start="opacity-100"
                 x-transition:leave-end="opacity-0"
                 class="fixed inset-0 z-10 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center">
            </div>
            <aside
                class="fixed inset-y-0 z-20 flex-shrink-0 w-64 mt-16 overflow-y-auto bg-white dark:bg-gray-800 md:hidden"
                x-show="isSideMenuOpen" x-transition:enter="transition ease-in-out duration-150"
                x-transition:enter-start="opacity-0 transform -translate-x-20" x-transition:enter-end="opacity-100"
                x-transition:leave="transition ease-in-out duration-150" x-transition:leave-start="opacity-100"
                x-transition:leave-end="opacity-0 transform -translate-x-20" @click.away="closeSideMenu"
                @keydown.escape="closeSideMenu">
                <div class="py-4 text-gray-500 dark:text-gray-400">
                    <h1 class="pl-10 text-xl font-bold text-gray-900 dark:text-gray-200" href="#">
                        Admin Dashboard
                    </h1>
                    <ul class="mt-6">
                        <li class="relative px-6 py-3">
                            <span class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                                  aria-hidden="true"></span>
                            <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                               href="">
                                <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round"
                                     stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
                                     stroke="currentColor">
                                <path
                                    d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6">
                                </path>
                                </svg>
                                <span class="ml-4">Dashboard</span>
                            </a>
                        </li>
                    </ul>
                    <!-- menu options -->

                    <ul onclick="">
                        <!-- products operations-->
                        <li class="relative px-6 py-3">
                            <button class="inline-flex items-center justify-between w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" @click="togglePagesMenu" aria-haspopup="true">
                                <span class="inline-flex items-center">
                                    <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                                    <path d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z">
                                    </path>
                                    </svg>
                                    <span class="ml-4">Products</span>
                                </span>
                                <svg class="w-4 h-4" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                </svg>
                            </button>
                            <template x-if="isPagesMenuOpen">
                                <ul x-transition:enter="transition-all ease-in-out duration-300" x-transition:enter-start="opacity-25 max-h-0" x-transition:enter-end="opacity-100 max-h-xl" x-transition:leave="transition-all ease-in-out duration-300" x-transition:leave-start="opacity-100 max-h-xl" x-transition:leave-end="opacity-0 max-h-0" class="p-2 mt-2 space-y-2 overflow-hidden text-sm font-medium text-gray-500 rounded-md shadow-inner bg-gray-50 dark:text-gray-400 dark:bg-gray-900" aria-label="submenu">
                                    <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" onclick="return viewProducts('viewProducts')">
                                        <a class="w-full">View Products</a>
                                    </li>
                                    <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" onclick="return insertItemForm()">
                                        <a class="w-full">
                                            Insert Products
                                        </a>
                                    </li>
                                    <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" onclick="return viewProducts('editProducts')">
                                        <a class="w-full">
                                            Update Products
                                        </a>
                                    </li>
                                    <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" onclick="return viewProducts('deleteProducts')">
                                        <a class="w-full">
                                            Delete Products
                                        </a>
                                    </li>
                                </ul>
                            </template>
                        </li>
                        <!-- orders operations-->
                        <li class="relative px-6 py-2 hover:bg-gray-100" onclick="return getOrderDetails()">
                            <button class="inline-flex items-center justify-between w-full text-sm font-semibold  transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <span class="inline-flex items-center">
                                    <img src="images/order2.png" class="h-5 w-5">
                                    <span class="ml-4">Orders</span>
                                </span>
                            </button>
                        </li>

                        <!-- Categories operations-->
                        <li class="relative px-6 py-2 hover:bg-gray-100" onclick="return getCategoryList()">
                            <button class="inline-flex items-center justify-between w-full text-sm font-semibold  transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <span class="inline-flex items-center">
                                    <img src="images/list.png" class="h-5 w-5">
                                    <span class="ml-4">Product Categories</span>
                                </span>
                            </button>
                        </li>

                        <!-- Users operations-->
                        <li class="relative px-6 py-2 hover:bg-gray-100" onclick="return getUserList()">
                            <button class="inline-flex items-center justify-between w-full text-sm font-semibold  transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <span class="inline-flex items-center">
                                    <img src="images/users.png" class="h-6 w-6">
                                    <span class="ml-4">User list</span>
                                </span>
                            </button>
                        </li>

                        <!-- User inquiries-->
                        <li class="relative px-6 py-2 hover:bg-gray-100" onclick="return getInquiryList()">
                            <button class="inline-flex items-center justify-between w-full text-sm font-semibold  transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <span class="inline-flex items-center">
                                    <img src="images/user-inquiries.png" class="h-5 w-5">
                                    <span class="ml-4">User inquiries</span>
                                </span>
                            </button>
                        </li>
                    </ul>
                    <div class="px-6 my-6">
                        <button
                            class="flex items-center justify-between px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                            Create account
                            <span class="ml-2" aria-hidden="true">+</span>
                        </button>
                    </div>
                </div>
            </aside>
            <div class="flex flex-col flex-1 w-full">
                <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
                    <div
                        class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300">
                        <!-- Mobile hamburger -->
                        <button
                            class="p-1 mr-5 -ml-1 rounded-md md:hidden focus:outline-none focus:shadow-outline-purple"
                            @click="toggleSideMenu" aria-label="Menu">
                            <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd"
                                  d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                                  clip-rule="evenodd"></path>
                            </svg>
                        </button>
                        <!-- Search input -->
                        <div class="flex justify-center flex-1 lg:mr-32">
                            <div class="relative w-full max-w-xl mr-6 focus-within:text-purple-500">
                                <div class="absolute inset-y-0 flex items-center pl-2">
                                    <svg class="w-4 h-4" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd"
                                          d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                          clip-rule="evenodd"></path>
                                    </svg>
                                </div>
                                <input
                                    class="w-full pl-8 pr-2 text-sm text-gray-700 placeholder-gray-600 bg-gray-100 border-0 rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-purple-300 focus:outline-none focus:shadow-outline-purple form-input"
                                    type="text" placeholder="Search " aria-label="Search" />
                            </div>
                        </div>
                        <ul class="flex items-center flex-shrink-0 space-x-6">
                            <!-- Theme toggler -->
                            <li class="flex">
                                <button class="rounded-md focus:outline-none focus:shadow-outline-purple"
                                        @click="toggleTheme" aria-label="Toggle color mode">
                                    <template x-if="!dark">
                                        <svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
                                             viewBox="0 0 20 20">
                                        <path
                                            d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z">
                                        </path>
                                        </svg>
                                    </template>
                                    <template x-if="dark">
                                        <svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
                                             viewBox="0 0 20 20">
                                        <path fill-rule="evenodd"
                                              d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
                                              clip-rule="evenodd"></path>
                                        </svg>
                                    </template>
                                </button>
                            </li>
                            <!-- Notifications menu -->
                            <li class="relative">
                                <button
                                    class="relative align-middle rounded-md focus:outline-none focus:shadow-outline-purple"
                                    @click="toggleNotificationsMenu" @keydown.escape="closeNotificationsMenu"
                                    aria-label="Notifications" aria-haspopup="true">
                                    <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                                    <path
                                        d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z">
                                    </path>
                                    </svg>
                                    <!--Notification badge--> 
                                    <span aria-hidden="true"
                                          class="absolute top-0 right-0 inline-block w-3 h-3 transform translate-x-1 -translate-y-1 bg-red-600 border-2 border-white rounded-full dark:border-gray-800"></span>
                                </button>
                                <template x-if="isNotificationsMenuOpen">
                                    <ul x-transition:leave="transition ease-in duration-150"
                                        x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
                                        @click.away="closeNotificationsMenu"
                                        @keydown.escape="closeNotificationsMenu"
                                        class="absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md dark:text-gray-300 dark:border-gray-700 dark:bg-gray-700">
                                        <li class="flex">
                                            <a class="inline-flex items-center justify-between w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                                               href="#">
                                                <span>Messages</span>
                                                <span
                                                    class="inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-red-600 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-600">
                                                    13
                                                </span>
                                            </a>
                                        </li>
                                        <li class="flex">
                                            <a class="inline-flex items-center justify-between w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                                               href="#">
                                                <span>Sales</span>
                                                <span
                                                    class="inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-red-600 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-600">
                                                    2
                                                </span>
                                            </a>
                                        </li>
                                        <li class="flex">
                                            <a class="inline-flex items-center justify-between w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                                               href="#">
                                                <span>Alerts</span>
                                            </a>
                                        </li>
                                    </ul>
                                </template>
                            </li>
                            <!-- Profile menu -->
                            <li class="relative">
                                <button
                                    class="align-middle rounded-full focus:shadow-outline-purple focus:outline-none"
                                    @click="toggleProfileMenu" @keydown.escape="closeProfileMenu"
                                    aria-label="Account" aria-haspopup="true">
                                    <img class="object-cover w-8 h-8 rounded-full"
                                         src="images/admin-2.png"
                                         alt="" aria-hidden="true" />
                                </button>
                                <template x-if="isProfileMenuOpen">
                                    <ul x-transition:leave="transition ease-in duration-150"
                                        x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
                                        @click.away="closeProfileMenu" @keydown.escape="closeProfileMenu"
                                        class="absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md dark:border-gray-700 dark:text-gray-300 dark:bg-gray-700"
                                        aria-label="submenu">
                                        <li class="flex" onclick="adminProfile(<%= session.getAttribute("admin_id")%>)">
                                            <a class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                                               href="#">
                                                <svg class="w-4 h-4 mr-3" aria-hidden="true" fill="none"
                                                     stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                     viewBox="0 0 24 24" stroke="currentColor">
                                                <path
                                                    d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z">
                                                </path>
                                                </svg>
                                                <span>Profile</span>
                                            </a>
                                        </li>
                                        <!--                                        <li class="flex">
                                                                                    <a class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                                                                                       href="#">
                                                                                        <svg class="w-4 h-4 mr-3" aria-hidden="true" fill="none"
                                                                                             stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                                                             viewBox="0 0 24 24" stroke="currentColor">
                                                                                        <path
                                                                                            d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z">
                                                                                        </path>
                                                                                        <path d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                                                                        </svg>
                                                                                        <span>Settings</span>
                                                                                    </a>
                                                                                </li>-->
                                        <li class="flex" onclick="return logoutAdmin()">
                                            <a class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                                               href="#">
                                                <svg class="w-4 h-4 mr-3" aria-hidden="true" fill="none"
                                                     stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                     viewBox="0 0 24 24" stroke="currentColor">
                                                <path
                                                    d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1">
                                                </path>
                                                </svg>
                                                <span>Log out</span>
                                            </a>
                                        </li>
                                    </ul>
                                </template>
                            </li>
                        </ul>
                    </div>
                </header>

                <!------------------------------main----------------------------------->
                <main class="h-full overflow-y-auto" id="main">
                    <div class="container px-6 mx-auto grid">
                        <div class="my-6 w-full h-full">
                            <div class="w-full bg-white dark:bg-gray-800 border h-full flex flex-col items-center">
                                <div class="h-full text-gray-700 w-full grid lg:grid-cols-3 sm:grid-cols-2 gap-y-2 p-10 place-items-center">
                                    <div class="p-4 bg-gray-50 border border-purple-400 w-60 flex flex-col items-center space-y-2 rounded">
                                        <div class="bg-teal-200 rounded-full h-fit p-4">
                                            <img src="images/products.png" class="h-8 w-8">
                                        </div>
                                        <div class="flex flex-col items-center">
                                            <p class="text-3xl font-bold">892</p>
                                            <p class="text-lg">Total Products</p>
                                        </div>
                                    </div>

                                    <div class="p-4 bg-gray-50 border border-purple-400 w-60 flex flex-col items-center space-y-2 rounded">
                                        <div class="bg-orange-300 rounded-full h-fit p-4">
                                            <img src="images/sales.png" class="h-8 w-8">
                                        </div>
                                        <div class="flex flex-col items-center">
                                            <p class="text-3xl font-bold">₹2395</p>
                                            <p class="text-lg">Total Sales</p>
                                        </div>
                                    </div>
                                    <div class="p-4 bg-gray-50 border border-purple-400 w-60 flex flex-col items-center space-y-2 rounded">
                                        <div class="bg-purple-300 rounded-full h-fit p-4">
                                            <img src="images/users.png" class="h-8 w-8">
                                        </div>
                                        <div class="flex flex-col items-center">
                                            <p class="text-3xl font-bold">4</p>
                                            <p class="text-lg">Registered Users</p>
                                        </div>
                                    </div>
                                    <div class="p-4 bg-gray-50 border border-purple-400 w-60 flex flex-col items-center space-y-2 rounded">
                                        <div class="bg-rose-300 rounded-full h-fit p-4">
                                            <img src="images/distributed.png" class="h-8 w-8">
                                        </div>
                                        <div class="flex flex-col items-center">
                                            <p class="text-3xl font-bold">18</p>
                                            <p class="text-lg">Total Categories</p>
                                        </div>
                                    </div>
                                    <div class="p-4 bg-gray-50 border border-purple-400 w-60 flex flex-col items-center space-y-2 rounded">
                                        <div class="bg-sky-300 rounded-full h-fit p-4">
                                            <img src="images/order2.png" class="h-8 w-8">
                                        </div>
                                        <div class="flex flex-col items-center">
                                            <p class="text-3xl font-bold">6</p>
                                            <p class="text-lg">Total Orders</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--dashboard main content loader-->
                    <div class="my-6 w-full text-black" id="loadMainContent">
                    </div>
                    <div class="my-6 w-full text-black" id="loadCategory">
                    </div>
                    <input type="text" id="loadFormdata" hidden>

                </main>

            </div>
        </div>
    </body>

</html>