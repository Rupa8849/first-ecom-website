<%-- 
    Document   : aboutus
    Created on : Jan 16, 2024, 12:01:29 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About us page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="../js/index.js"></script>
        <script src="../path/to/flowbite/dist/flowbite.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
        <link href="https://tuk.dev/components/E-commerce/Components/carousels/carousel_2"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
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
    <body class="w-screen h-screen overflow-x-hidden">
        <h1 class="text-center text-2xl font-bold my-4">ABOUT PRETTY ERA</h1>
        <div class="bg-zinc-900 flex justify-center p-2"><img class="h-24" src="images/pretty-eralogo.png" alt="logo"> </div>


        <div class="w-screen h-fit bg-gray-100 pb-10">
            <section class="w-full h-screen bg-gray-50 overflow-hidden flex lg:flex-row sm:flex-col items-center">
                <div class="lg:w-2/5 lg:h-[80%] p-5 sm:w-full sm:h-full">
                    <div class="grid grid-cols-2 gap-4 h-full">
                        <img src="images/bgimage6.avif"class="h-full w-full bg-white aspect-video">
                        <img src="images/bgimage3.avif" class="h-full w-full bg-white aspect-video">
                        <img src="images/bgimage4.avif" class="h-full w-full bg-white aspect-video">
                        <img src="images/bgimage5.avif" class="h-full w-full bg-white aspect-video">

                    </div>
                </div>
                <div class="lg:w-3/5 sm:w-full p-10 flex flex-col justify-center gap-y-4">
                    <p class="text-2xl tracking-wide">The At first glance, PreetyEra website is simple, aesthetically pleasing, and easy to navigate.
                        Large images showcase the product on its own and on a model, while pink colors perfectly match the brand.</p>
                    <p class="text-2xl tracking-wide"> A clean, natural look is a perfect match for this industry.With PreetyEra, navigation is not reduced to the main menu.</p>
                    <p class="text-2xl tracking-wide">Holding your cursor over a category brings up the top options within that category, previewing exactly what the user is looking for.
                        Bundling products makes for a more straightforward online shopping experience.In short, simplicity is key.</p>
                    <p class="text-2xl tracking-wide">The fact that the branding is consistent and strong throughout only helps to make this a site that fully leans into its brand and maximizes its potential..
                    </p>
                </div>

            </section>
            <section class="w-full h-screen bg-slate-200 overflow-hidden flex lg:flex-row sm:flex-col-reverse items-center  pr-4">
                <div class="lg:w-3/5 sm:w-full p-10 flex flex-col justify-center gap-y-4">
                    <p class="text-2xl tracking-wide">Talk about a top beauty site that shines through aesthetics.
                        The appearance is as the brand name suggests: bright colors, but without being too flashy, catch the eye without being annoying.
                        Meanwhile, menus with background pictures of the actual products add a fun touch to the navigation without compromising readability.
                        The shopping experience is still front and center here.
                    </p>
                    <p class="text-2xl tracking-wide"> An under $25 section appeals to budget shoppers, while a chat feature helps with anything from making a decision to potential check-out issues.
                        Once you get to the product pages, you find in-depth videos and information on how to apply the product, keeping the focus on education.</p>
                    <p class="text-2xl tracking-wide">But 100% Pure is not afraid to lean into its brand, either; a philanthropy site helps to communicate that when you shop here, you help to make a difference.</p>
                </div>
                <div class="lg:w-2/5 h-[80%] p-10 sm:w-full sm:h-full">
                    <div class="grid grid-cols-2 gap-4 h-full">
                        <img src="images/lakme/lakme-9to5-primer-matte-liquid-lip-color-mp3-dusty-rose-4-2ml_9_display_1657519633_654ca3f5.webp"class="h-full w-full bg-white aspect-video">
                        <img src="images/colorbar/colorbar_shadow2.avif" class="h-full bg-white aspect-video">
                        <img src="images/mamaearth/mama_eyeliner3.avif" class="h-full w-full bg-white aspect-video">
                        <img src="images/maybelline/maybelline_eyeliner3.avif" class="h-full bg-white aspect-video">

                    </div>
                </div>
            </section>
            <div class="bg-gray-50 w-screen h-[50%] flex flex-col items-center pt-4">
                <h1 class="text-center text-3xl font-bold my-4">Our Team</h1>

                <div class="w-[80%] bg-slate-200 flex justify-center gap-x-10 p-4">
                    <div class="bg-black h-fit w-fit p-5">
                        <img src="images/muskan2.jpeg" class="h-40 w-40 rounded-full">
                        <p class="text-center text-white">Muskan Gupta</p>
                    </div>
                    <div class="bg-black h-fit w-fit p-5">
                        <img src="images/sakshi1.jpeg" class="h-40 w-40 rounded-full">
                        <p class="text-center text-white">Sakshi Mishra</p>

                    </div>
                    <div class="bg-black h-fit w-fit p-5">
                        <img src="images/rupa2.jpeg" class="h-40 w-40 rounded-full">
                        <p class="text-center text-white">Rupa Chauhan</p>

                    </div>
                </div>
            </div>
        </div>





        <!--        <div class="max-w-[1320px] md:py-[80] py-5 flex mx-auto bg-gray-600 text-white">
        
                    <br>
                    <div class="basis-[35%] pl-[2%] grid grid-cols-2 gap-2">
                        <img src="images/bgimage1.avif" class="w-full">
                        <img src="images/bgimage9.avif" class="w-full">
                        <img src="images/bgimage3.avif" class="w-full">
                        <img src="images/bgimage4.avif" class="w-full">
                    </div>
                    <div class="basis-[55%] px-5">
                        <h1>The At first glance, PreetyEra website is simple, aesthetically pleasing, and easy to navigate.
                            Large images showcase the product on its own and on a model, while pink colors perfectly match the brand.
                            A clean, natural look is a perfect match for this industry.With PreetyEra, navigation is not reduced to the main menu.
                            Holding your cursor over a category brings up the top options within that category, previewing exactly what the user is looking for.
                            Bundling products makes for a more straightforward online shopping experience.
                            In short, simplicity is key.
                            The fact that the branding is consistent and strong throughout only helps to make this a site that fully leans into its brand and maximizes its potential..</h1>
        
                    </div>
        
                </div>
                <div class="max-w-[1320px] md:py-[80] p-20 flex mx-auto bg-gray-600 text-white">
        
                    <br>
                    <div class="basis-[70%] ">
                        <h1>Talk about a top beauty site that shines through aesthetics.
                            The appearance is as the brand name suggests: bright colors, but without being too flashy, catch the eye without being annoying.
                            Meanwhile, menus with background pictures of the actual products add a fun touch to the navigation without compromising readability.
                            The shopping experience is still front and center here. An under $25 section appeals to budget shoppers, while a chat feature helps with anything from making a decision to potential check-out issues.
                            Once you get to the product pages, you find in-depth videos and information on how to apply the product, keeping the focus on education. But 100% Pure is not afraid to lean into its brand, either; a philanthropy site helps to communicate that when you shop here, you help to make a difference</h1>
        
                    </div>
                    <div class="basis-[35%] pr-1 grid grid-cols-2 gap-2">
                        <img src="images/bgimage6.avif" class="w-full">
                        <img src="images/bgimage5.avif" class="w-full">
                        <img src="images/bgimage7.avif" class="w-full">
                        <img src="images/bgimage8.avif" class="w-full">
                    </div>
        
        
                </div>
        
            </div>
            <div class="max-w-[1320px] p-[15%]] bg-gray-600 grid lg:grid-cols-3 mx-auto gap-5">
                <div class="p-10 ml-20 h[30%] bg-black w-[70%]">
                    <img src="images/rupa2.jpeg " class="rounded-full h-40">
                    <p class="text-white">hello my name rupa chauhan</p>
                    <p class="text-white">bca student</p>
                    <p class="text-white">pretty era website</p>
        
                </div>
                <div class="p-10 ml-20 h[30%] bg-black w-[70%]">
                    <img src="images/sakshi1.jpeg " class="rounded-full h-40">
                    <p class="text-white">hello my name rupa chauhan</p>
                    <p class="text-white">bca student</p>
                    <p class="text-white">pretty era website</p>
        
                </div>
                <div class="p-10 ml-20 h[30%] bg-black w-[70%]">
                    <img src="images/muskan2.jpeg " class="rounded-full h-40">
                    <p class="text-white">hello my name rupa chauhan</p>
                    <p class="text-white">bca student</p>
                    <p class="text-white">pretty era website</p>
        
                </div>
            </div>-->
    </body>
</html>
