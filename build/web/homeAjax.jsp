<%-- 
    Document   : homeAjax
    Created on : Apr 9, 2024, 9:19:29 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.ResultSet" %>
<head>
    <script src="js/index.js"></script>
</head>
<c:if test="${process eq 'trendingNow'}">

    <%
        ResultSet rs = (ResultSet) request.getAttribute("result");
        while (rs.next()) {
            byte[] content = rs.getBytes("image");
            String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
            request.setAttribute("imageBt", base64Encoded);
    %>
    <!--col - 1--> 
    <a class="py-6 h-50 w-72 place-items-center grid">
        <div class="border border-2 border-bronze rounded-xl w-full h-fit text-left bg-white ">
            <div class="overflow-hidden w-full">
                <div>
                    <h1 class="text-left pl-1 text-xl text-green-600">Best Seller</h1>
                </div>
                <div class="h-56 w-full p-2">
                    <img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" class="w-full hover:scale-105 duration-500 rounded-t-xl mx-auto h-full" />
                </div>
            </div>
            <h1 class="bg-black text-white font-medium pl-2 p-4"><%= rs.getString("product_name")%></h1>
            <div class="flex gap-2 p-1 pl-2 bg-black text-white">
                <p class="font-bold">₹<span><%= rs.getDouble("final_price")%></span></p>
                <p>MRP : ₹<span class="line-through pl-2"><%= rs.getDouble("price")%></span></p>
            </div>
            <h1 class="bg-black text-yellow-300 pl-2"><span><%= rs.getInt("discount_in_pct")%></span>% off</h1>
            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4 pt-4">
                <button
                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4" onclick="return addToCart(<%= rs.getInt("product_id")%>,<%= session.getAttribute("userid")%>)">Add
                    to Bag</button>
            </div>
        </div>
    </a>
    <%
        }
    %>
</c:if>

<c:if test="${process eq 'topDeals'}">

    <%
        ResultSet deals = (ResultSet) request.getAttribute("result");
        while (deals.next()) {
            byte[] content = deals.getBytes("image");
            String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
            request.setAttribute("imageBt", base64Encoded);
    %>
    <!--col - 1--> 
    <a class="py-6 h-50 w-72 place-items-center grid">
        <div class="border border-2 border-bronze rounded-xl w-full h-fit text-left bg-white ">
            <div class="overflow-hidden w-full">
                <div>
                    <h1 class="text-left pl-1 text-xl text-green-600">Best Seller</h1>
                </div>
                <div class="h-56 w-full p-2">
                    <img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" class="w-full hover:scale-105 duration-500 rounded-t-xl mx-auto h-full" />
                </div>
            </div>
            <h1 class="bg-black text-white font-medium pl-2 p-4"><%= deals.getString("product_name")%></h1>
            <div class="flex gap-2 p-1 pl-2 bg-black text-white">
                <p class="font-bold">₹<span><%= deals.getDouble("final_price")%></span></p>
                <p>MRP : ₹<span class="line-through pl-2"><%= deals.getDouble("price")%></span></p>
            </div>
            <h1 class="bg-black text-yellow-300 pl-2"><span><%= deals.getInt("discount_in_pct")%></span>% off</h1>
            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4 pt-4">
                <button
                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4" onclick="return addToCart(<%= deals.getInt("product_id")%>,<%= session.getAttribute("userid")%>)">Add
                    to Bag</button>
            </div>
        </div>
    </a>
    <%
        }
    %>
</c:if>


<c:if test="${process eq 'topBrands'}">

    <%
        ResultSet topBrands = (ResultSet) request.getAttribute("result");
        while (topBrands.next()) {
            byte[] content = topBrands.getBytes("image");
            String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
            request.setAttribute("imageBt", base64Encoded);
    %>
    <!--col - 1--> 
    <a class="py-6 h-50 w-72 place-items-center grid">
        <div class="border border-2 border-bronze rounded-xl w-full h-fit text-left bg-white ">
            <div class="overflow-hidden w-full">
                <div>
                    <h1 class="text-left pl-1 text-xl text-green-600">Best Seller</h1>
                </div>
                <div class="h-56 w-full p-2">
                    <img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" class="w-full hover:scale-105 duration-500 rounded-t-xl mx-auto h-full" />
                </div>
            </div>
            <h1 class="bg-black text-white font-medium pl-2 p-4"><%= topBrands.getString("product_name")%></h1>
            <div class="flex gap-2 p-1 pl-2 bg-black text-white">
                <p class="font-bold">₹<span><%= topBrands.getDouble("final_price")%></span></p>
                <p>MRP : ₹<span class="line-through pl-2"><%= topBrands.getDouble("price")%></span></p>
            </div>
            <h1 class="bg-black text-yellow-300 pl-2"><span><%= topBrands.getInt("discount_in_pct")%></span>% off</h1>
            <div class="h-[10%] bg-black flex justify-center items-center w-full rounded-b-xl pb-4 pt-4">
                <button
                    class="border border-2 border-bronze hover:bg-bronze text-white p-2 rounded-full w-3/4" onclick="return addToCart(<%= topBrands.getInt("product_id")%>,<%= session.getAttribute("userid")%>)">Add
                    to Bag</button>
            </div>
        </div>
    </a>
    <%
        }
    %>
</c:if>