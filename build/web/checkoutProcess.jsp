<%-- Document : paymentProcess Created on : Jan 20, 2024, 9:10:25 AM Author : dell --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>checkout page</title>
        
        <!--links-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        
        <!--scripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
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

    <body class="bg-gray-50 h-full w-screen overflow-x-hidden" onload="return getOrderItems(<%= session.getAttribute("userid")%>)">
        
        <div id="loadOrderItems" class="w-screen h-screen overflow-y-scroll"></div>

       
    </body>

</html>