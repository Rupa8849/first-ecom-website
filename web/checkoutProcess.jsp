<%-- 
    Document   : paymentProcess
    Created on : Jan 20, 2024, 9:10:25 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>checkout page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="js/index.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tw-elements/dist/css/tw-elements.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
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

<body class="bg-gray-50 overflow-x-hidden overflow-y-scroll">
    
     <!--header-->
        <div class="lg:w-screen sm:w-screen flex shadow-lg  md:flex-col sticky top-0 z-40">
            <%@include file="header.jsp" %>
        </div>
    
    <div class="max-w-[1320px] mx-auto m-2 py-5 text-black flex justify-center space-x-6 w-screen h-full">
        <div class="w-[60%] space-y-4">
            <!-- login details -->
            <div class="bg-white flex justify-between border items-center px-4 py-2">
                <div class="text-black">
                    <p class="uppercase">[1] login <span>✓</span></p>
                    <p>+917567285590</p>
                </div>
                <div class="p-2">
                    <button class="bg-bronze text-white px-8 py-2 text-sm uppercase">change</button>
                </div>
            </div>

            <!-- delivery address -->
            <div class="bg-gray-200 border">
                <div class="flex justify-between items-center p-4 py-2">
                    <div class="">
                        <p class="uppercase">[2] Delivery address</p>
                        <span></span>
                    </div>
                    <div class="p-2">
                        <button class="bg-bronze text-white px-8 py-2 text-sm uppercase"
                            onclick="return changeAddress()">change</button>
                    </div>
                </div>
                <div class="bg-white p-4 flex justify-between w-full" id="defaultAddress">
                    <div class="w-full">
                        <div class="flex w-full justify-between">
                            <div>
                                <p><input type="radio" name="address" value="Muskan Gupta" checked><span
                                        class="pl-4">Muskan
                                        Gupta</span> - <span class="font-bold">7567285590</span></p>
                                <p class="pl-6">C-421,nitya society,vip road,surat- <span
                                        class="font-bold">394220</span>
                                </p>
                            </div>
                            <div class="">
                                <button class="bg-black text-white px-6 py-2 text-sm uppercase">Edit</button>
                            </div>
                        </div>
                        <div class="hidden flex w-full justify-between" id="address2">
                            <div>
                                <p><input type="radio" name="address" value="Muskan Gupta" checked><span
                                        class="pl-4">Muskan
                                        Gupta</span></p>
                                <p class="pl-6">C-421,nitya society,vip road,surat- <span
                                        class="font-bold">394220</span>
                                </p>
                            </div>
                            <div class="">
                                <button class="bg-black text-white px-6 py-2 text-sm uppercase">Edit</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- add new address -->
            <div class="bg-white hidden" id="addressMainDiv">
                <div class=" p-2 my-auto" id="addNewAddress"
                    onclick="showForm('rbbtn','addressForm','plussign')">
                    <p class="uppercase flex items-center">
                        <span class="text-2xl" id="plussign">+</span>
                        <span class="hidden" id="rbbtn"><input type="radio" class="h-4 w-4" name="newAddress"
                                value="newAddress" checked></span>
                        <span class="pl-2">Add New Address</span>
                    </p>
                </div>
                <!-- add new address form -->
                <div class="w-[90%] mx-auto pt-4 hidden" id="addressForm">
                    <div class="flex justify-center  space-x-4 mx-auto">
                        <input type="text" class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                            placeholder="Name">
                        <input type="text" class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                            placeholder="Mobile no">
                    </div>
                    <div class="flex justify-center space-x-4 mx-auto mt-2">
                        <input type="text" class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                            placeholder="Pincode">
                        <input type="text" class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                            placeholder="Locality">
                    </div>
                    <div class="flex justify-center  space-x-4 mx-auto mt-2">
                        <textarea cols="55" rows="3" class="pl-2 px-8 border boredr-1 border-gray-500 text-gray-500"
                            placeholder="Address">
                        </textarea>
                    </div>
                    <div class="flex justify-center space-x-4 mx-auto mt-2">
                        <div>
                            <input type="text" class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                                placeholder="City">
                        </div>
                        <div>
                            <div class="relative" id="stateDiv" onclick="showFilterOptions('angle-down','statelist')">
                                <i class="fa-solid fa-angle-down absolute top-4 right-2" id="angle-down"></i>
                                <input type="text" class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                                    placeholder="Select State">
                            </div>
                            <ul class="bg-gray-100 px-8 pl-3 text-left mt-1 hidden" id="statelist">
                                <li class="py-1">Gujarat</li>
                                <li class="py-1">Maharashtra</li>
                                <li class="py-1">New Delhi</li>
                                <li class="py-1">UP</li>
                            </ul>
                        </div>
                    </div>
                    <div class="flex justify-center  space-x-4 mx-auto mt-2">
                        <input type="text" class="px-8 pl-2 py-1 border boredr-1 border-gray-500 text-gray-500"
                            placeholder="Landmark (optional)">
                        <input type="text" class="px-8 pl-2 py-2 border boredr-1 border-gray-500 text-gray-500"
                            placeholder="Alternate phone no(optional)">
                    </div>
                    <div class="flex-col p-2  mt-2">
                        <p class="text-xs">Address Type</p>
                        <div class="flex">
                            <p><input type="radio" name="address" value="Muskan Gupta" checked class="h-4 w-4"><span
                                    class="pl-4">Home
                                    (All
                                    day delivery)</span></p>
                            <p><input type="radio" name="address" value="Muskan Gupta" class="h-4 w-4 ml-8"><span
                                    class="pl-4">Work
                                    (Delivery between 10AM - 5PM)</span></p>
                        </div>
                    </div>
                    <div class="flex font-semibold space-x-4 mt-2 p-2 justify-start ml-12 mb-2">
                        <button class="p-2 px-6 bg-bronze text-white" onclick="return changeAddress()">Save and Deliver
                            here</button>
                        <button class="p-2 px-10 bg-bronze text-white">Cancle</button>
                    </div>
                </div>
                <!-- add new address form ends-->
            </div>

            <!-- order summery  -->
            <div class="bg-white">
                <div class=" h-20 pt-2 p-10 text-left">[3] <span>Order summery</span></div>
                <!-- <div class="flex">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26">
                        <g fill="none" fill-rule="evenodd">
                            <path d="M-7-7h40v40H-7z" />
                            <path fill="#ED232A" d="M0 0h26v26H0" />
                            <path fill="#FFF" d="M4.6 4.6h16.8v16.8H4.6" />
                            <path fill="#FFF" d="M11.7 0h2.6v26h-2.6" />
                            <path fill="#FFF" d="M0 11.7h26v2.6H0" />
                            <path fill="#004C8F" d="M9 9h8v8H9" />
                        </g>
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27">
                        <g fill="none" fill-rule="evenodd">
                            <path d="M-7-7h40v40H-7z" />
                            <path fill="#16D"
                                d="M12.6 27C5.4 26.5-.2 20.4 0 13 .2 6 6.2 0 13.5 0S26.8 5.8 27 13c.2 7.4-5.4 13.5-12.6 14V16c1-.5 1.7-1.6 1.5-2.8-.4-1.2-1.4-2-2.6-2s-2.2.8-2.4 2c0 1.2.5 2.3 1.6 2.7" />
                        </g>
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="28">
                        <g fill="none" fill-rule="evenodd">
                            <path d="M-7-6h40v40H-7z" />
                            <path fill="#F99D27"
                                d="M7.5 6c6.3-6.2 14-8 17-3.6 3 4.3.4 13-6 19.2-6.2 6.3-14 8-17 3.6-3-4.3-.3-13 6-19.2" />
                            <path fill="#B02A30"
                                d="M11.7 2.7c-.7.5-1.4 1-2 1.8-5.6 5.5-8 13-5.2 16.7 2.8 3.8 9.6 2.4 15.3-3 3-3 5-6.5 6-9.7 0-2.4-.2-4.5-1.3-6C22-1 17-.5 11.7 2.5" />
                            <path fill="#FFF"
                                d="M19.3 2.5c.7.7.3 2.4-1 3.6-1.3 1.7-3 2-3.6 1-.8-.3-.3-2 1-3.2 1.2-1.3 3-1.7 3.6-1zm-4.5 22.2c-3 2.2-6 3.3-9 3 1.3 0 2.3-1.4 3-3.3 1-2 1.5-3.7 2-5.4.5-2.6.5-4.5.2-5-.5-.6-1.7-.4-3 .4-.6.3-1.4 0-.4-1 1-1.3 5-4.2 6.3-4.6 1.2-.5 3 0 2.3 1.8-.4 1.3-5.8 15.6-1.8 14z" />
                        </g>
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="24">
                        <g fill="none" fill-rule="evenodd">
                            <path d="M-6-8h40v40H-6z" />
                            <path fill="#BC4170" d="M28 24h-8.7L14 15h8.7m-4.4-7.6L8.7 24H0L14 0" />
                        </g>
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="24"
                        xmlns:xlink="http://www.w3.org/1999/xlink">
                        <defs>
                            <path id="a" d="M28 0H0v23.8h28V0z" />
                        </defs>
                        <g fill="none" fill-rule="evenodd">
                            <path d="M-6-8h40v40H-6z" />
                            <mask id="b" fill="#fff">
                                <use xlink:href="#a" />
                            </mask>
                            <path fill="#003874"
                                d="M0 12C0 5.2 6.3 0 14 0s14 5.3 14 12c0 6.5-6.3 11.8-14 11.8s-14-5.3-14-12"
                                mask="url(#b)" />
                            <path fill="#ED1C24" d="M12.3 3.8l3.2-1V20l-3.2 1.2" mask="url(#b)" />
                            <path fill="#FFF"
                                d="M14.2 14.7C12.8 16.3 11.4 18 9 18c-3.7 0-5.4-3.4-5.4-6.3 0-2.8 1.3-6 4.8-6 1.5 0 3 1 4 2V10c-1-.7-2.5-1-3.6-1-2.2 0-4.2.7-4 3 0 1.4 1.4 2.4 3 2.4 2.2 0 3.6-2 4.7-3.6L14 9c1-1.6 2.6-3.2 5-3.2 3 0 4.7 2.4 5.2 5H23c-.5-1-1.5-1.4-2.6-1.4-2.3 0-3.8 2-5 3.7l-1.2 2zM24.5 13c-.3 2.6-1.7 5-4.8 5-1.8 0-3.2-1-4.2-2.6v-1.7c1.3.6 2.4 1.2 3.8 1.2 1.7 0 3.2-1 3.8-2h2z"
                                mask="url(#b)" />
                        </g>
                    </svg>
                </div> -->
            </div>

            <!-- payment option -->
            <!-- <div class="bg-blue-200 h-20 pt-2 p-10 text-left">[3] <a href="payment2.html">Payment Option</a></div> -->
            <div class="shadow-lg">
                <div class="bg-white py-3 pl-2" onclick="return showForm('paymentOptions','','')">
                    <a class="uppercase">[4] Payment Option</a>
                </div>
                <div class="bg-white w-full pt-1 hidden h-fit mb-4" id="paymentOptions">
                    <div class="flex items-center p-4 border border-gray-100">
                        <p><input type="radio" name="cards" value="UPI" class="h-4 w-4"><span class="pl-4">UPI</span>
                        </p>
                    </div>
                    <div class="flex items-center p-4 border border-gray-100">
                        <p><input type="radio" name="cards" value="wallets" class="h-4 w-4"><span
                                class="pl-4">Wallets</span></p>
                    </div>
                    <div class="flex items-center p-4 border border-gray-100">
                        <p><input type="radio" name="cards" value="credit" class="h-4 w-4"><span class="pl-4">Credit
                                card</span></p>
                    </div>
                    <div class="flex items-center p-4 border border-gray-100">
                        <p><input type="radio" name="cards" value="debit" class="h-4 w-4"><span class="pl-4">Debit
                                card</span></p>
                    </div>
                    <div class="flex items-center p-4 border border-gray-100">
                        <p><input type="radio" name="cards" value="netbanking" class="h-4 w-4"><span class="pl-4">Net
                                Banking</span></p>
                    </div>
                    <div class="flex items-center p-4 border border-gray-100">
                        <p><input type="radio" name="cards" value="cod" class="h-4 w-4"><span class="pl-4">Cash on
                                Delivery</span></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- price detail -->
        <div class="w-[30%] p-4 bg-white py-5 text-left h-[40%] flex flex-col border">
            <h1 class="font-semibold text-zinc-500 border-b-2 border-bronze pb-2">PRICE DETAIL</h1>
            <div class="flex flex-col ">
                <div class="flex justify-between px-2 py-4">
                    <div class="">Price (<span>4</span>) items</div>
                    <div>₹<span>4200</span></div>
                </div>
                <div class="flex justify-between px-2 pb-4 border-b-2 border-dotted border-bronze">
                    <div class="">Delivery charges</div>
                    <div>₹<span>200</span></div>
                </div>
                <div class="flex justify-between px-2 py-4 font-semibold text-lg border-b-2 border-bronze">
                    <div class="">Total Payable</div>
                    <div>₹<span>4400</span></div>
                </div>
            </div>

        </div>
    </div>
    
    <!--========================================= footer section starts=============================================-->
        <section class="w-screen">
            <%@include  file="footer.jsp"%>
        </section>
        <!--========================================= footer section ends=============================================-->

</body>

</html>
