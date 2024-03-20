<%-- 
    Document   : payment
    Created on : Jan 16, 2024, 12:03:52 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
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
    <body>
        <div class="lg:w-screen md:w-screen sm:w-screen h-screen flex justify-between bg-white">
            <!-- component -->
            <div class="flex flex-col justify-between mx-auto h-fit shadow-lg shadow-blue-300 border border-1 border-gray-500 rounded bg-blue-200 mx-auto my-auto">
                <div class="flex">
                    <!-- adrress -->
                    <div class="min-w-fit min-h-fit h-fit py-4 p-4 flex items-center justify-center">
                        <div class="max-w-xl h-fit px-8 bg-white rounded shadow-xl" style="max-width: 700px">
                            <div class="m-2 p-9">
                                <h1 class="text-center font-bold text-xl uppercase">Customer Information</h1>
                            </div>
                            <div class="mb-3">
                                <label class="font-bold text-sm mb-2 ml-1">Name</label>
                                <div>
                                    <input
                                        class="w-full mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors"
                                        placeholder="John Smith" type="text" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="font-bold text-sm mb-2 ml-1">Email</label>
                                <div>
                                    <input
                                        class="w-full mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors"
                                        placeholder="John Smith" type="text" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="font-bold text-sm mb-2 ml-1">Address</label>
                                <div>
                                    <textarea
                                        class="w-full mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors"
                                        placeholder="John Smith" type="text"></textarea>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="font-bold text-sm mb-2 ml-1">City</label>
                                <div>
                                    <input
                                        class="w-full px-3 py-2 mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors"
                                        placeholder="0000 0000 0000 0000" type="text" />
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- payment -->
                    <div class="min-w-fit min-h-fit h-fit py-4 pr-4 flex items-center justify-center">
                        <div class="max-w-xl h-fit px-8 bg-white rounded shadow-xl" style="max-width: 700px">
                            <div class="m-2 p-8">
                                <h1 class="text-center font-bold text-xl uppercase">Secure payment info</h1>
                            </div>
                            <div class="mb-3 flex -mx-2">
                                <div class="px-2">
                                    <label for="type1" class="flex items-center cursor-pointer">
                                        <img src="https://leadershipmemphis.org/wp-content/uploads/2020/08/780370.png"
                                             class="h-8 ml-3">
                                    </label>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="font-bold text-sm mb-2 ml-1">Name on card</label>
                                <div>
                                    <input
                                        class="w-full mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors"
                                        placeholder="John Smith" type="text" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="font-bold text-sm mb-2 ml-1">Card number</label>
                                <div>
                                    <input
                                        class="w-full px-3 py-2 mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors"
                                        placeholder="0000 0000 0000 0000" type="text" />
                                </div>
                            </div>
                            <div class="mb-3 -mx-2 flex items-end">
                                <div class="px-2 w-1/2">
                                    <label class="font-bold text-sm mb-2 ml-1">Expiration date</label>
                                    <div>
                                        <select
                                            class="form-select w-full px-3 py-2 mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors cursor-pointer">
                                            <option value="01">01 - January</option>
                                            <option value="02">02 - February</option>
                                            <option value="03">03 - March</option>
                                            <option value="04">04 - April</option>
                                            <option value="05">05 - May</option>
                                            <option value="06">06 - June</option>
                                            <option value="07">07 - July</option>
                                            <option value="08">08 - August</option>
                                            <option value="09">09 - September</option>
                                            <option value="10">10 - October</option>
                                            <option value="11">11 - November</option>
                                            <option value="12">12 - December</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="px-2 w-1/2">
                                    <select
                                        class="form-select w-full px-3 py-2 mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors cursor-pointer">
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                        <option value="2023">2023</option>
                                        <option value="2024">2024</option>
                                        <option value="2025">2025</option>
                                        <option value="2026">2026</option>
                                        <option value="2027">2027</option>
                                        <option value="2028">2028</option>
                                        <option value="2029">2029</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-2">
                                <label class="font-bold text-sm ml-1">Security code</label>
                                <div>
                                    <input
                                        class="w-32 px-3 py-2 mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors"
                                        placeholder="000" type="text" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-full text-center mb-4">
                    <div>
                        <button type="submit" value="Proceed To Checkout"
                                class="bg-zinc-900 text-gold text-xl py-2 rounded w-[95%] hover:bg-zinc-800 hover:text-bronze"><i
                                class="mdi mdi-lock-outline mr-1"></i>Pay Now</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
