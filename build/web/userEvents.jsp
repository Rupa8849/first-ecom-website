<%-- 
    Document   : userEvents
    Created on : Mar 29, 2024, 2:38:54 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%><!DOCTYPE html>


<c:if test="${process eq 'addAddress'}">
    <input type="text" id="result" value="${result}">
</c:if>

<c:if test="${process eq 'viewAddress'}">
    <%
        ResultSet rs = (ResultSet) request.getAttribute("result");
        if (rs.next()) {
            do {
    %>
    <div class="bg-white border p-4 flex justify-between w-full" id="">
        <div class="w-full">
            <div class="flex w-full justify-between">
                <div>
                    <div>
                        <input type="radio" name="address" id="address" value="<%= rs.getInt("address_id")%>" checked>
                        <span class="pl-4"><%= rs.getString("first_name")%> <%= rs.getString("last_name")%>
                            - <%= rs.getString("mobile_no")%></span>
                    </div>
                    <div class="pl-6">
                        <span><%= rs.getString("address")%>,</span>
                        <span><%= rs.getString("city")%>,</span>
                        <span><%= rs.getString("state")%></span>
                        <span> - <%= rs.getString("pincode")%></span>
                    </div>
                </div>
                <div class="">
                    <!--<button class="bg-zinc-800 text-white px-6 py-2 text-sm uppercase">Edit</button>-->
                </div>
            </div>
        </div>
    </div>
    <%
        } while (rs.next());
    } else {
    %>
    <p class="text-center text-red-500 text-xl py-2" id="">No address found!!</p>
    <!-- add new address -->
    <div class="bg-white border lg:w-full sm:w-fit" id="addressMainDiv">
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

    <%}%>
</c:if>

<c:if test="${process eq 'updateOrder'}">
    <input type="text" id="result" value="${result}">
</c:if>

<c:if test="${process eq 'myOrders'}">
    hello
</c:if>

<c:if test="${process eq 'userProfile'}">

    <div class="h-screen w-screen flex justify-center items-center overflow-y-scroll">
        <div class="lg:w-1/2 sm:w-full lg:h-fit sm:h-3/4 border border-bronze rounded-md">
            <div class="bg-purple-200 lg:h-fit sm:h-1/2 flex justify-center items-center p-6 rounded-md">

                <div
                    class="bg-white border border-bronze overflow-auto lg:w-3/4 lg:h-3/4 p-6 sm:w-full sm:h-full lg:flex
                    lg:flex-row sm:flex justify-center sm:flex-col lg:items-start space-x-4">
                    <div class="lg:w-fit sm:w-full sm:h-1/2 flex justify-center">
                        <div class="justify-start bg-gray-100 lg:h-40 lg:w-40 sm:h-full sm:w-80 rounded-full">
                            <img src="images/user1.png" class="h-full w-full">
                        </div>
                    </div> 
                    <%
                        ResultSet profile = (ResultSet) request.getAttribute("profile");
                        while (profile.next()) {
                    %>
                    <div class="lg:h-full lg:w-2/3 overflow-x-hidden sm:w-[90%] sm:h-1/2 p-2 lg:flex lg:justify-between sm:text-center lg:text-xl sm:text-5xl">
                        <div class="text-left space-y-2">
                            <p class="uppercase"><span><%= profile.getString("first_name")%> <%= profile.getString("last_name")%></span></p>
                            <p><%= profile.getString("email")%></p>
                            <p><%= profile.getString("mobile_no")%></p>
                        </div>
                        <div class="flex items-center lg:w-fit h-fit sm:w-full sm:mt-4 sm:justify-center"
                             onclick="return showUpdateForm(<%= session.getAttribute("userid")%>, 'showUpdateForm')">
                            <i class="fa-solid fa-pen-to-square"></i>
                            <p class="lg:text-lg sm:text-5xl" >Edit</p>
                        </div>
                    </div>
                    <%}%>
                </div>

            </div>
            <div class="h-1/2 w-full border border-gray-300 bg-purple-200">
                <div class="bg-zinc-700 lg:text-xl sm:text-5xl text-gray-100 p-4 flex justify-between items-center w-full">
                    <h1>My Addresses</h1>
                    <div onclick="return showUpdateForm(<%= session.getAttribute("userid")%>, 'showAddressForm')">Add new address</div>
                </div>
                <div class="carousel-container h-fit p-6 space-x-4">
                    <%
                        ResultSet address = (ResultSet) request.getAttribute("address");
                        if (address.next()) {
                            session.setAttribute("addressId", address.getInt("address_id"));

                            do {
                    %>
                    <div class="carousel-item border border-bronze">
                        <div class="bg-white text-black lg:h-fit px-16 sm:w-full sm:h-full p-2 flex flex-col justify-center lg:text-xl sm:text-5xl">

                            <p><%= address.getString("address")%></p>
                            <p><%= address.getString("city")%> - <%= address.getString("pincode")%></p>
                            <p><%= address.getString("state")%></p>
                            <div class="p-4 w-full flex justify-end space-x-4 text-gray-500 text-sm">
                                <p onclick="showUpdateAddressForm(<%= session.getAttribute("addressId")%>)">
                                    <i class="fa-solid fa-pen-to-square"></i>Edit
                                </p>
                                <p onclick="removeAddress(<%= session.getAttribute("addressId")%>,<%= session.getAttribute("userid")%>)"><i class="fa-solid fa-trash-can"></i>Remove</p>
                            </div>
                        </div>
                    </div>
                    <%
                        } while (address.next());
                    } else {
                    %> 
                    <p class="lg:p-6 sm:p-8 w-full flex justify-center lg:text-xl sm:text-5xl text-red-500">No address found!!</p>
                    <%}%>

                </div>
            </div>
        </div>
    </div>

    <div id="loadUserUpdate"></div>
