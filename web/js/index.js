/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

function ajaxCall(method, url, data, destination, isHtml) {
    var xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        if (isHtml) {
            document.getElementById(destination).innerHTML = this.responseText;
        } else {
            document.getElementById(destination).value = this.responseText;
        }
    };
    xhttp.open(method, url, false);
    xhttp.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
    xhttp.send(data);
}

function checkEmpty(elementId, elementName) {
    var element = document.getElementById(elementId).value;
    if (element === "") {
        alert(elementName + " can't be empty !");
        document.getElementById(elementId).focus();
        return false;
    }
    return true;
}

function resetForm(formObj) {
    formObj.reset();
}

//email validation function
function validateEmail(emailId) {
    var validRegex = /^[a-zA-Z0-90!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    var result = checkEmpty(emailId, "Email");
    if (result) {
        var email = document.getElementById(emailId).value;
        if (!email.match(validRegex)) {
            alert("Please enter a valid email address");
            document.getElementById("email").focus();
            return false;
        }
        return true;
    }
    return false;
}

//send message to website 
function sendMessage() {
    var result = checkEmpty("firstname", "First name") &&
            checkEmpty("lastname", "Last name") &&
            validateEmail("email") &&
            checkEmpty("subject", "Subject") &&
            checkEmpty("message", "Message");
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

//            alert("call start");
                    ajaxCall("POST", "contactDetailServlet", data, "loadMessage", 'html');
//            alert("call ends");
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
    var result = validateEmail('emailInput');
    if (result) {
        alert("your otp is : " + otp);
//        (function () {
//            emailjs.init("gwo0WXLi7Wl67h7-g"); //pretty era public key
//        })();
//        var serviceId = "service_stdrw9d"; //pretty era service id
//        var templateId = "template_d2gluna"; //pretty era template id
//        var params = {
//            senderemail: document.querySelector("#emailInput").value,
//            sendotp: "Your otp to login is : " + otp
//        };
//        emailjs
//                .send(serviceId, templateId, params)
//                .then((res) => {
//                    alert("Otp has been sent to your email");

        var sendDiv = document.getElementById("sendDiv");
        var verifyDiv = document.getElementById("verifyDiv");
        var verifyInput = document.getElementById("verifyInput");

        sendDiv.classList.add("hidden");
        verifyDiv.classList.remove("hidden");
        verifyInput.focus();
//                })
//                .catch();
    }
    return false;
}


//verify otp

function verifyOtp() {
    var verifyInput = document.querySelector("#verifyInput").value;
    var loginDiv = document.querySelector("#loginDiv");
    var profileform = document.querySelector("#profile-form");
    var emailInput = document.getElementById("emailInput").value;
    var result = checkEmpty("verifyInput", "otp");

    if (result) {
        if (verifyInput.match(otp)) {

            alert("otp matched");
//            alert("call start");

            ajaxCall("POST", "loginServlet", "process=verifyOtp&emailInput=" + emailInput, "loademail", false);
//            alert("call ends");

            var loademail = document.getElementById("loademail").value;

            if (!loademail.match(emailInput)) {
//                alert("not matched : " + emailInput);
//                alert(loademail);
                loginDiv.classList.add("hidden");
                window.location.href = "home.jsp";

            } else {
//                alert("matched : " + emailInput);
//                alert(loademail);
                loginDiv.classList.add("hidden");
                profileform.classList.remove("hidden");
                return false;
            }

        } else {
            alert("Please enter correct Otp!!");
            document.getElementById("verifyInput").focus();
            return false;
        }
    }
    return false;
}


//validate profile form
function validateProfileForm() {
    var result = checkEmpty("fname", "first name") &&
            checkEmpty("lname", "last name") &&
            checkEmpty("username", "username") &&
            validateEmail("loademail") &&
            checkEmpty("mobile", "mobile no.") &&
            checkEmpty("address", "address") &&
            checkEmpty("state", "state") &&
            checkEmpty("city", "city") &&
            checkEmpty("pincode", "pincode");

    if (result) {
        var fname = document.getElementById("fname").value;
        var lname = document.getElementById("lname").value;
        var username = document.getElementById("username").value;
        var email = document.getElementById("loademail").value;
        var mobile = document.getElementById("mobile").value;
        var address = document.getElementById("address").value;
        var state = document.getElementById("state").value;
        var city = document.getElementById("city").value;
        var pincode = document.getElementById("pincode").value;

        var data = "fname=" + fname + "&lname=" + lname + "&username=" + username +
                "&mobile=" + mobile + "&address=" + address + "&state=" + state +
                "&city=" + city + "&pincode=" + pincode + "&email=" + email + "&process=insertProfileData";

        ajaxCall('POST', 'loginServlet', data, 'loadProfileData', 'html');

        var status = document.getElementById("result").value;

        if (status > 0) {
            window.location.href = "home.jsp";
        } else {
            alert("error in insertion");
            return  false;
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



//cart related functions
function addToCart(id) {
    alert("product added to bag");
    var productCount = parseInt(sessionStorage.getItem("productCount")) || 0;
    productCount += 1;

    sessionStorage.setItem("productCount", productCount);
    var productCountElement = document.getElementById("productCount");
    productCountElement.innerHTML = productCount;
//    alert(parseInt(productCountElement.innerHTML));

    alert("call start");
    ajaxCall('POST', 'productDetails', 'process=cartDetails&id=' + id, '', '');
    alert("call ends");



//    window.location.href = "cartItems.jsp?productCount=" + productCount;
}

function addToCart2() {
    alert("Please login to add product into cart!!");
    window.location.href = "userLogin.jsp";
}

function buyNow() {
    window.location.href = "checkoutProcess.jsp";
}

function increase() {
    var input = document.getElementById("inputNumber");
    alert(input.value);
    input.value = parseInt(input.value) + 1;
}

function decrease() {
    var input = document.getElementById("inputNumber");
    alert(input.value);
    if (parseInt(input.value) > 0) {
        input.value = parseInt(input.value) - 1;
    }
}

function checkCartItems() {
    var productCount = parseInt(sessionStorage.getItem("productCount")) || 0;
    alert(productCount);
    var cartItem = document.getElementById("cartItem");
    var emptyCart = document.getElementById("emptyCart");

    if (productCount === 0) {
//        alert(productCount);

        cartItem.classList.add("hidden");
        emptyCart.classList.remove("hidden");
    }
}

function removeCart() {
    sessionStorage.clear();
    alert("call start");
    ajaxCall('POST', 'productDetails', 'process=removeCartItems', '', '');
    alert("call ends");
    var cartItem = document.getElementById("cartItem");
    var emptyCart = document.getElementById("emptyCart");

    cartItem.classList.add("hidden");
    emptyCart.classList.remove("hidden");

}
//cart related functions ends


//admin side functions
function viewProducts(param) {
//    alert("call start");
    ajaxCall('POST', 'adminEventsServlet', 'process=' + param, 'loadMainContent', 'html');
//    alert("call ends");
}

function deleteItem(pid) {
    let result = confirm("Are you sure to delete this product ?");
    if (result) {
        ajaxCall('POST', 'adminEventsServlet', 'process=deleteItem&pid=' + pid, 'loadMainContent', 'html');
        var status = document.getElementById("status").value;
        alert(status);
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

//to display the insertion form
function insertItemForm() {
    ajaxCall('POST', 'adminEventsServlet', 'process=InsertItemForm', 'loadMainContent', 'html');
}

function editForm(pid) {
    ajaxCall('POST', 'adminEventsServlet', 'process=editItemForm&pid=' + pid, 'loadMainContent', 'html');
}

//to insert the products into db
function addProduct() {
    var result = checkEmpty("pid", "product id") &&
            checkEmpty("pname", "product name") &&
            checkEmpty("brand", "brand name") &&
            checkEmpty("description", "product description") &&
            checkEmpty("price", "product price") &&
            checkEmpty("quantity", "product quantity") &&
            checkEmpty("image", "product image") &&
            checkEmpty("cid", "category name") &&
            checkEmpty("discount", "discount") &&
            checkEmpty("sid", "shade id");
    if (result) {

        var pid = document.getElementById("pid").value;
        var pname = document.getElementById("pname").value;
        var brand = document.getElementById("brand").value;
        var description = document.getElementById("description").value;
        var price = document.getElementById("price").value;
        var quantity = document.getElementById("quantity").value;
        var image = document.getElementById("image").value;
        var cid = document.getElementById("cid").value;
        var discount = document.getElementById("discount").value;
        var sid = document.getElementById("sid").value;
        alert(pid + " " + pname);

        var data = "pid=" + pid + "&pname=" + pname + "&brand=" + brand + "&description=" + description +
                "&price=" + price + "&quantity=" + quantity + "&image=" + image + "&cid=" + cid +
                "&discount=" + discount + "&sid=" + sid + "&process=addProduct";

        ajaxCall('POST', 'adminEventsServlet', data, 'loadMainContent', 'html');
    }
    return false;
//           
}

function cancelSubmission() {
    alert("you cancel the submission");
    return false;
}



//function to logout
function logout() {
    var result = confirm("Are you really want to logout from Pretty Era ? ");
    if (result) {
        ajaxCall('POST', 'logoutServlet', '', '', '');
        window.location.href = "home.jsp";
        alert("logout");
//        return true;
    } else {
        return false;
    }
    return false;
}

//admin login
function checkAdmin() {
    var result = checkEmpty("username", "Username") &&
            checkEmpty("password", "Password");
    if (result) {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        alert(username + " " + password);

        ajaxCall("Post", "adminLoginServlet", "username=" + username + "&password=" + password, "adminlogin", "");

//        var status = document.getElementById("adminlogin").value;
//        alert("status: " + status);
//        if (status > 0) {
        alert("matched");
        window.location.href = "adminDashboard.jsp";
    } else {
        alert("Not matched");
        return false;
    }
//    }
    return false;
}

function getAdminData(adminid) {
//    alert("call start");
    ajaxCall("Post", "adminEventsServlet", "process=getAdminData&admin_id=" + adminid, "loadAdmin", "html");
//    alert("call ends");

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




//sweetalerts
//function showSweetAlert() {
//// Call SweetAlert function
//    swal({
//        title: "Are you sure?",
//        text: "Once deleted, you will not be able to recover this imaginary file!",
//        icon: "warning",
//        buttons: true,
//        dangerMode: true,
//    })
//            .then((willDelete) => {
//                if (willDelete) {
//                    swal("Poof! Your imaginary file has been deleted!", {
//                        icon: "success",
//                    });
//                } else {
//                    swal("Your imaginary file is safe!");
//                }
//            });
//}
//;


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
    var element = document.getElementById(element);
    var form = document.getElementById(form);
    var plussign = document.getElementById(icon);
    element.classList.toggle("hidden");
    form.classList.toggle("hidden");
    plussign.classList.toggle("hidden");
}

//function for checkout form
function changeAddress() {
    var address2 = document.getElementById("address2");
    var addressMainDiv = document.getElementById("addressMainDiv");
    address2.classList.toggle("hidden");
    addressMainDiv.classList.toggle("hidden");

}