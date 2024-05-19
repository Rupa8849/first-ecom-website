<%-- 
    Document   : cartAjax
    Created on : Mar 21, 2024, 10:53:41 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession" %>

<head>
    <!--<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">-->
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

<c:if test="${process eq 'insertCartItems'}">
    <input type="text" id="result" value="${result}">
</c:if>

<c:if test="${process eq 'viewCartItems'}">

    <div class="h-screen bg-gray-100 pt-10 overflow-y-auto overflow-x-hidden" >
        <div class="flex justify-center space-x-10 items-center bg-white border p-6">
            <h1 class="text-center lg:text-2xl sm:text-4xl font-bold">My bag (<span id="mybag"><%= session.getAttribute("total_quantity")%></span>)</h1>
            <button class="border border-bronze p-2 hover:text-red-500"><p class="text-xl" onclick="return removeAllCartItems(<%= session.getAttribute("userid")%>)">Clear bag</p></button>
        </div>
        <%
            int totalQuantity = (int) session.getAttribute("total_quantity");
            if(session.getAttribute("userExists") != null || session.getAttribute("userLoggedin") != null){
                if (totalQuantity > 0){
        %>
        <div class="mx-auto lg:h-full lg:px-10 pt-6 flex lg:flex-row lg:space-x-6 sm:flex-col sm:px-2 sm:h-2/3 mb-20 relative overflow-y-scroll" id="cartParent">

            <div class="rounded-lg lg:w-2/3 h-fit sm:w-full ">
                <%
                    ResultSet rs = (ResultSet) request.getAttribute("result");
                    double totalPrice = 0.0;
                    while (rs.next()) {
                        byte[] content = rs.getBytes("image");
                        String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                        request.setAttribute("imageBt", base64Encoded);
                        //                         Calculate price for each product 
                        double productPrice = rs.getDouble("final_price") * rs.getInt("item_quantity");
                        totalPrice += productPrice; // Accumulate total price
                %>
                <!-- cart item -->

                <div class="flex lg:justify-between mb-2 rounded-lg bg-white p-6 shadow-md sm:justify-start cartItem" id="cartItem">

                    <img src="data:image/jpg/jpeg/webp/avif/png;base64,${requestScope["imageBt"]}" alt="Product Image" class="border lg:h-24 lg:w-24 sm:h-40 sm:w-40"/>
                    <div class="sm:ml-4 lg:flex sm:flex-col sm:w-full sm:justify-between">
                        <div class="mt-5 sm:mt-0">

                            <h2 class="lg:text-lg sm:text-3xl font-medium text-gray-900"><%= rs.getString("product_name")%></h2>

                        </div>
                        <div class="mt-4 flex justify-between">
                            <p class="lg:text-lg sm:text-3xl">₹<span id="final_price" class="final_price"><%= productPrice%></span></p>

                            <div class="flex justify-center space-x-6">
                                <div class="flex items-center border-gray-100">
                                    <button class="lg:text-lg sm:text-3xl cursor-pointer rounded-l bg-gray-200  lg:py-1 lg:px-3 sm:py-2 sm:px-6 duration-100 hover:bg-bronze hover:text-white" 
                                            onclick="return decrease(this,<%= rs.getInt("product_id")%>,<%= session.getAttribute("userid")%>)"> - </button>
                                    <input id="inputNumber" class="inputNumber lg:h-8 lg:w-8 sm:h-12 sm:w-12 border bg-white text-center lg:text-xs outline-none" type="text" disabled="" value="<%= rs.getInt("item_quantity")%>" min="1" maxlength="2"/>
                                    <button id="btnIncrease" class="lg:text-lg sm:text-3xl cursor-pointer rounded-r bg-gray-200 lg:py-1 lg:px-3 sm:py-2 sm:px-6 duration-100 hover:bg-bronze hover:text-white" 
                                            onclick="return increase(this,<%= rs.getInt("product_id")%>,<%= session.getAttribute("userid")%>)"> + </button>
                                </div>

                                <!--delete icon-->
                                <div class="flex justify-center items-center text-red-500 hover:text-red-400 lg:text-xl sm:text-3xl" onclick="return removeItem(<%= rs.getInt("product_id")%>,<%= session.getAttribute("userid")%>)">
                                    <i class="fa-solid fa-trash-can"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>

            </div>
            <!-- Sub total starts-->
            <div class="lg:sticky lg:top-0 lg:right-0 rounded-lg border bg-white lg:p-4 lg:h-fit sm:p-8 shadow-md lg:w-[40%] sm:w-[100%] sm:h-fit" 
                 id="subtotalDiv">
                <div class="mb-2 flex justify-between lg:text-xl sm:text-3xl">
                    <p class="text-gray-700">Subtotal</p>
                    <p class="text-gray-700">₹ <span id="subtotal"><%= totalPrice%></span></p>
                </div>
                <div class="flex justify-between lg:text-xl sm:text-3xl sm:pt-4">
                    <p class="text-gray-700">Shipping</p>
                    <p class="text-gray-700">₹ <span>0.0</span></p>
                </div>
                <div class="flex justify-between lg:text-xl sm:text-3xl border-t lg:mt-6 sm:mt-8 lg:pt-2 sm:pt-4">
                    <p class="font-semibold">You Pay</p>
                    <p class="font-semibold">₹ <span id="youpay"><%= totalPrice%></span></p>
                </div>
                <div class="sm:hidden lg:flex justify-between mt-4 w-full border-t pt-4">
                    <div class="flex flex-col">
                        <h1 class="font-bold lg:text-2xl sm:text-3xl">₹<span id="grandtotal"><%= totalPrice%></span></h1>
                        <p>Grand Total</p>
                    </div>
                    <a href="">
                        <button class="lg:text-lg sm:text-3xl px-6 rounded-md bg-black py-1.5 font-medium text-white
                                hover:bg-zinc-800" onclick="return checkOut(<%= session.getAttribute("userid")%>)">Check out</button></a>
                </div>
            </div>
            <!-- Sub total ends-->

            <div id="loadCartUpdateResponse" hidden></div>

            <div class="lg:hidden bg-white sm:bottom-0 sm:left-0 sm:fixed sm:flex justify-between sm:w-full border-t border-bronze p-12">
                <div class="flex flex-col">
                    <h1 class="font-bold lg:text-2xl sm:text-5xl">₹<span id="totalpriceSpan"><%= totalPrice%></span></h1>
                    <p class="sm:text-3xl">Grand Total</p>
                </div>
                <a href="">
                    <button class="lg:text-xl sm:text-5xl sm:py-4 sm:px-12 rounded-md bg-black font-medium text-white
                            hover:bg-zinc-800" onclick="return checkOut(<%= session.getAttribute("userid")%>)">Check out</button>
                </a>
            </div>
        </div>
        <%
            } else {
        %>
        <!--empty bag--> 
        <div class="w-screen flex justify-center">
            <div class="lg:w-1/2 sm:w-full my-8 p-8 relative flex justify-center rounded-lg bg-white shadow-lg" >
                <img src="images/emptybag.webp" class="h-4/5 w-1/2">
                <p class="absolute bottom-2 sm:text-3xl lg:text-xl">Your shopping bag is empty!! 
                    <a href="home.jsp"><button class="bg-black text-white hover:bg-zinc-900 rounded-full ml-2 p-2 px-3 sm:text-3xl lg:text-xl sm:px-5">Start shopping </button></a>
                </p>
            </div>
        </div>
        <%
                }   
            } else {
        %>
        <!--empty bag--> 
        <div class="w-screen flex justify-center">
            <div class="lg:w-1/2 sm:w-full my-8 p-8 relative flex justify-center rounded-lg bg-white shadow-lg" >
                <img src="images/emptybag.webp" class="h-4/5 w-1/2">
                <p class="absolute bottom-2 sm:text-3xl lg:text-xl">Your shopping bag is empty!! 
                    <a href="home.jsp"><button class="bg-black text-white hover:bg-zinc-900 rounded-full ml-2 p-2 px-3 sm:text-3xl lg:text-xl sm:px-5">Start shopping </button></a>
                </p>
            </div>
        </div>
        <%
            }   
        %>
        <!--empty bag--> 
        <div class="hidden w-screen flex justify-center" id="emptyCart">
            <div class="lg:w-1/2 sm:w-full my-8 p-8 relative flex justify-center rounded-lg bg-white shadow-lg" >
                <img src="images/emptybag.webp" class="h-4/5 w-1/2">
                <p class="absolute bottom-2 sm:text-3xl lg:text-xl">Your shopping bag is empty!! 
                    <a href="home.jsp"><button class="bg-black text-white hover:bg-zinc-900 rounded-full ml-2 p-2 px-3 sm:text-3xl lg:text-xl sm:px-5">Start shopping </button></a>
                </p>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${process eq 'loadCheckoutPage'}">

    <div class="max-w-[1320px] mx-auto m-2 py-5 text-black flex justify-center space-x-6 w-screen h-full">
        <div class="w-[60%] space-y-4">
            <!-- login details -->
            <div class="bg-white flex justify-between border items-center px-4 py-2">
                <div class="text-black">
                    <p class="uppercase">[1] login <span></span></p>
                    <p>+91<span></span></p>
                </div>
                <div class="p-2">
                    <button class="bg-bronze text-white px-8 py-2 text-sm uppercase">change</button>
                </div>
            </div>

            <!-- delivery address -->
            <div class="bg-gray-200 border">
                <div class="flex justify-between items-center p-4 py-2">
                    <div class="">
                        <p class="uppercase">[2] Delivery address</p>
                        <span></span>
                    </div>
                    <div class="p-2">
                        <button class="bg-bronze text-white px-8 py-2 text-sm uppercase"
                                onclick="return changeAddress()">change</button>
                    </div>
                </div>
                <div class="bg-white p-4 flex justify-between w-full" id="defaultAddress">
                    <div class="w-full">
                        <div class="flex w-full justify-between">
                            <div>
                                <p><input type="radio" name="address" value="Muskan Gupta" checked><span
                                        class="pl-4">Muskan
                                        Gupta</span> - <span class="font-bold">7567285590</span></p>
                                <p class="pl-6">C-421,nitya society,vip road,surat- <span
                                        class="font-bold">394220</span>
                                </p>
                            </div>
                            <div class="">
                                <button class="bg-black text-white px-6 py-2 text-sm uppercase">Edit</button>
                            </div>
                        </div>
                        <div class="hidden flex w-full justify-between" id="address2">
                            <div>
                                <p><input type="radio" name="address" value="Muskan Gupta" checked><span
                                        class="pl-4">Muskan
                                        Gupta</span></p>
                                <p class="pl-6">C-421,nitya society,vip road,surat- <span
                                        class="font-bold">394220</span>
                                </p>
                            </div>
                            <div class="">
                                <button class="bg-black text-white px-6 py-2 text-sm uppercase">Edit</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- add new address -->
            <div class="bg-white hidden" id="addressMainDiv">
                <div class=" p-2 my-auto" id="addNewAddress"
                     onclick="showForm('rbbtn', 'addressForm', 'plussign')">
                    <p class="uppercase flex items-center">
                        <span class="text-2xl" id="plussign">+</span>
                        <span class="hidden" id="rbbtn"><input type="radio" class="h-4 w-4" name="newAddress"
                                                               value="newAddress" checked></span>
                        <span class="pl-2">Add New Address</span>
                    </p>
                </div>
                <!-- add new address form -->
                <div class="w-[90%] mx-auto pt-4 hidden" id="addressForm">
                    <div class="flex justify-center  space-x-4 mx-auto">
                        <input type="text" class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                               placeholder="Name">
                        <input type="text" class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                               placeholder="Mobile no">
                    </div>
                    <div class="flex justify-center space-x-4 mx-auto mt-2">
                        <input type="text" class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                               placeholder="Pincode">
                        <input type="text" class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                               placeholder="Locality">
                    </div>
                    <div class="flex justify-center  space-x-4 mx-auto mt-2">
                        <textarea cols="55" rows="3"
                                  class="pl-2 px-8 border boredr-1 border-gray-500 text-gray-500"
                                  placeholder="Address">
                        </textarea>
                    </div>
                    <div class="flex justify-center space-x-4 mx-auto mt-2">
                        <div>
                            <input type="text"
                                   class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                                   placeholder="City">
                        </div>
                        <div>
                            <div class="relative" id="stateDiv"
                                 onclick="showFilterOptions('angle-down', 'statelist')">
                                <i class="fa-solid fa-angle-down absolute top-4 right-2" id="angle-down"></i>
                                <input type="text"
                                       class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                                       placeholder="Select State">
                            </div>
                            <ul class="bg-gray-100 px-8 pl-3 text-left mt-1 hidden" id="statelist">
                                <li class="py-1">Gujarat</li>
                                <li class="py-1">Maharashtra</li>
                                <li class="py-1">New Delhi</li>
                                <li class="py-1">UP</li>
                            </ul>
                        </div>
                    </div>
                    <div class="flex justify-center  space-x-4 mx-auto mt-2">
                        <input type="text" class="px-8 pl-2 py-1 border boredr-1 border-gray-500 text-gray-500"
                               placeholder="Landmark (optional)">
                        <input type="text" class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                               placeholder="Alternate phone no(optional)">
                    </div>
                    <div class="flex-col p-2  mt-2">
                        <p class="text-xs">Address Type</p>
                        <div class="flex">
                            <p><input type="radio" name="address" value="Muskan Gupta" checked
                                      class="h-4 w-4"><span class="pl-4">Home
                                    (All
                                    day delivery)</span></p>
                            <p><input type="radio" name="address" value="Muskan Gupta"
                                      class="h-4 w-4 ml-8"><span class="pl-4">Work
                                    (Delivery between 10AM - 5PM)</span></p>
                        </div>
                    </div>
                    <div class="flex font-semibold space-x-4 mt-2 p-2 justify-start ml-12 mb-2">
                        <button class="p-2 px-6 bg-bronze text-white" onclick="return changeAddress()">Save and
                            Deliver
                            here</button>
                        <button class="p-2 px-10 bg-bronze text-white">Cancle</button>
                    </div>
                </div>
                <!-- add new address form ends-->
            </div>

            <!-- order summery  -->
            <div class="bg-white border">
                <div class=" h-20 pt-2 p-10 text-left">[3] <span>Order summery</span></div>
                <!-- <div class="flex">
            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26">
                <g fill="none" fill-rule="evenodd">
                    <path d="M-7-7h40v40H-7z" />
                    <path fill="#ED232A" d="M0 0h26v26H0" />
                    <path fill="#FFF" d="M4.6 4.6h16.8v16.8H4.6" />
                    <path fill="#FFF" d="M11.7 0h2.6v26h-2.6" />
                    <path fill="#FFF" d="M0 11.7h26v2.6H0" />
                    <path fill="#004C8F" d="M9 9h8v8H9" />
                </g>
            </svg>
            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27">
                <g fill="none" fill-rule="evenodd">
                    <path d="M-7-7h40v40H-7z" />
                    <path fill="#16D"
                        d="M12.6 27C5.4 26.5-.2 20.4 0 13 .2 6 6.2 0 13.5 0S26.8 5.8 27 13c.2 7.4-5.4 13.5-12.6 14V16c1-.5 1.7-1.6 1.5-2.8-.4-1.2-1.4-2-2.6-2s-2.2.8-2.4 2c0 1.2.5 2.3 1.6 2.7" />
                </g>
            </svg>
            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="28">
                <g fill="none" fill-rule="evenodd">
                    <path d="M-7-6h40v40H-7z" />
                    <path fill="#F99D27"
                        d="M7.5 6c6.3-6.2 14-8 17-3.6 3 4.3.4 13-6 19.2-6.2 6.3-14 8-17 3.6-3-4.3-.3-13 6-19.2" />
                    <path fill="#B02A30"
                        d="M11.7 2.7c-.7.5-1.4 1-2 1.8-5.6 5.5-8 13-5.2 16.7 2.8 3.8 9.6 2.4 15.3-3 3-3 5-6.5 6-9.7 0-2.4-.2-4.5-1.3-6C22-1 17-.5 11.7 2.5" />
                    <path fill="#FFF"
                        d="M19.3 2.5c.7.7.3 2.4-1 3.6-1.3 1.7-3 2-3.6 1-.8-.3-.3-2 1-3.2 1.2-1.3 3-1.7 3.6-1zm-4.5 22.2c-3 2.2-6 3.3-9 3 1.3 0 2.3-1.4 3-3.3 1-2 1.5-3.7 2-5.4.5-2.6.5-4.5.2-5-.5-.6-1.7-.4-3 .4-.6.3-1.4 0-.4-1 1-1.3 5-4.2 6.3-4.6 1.2-.5 3 0 2.3 1.8-.4 1.3-5.8 15.6-1.8 14z" />
                </g>
            </svg>
            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="24">
                <g fill="none" fill-rule="evenodd">
                    <path d="M-6-8h40v40H-6z" />
                    <path fill="#BC4170" d="M28 24h-8.7L14 15h8.7m-4.4-7.6L8.7 24H0L14 0" />
                </g>
            </svg>
            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="24"
                xmlns:xlink="http://www.w3.org/1999/xlink">
                <defs>
                    <path id="a" d="M28 0H0v23.8h28V0z" />
                </defs>
                <g fill="none" fill-rule="evenodd">
                    <path d="M-6-8h40v40H-6z" />
                    <mask id="b" fill="#fff">
                        <use xlink:href="#a" />
                    </mask>
                    <path fill="#003874"
                        d="M0 12C0 5.2 6.3 0 14 0s14 5.3 14 12c0 6.5-6.3 11.8-14 11.8s-14-5.3-14-12"
                        mask="url(#b)" />
                    <path fill="#ED1C24" d="M12.3 3.8l3.2-1V20l-3.2 1.2" mask="url(#b)" />
                    <path fill="#FFF"
                        d="M14.2 14.7C12.8 16.3 11.4 18 9 18c-3.7 0-5.4-3.4-5.4-6.3 0-2.8 1.3-6 4.8-6 1.5 0 3 1 4 2V10c-1-.7-2.5-1-3.6-1-2.2 0-4.2.7-4 3 0 1.4 1.4 2.4 3 2.4 2.2 0 3.6-2 4.7-3.6L14 9c1-1.6 2.6-3.2 5-3.2 3 0 4.7 2.4 5.2 5H23c-.5-1-1.5-1.4-2.6-1.4-2.3 0-3.8 2-5 3.7l-1.2 2zM24.5 13c-.3 2.6-1.7 5-4.8 5-1.8 0-3.2-1-4.2-2.6v-1.7c1.3.6 2.4 1.2 3.8 1.2 1.7 0 3.2-1 3.8-2h2z"
                        mask="url(#b)" />
                </g>
            </svg>
        </div> -->
            </div>

            <!-- payment option -->
            <!-- <div class="bg-blue-200 h-20 pt-2 p-10 text-left">[3] <a href="payment2.html">Payment Option</a></div> -->
            <div class="shadow-lg border">
                <div class="bg-white py-3 pl-4" onclick="return showForm('paymentOptions', '', '')">
                    <a class="uppercase">[4] Payment Option</a>
                </div>
                <div class="bg-white w-full pt-1 hidden h-fit mb-4" id="paymentOptions">
                    <div class="flex items-center p-4 border border-gray-100">
                        <p><input type="radio" name="cards" value="UPI" class="h-4 w-4"><span
                                class="pl-4">UPI</span>
                        </p>
                    </div>
                    <div class="flex items-center p-4 border border-gray-100">
                        <p><input type="radio" name="cards" value="wallets" class="h-4 w-4"><span
                                class="pl-4">Wallets</span></p>
                    </div>
                    <div class="flex items-center p-4 border border-gray-100">
                        <p><input type="radio" name="cards" value="credit" class="h-4 w-4"><span
                                class="pl-4">Credit
                                card</span></p>
                    </div>
                    <div class="flex items-center p-4 border border-gray-100">
                        <p><input type="radio" name="cards" value="debit" class="h-4 w-4"><span
                                class="pl-4">Debit
                                card</span></p>
                    </div>
                    <div class="flex items-center p-4 border border-gray-100">
                        <p><input type="radio" name="cards" value="netbanking" class="h-4 w-4"><span
                                class="pl-4">Net
                                Banking</span></p>
                    </div>
                    <div class="flex items-center p-4 border border-gray-100">
                        <p><input type="radio" name="cards" value="cod" class="h-4 w-4"><span class="pl-4">Cash
                                on
                                Delivery</span></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- price detail -->
        <div class="w-[30%] p-4 bg-white py-5 text-left h-[40%] flex flex-col border">
            <h1 class="font-semibold text-zinc-500 border-b-2 border-bronze pb-2">PRICE DETAIL</h1>
            <div class="flex flex-col ">
                <div class="flex justify-between px-2 py-4">
                    <div class="">Price (<span>4</span>) items</div>
                    <div>₹<span>4200</span></div>
                </div>
                <div class="flex justify-between px-2 pb-4 border-b-2 border-dotted border-bronze">
                    <div class="">Delivery charges</div>
                    <div>₹<span>200</span></div>
                </div>
                <div class="flex justify-between px-2 py-4 font-semibold text-lg border-b-2 border-bronze">
                    <div class="">Total Payable</div>
                    <div>₹<span>4400</span></div>
                </div>
            </div>

        </div>
    </div>
</c:if>

<c:if test="${process eq 'increaseCartItems'}">
    <input type="text" id="result" value="${result}">
</c:if>

<c:if test="${process eq 'decreaseCartItems'}">
    <input type="text" id="result" value="${result}">
</c:if>

<c:if test="${process eq 'removeItem'}">
    <input type="text" id="result" value="${result}">
</c:if>

<c:if test="${process eq 'removeAllCartItems'}">
    <input type="text" id="result" value="${result}">
</c:if>

