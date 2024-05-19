<%-- 
    Document   : 404
    Created on : Feb 25, 2024, 12:31:48 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>404 Page</title>
         <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="css/tailwind.output.css" />
        <script
            src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
            defer
        ></script>
        <script src="js/init-alpine.js"></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css"
            />
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
            defer
        ></script>
        <script src="js/chart-lines.js" defer></script>
        <script src="js/chart-pie.js" defer></script>

        <script src="https://cdn.tailwindcss.com"></script>

    </head>
    <body>
        <div class="container flex flex-col items-center px-6 mx-auto">
            <svg
                class="w-12 h-12 mt-8 text-purple-200"
                fill="currentColor"
                viewBox="0 0 20 20"
                >
            <path
                fill-rule="evenodd"
                d="M13.477 14.89A6 6 0 015.11 6.524l8.367 8.368zm1.414-1.414L6.524 5.11a6 6 0 018.367 8.367zM18 10a8 8 0 11-16 0 8 8 0 0116 0z"
                clip-rule="evenodd"
                ></path>
            </svg>
            <h1 class="text-6xl font-semibold text-gray-700 dark:text-gray-200">
                404
            </h1>
            <p class="text-gray-700 dark:text-gray-300">
                Page not found. Check the address or
                <a
                    class="text-purple-600 hover:underline dark:text-purple-300"
                    href="../index.html"
                    >
                    go back
                </a>
                .
            </p>
        </div>
    </body>
</html>
