<%-- 
    Document   : displayImage
    Created on : Jan 19, 2024, 10:26:47 PM
    Author     : dell
--%>

<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>display image Page</title>
        <script src="https://cdn.tailwindcss.com"></script>

    </head>
    <body>
        <h1>Displaying image</h1>
        <table class="mx-auto">
            <tr>
                <th>product id</th>                
                <th>product name</th>
                <th>brand</th>
                <th>description</th>
                <th>price</th>
                <th>quantity</th>
                <th>image</th>
                <th>category id</th>
                <th>discount</th>
                <th>shade id</th>
            </tr>

            <%
                ResultSet rs = (ResultSet) request.getAttribute("result");
                while (rs.next()) {
                    byte[] content = rs.getBytes("image");
                    String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");
                    request.setAttribute("imageBt", base64Encoded);

            %>

            <tr class="capitalize text-red-500">
                <td> <p><%=rs.getInt("product_id")%></p></td>
                <td><p><%=rs.getString("product_name")%></p></td>
                <td><p><%=rs.getString("brand")%></p></td>
                <td><p><%=rs.getString("description")%></p></td>
                <td><p><%=rs.getDouble("price")%></p></td>
                <td><p><%=rs.getInt("quantity_in_stock")%></p></td>
                <td><img src="data:image/jpg/jpeg/webp/avif;base64,${requestScope["imageBt"]}" height="500px" width="500px"></td>
                <td><p><%=rs.getInt("category_id")%></p></td>
                <td><p><%=rs.getInt("discount_in_pct")%></p></td>
                <td><p><%=rs.getInt("shade_id")%></p></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
