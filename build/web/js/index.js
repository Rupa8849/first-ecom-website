/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

function ajaxCall(method, url, data, destination, isHtml, isFile) {
    var xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        if (isHtml) {
            document.getElementById(destination).innerHTML = this.responseText;
        } else {
            document.getElementById(destination).value = this.responseText;
        }
    };
    xhttp.open(method, url, false);
    // Check if the data contains a file
    if (isFile) {
        xhttp.send(data); // If it's a file, send the FormData directly
    } else {
        // For non-file data, set the appropriate content type
        xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhttp.send(encodeURI(data)); // Encode the data for transmission
    }

}

function checkEmpty(elementId, elementName, spanId) {
    var element = document.getElementById(elementId);
    var span = document.getElementById(spanId);

    element.addEventListener('input', function () {
        if (element.value === "") {
            span.innerHTML = elementName + " can't be empty!";
        } else {
            span.innerHTML = ""; // Clear the error message when value is entered
        }
    });

    if (element.value === "") {
        span.innerHTML = elementName + " can't be empty !";
        element.focus();
        return false;
    } else {
        span.innerHTML = "";
    }
    return true;
}

function validatePrice(elementId, SpanId) {
    var result = checkEmpty(elementId, "price", SpanId);
    if (result) {
        var price = parseFloat(document.getElementById(elementId).value);

        if (isNaN(price) || price < 0) {
            var span = document.getElementById(SpanId);
            span.innerHTML = "Price cannot be negative.";
            document.getElementById(elementId).focus();

            return false; // Prevent form submission
        }
        return true;
    }
    return false;
}

