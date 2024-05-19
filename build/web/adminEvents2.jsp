<%-- 
    Document   : adminEvents2
    Created on : Mar 8, 2024, 9:08:21 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="javax.servlet.http.HttpSession" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin2 Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" 
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>

    <c:if test="${process eq 'InsertItemForm'}">
        <!-- component -->
        <h2 class="text-2xl font-bold mb-4 dark:text-gray-200 mt-10 ml-10">Insert Products</h2>

        <form id="insertForm" name="insertForm" method="post" enctype="multipart/form-data" class="w-[90%] mx-auto">
            <div class="bg-white dark:bg-gray-700 dark:text-gray-200 shadow-md rounded px-8 pt-6 pb-8 mb-4 flex flex-col my-2">
                <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="pid">
                            Product Id
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-red rounded py-3 px-4 mb-3" 
                               id="pid" name="pid" type="text" placeholder="1001">
                        <span id="pidSpan" class="text-red-500"></span>
                    </div>
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="pname">
                            Product Name
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-red rounded py-3 px-4 mb-3" 
                               id="pname" name="pname" type="text" placeholder="abc lipstic">
                        <span id="pnameSpan" class="text-red-500"></span>
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="brand">
                            Brand
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="brand" name="brand" type="text" placeholder="lakme">
                        <span id="brandSpan" class="text-red-500"></span>
                    </div>
                </div>
                <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-full px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="description">
                            Description
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4 mb-3" 
                               id="description" name="description" type="text" multiline="true" placeholder="******************">
                        <span id="descriptionSpan" class="text-red-500"></span>
                    </div>
                </div>
                <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="price">
                            Price
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-red rounded py-3 px-4 mb-3" 
                               id="price" name="price" type="text" placeholder="499">
                        <span id="priceSpan" class="text-red-500"></span>
                    </div>
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="quantity">
                            Quantity
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-red rounded py-3 px-4 mb-3" 
                               id="quantity" name="quantity" type="text" placeholder="Jane">
                        <span id="quantitySpan" class="text-red-500"></span>
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="pimage">
                            Product Image
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="image" name="image" type="file" accept=".jpg, .jpeg, .webp, .avif, .png">
                        <span id="imageSpan" class="text-red-500"></span>
                    </div>
                </div>
                <div class="-mx-3 md:flex mb-2">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="cid">
                            Category Id
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="cid" name="cid" type="text" placeholder="2005">
                        <span id="cidSpan" class="text-red-500"></span>
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="discount">
                            Discount in Percent
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="discount" name="discount" type="text" placeholder="25%">
                        <span id="discountSpan" class="text-red-500"></span>
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="sid">
                            Shade Id
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="sid" name="sid" type="text" placeholder="3012">
                        <span id="sidSpan" class="text-red-500"></span>
                    </div>
                </div>

                <!--buttons-->
                <div class="mt-4 w-full flex justify-center p-2">
                    <div class="w-1/2 flex justify-center space-x-8">
                        <button class="bg-purple-600 text-white w-1/2 p-2 font-medium text-lg rounded hover:bg-purple-800
                                duration-300" onclick="return addProduct()">Submit</button>
                        <button class="bg-white border text-purple-600 w-1/2 p-2 font-medium text-lg rounded hover:bg-pink-200
                                duration-300" onclick="return cancelSubmission()">Cancel</button>

                    </div>
                </div>
            </div> 
        </form>
    </c:if>

    <c:if test="${process eq 'editItemForm'}">
        <!--<h1>hello</h1>-->
        <h2 class="text-2xl font-bold mb-4 dark:text-gray-200 mt-10 ml-10">Update Product Details</h2>
        <!-- component -->
        <form id="updateForm" name="updateForm" method="post" enctype="multipart/form-data" class="w-[90%] mx-auto">

            <%
                ResultSet rs = (ResultSet) request.getAttribute("result");
                while (rs.next()) {
            %>
            <div class="bg-white dark:bg-gray-700 dark:text-gray-200 shadow-md rounded px-8 pt-6 pb-8 mb-4 flex flex-col my-2">
                <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="pid">
                            Product Id
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-red rounded py-3 px-4 mb-3" 
                               disabled id="pid" name="pid" type="text" placeholder="1001" value="<%= rs.getInt("product_id")%>">
                        <span id="pidSpan" class="text-red-500"></span>
                    </div>
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="pname">
                            Product Name
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-red rounded py-3 px-4 mb-3" 
                               id="pname" name="pname" type="text" placeholder="abc lipstic" value="<%= rs.getString("product_name")%>">
                        <span id="pnameSpan" class="text-red-500"></span>
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="brand">
                            Brand
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="brand" name="brand" type="text" placeholder="lakme" value="<%= rs.getString("brand")%>">
                        <span id="brandSpan" class="text-red-500"></span>
                    </div>
                </div>
                <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-full px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="description">
                            Description
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4 mb-3" 
                               id="description" name="description" type="text" multiline="true" placeholder="******************" value="<%= rs.getString("description")%>">
                        <span id="descriptionSpan" class="text-red-500"></span>
                    </div>
                </div>
                <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="price">
                            Price
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-red rounded py-3 px-4 mb-3" 
                               id="price" name="price" type="text" placeholder="499" value="<%= rs.getDouble("price")%>">
                        <span id="priceSpan" class="text-red-500"></span>
                    </div>
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="quantity">
                            Quantity
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-red rounded py-3 px-4 mb-3" 
                               id="quantity" name="quantity" type="text" placeholder="25" value="<%= rs.getInt("quantity_in_stock")%>">
                        <span id="quantitySpan" class="text-red-500"></span>
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="pimage">
                            Product Image
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="image" name="image" type="file" accept=".jpg, .jpeg, .webp, .avif, .png" >
                        <span id="imageSpan" class="text-red-500"></span>
                    </div>
                </div>
                <div class="-mx-3 md:flex mb-2">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="cid">
                            Category Id
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="cid" name="cid" type="text" placeholder="2005" value="<%= rs.getInt("category_id")%>">
                        <span id="cidSpan" class="text-red-500"></span>
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="discount">
                            Discount in Percent
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="discount" name="discount" type="text" placeholder="25%" value="<%= rs.getInt("discount_in_pct")%>">
                        <span id="discountSpan" class="text-red-500"></span>
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="sid">
                            Shade Id
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="sid" name="sid" type="text" placeholder="3012" value="<%= rs.getInt("shade_id")%>">
                        <span id="sidSpan" class="text-red-500"></span>
                    </div>
                </div>

                <!--buttons-->
                <div class="mt-4 w-full flex justify-center p-2">
                    <div class="w-1/2 flex justify-center space-x-8">
                        <button class="bg-purple-600 text-white w-1/2 p-2 font-medium text-lg rounded hover:bg-purple-800
                                duration-300" onclick="return updateProduct()">Update</button>
                        <button class="bg-white border text-purple-600 w-1/2 p-2 font-medium text-lg rounded hover:bg-gray-200
                                duration-300" onclick="return cancelSubmission()">Cancel</button>

                    </div>
                </div>
            </div> 
            <%
                }
            %>
        </form>

    </c:if>


    <c:if test="${process eq 'getOrderDetails'}">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
            <div class="w-full flex justify-between  mb-10">
                <h2 class="text-2xl font-bold mb-4 dark:text-gray-200">All Orders</h2>
                <div class="w-fit flex">
                    <span class="text-xl dark:text-white">Filter Order: </span><select id="selectOrderType" class="ml-4 pl-2 w-60 bg-white" onchange="return filterOrder()">
                        <option selected disabled>-- Select --</option>
                        <option value="pending">pending</option>
                        <option value="confirmed">confirmed</option>
                    </select>
                </div>
            </div>
            <table id="example" class="table-auto sm:overflow-x-scroll w-full bg-white dark:bg-gray-700 dark:text-gray-200">
                <thead>
                    <tr class="border bg-purple-500 text-white">
                        <th class="px-4 py-2 border border-white">Order id</th>
                        <th class="px-4 py-2 border border-white">User id</th>
                        <th class="px-4 py-2 border border-white">User Name</th>
                        <th class="px-4 py-2 border border-white">Total quantity</th>
                        <th class="px-4 py-2 border border-white">Total Order Amount</th>
                        <th class="px-4 py-2 border border-white">Order Date & time</th>
                        <th class="px-4 py-2 border border-white">Order Status</th>
                    </tr>
                </thead>

                <%
                    ResultSet order = (ResultSet) request.getAttribute("result");
                    while (order.next()) {
                %>
                <tbody>
                    <tr>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=order.getInt("order_id")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=order.getInt("user_id")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=order.getString("first_name")%> <%=order.getString("last_name")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=order.getInt("total_quantity")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=order.getDouble("total_price")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=order.getTimestamp("order_date")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=order.getString("order_status")%></td>
                    </tr>
                </tbody>
                <%
                    }
                %>
            </table>
        </div>
    </c:if>


    <c:if test="${process eq 'getUserList'}">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
            <h2 class="text-2xl font-bold mb-4 dark:text-gray-200">All User list</h2>
            <table id="example" class="table-auto sm:overflow-x-scroll w-full bg-white dark:bg-gray-700 dark:text-gray-200">
                <thead>
                    <tr class="border bg-purple-500 text-white">
                        <th class="px-4 py-2 border border-white">User id</th>
                        <th class="px-4 py-2 border border-white">Customer Name</th>
                        <th class="px-4 py-2 border border-white">Email id</th>
                        <th class="px-4 py-2 border border-white">Mobile no</th>
                    </tr>
                </thead>

                <%
                    ResultSet user = (ResultSet) request.getAttribute("result");
                    while (user.next()) {
                %>
                <tbody>
                    <tr>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=user.getInt("user_id")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=user.getString("first_name")%> <%=user.getString("last_name")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=user.getString("email")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=user.getString("mobile_no")%></td>
                    </tr>
                </tbody>
                <%
                    }
                %>
            </table>
        </div>
    </c:if>

    <c:if test="${process eq 'getCategoryList'}">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
            <h2 class="text-2xl font-bold mb-4 dark:text-gray-200">All Categories</h2>
            <table id="categoryTable" contenteditable="false" class="table-auto sm:overflow-x-scroll w-full bg-white dark:bg-gray-700 dark:text-gray-200">
                <thead>
                    <tr class="border bg-purple-500 text-white">
                        <th class="px-4 py-2 border border-white">Category id</th>
                        <th class="px-4 py-2 border border-white">Category Name</th>
                        <th class="px-4 py-2 border border-white">Edit</th>
                        <th class="px-4 py-2 border border-white">Remove</th>
                    </tr>
                </thead>

                <%
                    ResultSet category = (ResultSet) request.getAttribute("result");
                    while (category.next()) {
                %>
                <tbody>
                    <tr>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700" id="cid" name="cid"><%=category.getInt("category_id")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=category.getString("category_name")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700" onclick="editCategoryForm(<%= category.getInt("category_id")%>)">
                            <i class="fa-regular fa-pen-to-square"></i>
                        </td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700" onclick="removeCategory(<%= category.getInt("category_id")%>)">
                            <i class="fa-regular fa-trash-can"></i>
                        </td>
                    </tr>
                </tbody>
                <%
                    }
                %>
            </table>
        </div>
    </c:if>

    <c:if test="${process eq 'editCategoryForm'}">
        <div id="category-modal-wrapper" class="fixed top-0 right-0 left-0 z-40 flex justify-center items-center w-full h-full backdrop-filter backdrop-blur-sm bg-opacity-75 transition-opacity duration-300">
            <div id="category-modal" tabindex="1" aria-hidden="true" class="overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 flex justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                <div class="relative p-4 w-full max-w-md max-h-full">
                    <!-- Modal content -->
                    <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                        <!-- Modal header -->
                        <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                            <h3 class="text-xl font-semibold text-gray-900 dark:text-white">update category</h3>
                            <button type="button" class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg
                                    text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" 
                                    onclick="hideForm('category-modal-wrapper')">
                                <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                </svg>
                                <span class="sr-only">Close modal</span>
                            </button>
                        </div>
                        <!-- Modal body -->

                        <%
                            ResultSet editcategory = (ResultSet) request.getAttribute("result");
                            while (editcategory.next()) {
                        %>
                        <div class="p-4 md:p-5">
                            <form class="space-y-4" action="#">
                                <div>
                                    <label for="cid" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Category id</label>
                                    <div>
                                        <input type="text" name="cid" id="cid" value="<%= editcategory.getInt("category_id")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="2001" />
                                        <span id="cidSpan" class="text-red-500"></span>
                                    </div>
                                </div>
                                <div>
                                    <label for="cname" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Category name</label>
                                    <div>
                                        <input type="text" name="cname" id="cname" value="<%= editcategory.getString("category_name")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="maharashtra" />
                                        <span id="cnameSpan" class="text-red-500"></span>
                                    </div>
                                </div>
                                <button class="w-full text-white hover:bg-black bg-zinc-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium
                                        rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" 
                                        onclick="return updateCategory(<%= editcategory.getInt("category_id")%>)">Update</button>
                            </form>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <c:if test="${process eq 'getInquiryList'}">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
            <h2 class="text-2xl font-bold mb-4 dark:text-gray-200">User Inquiries</h2>
            <table id="categoryTable" contenteditable="false" class="table-auto sm:overflow-x-scroll w-full bg-white dark:bg-gray-700 dark:text-gray-200">
                <thead>
                    <tr class="border bg-purple-500 text-white">
                        <th class="px-4 py-2 border border-white">Sr no.</th>
                        <th class="px-4 py-2 border border-white">Sender name</th>
                        <th class="px-4 py-2 border border-white">Email</th>
                        <th class="px-4 py-2 border border-white">Subject</th>
                        <th class="px-4 py-2 border border-white">Message</th>
                    </tr>
                </thead>

                <%
                    ResultSet message = (ResultSet) request.getAttribute("result");
                    while (message.next()) {
                %>
                <tbody>
                    <tr>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700" id="mid" name="mid"><%=message.getInt("msg_id")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=message.getString("sender_fname")%> <%=message.getString("sender_lname")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700" id="email" name="email"><%=message.getString("sender_email")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700" id="subject" name="subject"><%=message.getString("subject")%></td>
                        <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700" id="message" name="message"><%=message.getString("message")%></td>
                    </tr>
                </tbody>
                <%
                    }
                %>
            </table>
        </div>
    </c:if>

    <c:if test="${process eq 'adminProfile'}">
        <div class="h-screen flex justify-center items-center">
            <div class="w-[50%] h-fit p-4">
                <div class="border border-purple-500 bg-white w-full h-full flex flex-col gap-y-4 p-2">
                    <%
                        ResultSet admin = (ResultSet) request.getAttribute("result");
                        while (admin.next()) {
                    %>
                    <div class="flex justify-center items-center p-2">
                        <img src="images/admin-2.png" class="h-40 w-40">
                    </div>
                    <div class="flex justify-center">

                        <div class="w-full flex flex-col items-center p-4 text-xl text-purple-700 bg-gray-100">
                            <div class="flex justify-center w-full">
                                <p>Name : <span><%= admin.getString("first_name")%> <%= admin.getString("last_name")%></span></p>
                            </div>
                            <div class="flex justify-center w-full">
                                <p>Username : <span><%= admin.getString("username")%></span></p>
                            </div>
                            <div class="flex justify-center w-full">
                                <p>Password : <span><%= admin.getString("password")%></span></p>
                            </div>
                            <div class="flex justify-center w-full">
                                <p>Mobile no : <span><%= admin.getString("mobile_no")%></span></p>
                            </div>
                            <div class="flex justify-center w-full">
                                <p>Email : <span><%= admin.getString("email")%></span></p>
                            </div>
                            <div class="flex justify-end mt-4">
                                <button class="bg-black text-white px-6 py-1 text-xl " onclick="editAdminProfileForm(<%= admin.getInt("admin_id")%>)">Edit</button>
                            </div>
                        </div>
                    </div>

                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <div id="loadAdminData"></div>
    </c:if>

    <c:if test="${process eq 'editAdminProfileForm'}">
        <div id="admin-modal-wrapper" class="fixed top-0 right-0 left-0 z-40 flex justify-center items-center w-full h-full backdrop-filter backdrop-blur-sm bg-opacity-75 transition-opacity duration-300">
            <div id="admin-modal" tabindex="1" aria-hidden="true" class="overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 flex justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                <div class="relative p-4 w-full max-w-md max-h-full">
                    <!-- Modal content -->
                    <div class="relative bg-white rounded-lg shadow dark:bg-gray-700 w-full">
                        <!-- Modal header -->
                        <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                            <h3 class="text-xl font-semibold text-gray-900 dark:text-white">update category</h3>
                            <button type="button" class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg
                                    text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" 
                                    onclick="hideForm('admin-modal-wrapper')">
                                <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                </svg>
                                <span class="sr-only">Close modal</span>
                            </button>
                        </div>
                        <!-- Modal body -->

                        <%
                            ResultSet editForm = (ResultSet) request.getAttribute("result");
                            while (editForm.next()) {
                        %>
                        <div class="p-4 md:p-5">
                            <form class="space-y-2" action="#">
                                <div>
                                    <label for="adminid" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Admin id</label>
                                    <div>
                                        <input type="text" name="adminid" id="adminid" value="<%= editForm.getInt("admin_id")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="2001" />
                                        <span id="adminidSpan" class="text-red-500"></span>
                                    </div>
                                </div>
                                <div>
                                    <label for="username" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Username</label>
                                    <div>
                                        <input type="text" name="username" id="username" value="<%= editForm.getString("username")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="maharashtra" />
                                        <span id="usernameSpan" class="text-red-500"></span>
                                    </div>
                                </div>
                                <div>
                                    <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
                                    <div>
                                        <input type="text" name="password" id="password" value="<%= editForm.getString("password")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="maharashtra" />
                                        <span id="passwordSpan" class="text-red-500"></span>
                                    </div>
                                </div>
                                <div>
                                    <label for="fname" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">First name</label>
                                    <div>
                                        <input type="text" name="fname" id="fname" value="<%= editForm.getString("first_name")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="maharashtra" />
                                        <span id="fnameSpan" class="text-red-500"></span>
                                    </div>
                                </div>
                                <div>
                                    <label for="lname" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Last name</label>
                                    <div>
                                        <input type="text" name="lname" id="lname" value="<%= editForm.getString("last_name")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="maharashtra" />
                                        <span id="lnameSpan" class="text-red-500"></span>
                                    </div>
                                </div>
                                <div>
                                    <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email</label>
                                    <div>
                                        <input type="text" name="email" id="email" value="<%= editForm.getString("email")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="maharashtra" />
                                        <span id="emailSpan" class="text-red-500"></span>
                                    </div>
                                </div>
                                <div>
                                    <label for="mobile" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Mobile no</label>
                                    <div>
                                        <input type="text" name="mobile" id="mobile" value="<%= editForm.getString("mobile_no")%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="maharashtra" />
                                        <span id="mobileSpan" class="text-red-500"></span>
                                    </div>
                                </div>
                                <button class="w-full text-white hover:bg-black bg-zinc-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium
                                        rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" 
                                        onclick="return updateAdmin()">Save changes</button>
                            </form>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</html>
