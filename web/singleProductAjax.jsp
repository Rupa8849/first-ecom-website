<%-- 
    Document   : eyeliner
    Created on : Jan 10, 2024, 12:32:38 AM
    Author     : dell
--%>

<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eyeliner</title>
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="js/index.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tw-elements/dist/css/tw-elements.min.css" />

        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            gold: '#3f0d12',
                            bronze: '#cd7f32'
                        }
                    }
                }
            }
        </script>
    </head>

    <c:if test="${process eq 'productDetails'}">
        <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>
        <%            ResultSet rs = (ResultSet) request.getAttribute("product");
            while (rs.next()) {
                byte[] content = rs.getBytes("image");
                String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                request.setAttribute("imageBt", base64Encoded);
        %>
        <div class="flex justify-center bg-gray-100">
            <div class="lg:w-[80%] h-screen lg:p-10 sm:p-5">
                <div class="w-fit h-[90%] grid lg:grid-cols-2 sm:grid-cols-1 sm:w-full border">

                    <div class="h-full bg-white flex justify-center rounded">
                        <div class="w-[80%] h-full flex justify-center items-center">
                            <img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" 
                                 class="w-full lg:h-3/4 sm:h-3/4 hover:scale-110 duration-500 object-cover">
                        </div>
                    </div>

                    <div class="h-full border-l flex rounded-r bg-white overflow-auto">
                        <div class="w-full flex flex-col justify-start p-4">
                            <!--name-->
                            <div class="px-6">
                                <p class="font-medium lg:text-xl uppercase sm:text-4xl"><span><%=rs.getString("product_name")%> - </span>
                                    <%=rs.getString("shade_name")%></p>
                            </div>
                            <!--mrp-->
                            <div class="p-6 flex flex-col">
                                <div class="flex space-x-4">
                                    <p class="font-medium lg:text-xl uppercase sm:text-4xl">MRP : ₹<span class="line-through"><%=rs.getDouble("price")%></span></p>
                                    <p class="font-medium lg:text-xl uppercase sm:text-4xl">₹<span><%=rs.getDouble("final_price")%></span></p>
                                </div>
                                <p class="lg:text-xl pt-2 sm:text-3xl"><span><%=rs.getInt("discount_in_pct")%></span>% Off</p>
                            </div>
                            <!--buttons-->
                            <div class="p-2 w-full flex gap-x-4 justify-center">
                                <%
                                    if (session.getAttribute("userExists") != null || session.getAttribute("userLoggedin") != null) {
                                %>
                                <button class="bg-black text-white lg:text-xl sm:text-3xl font-medium lg:py-4 sm:p-6 lg:w-[45%] sm:w-1/2  hover:bg-white hover:text-black
                                        hover:outline hover:outline-bronze duration-500" onclick="return addToCart(<%= session.getAttribute("productid")%>)">Add to bag</button>
                                <%
                                } else {
                                %>

                                <button class="bg-black text-white lg:text-xl sm:text-3xl font-medium lg:py-4 sm:p-6 lg:w-[45%] sm:w-1/2 hover:bg-white hover:text-black
                                        hover:outline hover:outline-bronze duration-500" onclick="return addToCart2()">Add to bag</button>
                                <%
                                    }
                                %>
                                <button class="bg-black text-white lg:text-xl sm:text-3xl font-medium lg:py-4 sm:p-6 lg:w-[45%] sm:w-1/2 hover:bg-white hover:text-black
                                        hover:outline hover:outline-bronze duration-500" onclick="return buyNow()">Buy now</button>
                            </div>
                            <!--discription-->
                            <div class="p-6 h-fit">
                                <p class="font-medium lg:text-2xl sm:text-5xl">Details :</p>
                                <p class="font-medium lg:text-lg sm:text-3xl pt-4"><%=rs.getString("description")%></p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%}%>

        <!--========================================= footer section starts=============================================-->
        <section class="w-screen h-fit">
            <%@include  file="footer.jsp"%>
        </section>
        <!--========================================= footer section ends=============================================-->

    </c:if>

    <c:if test="${process eq 'brandProductDetail'}">
        <!--hello-->
        <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>

        <!--for lakme-->
        <%            if (session.getAttribute("brand") != null) {
                if (session.getAttribute("brand").equals("lakme")) {
        %>
        <div class="max-w-[1320px] lg:w-[75%] h-fit mx-auto text-center mt-10 p-10 text-5xl bg-white">
            <p class="text-3xl mb-4">Buy <span><%= session.getAttribute("brand")%> </span> Products Online</p>
            <div class="border bg-green-200 flex flex-col justify-center space-y-10">
                <div class="bg-gray-100">
                    <video poster="https://images-static.nykaa.com/uploads/37bd95bf-33bb-452e-a1dc-6bbba00c4e6d.png?tr=w-600,cm-pad_resize" loop="" autoplay="" muted="" playsinline="">
                        <source src="https://vtsmedia.nykaa.com/display_network_prod_blue/df45cc07-ced3-43b5-a497-71642c8a5f6a/2pass-abr-vbv/preset1/a6f5a8c24617-794a-5b34-3dec-70cc54fd.mp4" 
                                type="video/mp4"><img alt="Lakme" src="https://images-static.nykaa.com/uploads/37bd95bf-33bb-452e-a1dc-6bbba00c4e6d.png?tr=w-600,cm-pad_resize" loading="eager">
                    </video>
                </div>
                <!--                <div class="bg-gray-200 flex justify-evenly">
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                
                                </div>-->
            </div>
        </div>
        <%
                }
            }
        %>

        <!--for kay beauty-->
        <%
            if (session.getAttribute("brand") != null) {
                if (session.getAttribute("brand").equals("kay beauty")) {
        %>
        <div class="max-w-[1320px] lg:w-[75%] h-fit mx-auto text-center mt-10 p-10 text-5xl bg-white">
            <p class="text-3xl mb-4">Buy <span><%= session.getAttribute("brand")%> </span> Products Online</p>
            <div class="border bg-green-200 flex flex-col justify-center space-y-10">
                <div class="bg-gray-100">
                    <video poster="https://images-static.nykaa.com/uploads/348b1f95-ad4e-4736-af5a-5e41916d5fc5.jpg?tr=w-600,cm-pad_resize" 
                           loop="" autoplay="" muted="" playsinline="">
                        <source src="https://vtsmedia.nykaa.com/display_network_prod_blue/66fa06a8-243e-4e2d-bb47-ea9fe75ca17c/2pass-abr-vbv/preset1/c71ac57ef9ae-74bb-d2e4-e342-8a60af66.mp4" 
                                type="video/mp4"><img alt="kay-beauty-video" src="./Shop For Genuine Kay Beauty Products At Best Price Online_files/348b1f95-ad4e-4736-af5a-5e41916d5fc5.jpg" loading="eager">
                    </video>
                </div>
                <!--                <div class="bg-gray-200 flex justify-evenly">
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                
                                </div>-->
            </div>
        </div>
        <%
                }
            }
        %>

        <!--for loreal paris-->
        <%
            if (session.getAttribute("brand") != null) {
                if (session.getAttribute("brand").equals("loreal")) {
        %>
        <div class="max-w-[1320px] lg:w-[75%] h-fit mx-auto text-center mt-10 p-10 text-5xl bg-white">
            <p class="text-3xl mb-4">Buy <span><%= session.getAttribute("brand")%> </span> Products Online</p>
            <div class="border bg-green-200 flex flex-col justify-center space-y-10">
                <div class="bg-gray-100">
                    <video poster="https://images-static.nykaa.com/uploads/8d8bfe59-c5b5-4810-a000-bd3ff58df1fb.jpg?tr=w-600,cm-pad_resize" 
                           loop="" autoplay="" muted="" playsinline="">
                        <source src="https://vtsmedia.nykaa.com/display_network_prod/4235c9f3-3970-4384-978e-5e8d278190e1/2pass-abr-vbv/preset1/1e091872d8e5-e879-4834-0793-3f9c5324.mp4" 
                                type="video/mp4"><img alt="lorealparis-video" src="https://images-static.nykaa.com/uploads/8d8bfe59-c5b5-4810-a000-bd3ff58df1fb.jpg?tr=w-600,cm-pad_resize" 
                                loading="eager">
                    </video>
                </div>
                <!--                <div class="bg-gray-200 flex justify-evenly">
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                
                                </div>-->
            </div>
        </div>
        <%
                }
            }
        %>

        <!--for Nykaa-->
        <%
            if (session.getAttribute("brand") != null) {
                if (session.getAttribute("brand").equals("nykaa")) {
        %>
        <div class="max-w-[1320px] lg:w-[75%] h-fit mx-auto text-center mt-10 p-10 text-5xl bg-white">
            <p class="text-3xl mb-4">Buy <span><%= session.getAttribute("brand")%> </span> Products Online</p>
            <div class="border bg-green-200 flex flex-col justify-center space-y-10">
                <div class="bg-gray-100">
                    <video poster="https://images-static.nykaa.com/uploads/7904dd28-d828-4eec-951e-58e6ad9a6a20.jpg?tr=w-600,cm-pad_resize" loop="" autoplay="" muted="" playsinline="">
                        <source src="https://vtsmedia.nykaa.com/display_network_prod_blue/0c2d90b9-4035-499f-bb3d-063d42b4ca63/2pass-abr-vbv/preset1/36ac4b24d360-d3bb-f994-5304-9b09d2c0.mp4" 
                                type="video/mp4"><img alt="Nykaa Cosmetics" src="https://images-static.nykaa.com/uploads/7904dd28-d828-4eec-951e-58e6ad9a6a20.jpg?tr=w-600,cm-pad_resize" loading="eager">
                    </video>
                </div>
                <!--                <div class="bg-gray-200 flex justify-evenly">
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                                    <div class="bg-red-500 h-20 w-32">hello</div>
                
                                </div>-->
            </div>
        </div>
        <%
                }
            }
        %>

        <div class="py-8 pt-10 flex justify-between max-w-[1320px] lg:w-[75%] mx-auto lg:space-x-10 sm:space-x-6 ">

            <!--filter--> 
            <div class="p-1 w-[35%] h-screen">
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
            </div>

            <!--products--> 
            <div class="max-w-[1320px] mx-auto grid lg:grid-cols-3 md:grid-cols-2 gap-6">
                <%                    ResultSet brand = (ResultSet) request.getAttribute("product");
                    while (brand.next()) {
                        byte[] content = brand.getBytes("image");
                        String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                        request.setAttribute("imageBt", base64Encoded);
                %>

                <div class="flex-col justify-between relative bg-white max-w-xl overflow-hidden border border-gray-50 bg-white shadow-lg h-full fixed">
                    <a class="px-4 py-2 flex h-fit w-full overflow-hidden justify-center" 
                       id="addToCart" href="productDetails.jsp?id=<%=brand.getInt("product_id")%>" 
                       target="_blank">

                        <img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" class="w-50 h-60 hover:scale-110 duration-500 object-cover" />
                    </a>
                    <div class="mt-4 px-4 pb-5 h-full flex-col justify-between uppercase font-heading ">
                        <div class="">
                            <a href="">
                                <h5 class="truncate text-lg tracking-wide text-slate-900"><%=brand.getString("product_name")%></h5>
                            </a>
                            <div class="my-6 flex-col">
                                <h3 class="flex items-center space-x-4">
                                    <p class="text-2xl font-bold text-slate-900">₹<span><%=brand.getDouble("final_price")%></span></p>
                                    <p class="text-md text-slate-900 line-through">₹<span><%=brand.getDouble("price")%></span></p>
                                </h3>
                                <p class="mt-2"><span><%=brand.getInt("discount_in_pct")%></span>% off</p>
                            </div>
                            <div class="w-full flex-col">
                                <%
                                    if (session.getAttribute("userExists") != null || session.getAttribute("userName") != null) {
                                %>
                                <button onclick="return addToCart()" class="w-full flex items-center justify-center bg-black px-5 py-2.5 text-center text-lg font-semi-bold
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
</html>