//email validation function
function validateEmail(event, emailId, spanId) {
    event.preventDefault();
    var validRegex = /^[a-zA-Z0-90!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.com|\.net|\.org$/;
    var span = document.getElementById(spanId);
    var result = checkEmpty(emailId, "Email", spanId);
    if (result) {
        var email = document.getElementById(emailId).value;
        if (!email.match(validRegex)) {
            span.innerHTML = "Please enter a valid email address";
            document.getElementById(emailId).focus();
            return false;
        } else {
            return true; // Email is valid
        }
    }
    return false;
}


function validateMobileno(id, spanId) {
    var element = document.getElementById(id).value;
    var span = document.getElementById(spanId);
    var result = checkEmpty("mobile", "Mobile no", "mobileSpan");

    if (result) {

        if (!isNaN(element) && parseInt(element) >= 0) {
            // Check if the value is a number
            if (element.length !== 10) {
                span.innerHTML = "Mobile number should contain exactly 10 digits.";
                return false;
            }
        } else {
            span.innerHTML = "Only numbers are allowed.";
            return false;
        }
    }
    return true;
}

//send message to website 
function sendMessage() {
//    alert("Thanks diya sharma your message has been sent");

    var result = checkEmpty("firstname", "First name", "fnameSpan") &&
            checkEmpty("lastname", "Last name", "lnameSpan") &&
            validateEmail(event, "email", "emailSpan") &&
            checkEmpty("subject", "Subject", "subjectSpan") &&
            checkEmpty("message", "Message", "messageSpan");
    if (result) {
        (function () {
            emailjs.init("gwo0WXLi7Wl67h7-g"); //pretty era public key
        })();
        var serviceId = "service_stdrw9d"; //pretty era service id
        var templateId = "template_ve64tk6"; //pretty era template id
        var params = {
            sendername: document.querySelector("#firstname").value + " " + document.querySelector("#lastname").value,
            senderemail: document.querySelector("#email").value,
            subject: document.querySelector("#subject").value,
            message: document.querySelector("#message").value,
        };
        emailjs
                .send(serviceId, templateId, params)
                .then((res) => {

                    var fname = document.getElementById("firstname").value;
                    var lname = document.getElementById("lastname").value;
                    var email = document.getElementById("email").value;
                    var subject = document.getElementById("subject").value;
                    var message = document.getElementById("message").value;

                    var data = "fname=" + fname + "&lname=" + lname + "&email=" + email + "&subject=" + subject +
                            "&message=" + message + "&process=sendMessage";

                    ajaxCall("POST", "contactDetailServlet", data, "loadMessage", 'html');

                    var result = document.getElementById("result").value;
                    if (result > 0) {
                        alert("Thanks " + params["sendername"] + " your message has been sent");
                        resetForm(document.getElementById("contactForm"));
                    } else {
                        alert("Error occurs in sending message");
                    }
                })
                .catch();
    }
    return false;
}

var otp = Math.floor(Math.random() * 1000000);

//send otp function
function sendOtp() {
    var result = validateEmail(event, 'emailInput', 'loginspan');
    if (result) {
//        alert("your otp is : " + otp);
        (function () {
            emailjs.init("gwo0WXLi7Wl67h7-g"); //pretty era public key
        })();
        var serviceId = "service_stdrw9d"; //pretty era service id
        var templateId = "template_d2gluna"; //pretty era template id
        var params = {
            senderemail: document.querySelector("#emailInput").value,
            sendotp: "Your otp to login is : " + otp
        };
        emailjs
                .send(serviceId, templateId, params)
                .then((res) => {
                    alert("Otp has been sent to your email");
                    var sendDiv = document.getElementById("sendDiv");
                    var verifyDiv = document.getElementById("verifyDiv");
                    var verifyInput = document.getElementById("verifyInput");
                    sendDiv.classList.add("hidden");
                    verifyDiv.classList.remove("hidden");
                    verifyInput.focus();
                })
                .catch();

    }
    return false;
}


//verify otp

function verifyOtp() {
    var verifyInput = document.querySelector("#verifyInput").value;
    var loginDiv = document.querySelector("#loginDiv");
    var profileform = document.querySelector("#profile-form");
    var profileIcon = document.querySelector("#profile-icon");
    var signinBtn = document.querySelector("#signinBtn");
    var emailInput = document.getElementById("emailInput").value;
    var verifyOtpSpan = document.getElementById("verifyOtpSpan");

    var result = checkEmpty("verifyInput", "otp", "verifyOtpSpan");

    if (result) {
//        verifyOtpSpan.innerHTML = "Otp matched!!";

        if (verifyInput.match(otp)) {
//
//            alert("otp matched");
            ajaxCall("POST", "loginServlet", "process=verifyOtp&emailInput=" + emailInput, "loademail", false);

            var loademail = document.getElementById("loademail").value;

            if (!loademail.match(emailInput)) {
                loginDiv.classList.add("hidden");
//                profileIcon.classList.remove("hidden");
                signinBtn.classList.add("hidden");
                window.location.href = "home.jsp";

            } else {
                loginDiv.classList.add("hidden");
                profileform.classList.remove("hidden");
                return false;
            }

        } else {
            verifyOtpSpan.innerHTML = "Please enter correct Otp!!";
            document.getElementById("verifyInput").focus();
            return false;
        }
//        alert(verifyOtpSpan.innerHTML);

    }
    return false;
}



//validate user profile form
function validateProfileForm() {
    var result = checkEmpty("fname", "first name", "fnameSpan") &&
            checkEmpty("lname", "last name", "lnameSpan") &&
            validateEmail(event, "loademail", "emailSpan") &&
            validateMobileno("mobile", "mobileSpan");
    if (result) {
        var fname = document.getElementById("fname").value;
        var lname = document.getElementById("lname").value;
        var email = document.getElementById("loademail").value;
        var mobile = document.getElementById("mobile").value;

        var insertProfileSpan = document.getElementById("insertProfileSpan");

        var data = "fname=" + fname + "&lname=" + lname + "&mobile=" + mobile + "&email=" + email + "&process=insertProfileData";

        ajaxCall('POST', 'loginServlet', data, 'loadProfileData', 'html');

        var status = document.getElementById("result").value;

        if (status > 0) {
            window.location.href = "home.jsp";
        } else {
            insertProfileSpan.innerHTML = "error in insertion";
            return  false;
        }
    }
    return false;
}

//show update form
function showUpdateForm(userid, param) {
    ajaxCall('POST', 'userEventServlet', "process=" + param + "&userid=" + userid, 'loadUserUpdate', 'html');
}

//hide modal  update form
function hideForm(id) {
    var element = document.getElementById(id);
    element.classList.add("hidden");
}

//update user profile
function updateProfile(userid) {
    var result = checkEmpty("fname", "First name", "fnameSpan") &&
            checkEmpty("lname", "Last name", "lnameSpan") &&
            validateEmail(event, "email", "emailSpan") &&
            validateMobileno("mobile", "mobileSpan");
    if (result) {
//        alert(result);
        var fname = document.getElementById("fname").value;
        var lname = document.getElementById("lname").value;
        var email = document.getElementById("email").value;
        var mobile = document.getElementById("mobile").value;

        var data = "fname=" + fname + "&lname=" + lname + "&email=" + email + "&mobile=" + mobile + "&userid=" + userid + "&process=updateProfile";
//        alert(data);
//        alert("call start");
        ajaxCall('POST', 'userEventServlet', data, 'loadUserUpdate', 'html');
//        alert("call ends");

        var result = document.getElementById("result").value;
        if (result > 0) {
            alert("Your profile has been updated successfully");

        } else {
            alert("Error in updation!");
            return false;
        }
    }
    return false;
}

//function for getting login user data
function getUserData() {

    var email = document.getElementById("email").value;
//    alert("call start");
    ajaxCall('POST', 'loginServlet', "process=getUserData&email=" + email, 'loadUserName', 'html');
//    alert("call ends");
}

function clearInput(id, innerText) {
    var input = document.getElementById(id);
    if (innerText) {
        input.innerHTML = "";
    } else {
        input.value = "";
    }
}

function toggle() {
    var sendDiv = document.getElementById("sendDiv");
    var verifyDiv = document.getElementById("verifyDiv");
    sendDiv.classList.add("hidden");
    verifyDiv.classList.remove("hidden");
    return false;
}

function displayAllCategoryProducts(process) {
//    alert("call start");
    ajaxCall('POST', 'displayImageServlet', 'process=' + process, 'loadCategory', 'html');
//    alert("dest : " + destination);
    return false;
}

function getProductDetail(id) {
//    alert(id);
    ajaxCall('POST', 'productDetails', 'process=productDetails&id=' + id, 'loadOneProduct', 'html');
    return false;
}

function brandProductDetail(brand) {
//    alert(brand);
    ajaxCall('POST', 'productDetails', 'process=brandProductDetail&brand=' + brand, 'loadBrandProduct', 'html');
    return false;
}

function displaySingleCategory(cid) {
//    alert("call start");
    ajaxCall('POST', 'categoryServlet', 'process=loadSingleCategory&cid=' + cid, 'loadSingleCategory', 'html');
//    alert("call ends");
    return false;
}

function showSuggestion(id) {
    var pname = document.getElementById(id).value;
    var fname = pname.split(" ")[0];
    ajaxCall("POST", "userEventServlet", "process=suggestion&fname=" + fname, "pnames", "html");

    if (pname.length > 1) {
        searchItem(id);
    }
}

function searchItem(id) {
    var pname = document.getElementById(id).value;
    var parts = pname.split(",");
    var pid = parts[1];

    window.location.href = "productDetails.jsp?id=" + pid;
}

//function for viewing user's personal detail
function userDetail(param, userid) {
//    alert(userid);

    ajaxCall('POST', 'userEventServlet', 'process=' + param + '&userid=' + userid, 'loadUserDetails', 'html');
}

function showUpdateAddressForm(addressId) {
//    alert("call start");
    ajaxCall('POST', 'userEventServlet', 'process=showUpdateAddressForm&addressid=' + addressId, 'loadUserUpdate', 'html');
//    alert("call ends");
}

function updateAddress(addressId) {
    var result = checkEmpty("newAddress", "Address", "addressSpan") &&
            checkEmpty("state", "State", "stateSpan") &&
            checkEmpty("city", "City", "citySpan") &&
            checkEmpty("pincode", "Pincode", "pincodeSpan");

    if (result) {
        var address = document.getElementById("newAddress").value;
        var state = document.getElementById("state").value;
        var city = document.getElementById("city").value;
        var pincode = document.getElementById("pincode").value;

        var data = "address=" + address + "&state=" + state + "&city=" + city + "&pincode="
                + pincode + "&addressid=" + addressId + "&process=updateAddress";

        ajaxCall('POST', 'userEventServlet', data, 'loadUserUpdate', 'html');

        var status = document.getElementById("status").value;
        if (status > 0) {
            alert("Address updated successfully");
        } else {
            alert("Error occurs while updating address");
        }
    }
    return false;
}

function removeAddress(addressId, userid) {
    var result = confirm("Are you sure want to delete your address ?");
    if (result) {
        ajaxCall('POST', 'userEventServlet', 'process=removeAddress' + '&addressid=' + addressId, 'loadUserUpdate', 'html');
        var status = document.getElementById("status").value;
        if (status > 0) {
            alert("Address deleted successfully");
            userDetail("userProfile", userid);
        } else {
            alert("Error occurs while removing address");
            return false;
        }
    }
    return false;
}

//function to logout user
function logout() {
    var result = confirm("Are you really want to logout from Pretty Era ? ");
    if (result) {
        ajaxCall('POST', 'logoutServlet', '', '', '');
        window.location.href = "home.jsp";
        alert("logout from prettyEra....");
//        return true;
    } else {
        return false;
    }
    return false;
}
//user functions ends ===========================================

//cart related functions starts ===================================
function addToCart(pid, userid) {
    alert("product added to bag successfully");
//    var productCount = parseInt(sessionStorage.getItem("productCount")) || 0;
//    productCount += 1;

    var productCountElement = document.getElementById("productCount");
    productCountElement.innerHTML = parseInt(productCountElement.innerHTML) + 1;
    sessionStorage.setItem("productCount", productCountElement.innerHTML);

    var quantity = 1;
//    alert(pid + " " + userid + " " + quantity);

//    alert("call start");
    ajaxCall('POST', 'cartServlet', 'process=insertCartItems&pid=' + pid + "&userid=" + userid + "&quantity=" + quantity, 'cart', 'html');
//    alert("call ends");

    var result = document.getElementById("result").value;
//    alert(result);

    return false;

}

function addToCart2() {
    alert("Please login to add product into cart!!");
    window.location.href = "userLogin.jsp";
}

function increase(btn, pid, userid) {
    var container = btn.closest(".cartItem"); // Find the parent container of the clicked button
    var input = container.querySelector(".inputNumber");
    var finalPrice = container.querySelector(".final_price");
    var subtotal = document.getElementById("subtotal");
    var youpay = document.getElementById("youpay");
    var grandTotal = document.getElementById("grandtotal");
    var mybag = document.getElementById("mybag");
    var quantity = 1;
//
//    alert(input.value);
//    alert(mybag.textContent);
//    
    var pricePerUnit = parseFloat(finalPrice.textContent) / parseInt(input.value);
//    
//    alert(finalPrice.textContent);
//    alert(pricePerUnit);

//    let totalItemsPrice = youpay = grandTotal;

    subtotal.textContent = parseInt(subtotal.textContent) + parseInt(pricePerUnit);
    youpay.textContent = parseInt(youpay.textContent) + parseInt(pricePerUnit);
    grandTotal.textContent = parseInt(grandTotal.textContent) + parseInt(pricePerUnit);

//    alert(subtotal.textContent);

    input.value = parseInt(input.value) + quantity;
    finalPrice.textContent = parseFloat(pricePerUnit) * parseInt(input.value);

    var data = "userid=" + userid + "&pid=" + pid + "&finalQuantity=" + parseInt(input.value) + "&finalPrice=" + parseFloat(finalPrice.textContent) + "&process=increaseCartItems";

//    alert(data);
//    alert("call start");
    ajaxCall('POST', 'cartServlet', data, 'loadCartUpdateResponse', 'html');
//    alert("call ends");

    var element = document.getElementById("result").value;
//    alert(element);
    var cart = document.getElementById("productCount");
    cart.textContent = parseInt(cart.textContent) + parseInt(element);
    mybag.textContent = parseInt(mybag.textContent) + element;

    ajaxCall('POST', 'cartServlet', 'process=viewCartItems&userid=' + userid, 'cartItems', 'html');

}

function decrease(btn, pid, userid) {
    var container = btn.closest(".cartItem"); // Find the parent container of the clicked button
    var input = container.querySelector(".inputNumber");
    var finalPrice = container.querySelector(".final_price");
    var subtotal = document.getElementById("subtotal");
    var youpay = document.getElementById("youpay");
    var grandTotal = document.getElementById("grandtotal");
    var mybag = document.getElementById("mybag");
    var cart = document.getElementById("productCount");
    var quantity = 1;

    // Calculate the price per unit
    var pricePerUnit = parseFloat(finalPrice.textContent) / parseInt(input.value);

    // Update the quantity and total price
    if (parseInt(input.value) > 1) {
        input.value = parseInt(input.value) - quantity;
//        alert(input.value);

        mybag.textContent = parseInt(mybag.textContent) - quantity;
//        alert(mybag.textContent);

        finalPrice.textContent = parseFloat(pricePerUnit) * parseInt(input.value);
//        alert(finalPrice.textContent);

        // Calculate the new subtotal and update all related elements
        subtotal.textContent = parseInt(subtotal.textContent) - parseInt(pricePerUnit);
        youpay.textContent = parseInt(youpay.textContent) - parseInt(pricePerUnit);
        grandTotal.textContent = parseInt(grandTotal.textContent) - parseInt(pricePerUnit);

        var data = "userid=" + userid + "&pid=" + pid + "&finalQuantity=" + parseInt(input.value) +
                "&finalPrice=" + parseFloat(finalPrice.textContent) + "&process=decreaseCartItems";

//        alert(data);
//        alert("call start");
        ajaxCall('POST', 'cartServlet', data, 'loadCartUpdateResponse', 'html');
//        alert("call ends");

        var element = document.getElementById("result").value;
//        alert(element);
        if (element > 0) {
            cart.textContent = parseInt(cart.textContent) - element;
        }

        ajaxCall('POST', 'cartServlet', 'process=viewCartItems&userid=' + userid, 'cartItems', 'html');

    }
}

function checkOut(userid) {
//    alert(userid);
    var totalpriceSpan = document.getElementById("totalpriceSpan");
    var mybag = document.getElementById("mybag");

    var totalPrice = parseFloat(totalpriceSpan.textContent);
    var totalQuantity = parseInt(mybag.textContent);
//    alert(totalPrice);
//    alert(totalQuantity);

//    alert("call start");
    ajaxCall('POST', 'orderServlet', 'process=checkout&userid=' + userid + '&totalPrice=' + totalPrice + '&totalQuantity=' + totalQuantity, 'loadCartUpdateResponse', 'html');
//    alert("call ends");

    var result = document.getElementById("result").value;
    if (result > 0) {
//        alert("inserted" + result);
        window.location.href = "checkoutProcess.jsp";
    } else {
        alert("Error during checkout !!");
        return false;
    }
    return false;
}

//buy now
function buyNow(userid) {
//    alert(userid);
    var totalpriceSpan = document.getElementById("totalpriceSpan");
    var mybag = 1;
    var totalPrice = parseFloat(totalpriceSpan.textContent);
    var totalQuantity = mybag;
//    alert(totalPrice);
//    alert(totalQuantity);

//    alert("call start");
    ajaxCall('POST', 'orderServlet', 'process=checkout&userid=' + userid + '&totalPrice=' + totalPrice + '&totalQuantity=' + totalQuantity, 'loadCartUpdateResponse', 'html');
//    alert("call ends");

    var result = document.getElementById("result").value;
    if (result > 0) {
//        alert("inserted" + result);
        window.location.href = "checkoutProcess.jsp";
    } else {
        alert("Error during checkout !!");
        return false;
    }
    return false;
}


function placeOrder(userid) {
//    var noAddressFound = document.getElementById("defaultAddress");
    var radios = document.getElementsByName('address');
    var totalPayable = document.getElementById("totalPayable");
    var selectedValue = null;

    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            selectedValue = radios[i].value;
            break;
        }
    }
    alert("Selected value: " + selectedValue);
    alert("Selected price: " + parseFloat(totalPayable.textContent));

