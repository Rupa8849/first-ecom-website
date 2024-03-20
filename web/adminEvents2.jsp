<%-- 
    Document   : adminEvents2
    Created on : Mar 8, 2024, 9:08:21 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.ResultSet" %>

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
        <h2 class="text-2xl font-bold mb-4 dark:text-gray-200">Insert Products</h2>

        <form action="insertServlet?process=addProducts" method="post" enctype="multipart/form-data">
            <div class="bg-white dark:bg-gray-700 dark:text-gray-200 shadow-md rounded px-8 pt-6 pb-8 mb-4 flex flex-col my-2">
                <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="pid">
                            Product Id
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-red rounded py-3 px-4 mb-3" 
                               id="pid" name="pid" type="text" placeholder="1001">
                    </div>
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="pname">
                            Product Name
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-red rounded py-3 px-4 mb-3" 
                               id="pname" name="pname" type="text" placeholder="abc lipstic">
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="brand">
                            Brand
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="brand" name="brand" type="text" placeholder="lakme">
                    </div>
                </div>
                <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-full px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="description">
                            Description
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4 mb-3" 
                               id="description" name="description" type="text" multiline="true" placeholder="******************">
                    </div>
                </div>
                <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="price">
                            Price
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-red rounded py-3 px-4 mb-3" 
                               id="price" name="price" type="text" placeholder="499">
                    </div>
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="quantity">
                            Quantity
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-red rounded py-3 px-4 mb-3" 
                               id="quantity" name="quantity" type="text" placeholder="Jane">
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="pimage">
                            Product Image
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="image" name="image" type="file" accept=".jpg, .jpeg, .webp, .avif, .png">
                    </div>
                </div>
                <div class="-mx-3 md:flex mb-2">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="cid">
                            Category Id
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="cid" name="cid" type="text" placeholder="2005">
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="discount">
                            Discount in Percent
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="discount" name="discount" type="text" placeholder="25%">
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="sid">
                            Shade Id
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker bg-gray-50 border border-grey-lighter rounded py-3 px-4" 
                               id="sid" name="sid" type="text" placeholder="3012">
                    </div>
                </div>

                <!--buttons-->
                <div class="mt-4 w-full flex justify-center p-2">
                    <div class="w-1/2 flex justify-center space-x-8">
                        <button class="bg-purple-600 text-white w-1/2 p-2 font-medium text-lg rounded hover:bg-purple-800
                                duration-300" onclick="" type="submit">Submit</button>
                        <button class="bg-white border text-purple-600 w-1/2 p-2 font-medium text-lg rounded hover:bg-gray-200
                                duration-300" onclick="return cancelSubmission()">Cancel</button>

                    </div>
                </div>
            </div> 
        </form>
    </c:if>

    <c:if test="${process eq 'editItemForm'}">
        <!--<h1>hello</h1>-->
        <h2 class="text-2xl font-bold mb-4 dark:text-gray-200">Update Products Detail</h2>
        <!-- component -->
        <form action="insertServlet?process=updateProducts" method="post" enctype="multipart/form-data">

            <div class="bg-white dark:bg-gray-700 dark:text-gray-200 shadow-md rounded px-8 pt-6 pb-8 mb-4 flex flex-col my-2">
                <%
                    ResultSet rs = (ResultSet) request.getAttribute("result");
                    while (rs.next()) {
                %>
                <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="pid">
                            Product Id
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-red rounded py-3 px-4 mb-3" 
                               id="pid" name="pid" type="text" placeholder="1001" value='<%= rs.getInt("product_id")%>'>
                    </div>
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="pname">
                            Product Name
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-red rounded py-3 px-4 mb-3" 
                               id="pname" name="pname" type="text" placeholder="abc lipstic" value='<%= rs.getString("product_name")%>'>
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="brand">
                            Brand
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4" 
                               id="brand" name="brand" type="text" placeholder="lakme" value='<%= rs.getString("brand")%>'>
                    </div>
                </div>
                <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-full px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="description">
                            Description
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4 mb-3" 
                               id="description" name="description" type="text" multiline="true" placeholder="****" value='<%= rs.getString("description")%>'>
                    </div>
                </div>
                <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="price">
                            Price
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-red rounded py-3 px-4 mb-3" 
                               id="price" name="price" type="text" placeholder="499" value='<%= rs.getInt("price")%>'>
                    </div>
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="quantity">
                            Quantity
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-red rounded py-3 px-4 mb-3" 
                               id="quantity" name="quantity" type="text" placeholder="Jane" value='<%= rs.getInt("quantity_in_stock")%>'>
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="image">
                            Product Image
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4" 
                               id="image" name="image" type="file" accept=".jpg, .jpeg, .webp, .avif, .png">
                    </div>
                </div>
                <div class="-mx-3 md:flex mb-2">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="cid">
                            Category Id
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4" 
                               id="cid" name="cid" type="text" placeholder="2005" value='<%= rs.getInt("category_id")%>'>
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="discount">
                            Discount in Percent
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4" 
                               id="discount" name="discount" type="text" placeholder="25%" value='<%= rs.getInt("discount_in_pct")%>'>
                    </div>
                    <div class="md:w-1/2 px-3">
                        <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="sid">
                            Shade Id
                        </label>
                        <input class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded py-3 px-4" 
                               id="sid" name="sid" type="text" placeholder="3012" value='<%= rs.getInt("shade_id")%>'>
                    </div>
                </div>

                <!--buttons-->
                <div class="mt-4 w-full flex justify-center p-2">
                    <div class="w-1/2 flex justify-center space-x-8">
                        <button class="bg-purple-600 text-white w-1/2 p-2 font-medium text-lg rounded hover:bg-purple-800
                                duration-300" onclick="" type="">Update</button>
                        <button class="bg-white border text-purple-600 w-1/2 p-2 font-medium text-lg rounded hover:bg-gray-200
                                duration-300" onclick="return cancelSubmission()">Cancel</button>

                    </div>
                </div>

                <%}%>
            </div> 

        </form>

    </c:if>

</html>
