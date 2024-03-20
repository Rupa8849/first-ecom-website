<%-- 
    Document   : adminEvents
    Created on : Mar 7, 2024, 11:45:07 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.ResultSet" %>



<c:if test="${process eq 'viewProducts' || process eq 'editProducts' || process eq 'deleteProducts'}">
    <!--<p>hello viewProducts</p>-->
    <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <h2 class="text-2xl font-bold mb-4 dark:text-gray-200">All Products</h2>
        <table id="example" class="table-auto sm:overflow-x-scroll w-full bg-white dark:bg-gray-700 dark:text-gray-200">
            <thead>
                <tr class="border bg-purple-500 text-white">
                    <th class="px-4 py-2 border border-white">Product id</th>
                    <th class="px-4 py-2 border border-white">Product image</th>
                    <th class="px-4 py-2 border border-white">Product name</th>
                    <th class="px-4 py-2 border border-white">Price</th>
                    <th class="px-4 py-2 border border-white">Discount in percent</th>
                    <th class="px-4 py-2 border border-white">brand</th>
                    <th class="px-4 py-2 border border-white">Total stock</th>
                        <c:if test="${process eq 'editProducts'}">
                        <th class="px-4 py-2 border border-white">Edit</th>
                        </c:if>
                        <c:if test="${process eq 'deleteProducts'}">
                        <th class="px-4 py-2 border border-white">Delete</th>
                        </c:if>
                </tr>
            </thead>

            <%
                ResultSet rs = (ResultSet) request.getAttribute("result");
                while (rs.next()) {

                    byte[] content = rs.getBytes("image");
                    String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                    request.setAttribute("imageBt", base64Encoded);
            %>
            <tbody>
                <tr>
                    <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=rs.getInt("product_id")%></td>
                    <td class="border border-purple-500 px-4 py-2 text-center bg-white h-fit w-fit">
                        <img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" 
                             class="w-24 h-24 hover:scale-110 duration-500 object-cover" />
                    </td>
                    <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=rs.getString("product_name")%></td>
                    <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=rs.getDouble("price")%></td>
                    <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=rs.getInt("discount_in_pct")%></td>
                    <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=rs.getString("brand")%></td>
                    <td class="border border-purple-500 px-4 py-2 text-center bg-white text-gray-700"><%=rs.getInt("quantity_in_stock")%></td>
                    <c:if test="${process eq 'editProducts'}">
                        <td onclick="return editForm('<%=rs.getInt("product_id")%>')" class="border border-purple-500 px-4 py-2 text-center">
                            <i class="fa-regular fa-pen-to-square"></i>
                        </td>
                    </c:if>
                    <c:if test="${process eq 'deleteProducts'}">
                        <td onclick="return deleteItem('<%=rs.getInt("product_id")%>')" class="border border-purple-500 px-4 py-2 text-center">
                            <i class="fa-solid fa-trash-can"></i>
                        </td>
                    </c:if>
                </tr>
            </tbody>
            <%
                }
            %>
        </table>
    </div>

</c:if>

<c:if test="${process eq 'deleteItem'}">
    <input id="status" value="${status}">
</c:if>
    
    
<c:if test="${process eq 'sendMessage'}">
    <input id="result" value="${result}">
</c:if>
    
