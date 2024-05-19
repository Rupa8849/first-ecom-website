<%-- 
    Document   : userOrders
    Created on : Mar 30, 2024, 3:02:45 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>userOrder Page</title>

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
        <style>
        .carousel-container {
            display: flex;
            overflow-x: auto;
            /* scrollbar-width: none; Hide scrollbar */
            -ms-overflow-style: none;
            /* Hide scrollbar for IE/Edge */
        }

        .carousel-item {
            flex: 0 0 auto;
            /* Prevent flex items from shrinking */
            scroll-snap-align: start;
            /* Snap items to start of container */
        }

        /* Optional: Hide scrollbar for other browsers */
        /* .carousel-container::-webkit-scrollbar {
    display: none;
} */
    </style>
    </head>
    <body class="h-full w-screen overflow-x-hidden" onload="return userDetail('<%= request.getParameter("param")%>',<%= session.getAttribute("userid")%>)">
        <!--header-->
        <div class="w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>
        
        <div id="loadUserDetails" class="h-screen w-screen"></div>
        
        <!--========================================= footer section starts=============================================-->
        <section class="w-screen h-fit lg:flex sm:hidden">
            <%@include  file="footer.jsp"%>
        </section>
        <!--========================================= footer section ends=============================================-->

    </body>
</html>