//    if (selectedValue !== null) {
    alert("call start");
    ajaxCall("POST", "userEventServlet", "process=updateOrder&userid=" + userid + "&addressId=" + selectedValue, "loadUserEvents", "html");
    alert("call ends");

    var status = document.getElementById("result").value;
    alert(status);

    if (status > 0) {
        alert("Thank you user, your order has been placed successfully");
        ajaxCall('POST', 'cartServlet', "process=removeAllCartItems&userid=" + userid, 'loadUserEvents', 'html');

//            window.location.href = "userOrders.jsp";
    }
//    } else {
//        alert("please select an address");
////        return false;
//    }
}

//function for displaying cart items
function viewCartItems(userid) {
    ajaxCall('POST', 'cartServlet', 'process=viewCartItems&userid=' + userid, 'cartItems', 'html');
    return false;
}

//function for displaying ordered items
function getOrderItems(userid) {
//    alert(userid);
    ajaxCall('POST', 'orderServlet', 'process=viewOrderItems&userid=' + userid, 'loadOrderItems', 'html');
    viewAddress(userid);
}

//function for removing single item form cart
function removeItem(pid, userid) {

//    alert(userid);
//    alert(pid);

    var data = "userid=" + userid + "&pid=" + pid + "&process=removeItem";

//    alert("call start");
    ajaxCall('POST', 'cartServlet', data, 'loadCartUpdateResponse', 'html');
//    alert("call ends");

    var element = document.getElementById("result").value;
    if (element > 0) {
        alert("product removed successfully");
        ajaxCall('POST', 'cartServlet', 'process=viewCartItems&userid=' + userid, 'cartItems', 'html');
    }

}

