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
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="js/index.js"></script>

    </head>
    <body>
        <!--<h1>Uploaded!</h1>-->
        <h1><%=request.getAttribute("Message")%></h1>
        
        
<!--        <div class="flex justify-center">
            <label>user name : </label>
            <input type="text" list="usernames" id="uname" name="uname" 
                   class="bg-gray-200" onkeyup="showSuggestion()">
            <button class="bg-purple-500 text-white p-2 px-4" >Search</button>

        </div>
        <datalist id="usernames"></datalist>-->


    </body>
</html>
