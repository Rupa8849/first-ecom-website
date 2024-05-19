<%-- 
    Document   : lipstic
    Created on : Jan 10, 2024, 12:35:10 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%>
<head>
    <!--links-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
    <link href="https://icons8.com/icon/W0xu6u7K9A0F/search" />

    <!--scripts-->
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="../path/to/flowbite/dist/flowbite.min.js"></script>

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
<body>
    <c:if test="${process eq 'displayLipstics'}">
        <!--hello-->
        <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>
        
        <div class="max-w-[1320px] lg:w-1/2 mx-auto text-center p-10 text-5xl ">
            <h1>Lipstics & Lipcares</h1>
            
        </div>
        <div class="py-8 flex justify-between max-w-[1320px] mx-auto lg:space-x-10 sm:space-x-6 lg:w-screen ">

            <!--filter--> 
<!--            <div class="p-1 w-[35%] h-screen">
                <div>
                    <div class="bg-gray-200 w-full flex justify-between p-2"  id="shortByDiv" onclick='showFilterOptions("angle-down", "filter-categories")'>
                        <p class="text-pink-500 ">Short By : <span id="filter-choice"></span></p>
                        <span><i class="fa-solid fa-angle-down" id="angle-down"></i></span>
                    </div>
                    <div id="filter-categories" class="hidden bg-gray-100 w-full flex-col p-2 mt-1">
                        <div class="flex justify-between p-2">
                            <p>Popularity</p>
                            <input type="radio" value="Popularity" id="rbPopularity" name="rb" class="w-4 h-4" onchange="applyFilter()">
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
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down1", "filter-categories1")'>
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
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down2", "filter-categories2")'>
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
                        <div class="flex justify-between p-2">
                            <p>below 10%</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>

                    </div>
                </div>
                <div class="mt-1">
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down3", "filter-categories3")'>
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
            </div>-->

            <!--products--> 
            <div class="max-w-[1320px] mx-auto grid lg:grid-cols-3 md:grid-cols-2 gap-6">
                <%
                    ResultSet lips = (ResultSet) request.getAttribute("result");
                    while (lips.next()) {
                        byte[] content = lips.getBytes("image");
                        String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                        request.setAttribute("imageBt", base64Encoded);
                %>

                <div class="flex-col justify-between relative bg-white max-w-xl overflow-hidden border border-gray-50 bg-white shadow-lg h-full fixed">
                    <a class="px-4 py-2 flex h-fit w-full overflow-hidden justify-center" 
                       id="addToCart" href="productDetails.jsp?id=<%=lips.getInt("product_id")%>" 
                       target="_blank">

                        <img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" class="w-50 h-60 hover:scale-110 duration-500 object-cover" />
                    </a>
                    <div class="mt-4 px-4 pb-5 h-full flex-col justify-between uppercase font-heading ">
                        <div class="">
                            <a href="">
                                <h5 class="truncate text-lg tracking-wide text-slate-900"><%=lips.getString("product_name")%></h5>
                            </a>
                            <div class="my-6 flex-col">
                                <h3 class="flex items-center space-x-4">
                                    <p class="text-2xl font-bold text-slate-900">₹<span><%=lips.getDouble("final_price")%></span></p>
                                    <p class="text-md text-slate-900 line-through">₹<span><%=lips.getDouble("price")%></span></p>
                                </h3>
                                <p class="mt-2"><span><%=lips.getInt("discount_in_pct")%></span>% off</p>
                            </div>
                            <div class="w-full flex-col">
                                <%
                                    if (session.getAttribute("userExists") != null || session.getAttribute("userLoggedin") != null) {
                                %>
                                <button onclick="return addToCart(<%= lips.getInt("product_id")%>,<%= session.getAttribute("userid")%>)" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold 
                                           text-white hover:bg-white hover:text-black hover:border hover:border-black duration-300">
                                    Add to cart</button>
                                <%    
                                    } else {
                                %>
                                
                                <button onclick="return addToCart2()" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold 
                                           text-white hover:bg-white hover:text-black hover:border hover:border-black duration-300">
                                    Add to cart</button>
                               <%
                                    }
                                %>
                               
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>

        </div>


        <!--========================================= footer section starts=============================================-->
        <section class="w-screen h-fit">
            <%@include  file="footer.jsp"%>
        </section>
        <!--========================================= footer section ends=============================================-->
    </c:if>

    <c:if test="${process eq 'displayEyemakeup'}">
        <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>
        <div class="max-w-[1320px] lg:w-1/2 mx-auto text-center p-10 text-5xl ">
            <h1>Eyeliner's & Kajal</h1>
        </div>
        <div class="py-8 flex justify-between max-w-[1320px] mx-auto lg:space-x-10 sm:space-x-6 lg:w-screen ">
            <!--filter--> 
<!--            <div class="p-1 w-[35%] h-screen">
                <div>
                    <div class="bg-gray-200 w-full flex justify-between p-2"  id="shortByDiv" onclick='showFilterOptions("angle-down", "filter-categories")'>
                        <p class="text-pink-500 ">Short By : <span id="filter-choice"></span></p>
                        <span><i class="fa-solid fa-angle-down" id="angle-down"></i></span>
                    </div>
                    <div id="filter-categories" class="hidden bg-gray-100 w-full flex-col p-2 mt-1">
                        <div class="flex justify-between p-2">
                            <p>Popularity</p>
                            <input type="radio" value="Popularity" id="rbPopularity" name="rb" class="w-4 h-4" onchange="applyFilter()">
                            <button onclick="applyFilter()"></button> 
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
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down1", "filter-categories1")'>
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
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down2", "filter-categories2")'>
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
                        <div class="flex justify-between p-2">
                            <p>below 10%</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>

                    </div>
                </div>
                <div class="mt-1">
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down3", "filter-categories3")'>
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
            </div>-->

            <!--products--> 
            <div class="max-w-[1320px] mx-auto grid lg:grid-cols-3 md:grid-cols-2 gap-6">
                <%
                    ResultSet eyes = (ResultSet) request.getAttribute("result");
                    while (eyes.next()) {
                        byte[] content = eyes.getBytes("image");
                        String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                        request.setAttribute("imageBt", base64Encoded);
                %>

                <div class="flex-col justify-between relative bg-white max-w-xl overflow-hidden border border-gray-50 bg-white shadow-lg h-full fixed">
                    <a class="px-4 py-2 flex h-fit w-full overflow-hidden justify-center" 
                       href="productDetails.jsp?id=<%=eyes.getInt("product_id")%>" target="_blank">
                        <img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" class="w-50 h-60 hover:scale-110 duration-500 object-cover" />
                    </a>
                    <div class="mt-4 px-4 pb-5 h-full flex-col justify-between uppercase font-heading ">
                        <div class="">
                            <a href="">
                                <h5 class="truncate text-lg tracking-wide text-slate-900"><%=eyes.getString("product_name")%></h5>
                            </a>
                            <div class="my-6 flex-col">
                                <h3 class="flex items-center space-x-4">
                                    <p class="text-2xl font-bold text-slate-900">₹<span><%=eyes.getDouble("final_price")%></span></p>
                                    <p class="text-md text-slate-900 line-through">₹<span><%=eyes.getDouble("price")%></span></p>
                                </h3>
                                <p class="mt-2"><span><%=eyes.getInt("discount_in_pct")%></span>% off</p>
                            </div>
                            <div class="w-full flex-col">
                                <%
                                    if (session.getAttribute("userExists") != null || session.getAttribute("userLoggedin") != null) {
                                %>
                                <button onclick="return addToCart(<%=eyes.getInt("product_id")%>,<%= session.getAttribute("userid")%>)" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold 
                                           text-white hover:bg-white hover:text-black hover:border hover:border-black duration-300">
                                    Add to cart</button>
                                <%    
                                    } else {
                                %>
                                
                                <button onclick="return addToCart2()" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold 
                                           text-white hover:bg-white hover:text-black hover:border hover:border-black duration-300">
                                    Add to cart</button>
                               <%
                                    }
                                %>
                               
                            </div>
                        </div>


                    </div>
                </div>
                <%
                    }
                %>
            </div>

        </div>


        <!--========================================= footer section starts=============================================-->
        <section class="w-screen h-fit">
            <%@include  file="footer.jsp"%>
        </section>
        <!--========================================= footer section ends=============================================-->
    </c:if>

    <c:if test="${process eq 'displayFacemakeup'}">
        <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>
        <div class="max-w-[1320px] lg:w-1/2 mx-auto text-center p-10 text-5xl ">
            <h1>Face makeups & glowing skin</h1>
        </div>
        <div class="py-8 flex justify-between max-w-[1320px] mx-auto lg:space-x-10 sm:space-x-6 lg:w-screen ">
            <!--filter--> 
<!--            <div class="p-1 w-[35%] h-screen">
                <div>
                    <div class="bg-gray-200 w-full flex justify-between p-2"  id="shortByDiv" onclick='showFilterOptions("angle-down", "filter-categories")'>
                        <p class="text-pink-500 ">Short By : <span id="filter-choice"></span></p>
                        <span><i class="fa-solid fa-angle-down" id="angle-down"></i></span>
                    </div>
                    <div id="filter-categories" class="hidden bg-gray-100 w-full flex-col p-2 mt-1">
                        <div class="flex justify-between p-2">
                            <p>Popularity</p>
                            <input type="radio" value="Popularity" id="rbPopularity" name="rb" class="w-4 h-4" onchange="applyFilter()">
                            <button onclick="applyFilter()"></button> 
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
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down1", "filter-categories1")'>
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
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down2", "filter-categories2")'>
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
                        <div class="flex justify-between p-2">
                            <p>below 10%</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>

                    </div>
                </div>
                <div class="mt-1">
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down3", "filter-categories3")'>
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
            </div>-->

            <!--products--> 
            <div class="max-w-[1320px] mx-auto grid lg:grid-cols-3 md:grid-cols-2 gap-6">
                <%
                    ResultSet face = (ResultSet) request.getAttribute("result");
                    while (face.next()) {
                        byte[] content = face.getBytes("image");
                        String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                        request.setAttribute("imageBt", base64Encoded);
                %>

                <div class="flex-col justify-between relative bg-white max-w-xl overflow-hidden border border-gray-50 bg-white shadow-lg h-full fixed">
                    <a class="px-4 py-2 flex h-fit w-full overflow-hidden justify-center" 
                       href="productDetails.jsp?id=<%=face.getInt("product_id")%>" target="_blank">
                        <img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" class="w-50 h-60 hover:scale-110 duration-500 object-cover" />
                    </a>
                    <div class="mt-4 px-4 pb-5 h-full flex-col justify-between uppercase font-heading ">
                        <div class="">
                            <a href="">
                                <h5 class="truncate text-lg tracking-wide text-slate-900"><%=face.getString("product_name")%></h5>
                            </a>
                            <div class="my-6 flex-col">
                                <h3 class="flex items-center space-x-4">
                                    <p class="text-2xl font-bold text-slate-900">₹<span><%=face.getDouble("final_price")%></span></p>
                                    <p class="text-md text-slate-900 line-through">₹<span><%=face.getDouble("price")%></span></p>
                                </h3>
                                <p class="mt-2"><span><%=face.getInt("discount_in_pct")%></span>% off</p>
                            </div>
                            <div class="w-full flex-col">
                                <%
                                    if (session.getAttribute("userExists") != null || session.getAttribute("userLoggedin") != null) {
                                %>
                                <button onclick="return addToCart(<%= face.getInt("product_id")%>,<%= session.getAttribute("userid")%>)" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold 
                                           text-white hover:bg-white hover:text-black hover:border hover:border-black duration-300">
                                    Add to cart</button>
                                <%    
                                    } else {
                                %>
                                
                                <button onclick="return addToCart2()" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold 
                                           text-white hover:bg-white hover:text-black hover:border hover:border-black duration-300">
                                    Add to cart</button>
                               <%
                                    }
                                %>
                               
                            </div>
                        </div>


                    </div>
                </div>
                <%
                    }
                %>
            </div>

        </div>


        <!--========================================= footer section starts=============================================-->
        <section class="w-screen h-fit">
            <%@include  file="footer.jsp"%>
        </section>
        <!--========================================= footer section ends=============================================-->
    </c:if>

    <c:if test="${process eq 'displayNailmakeup'}">
        <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>
        <div class="max-w-[1320px] lg:w-1/2 mx-auto text-center p-10 text-5xl ">
            <h1>Nailpaints & Remover</h1>
        </div>
        <div class="py-8 flex justify-between max-w-[1320px] mx-auto lg:space-x-10 sm:space-x-6 lg:w-screen ">
            <!--filter--> 
<!--            <div class="p-1 w-[35%] h-screen">
                <div>
                    <div class="bg-gray-200 w-full flex justify-between p-2"  id="shortByDiv" onclick='showFilterOptions("angle-down", "filter-categories")'>
                        <p class="text-pink-500 ">Short By : <span id="filter-choice"></span></p>
                        <span><i class="fa-solid fa-angle-down" id="angle-down"></i></span>
                    </div>
                    <div id="filter-categories" class="hidden bg-gray-100 w-full flex-col p-2 mt-1">
                        <div class="flex justify-between p-2">
                            <p>Popularity</p>
                            <input type="radio" value="Popularity" id="rbPopularity" name="rb" class="w-4 h-4" onchange="applyFilter()">
                            <button onclick="applyFilter()"></button> 
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
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down1", "filter-categories1")'>
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
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down2", "filter-categories2")'>
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
                        <div class="flex justify-between p-2">
                            <p>below 10%</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>

                    </div>
                </div>
                <div class="mt-1">
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down3", "filter-categories3")'>
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
            </div>-->

            <!--products--> 
            <div class="max-w-[1320px] mx-auto grid lg:grid-cols-3 md:grid-cols-2 gap-6">
                <%
                    ResultSet nail = (ResultSet) request.getAttribute("result");
                    while (nail.next()) {
                        byte[] content = nail.getBytes("image");
                        String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                        request.setAttribute("imageBt", base64Encoded);
                %>

                <div class="flex-col justify-between relative bg-white max-w-xl overflow-hidden border border-gray-50 bg-white shadow-lg h-full fixed">
                    <a class="px-4 py-2 flex h-fit w-full overflow-hidden justify-center" 
                       href="productDetails.jsp?id=<%=nail.getInt("product_id")%>" target="_blank">
                        <img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" class="w-50 h-60 hover:scale-110 duration-500 object-cover" />
                    </a>
                    <div class="mt-4 px-4 pb-5 h-full flex-col justify-between uppercase font-heading ">
                        <div class="">
                            <a href="">
                                <h5 class="truncate text-lg tracking-wide text-slate-900"><%=nail.getString("product_name")%></h5>
                            </a>
                            <div class="my-6 flex-col">
                                <h3 class="flex items-center space-x-4">
                                    <p class="text-2xl font-bold text-slate-900">₹<span><%=nail.getDouble("final_price")%></span></p>
                                    <p class="text-md text-slate-900 line-through">₹<span><%=nail.getDouble("price")%></span></p>
                                </h3>
                                <p class="mt-2"><span><%=nail.getInt("discount_in_pct")%></span>% off</p>
                            </div>
                            <div class="w-full flex-col">
                                <%
                                    if (session.getAttribute("userExists") != null || session.getAttribute("userLoggedin") != null) {
                                %>
                                <button onclick="return addToCart(<%= nail.getInt("product_id")%>,<%= session.getAttribute("userid")%>)" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold 
                                           text-white hover:bg-white hover:text-black hover:border hover:border-black duration-300">
                                    Add to cart</button>
                                <%    
                                    } else {
                                %>
                                
                                <button onclick="return addToCart2()" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold 
                                           text-white hover:bg-white hover:text-black hover:border hover:border-black duration-300">
                                    Add to cart</button>
                               <%
                                    }
                                %>
                               
                            </div>
                        </div>


                    </div>
                </div>
                <%
                    }
                %>
            </div>

        </div>


        <!--========================================= footer section starts=============================================-->
        <section class="w-screen h-fit">
            <%@include  file="footer.jsp"%>
        </section>
        <!--========================================= footer section ends=============================================-->
    </c:if>

    <c:if test="${process eq 'displaySkincare'}">
        <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>
        <div class="max-w-[1320px] lg:w-1/2 mx-auto text-center p-10 text-5xl ">
            <h1>Skincare products</h1>
        </div>
        <div class="py-8 flex justify-between max-w-[1320px] mx-auto lg:space-x-10 sm:space-x-6 lg:w-screen ">
            <!--filter--> 
<!--            <div class="p-1 w-[35%] h-screen">
                <div>
                    <div class="bg-gray-200 w-full flex justify-between p-2"  id="shortByDiv" onclick='showFilterOptions("angle-down", "filter-categories")'>
                        <p class="text-pink-500 ">Short By : <span id="filter-choice"></span></p>
                        <span><i class="fa-solid fa-angle-down" id="angle-down"></i></span>
                    </div>
                    <div id="filter-categories" class="hidden bg-gray-100 w-full flex-col p-2 mt-1">
                        <div class="flex justify-between p-2">
                            <p>Popularity</p>
                            <input type="radio" value="Popularity" id="rbPopularity" name="rb" class="w-4 h-4" onchange="applyFilter()">
                            <button onclick="applyFilter()"></button> 
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
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down1", "filter-categories1")'>
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
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down2", "filter-categories2")'>
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
                        <div class="flex justify-between p-2">
                            <p>below 10%</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>

                    </div>
                </div>
                <div class="mt-1">
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down3", "filter-categories3")'>
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
            </div>-->

            <!--products--> 
            <div class="max-w-[1320px] mx-auto grid lg:grid-cols-3 md:grid-cols-2 gap-6">
                <%
                    ResultSet skin = (ResultSet) request.getAttribute("result");
                    while (skin.next()) {
                        byte[] content = skin.getBytes("image");
                        String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                        request.setAttribute("imageBt", base64Encoded);
                %>

                <div class="flex-col justify-between relative bg-white max-w-xl overflow-hidden border border-gray-50 bg-white shadow-lg h-full fixed">
                    <a class="px-4 py-2 flex h-fit w-full overflow-hidden justify-center" 
                       href="productDetails.jsp?id=<%=skin.getInt("product_id")%>" target="_blank">
                        <img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" class="w-50 h-60 hover:scale-110 duration-500 object-cover" />
                    </a>
                    <div class="mt-4 px-4 pb-5 h-full flex-col justify-between uppercase font-heading ">
                        <div class="">
                            <a href="">
                                <h5 class="truncate text-lg tracking-wide text-slate-900"><%=skin.getString("product_name")%></h5>
                            </a>
                            <div class="my-6 flex-col">
                                <h3 class="flex items-center space-x-4">
                                    <p class="text-2xl font-bold text-slate-900">₹<span><%=skin.getDouble("final_price")%></span></p>
                                    <p class="text-md text-slate-900 line-through">₹<span><%=skin.getDouble("price")%></span></p>
                                </h3>
                                <p class="mt-2"><span><%=skin.getInt("discount_in_pct")%></span>% off</p>
                            </div>
                            <div class="w-full flex-col">
                                <%
                                    if (session.getAttribute("userExists") != null || session.getAttribute("userLoggedin") != null) {
                                %>
                                <button onclick="return addToCart(<%= skin.getInt("product_id")%>,<%= session.getAttribute("userid")%>)" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold 
                                           text-white hover:bg-white hover:text-black hover:border hover:border-black duration-300">
                                    Add to cart</button>
                                <%    
                                    } else {
                                %>
                                
                                <button onclick="return addToCart2()" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold 
                                           text-white hover:bg-white hover:text-black hover:border hover:border-black duration-300">
                                    Add to cart</button>
                               <%
                                    }
                                %>
                               
                            </div>
                        </div>


                    </div>
                </div>
                <%
                    }
                %>
            </div>

        </div>


        <!--========================================= footer section starts=============================================-->
        <section class="w-screen h-fit">
            <%@include  file="footer.jsp"%>
        </section>
        <!--========================================= footer section ends=============================================-->
    </c:if>

        
   <c:if test="${process eq 'loadSingleCategory'}">
        <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>
        <div class="max-w-[1320px] lg:w-1/2 mx-auto text-center p-10 text-4xl ">
            <h1 class="uppercase"><%= session.getAttribute("cname")%></h1>
        </div>
        <div class="py-8 flex justify-between max-w-[1320px] mx-auto lg:space-x-10 sm:space-x-6 lg:w-screen ">
            <!--filter--> 
<!--            <div class="p-1 w-[35%] h-screen">
                <div>
                    <div class="bg-gray-200 w-full flex justify-between p-2"  id="shortByDiv" onclick='showFilterOptions("angle-down", "filter-categories")'>
                        <p class="text-pink-500 ">Short By : <span id="filter-choice"></span></p>
                        <span><i class="fa-solid fa-angle-down" id="angle-down"></i></span>
                    </div>
                    <div id="filter-categories" class="hidden bg-gray-100 w-full flex-col p-2 mt-1">
                        <div class="flex justify-between p-2">
                            <p>Popularity</p>
                            <input type="radio" value="Popularity" id="rbPopularity" name="rb" class="w-4 h-4" onchange="applyFilter()">
                            <button onclick="applyFilter()"></button> 
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
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down1", "filter-categories1")'>
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
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down2", "filter-categories2")'>
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
                        <div class="flex justify-between p-2">
                            <p>below 10%</p>
                            <input type="checkbox" class="w-4 h-4">
                        </div>

                    </div>
                </div>
                <div class="mt-1">
                    <div class="bg-gray-200 w-full flex justify-between p-2" onclick='showFilterOptions("angle-down3", "filter-categories3")'>
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
            </div>-->

            <!--products--> 
            <div class="max-w-[1320px] mx-auto grid lg:grid-cols-3 md:grid-cols-2 gap-6">
                <%
                    ResultSet rs = (ResultSet) request.getAttribute("result");
                    while (rs.next()) {
                        byte[] content = rs.getBytes("image");
                        String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                        request.setAttribute("imageBt", base64Encoded);
                %>

                <div class="flex-col justify-between relative bg-white max-w-xl overflow-hidden border border-gray-50 bg-white shadow-lg h-full fixed">
                    <a class="px-4 py-2 flex h-fit w-full overflow-hidden justify-center" 
                       href="productDetails.jsp?id=<%=rs.getInt("product_id")%>" target="_blank">
                        <img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" class="w-50 h-60 hover:scale-110 duration-500 object-cover" />
                    </a>
                    <div class="mt-4 px-4 pb-5 h-full flex-col justify-between uppercase font-heading ">
                        <div class="">
                            <a href="">
                                <h5 class="truncate text-lg tracking-wide text-slate-900"><%=rs.getString("product_name")%></h5>
                            </a>
                            <div class="my-6 flex-col">
                                <h3 class="flex items-center space-x-4">
                                    <p class="text-2xl font-bold text-slate-900">₹<span><%=rs.getDouble("final_price")%></span></p>
                                    <p class="text-md text-slate-900 line-through">₹<span><%=rs.getDouble("price")%></span></p>
                                </h3>
                                <p class="mt-2"><span><%=rs.getInt("discount_in_pct")%></span>% off</p>
                            </div>
                            <div class="w-full flex-col">
                                <%
                                    if (session.getAttribute("userExists") != null || session.getAttribute("userLoggedin") != null) {
                                %>
                                <button onclick="return addToCart(<%= rs.getInt("product_id")%>,<%= session.getAttribute("userid")%>)" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold 
                                           text-white hover:bg-white hover:text-black hover:border hover:border-black duration-300">
                                    Add to cart</button>
                                <%    
                                    } else {
                                %>
                                
                                <button onclick="return addToCart2()" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold 
                                           text-white hover:bg-white hover:text-black hover:border hover:border-black duration-300">
                                    Add to cart</button>
                               <%
                                    }
                                %>
                               
                            </div>
                        </div>


                    </div>
                </div>
                <%
                    }
                %>
            </div>

        </div>


        <!--========================================= footer section starts=============================================-->
        <section class="w-screen h-fit">
            <%@include  file="footer.jsp"%>
        </section>
        <!--========================================= footer section ends=============================================-->
    </c:if>
</body>