//function for removing all item from cart
function removeAllCartItems(userid) {

//    alert(userid);
    var result = confirm("Are you sure to delete all cart items ?");

    if (result) {
//        alert("call start");
        ajaxCall('POST', 'cartServlet', "process=removeAllCartItems&userid=" + userid, 'loadCartUpdateResponse', 'html');
//        alert("call ends");

        var element = document.getElementById("result").value;
//        alert(element);
        if (element > 0) {
            var cartParent = document.getElementById("cartParent");
            var emptyCart = document.getElementById("emptyCart");
//            var mybag = document.getElementById("mybag");

//            mybag.textContent = 0;
            cartParent.classList.add("hidden");
            emptyCart.classList.remove("hidden");

//            var cart = document.getElementById("productCount");
//            cart.innerHTML = 0;
        }

    }
    return false;
}

//function for checkout form
function changeAddress() {
    var addressMainDiv = document.getElementById("addressMainDiv");
    addressMainDiv.classList.toggle("hidden");
}

function addAddress(userid) {
//    alert(userid);
    var result = checkEmpty("newAddress", "Address", "addressSpan") &&
            checkEmpty("state", "State", "stateSpan") &&
            checkEmpty("city", "City", "citySpan") &&
            checkEmpty("pincode", "Pincode", "pincodeSpan");

    if (result) {
        var newAddress = document.getElementById("newAddress").value;
        var state = document.getElementById("state").value;
        var city = document.getElementById("city").value;
        var pincode = document.getElementById("pincode").value;

//        alert(newAddress + state + city);

        var data = "userid=" + userid + "&address=" + newAddress + "&state=" + state + "&city=" + city + "&pincode=" + pincode
                + "&process=addAddress";

//        alert("call start");
        ajaxCall("POST", "userEventServlet", data, "loadUserEvents", "html");
//        alert("call ends");

        var result = document.getElementById("result").value;
        if (result > 0) {
            alert("Address added successfully");
            userDetail("userProfile", userid);
        } else {
            alert("Error in insertion");
            return false;
        }
    }
    return false;
}