</c:if>

<c:if test="${process eq 'showUpdateForm'}">
    <%
        ResultSet user = (ResultSet) request.getAttribute("result");
        while (user.next()) {
    %>
    <!-- Main modal -->
    <div id="authentication-modal-wrapper" class="fixed top-0 right-0 left-0 z-40 flex justify-center items-center w-full h-full backdrop-filter backdrop-blur-sm bg-opacity-75 transition-opacity duration-300">
        <div id="authentication-modal" tabindex="1" aria-hidden="true" class="overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 flex justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
            <div class="relative p-4 w-full max-w-md max-h-full">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                    <!-- Modal header -->
                    <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                        <h3 class="text-xl font-semibold text-gray-900 dark:text-white">Update Profile</h3>
                        <button type="button" class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg
                                text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" 
                                onclick="hideForm('authentication-modal-wrapper')">
                            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                            </svg>
                            <span class="sr-only">Close modal</span>
                        </button>
                    </div>
                    <!-- Modal body -->
                    <div class="p-4 md:p-5">
                        <form class="space-y-4" action="#">
                            <div>
                                <label for="fname" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">First name</label>
                                <div>
                                    <input type="text" name="fname" id="fname" value="<%= user.getString("first_name")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="john" />
                                    <span id="fnameSpan" class="text-red-500"></span>
                                </div>
                            </div>
                            <div>
                                <label for="lname" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Last name</label>
                                <div>
                                    <input type="text" name="lname" id="lname" value="<%= user.getString("last_name")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="Doe" />
                                    <span id="lnameSpan" class="text-red-500"></span>
                                </div>
                            </div>
                            <div>
                                <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email</label>
                                <div>
                                    <input type="email" name="email" id="email" value="<%= user.getString("email")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="user@gmail.com" />
                                    <span id="emailSpan" class="text-red-500"></span>
                                </div>
                            </div>
                            <div>
                                <label for="mobile" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Mobile no</label>
                                <div>
                                    <input type="text" name="mobile" id="mobile" value="<%= user.getString("mobile_no")%>" placeholder="123-456-789" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" />
                                    <span id="mobileSpan" class="text-red-500"></span>
                                </div>
                            </div>

                            <button class="w-full text-white hover:bg-black bg-zinc-800 focus:ring-4 focus:outline-none
                                    focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600
                                    dark:hover:bg-blue-700 dark:focus:ring-blue-800" 
                                    onclick="return updateProfile(<%= session.getAttribute("userid")%>)">Update</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%}%>
</c:if>

