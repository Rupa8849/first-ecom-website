<%-- 
    Document   : productDetails
    Created on : Feb 23, 2024, 11:45:02 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<html>
    <head>
        <title>product details page</title>
        
        <!--links-->
        
        
        <!--scripts-->
        
        <script src="js/index.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
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
    <body class="h-screen w-screen overflow-x-hidden" onload="return getProductDetail(<%=request.getParameter("id")%>)">

        <!--product info.-->
        <h1 id="cartItems"></h1>
        <div id="loadOneProduct" class="w-screen h-screen"></div>
    </body>
</html>