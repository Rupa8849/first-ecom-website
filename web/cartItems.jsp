<%-- 
    Document   : checkout
    Created on : Mar 3, 2024, 2:27:32 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.util.Arrays"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cart items Page</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

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
            };
        </script>       
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="js/index.js"></script>

    </head>
    <body onload="" class="w-screen overflow-x-hidden">

        <!--header-->
        <div class="w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>
        <%    String[] productNames = (String[]) session.getAttribute("productNames");
            Double[] prices = (Double[]) session.getAttribute("prices");
            String base64EncodedImage = (String) session.getAttribute("imageBt");

            if (productNames != null && prices != null && base64EncodedImage != null) {

        %>

        <div class="relative h-screen bg-gray-100 pt-10 overflow-y-auto">
            <h1 class="text-center text-2xl font-bold">My bag (<span><%= productNames.length%></span>)</h1>
            <h1 class="text-center text-2xl font-bold" onclick="return removeCart()">Clear bag</h1>

            <div class="mx-auto max-w-6xl h-3/4 px-6 flex lg:flex-row lg:space-x-6 sm:flex-col overflow-y-auto mb-20 mt-10">
               
                <div class="rounded-lg lg:w-2/3 sm:w-full" id="cartParent">
                    <!-- cart item -->
                    <% if (productNames.length > 0) { %>
                    <% for (int i = 0; i < productNames.length; i++) {%>

                    <div class="flex lg:justify-between mb-2 rounded-lg bg-white p-6 shadow-md sm:justify-start" id="cartItem">

                        <img src="data:image/png;base64,<%= base64EncodedImage %>" alt="Product Image" class="lg:h-24 lg:w-24 sm:h-40 sm:w-40"/>
                        <div class="sm:ml-4 lg:flex sm:flex-col sm:w-full sm:justify-between">
                            <div class="mt-5 sm:mt-0">
                                <h2 class="lg:text-lg sm:text-3xl font-medium text-gray-900"><%= productNames[i]%></h2>
                            </div>
                            <div class="mt-4 flex justify-between">
                                <p class="lg:text-lg sm:text-3xl">₹<span><%= prices[i]%></span></p>

                                <div class="flex justify-center space-x-6">
                                    <div class="flex items-center border-gray-100">
                                        <span class="lg:text-lg sm:text-3xl cursor-pointer rounded-l bg-gray-200  lg:py-1 lg:px-3 sm:py-2 sm:px-6 duration-100 hover:bg-bronze hover:text-white" 
                                              onclick="return decrease()"> - </span>
                                        <input id="inputNumber" class="lg:h-8 lg:w-8 sm:h-12 sm:w-12 border bg-white text-center lg:text-xs outline-none" type="text" disabled="" value="1" min="1" maxlength="2"/>
                                        <button id="btnIncrease" class="lg:text-lg sm:text-3xl cursor-pointer rounded-r bg-gray-200 lg:py-1 lg:px-3 sm:py-2 sm:px-6 duration-100 hover:bg-bronze hover:text-white" 
                                                onclick="return increase()"> + </button>
                                    </div>
                                    <div class="flex justify-center items-center text-red-500 lg:text-xl sm:text-3xl">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <%
                        }
                      }
                    %>
                </div>

                <!-- Sub total starts-->
                <div class="rounded-lg border bg-white lg:p-4 lg:h-[40%] sm:p-8 shadow-md lg:w-[40%] sm:w-[100%] sm:h-[30%]" id="subtotalDiv">
                    <div class="mb-2 flex justify-between lg:text-xl sm:text-3xl">
                        <p class="text-gray-700">Subtotal</p>
                        <p class="text-gray-700">₹ <span>0.00</span></p>
                    </div>
                    <div class="flex justify-between lg:text-xl sm:text-3xl sm:pt-4">
                        <p class="text-gray-700">Shipping</p>
                        <p class="text-gray-700">₹ <span>0.00</span></p>
                    </div>
                    <div class="flex justify-between lg:text-xl sm:text-3xl border-t lg:mt-6 sm:mt-8 lg:pt-2 sm:pt-4">
                        <p class="font-semibold">You Pay</p>
                        <p class="font-semibold">₹ <span>0.00</span></p>
                    </div>
                    <div class="sm:hidden lg:flex justify-between mt-4 w-full border-t pt-4">
                        <div class="flex flex-col">
                            <h1 class="font-bold lg:text-2xl sm:text-3xl">₹<span>0.00</span></h1>
                            <p>Grand Total</p>
                        </div>
                        <a href="addcard.html"><button class="lg:text-lg sm:text-3xl px-6 rounded-md bg-black py-1.5 font-medium text-white hover:bg-zinc-800">Check out</button></a>
                    </div>
                </div>
                <!-- Sub total ends-->

                <div class="lg:hidden bg-white bottom-0 sm:absolute sm:flex justify-between sm:w-full border-t border-bronze p-12">
                    <div class="flex flex-col">
                        <h1 class="font-bold lg:text-2xl sm:text-5xl">₹<span>0.00</span></h1>
                        <p class="sm:text-3xl">Grand Total</p>
                    </div>
                    <a href="addcard.html">
                        <button class="lg:text-xl sm:text-5xl sm:py-4 sm:px-12 rounded-md bg-black font-medium text-white
                                hover:bg-zinc-800">Check out</button>
                    </a>
                </div>

            </div>
        </div>
        <%
        } else {
        %>
        <div class="w-full bg-red-200 lg:flex-row lg:justify-center lg:items-center lg:space-x-5 h-screen sm:flex sm:flex-col overflow-auto">
            <div class="lg:w-1/2 sm:w-full my-8 p-8 relative flex justify-center rounded-lg bg-white shadow-md" id="emptyCart">
                <img src="images/emptybag.webp" class="h-4/5 w-1/2">
                <p class="absolute bottom-2 sm:text-3xl lg:text-xl">Your shopping bag is empty!! 
                    <a href="home.jsp"><button class="bg-black text-white rounded-full ml-2 p-2 px-3 sm:text-3xl lg:text-xl sm:px-5">Start shopping </button></a>
                </p>
            </div>
        </div>
        <%
            }
        %>
        <!--========================================= footer section starts=============================================-->
        <section class="w-screen h-fit lg:flex sm:hidden">
            <%@include  file="footer.jsp"%>
        </section>
        <!--========================================= footer section ends=============================================-->

    </body>
</html>