function viewAddress(userid) {
//    alert("call start");
    ajaxCall("POST", "userEventServlet", "process=viewAddress&userid=" + userid, "defaultAddress", "html");
//    alert("call ends");
}

//cart related functions ends =====================================




//admin side functions starts =====================================
function viewProducts(param) {
    ajaxCall('POST', 'adminEventsServlet', 'process=' + param, 'loadMainContent', 'html');
}

//funtion for deleting the product
function deleteItem(pid) {
    let result = confirm("Are you sure to delete this product ?");
    if (result) {
        ajaxCall('POST', 'adminEventsServlet', 'process=deleteItem&pid=' + pid, 'loadMainContent', 'html');
        var status = document.getElementById("status").value;
//        alert(status);
        if (status > 0) {
            alert("product deleted successfully");
            viewProducts("viewProducts");
            return false;
        } else {
            alert("Some error occurs");
            return false;
        }
    } else {
        alert("Nothing to do!!");
        return false;
    }
    return false;
}

//to display the product insertion form
function insertItemForm() {
    ajaxCall('POST', 'adminEventsServlet', 'process=InsertItemForm', 'loadMainContent', 'html');
}

//to display edit product form
function editForm(pid) {
    ajaxCall('POST', 'adminEventsServlet', 'process=editItemForm&pid=' + pid, 'loadMainContent', 'html');
}

