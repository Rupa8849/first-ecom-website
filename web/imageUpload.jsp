<%-- 
    Document   : imageUpload
    Created on : Jan 12, 2024, 9:36:42 PM
    Author     : dell
--%>

<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Upload image</title>
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
    <body>
        <form action="uploadServlet" method="post" enctype="multipart/form-data">
            <div class="bg-black p-4 text-white w-3/5 mx-auto mt-8">
                <div class="p-8 gap-x-2 gap-y-4 grid grid-cols-2">
                    <div>product id : <input type="text" name="pid" placeholder="enter product id" class="py-1 text-gray-800"></div>
                    <div>product name : <input type="text" name="pname" placeholder="enter product name" class="py-1 text-gray-800"></div>
                    <div>brand : <input type="text" name="brand" placeholder="enter brand name" class="py-1 text-gray-800"></div>
                    <div>description : <input type="text" name="description" placeholder="enter product description" class="py-1 text-gray-800"></div>
                    <div>price : <input type="text" name="price" placeholder="enter price per unit" class="py-1 text-gray-800"></div>
                    <div>quantity in stock : <input type="text" name="quantity" placeholder="enter quantity" class="py-1 text-gray-800"></div>
                    <div>image : <input type="file" name="image" id="image"></div>
                    <div>category id : <input type="text" name="cid" placeholder="enter category id" class="py-1 text-gray-800"></div>
                    <div>discount : <input type="text" name="discount" placeholder="enter discount percent" class="py-1 text-gray-800"></div>
                    <div>shade_id : <input type="text" name="sid" placeholder="enter shade id" class="py-1 text-gray-800"></div>
                    <!--<div>final price : <input type="text" name="final_price" placeholder="final price" class="py-1 text-gray-800"></div>-->
                </div>
                <div class="flex justify-center"><input type="submit" value="upload" class="bg-bronze p-2 px-6"></div>
            </div>
        </form>
    </body>
</html>
