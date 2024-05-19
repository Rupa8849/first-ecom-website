<%-- 
    Document   : orderAjax
    Created on : Mar 25, 2024, 3:22:25 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession" %>


<body>
    <c:if test="${process eq 'checkout'}">
        <input type="text" id="result" value="${result}">
    </c:if>

    <c:if test="${process eq 'viewOrderItems'}">
        <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>


        <div class="relative max-w-[1320px] mx-auto text-black lg:flex lg:flex-row lg:justify-center
             lg:space-x-6 sm:flex sm:flex-col w-screen h-fit mt-4">
            <%                if ((session.getAttribute("userExists") != null) || (session.getAttribute("userLoggedin") != null)) {
            %>
            <div class="lg:w-[60%] sm:w-full space-y-2 mb-10 sm:overflow-x-hidden">
                <!-- login details -->

                <div class="bg-white flex justify-between border items-center px-4 py-2">
                    <div class="text-black flex justify-center items-center space-x-4">
                        <p class="uppercase flex">login </p>
                        <span><img src="images/verify.png" class="h-8 w-8"></span>
                    </div>

                </div>

                <!-- delivery address -->
                <div class="bg-gray-100 border">
                    <div class="flex justify-between items-center p-2">
                        <div class="">
                            <p class="uppercase">Delivery address</p>
                        </div>
                        <div class="p-2">
                            <button class="border border-bronze bg-white hover:bg-zinc-800 hover:text-white hover:border-black text-black px-8 py-2 text-sm uppercase"
                                    onclick="return changeAddress()">add</button>
                        </div>
                    </div>
                    <div id="defaultAddress" class="bg-white w-full h-fit"></div>
                </div>

                <!-- add new address -->
                <div class="bg-white hidden border lg:w-full sm:w-fit" id="addressMainDiv">
                    <div class="p-2 my-auto" id="addNewAddress" onclick="showForm('rbbtn', 'addressForm', 'plussign')">
                        <p class="uppercase flex items-center">
                            <span class="text-2xl" id="plussign">+</span>
                            <span class="hidden" id="rbbtn">
                                <input type="radio" class="h-4 w-4" name="newAddress" value="newAddress" checked>
                            </span>
                            <span class="pl-2">Add New Address</span>
                        </p>
                    </div>

                    <!-- add new address form -->
                    <div class="mx-auto pt-4 p-4 hidden w-[80%] mb-4 bg-gray-200 space-y-4" id="addressForm">
                        <div class="w-full flex justify-center space-x-4 mt-2">
                            <div class="flex-col w-1/2">
                                <textarea id="newAddress" rows="1" class="w-full border border-gray-500 text-gray-500" placeholder="Address"></textarea>
                                <span id="addressSpan" class="text-red-500"></span>
                            </div>
                            <div class="flex-col w-1/2">
                                <div class="relative" id="stateDiv">
                                    <input id="state" type="text" class="w-full py-2 border boredr-1 border-gray-500 text-gray-500"
                                           placeholder="Select State" list="statelist">
                                </div>
                                <span id="stateSpan" class="text-red-500"></span>
                                <datalist class="bg-white px-8 pl-3 text-left mt-1 hidden" id="statelist">
                                    <option class="py-1">Gujarat</option>
                                    <option class="py-1">Maharashtra</option>
                                    <option class="py-1">New Delhi</option>
                                    <option class="py-1">Uttar Pradesh</option>
                                    <option class="py-1">Kerala</option>
                                    <option class="py-1">West Bengal</option>
                                    <option class="py-1">Punjab</option>
                                    <option class="py-1">Haryana</option>
                                    <option class="py-1">Bihar</option>
                                    <option class="py-1">Madhya Pradesh</option>
                                    <option class="py-1">Rajasthan</option>

                                </datalist>
                            </div>
                        </div>
                        <div class="flex justify-center space-x-4 mx-auto mt-2">
                            <div class="w-1/2 flex-col">
                                <input id="city" type="text"
                                       class="w-full py-2 border border border-gray-500 text-gray-500"
                                       placeholder="City">
                                <span id="citySpan" class="text-red-500"></span>
                            </div>
                            <div class="w-1/2 flex-col">
                                <input id="pincode" type="text" class="w-full py-1 border boredr-1 border-gray-500 text-gray-500"
                                       placeholder="Pincode">
                                <span id="pincodeSpan" class="text-red-500"></span>
                            </div>
                        </div>
                        <div class="flex font-semibold space-x-4 mt-2 p-2 justify-center">
                            <button class="p-2 px-16 bg-zinc-800 text-white" onclick="return addAddress(<%= session.getAttribute("userid")%>)">
                                Save</button>
                            <button class="p-2 px-16 bg-zinc-800 text-white">Cancle</button>
                        </div>
                    </div>
                    <!-- add new address form ends-->
                </div>

                <!-- order summery  -->
                <div class="relative bg-white border w-full flex flex-col overflow-y-auto">
                    <div class="sticky top-0 bg-white pt-2 p-4 text-left uppercase">Order summery</div>
                    <div class="lg:w-full h-80 sm:w-full">
                        <%
                            ResultSet rs = (ResultSet) request.getAttribute("result");
                            double totalPrice = 0.0;
                            
                                while (rs.next()) {
                                    byte[] content = rs.getBytes("image");
                                    String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                                    request.setAttribute("imageBt", base64Encoded);

                                totalPrice = rs.getDouble("total_price");
                                session.setAttribute("qntt", rs.getInt("total_quantity"));
                                session.setAttribute("totalOrderPrice", totalPrice);
                        %>

                        <!-- cart item -->
                        <div class="flex lg:justify-between mb-2 bg-white border p-6 shadow-md sm:justify-start cartItem" id="cartItem">

                            <img src="data:image/jpg/jpeg/webp/avif/png;base64,${requestScope["imageBt"]}" alt="Product Image" class="border lg:h-24 lg:w-24 sm:h-40 sm:w-40"/>
                            <div class="sm:ml-4 lg:flex sm:flex-col sm:w-full sm:justify-between">
                                <div class="mt-5 sm:mt-0">
                                    <h2 class="lg:text-lg sm:text-3xl font-medium text-gray-900"><%= rs.getString("product_name")%></h2>
                                </div>
                                <div class="mt-4 flex justify-between">
                                    <div class="flex justify-center space-x-4">
                                        <p class="lg:text-lg sm:text-3xl">unit price : ₹<span id="price" class="price"><%= rs.getDouble("final_price")%></span></p>
                                        <p class="lg:text-lg sm:text-3xl">total : ₹<span id="total_price" class="total_price"><%= rs.getDouble("final_price") * rs.getInt("odqntt")%></span></p>
                                    </div>
                                    <p class="lg:text-lg sm:text-3xl">quantity : <span id="qntty" class="qntty"><%= rs.getInt("odqntt")%></span></p>
                                </div>
                            </div>
                        </div>
                        <%  }
                        %>
                    </div>
                </div>

                <!-- payment option -->
                <div class="shadow-lg border">
                    <div class="bg-white py-3 pl-4">
                        <a class="uppercase">Payment Option</a>
                    </div>
                    <div class="bg-white w-full pt-1 h-fit" id="paymentOptions">
                        <div class="flex items-center p-4 border border-gray-100">
                            <p>
                                <input type="checkbox" name="cod" value="cod" class="h-4 w-4" checked>
                                <span class="pl-4">Cash on Delivery</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- price detail -->
            <div class="lg:w-[30%] sm:w-full h-fit p-4 bg-white py-5 text-left flex flex-col border sticky top-0 ">
                <h1 class="font-semibold text-zinc-500 border-b-2 border-bronze pb-2">PRICE DETAIL</h1>
                <div class="flex flex-col ">

                    <div class="flex justify-between px-2 py-4">
                        <div class="">Bag</div>
                        <div><span id="totalQuantity">(<%= session.getAttribute("qntt")%>)</span> items</div>
                    </div>
                    <div class="flex justify-between px-2 pb-4 border-b-2 border-dotted border-bronze">
                        <div class="">Delivery charges</div>
                        <div>Free delivery</div>
                    </div>
                    <div class="flex justify-between px-2 py-4 font-semibold text-lg border-b-2 mb-2 border-bronze">
                        <div class="">Total Payable</div>
                        <div>₹<span id="totalPayable"><%= session.getAttribute("totalOrderPrice")%></span></div>
                    </div>
                    <button class="lg:text-lg sm:text-3xl px-6 rounded-md bg-zinc-800 py-1.5 font-medium text-white"
                            onclick="return placeOrder(<%= session.getAttribute("userid")%>)">Place Order</button>
                </div>
            </div>

            <div id="loadUserEvents" hidden></div>

            <%
                }else {
            %>

            <div class="relative h-screen flex justify-center">
                <img src="images/login-img.png" class="h-3/4">
                <p class="absolute bottom-40 sm:text-3xl lg:text-xl">Please login first!! 
                    <a href="userLogin.jsp">
                        <button class="bg-zinc-800 text-white hover:bg-zinc-900 rounded-full ml-2 p-2 px-3 sm:text-3xl lg:text-xl sm:px-5">Login </button>
                    </a>
                </p>            
            </div>
            <%}%>

        </div>
        <!--========================================= footer section starts=============================================-->
        <section class="w-screen">
            <%@include file="footer.jsp" %>
        </section>
        <!--========================================= footer section ends=============================================-->
    </c:if>
</body>