//to insert the products into db
function addProduct() {
    var result = checkEmpty("pid", "product id", "pidSpan") &&
            checkEmpty("pname", "product name", "pnameSpan") &&
            checkEmpty("brand", "brand name", "brandSpan") &&
            checkEmpty("description", "product description", "descriptionSpan") &&
            validatePrice("price", "priceSpan") &&
            checkEmpty("quantity", "product quantity", "quantitySpan") &&
            checkEmpty("image", "product image", "imageSpan") &&
            checkEmpty("cid", "category name", "cidSpan") &&
            checkEmpty("discount", "discount", "discountSpan") &&
            checkEmpty("sid", "shade id", "sidSpan");

    let formData = new FormData();
    if (result) {

        var pid = document.getElementById("pid").value;
        var pname = document.getElementById("pname").value;
        var brand = document.getElementById("brand").value;
        var description = document.getElementById("description").value;
        var price = document.getElementById("price").value;
        var quantity = document.getElementById("quantity").value;
        var image = document.querySelector("#image");
        var cid = document.getElementById("cid").value;
        var discount = document.getElementById("discount").value;
        var sid = document.getElementById("sid").value;
//        alert(pid + " " + pname);

        let pimage = image.files[0];
////        alert(pimage);
//
        formData.append("pid", pid);
        formData.append("pname", pname);
        formData.append("brand", brand);
        formData.append("description", description);
        formData.append("price", price);
        formData.append("quantity", quantity);
        formData.append("pimage", pimage);
        formData.append("cid", cid);
        formData.append("discount", discount);
        formData.append("sid", sid);
//
//        alert("call start");
        ajaxCall('POST', 'insertProductServlet', formData, 'loadFormdata', '', 'file');
//        alert("call ends");

        var status = document.getElementById("loadFormdata").value;
        if (status > 0) {
            alert("product added successfully");
            ajaxCall('POST', 'adminEventsServlet', 'process=InsertItemForm', 'loadMainContent', 'html');
        } else {
            alert("Some error occus");
            return false;
        }
    }
    return false;
//           
}