<c:if test="${process eq 'showAddressForm'}">
    <!-- Main modal -->
    <div id="address-modal-wrapper" class="fixed top-0 right-0 left-0 z-40 flex justify-center items-center w-full h-full backdrop-filter backdrop-blur-sm bg-opacity-75 transition-opacity duration-300">
        <div id="address-modal" tabindex="1" aria-hidden="true" class="overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 flex justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
            <div class="relative p-4 w-full max-w-md max-h-full">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                    <!-- Modal header -->
                    <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                        <h3 class="text-xl font-semibold text-gray-900 dark:text-white">Add Address</h3>
                        <button type="button" class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg
                                text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" 
                                onclick="hideForm('address-modal-wrapper')">
                            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                            </svg>
                            <span class="sr-only">Close modal</span>
                        </button>
                    </div>
                    <!-- Modal body -->
                    <div class="p-4 md:p-5">
                        <form class="space-y-4" action="#">
                            <div>
                                <label for="address" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Address</label>
                                <div>
                                    <input type="text" name="address" id="newAddress" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="25,abc complex" />
                                    <span id="addressSpan" class="text-red-500"></span>
                                </div>
                            </div>
                            <div>
                                <label for="state" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">State</label>
                                <div>
                                    <input type="text" name="state" id="state" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="maharashtra" />
                                    <span id="stateSpan" class="text-red-500"></span>
                                </div>
                            </div>
                            <div>
                                <label for="city" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">City</label>
                                <div>
                                    <input type="text" name="city" id="city" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="mumbai" />
                                    <span id="citySpan" class="text-red-500"></span>
                                </div>
                            </div>
                            <div>
                                <label for="pincode" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Pincode</label>
                                <div>
                                    <input type="text" name="pincode" id="pincode" placeholder="395520" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" />
                                    <span id="pincodeSpan" class="text-red-500"></span>
                                </div>
                            </div>

                            <button class="w-full text-white hover:bg-black bg-zinc-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium
                                    rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" 
                                    onclick="return addAddress(<%= session.getAttribute("userid")%>)">Add</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</c:if>

<c:if test="${process eq 'showUpdateAddressForm'}">
    <div id="address-modal-wrapper" class="fixed top-0 right-0 left-0 z-40 flex justify-center items-center w-full h-full backdrop-filter backdrop-blur-sm bg-opacity-75 transition-opacity duration-300">
        <div id="address-modal" tabindex="1" aria-hidden="true" class="overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 flex justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
            <div class="relative p-4 w-full max-w-md max-h-full">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                    <!-- Modal header -->
                    <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                        <h3 class="text-xl font-semibold text-gray-900 dark:text-white">Add Address</h3>
                        <button type="button" class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg
                                text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" 
                                onclick="hideForm('address-modal-wrapper')">
                            <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                            </svg>
                            <span class="sr-only">Close modal</span>
                        </button>
                    </div>
                    <!-- Modal body -->

                    <%
                        ResultSet add = (ResultSet) request.getAttribute("result");
                        while (add.next()) {
                    %>
                    <div class="p-4 md:p-5">
                        <form class="space-y-4" action="#">
                            <div>
                                <label for="address" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Address</label>
                                <div>
                                    <input type="text" name="address" id="newAddress" value="<%= add.getString("address")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="25,abc complex" />
                                    <span id="addressSpan" class="text-red-500"></span>
                                </div>
                            </div>
                            <div>
                                <label for="state" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">State</label>
                                <div>
                                    <input type="text" name="state" id="state" value="<%= add.getString("state")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="maharashtra" />
                                    <span id="stateSpan" class="text-red-500"></span>
                                </div>
                            </div>
                            <div>
                                <label for="city" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">City</label>
                                <div>
                                    <input type="text" name="city" id="city" value="<%= add.getString("city")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="mumbai" />
                                    <span id="citySpan" class="text-red-500"></span>
                                </div>
                            </div>
                            <div>
                                <label for="pincode" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Pincode</label>
                                <div>
                                    <input type="text" name="pincode" id="pincode" value="<%= add.getString("pincode")%>" placeholder="395520" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" />
                                    <span id="pincodeSpan" class="text-red-500"></span>
                                </div>
                            </div>

                            <button class="w-full text-white hover:bg-black bg-zinc-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium
                                    rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" 
                                    onclick="return updateAddress(<%= session.getAttribute("addressId")%>)">Update</button>
                        </form>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${process eq 'updateProfile'}">
    <input type="text" id="result" value="${result}">
</c:if>

<c:if test="${process eq 'suggestion'}">
    <% ResultSet result = (ResultSet) request.getAttribute("result");
        while (result.next()) {
//            int id = result.getInt("product_id");
    %>
    <option value="<%= result.getString("product_name")%> , <%= result.getString("product_id")%>"></option>
    <%}%>
</c:if>
    
<c:if test="${process eq 'updateAddress'}">
    <input type="text" id="status" value="${status}">
</c:if>
        
<c:if test="${process eq 'removeAddress'}">
    <input type="text" id="status" value="${status}">
</c:if>
