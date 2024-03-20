<%-- 
    Document   : success
    Created on : Jan 12, 2024, 10:45:19 PM
    Author     : dell
--%>

<%@page contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>success Page</title>
    </head>
    <body>
        <!--<h1>Uploaded!</h1>-->
        <h1><%=request.getAttribute("Message")%></h1>

    </body>
</html>