//to update the products
function updateProduct() {
    var result = checkEmpty("pid", "product id", "pidSpan") &&
            checkEmpty("pname", "product name", "pnameSpan") &&
            checkEmpty("brand", "brand name", "brandSpan") &&
            checkEmpty("description", "product description", "descriptionSpan") &&
            validatePrice("price", "priceSpan") &&
            checkEmpty("quantity", "product quantity", "quantitySpan") &&
            checkEmpty("image", "product image", "imageSpan") &&
            checkEmpty("cid", "category name", "cidSpan") &&
            checkEmpty("discount", "discount", "discountSpan") &&
            checkEmpty("sid", "shade id", "sidSpan");

    let formData = new FormData();
    if (result) {

        var pid = document.getElementById("pid").value;
        var pname = document.getElementById("pname").value;
        var brand = document.getElementById("brand").value;
        var description = document.getElementById("description").value;
        var price = document.getElementById("price").value;
        var quantity = document.getElementById("quantity").value;
        var image = document.querySelector("#image");
        var cid = document.getElementById("cid").value;
        var discount = document.getElementById("discount").value;
        var sid = document.getElementById("sid").value;
//        alert(pid + " " + pname);

        let pimage = image.files[0];

        formData.append("pid", pid);
        formData.append("pname", pname);
        formData.append("brand", brand);
        formData.append("description", description);
        formData.append("price", price);
        formData.append("quantity", quantity);
        formData.append("pimage", pimage);
        formData.append("cid", cid);
        formData.append("discount", discount);
        formData.append("sid", sid);
//
//        alert("call start");
        ajaxCall('POST', 'updateProductServlet', formData, 'loadFormdata', '', 'file');
//        alert("call ends");

        var status = document.getElementById("loadFormdata").value;
        if (status > 0) {
            alert("product updated successfully");
            viewProducts('editProducts')//            resetForm(document.getElementById("updateForm"));
//            return false;
//            alert("reset form successfully");
        } else {
            alert("Some error occus");
            return false;
        }
    }
    return false;
//           
}

function cancelSubmission() {
    alert("you cancel the submission");
    return false;
}

function filterOrder() {
    var selectElement = document.getElementById("selectOrderType");
    var selectedValue = selectElement.value;
//    alert(selectedValue);

    if (selectedValue === "pending") {
        ajaxCall("POST", "adminEventsServlet", "process=getPendingOrders", "loadMainContent", "html");
    } else if (selectedValue === "confirmed") {
        ajaxCall("POST", "adminEventsServlet", "process=getConfirmedOrders", "loadMainContent", "html");
    }
}

//function for check admin login 
function checkAdmin() {
    var result = checkEmpty("username", "Username", "usernameSpan") &&
            checkEmpty("password", "Password", "passwordSpan");
    if (result) {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
//        alert(username + " " + password);

        ajaxCall("Post", "adminLoginServlet", "username=" + username + "&password=" + password, "loginSpan", "html");

        var loginSPan = document.getElementById("loginSpan");

        if (parseInt(loginSPan.textContent) > 0) {
            loginSPan.classList.add("hidden");
            window.location.href = "adminDashboard.jsp";
        } else {
            loginSPan.innerHTML = "Invalid username or password!!";
            return false;
        }
    }
    return false;
}

//function to get the admin details
function getAdminData(adminid) {
    ajaxCall("POST", "adminEventsServlet", "process=getAdminData&adminid=" + adminid, "loadAdmin", "html");
    getOrderDetails();
}

//admin logout function
function logoutAdmin() {
    var result = confirm("Are you really want to logout ? ");
    if (result) {
        ajaxCall('POST', 'adminLogoutServlet', '', '', '');
        window.location.href = "adminLogin.jsp";
        alert("logout from pretty era....");
//        return true;
    } else {
        return false;
    }
    return false;
}

//function to get all orders at admin side
function getOrderDetails() {
    ajaxCall("POST", "adminEventsServlet", "process=getOrderDetails", "loadMainContent", "html");
}

//function to get all users at admin side
function getUserList() {
    ajaxCall("POST", "adminEventsServlet", "process=getUserList", "loadMainContent", "html");
}

function getCategoryList() {
    ajaxCall("POST", "adminEventsServlet", "process=getCategoryList", "loadMainContent", "html");
}

function editCategoryForm(cid) {
//    alert(cid);
//    alert("call start");
    ajaxCall('POST', 'adminEventsServlet', 'process=editCategoryForm&cid=' + cid, 'loadCategory', 'html');
//    alert("call ends");
}

function updateCategory(cid) {
    var result = checkEmpty('cid', 'category id', 'cidSpan') &&
            checkEmpty('cname', 'category name', 'cnameSpan');
    if (result) {
//        var cid = document.getElementById("cid").value;
        var cname = document.getElementById("cname").value;

//        alert(cid + " " + cname);
//        alert("call start");
        ajaxCall('POST', 'adminEventsServlet', 'process=updateCategory&cname=' + cname + '&cid=' + cid, 'loadCategory', 'html');
//        alert("call ends");

        var status = parseInt(document.getElementById("loadCategory").innerHTML);
        if (status > 0) {
            alert("category updated successfully!");
            ajaxCall("POST", "adminEventsServlet", "process=getCategoryList", "loadMainContent", "html");
        } else {
            alert("Error occurs while removing!");
            return false;
        }
    }
    return false;
}

function removeCategory(cid) {
    var result = confirm("Are you sure ?");
    if (result) {
//        alert("call start");
        ajaxCall('POST', 'adminEventsServlet', 'process=removeCategory&cid=' + cid, 'loadCategory', 'html');
//        alert("call ends");

        var status = parseInt(document.getElementById("loadCategory").innerHTML);
        if (status > 0) {
            alert("category removed successfully!");
            ajaxCall("POST", "adminEventsServlet", "process=getCategoryList", "loadMainContent", "html");
        } else {
            alert("Error occurs while removing!");
            return false;
        }
    }
    return false;
}

//function to get user inquiries
function getInquiryList() {
//    alert("call start");
    ajaxCall('POST', 'adminEventsServlet', 'process=getInquiryList', 'loadMainContent', 'html');
//    alert("call ends");
}

function adminProfile(adminid) {
//    alert(adminid);
//    alert("call start");
    ajaxCall('POST', 'adminEventsServlet', 'process=adminProfile&adminid=' + adminid, 'main', 'html');
//    alert("call ends");
}

function editAdminProfileForm(adminid) {
//    alert("call start");
    ajaxCall('POST', 'adminEventsServlet', 'process=editAdminProfileForm&adminid=' + adminid, 'loadAdminData', 'html');
//    alert("call ends");
}

function updateAdmin() {
    var result = checkEmpty("adminid", "Admin Id", "adminidSpan") &&
            checkEmpty("username", "Username", "usernameSpan") &&
            checkEmpty("password", "Password", "passwordSpan") &&
            checkEmpty("fname", "First name", "fnameSpan") &&
            checkEmpty("lname", "Last name", "lnameSpan") &&
            checkEmpty("email", "Email", "emailSpan") &&
            validateMobileno("mobile", "mobileSpan");

    if (result) {
        var adminid = document.getElementById("adminid").value;
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var fname = document.getElementById("fname").value;
        var lname = document.getElementById("lname").value;
        var email = document.getElementById("email").value;
        var mobile = document.getElementById("mobile").value;

//        alert(fname);

        var data = "adminid=" + adminid + "&username=" + username + "&password=" + password + "&fname=" +
                fname + "&lname=" + lname + "&email=" + email + "&mobile=" + mobile + "&process=updateAdmin";

//        alert("call start");
        ajaxCall('POST', 'adminEventsServlet', data, 'loadAdminData', 'html');
//        alert("call ends");

        var status = document.getElementById("loadAdminData").innerHTML;
        if (status > 0) {
            alert("Detail updated successfully");
            ajaxCall('POST', 'adminEventsServlet', 'process=adminProfile&adminid=' + adminid, 'main', 'html');
        } else {
            alert("error ocuurs");
            return false;
        }
    }
    return false;
}
//admin side functions ends

//homepage functions
function trendingNow() {
    ajaxCall('POST', 'homeServlet', 'process=trendingNow', 'trendingSection', 'html');
}

function topDeals() {
    ajaxCall('POST', 'homeServlet', 'process=topDeals', 'topDealsSection', 'html');
}

function topBrands() {
    ajaxCall('POST', 'homeServlet', 'process=topBrands', 'topBrandsSection', 'html');
}

function showFilterOptions(angleid, filterid) {
    var angle = document.getElementById(angleid);
    var filterCategories = document.getElementById(filterid);
    angle.classList.toggle("fa-angle-up");
    filterCategories.classList.toggle("hidden");
    // alert("hello");
}

//function for filter
function applyFilter() {
    var element1 = document.getElementsByName("rb");
    var element2 = document.getElementById("filter-choice");
    var filterCategory = document.getElementById("filter-categories");
    for (let index = 0; index < element1.length; index++) {
        if (element1[index].checked) {
            element2.innerHTML = element1[index].value;
            filterCategory.classList.add("hidden");
            return;
        }
    }
    alert("no radio button selected");
}

//function for displaying or hiding any form
function showForm(element, form, icon) {
    var element1 = document.getElementById(element);
    var form1 = document.getElementById(form);
    var plussign = document.getElementById(icon);
    element1.classList.toggle("hidden");
    form1.classList.toggle("hidden");
    plussign.classList.toggle("hidden");
    return false;
}
