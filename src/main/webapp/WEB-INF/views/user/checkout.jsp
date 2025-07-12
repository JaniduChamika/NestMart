<%-- 
    Document   : checkout
    Created on : Mar 11, 2025, 11:01:12 PM
    Author     : ROG STRIX
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%> 
<layout:extends name="base">
    <layout:put block="styles" type="REPLACE">
        <!--<link rel="stylesheet" href="${base_url}assets/css/custom.css">-->
        <style>
            .form-control{
                background: white;
            }
            .checkout .form-control:not(:focus) {
                background-color: white;
            }
            .checkout .form-control:disabled {
                background-color: #f9f9f9;
            }
        </style>
    </layout:put>
    <layout:put block="contents" type="REPLACE">
        <c:set var="requestFrom" value="Shop"/>

        <main class="main">
            <div class="page-header text-center" style="background-image: url('${base_url}assets/images/page-header-bg.jpg')">
                <div class="container">
                    <h1 class="page-title">Checkout<span>Shop</span></h1>
                </div><!-- End .container -->
            </div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
                <div class="checkout">
                    <div class="container">
                        <div class="checkout-discount">
                            <form action="#">
                                <input type="text" class="form-control" required id="checkout-discount-input">
                                <label for="checkout-discount-input" class="text-truncate">Have a coupon? <span>Click here to enter your code</span></label>
                            </form>
                        </div><!-- End .checkout-discount -->
                        <form action="place-order" method="post" id="checkout-form">
                            <div class="row">
                                <div class="col-lg-9">
                                    <h2 class="checkout-title">Billing Details</h2><!-- End .checkout-title -->

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label for="first-name">First Name *</label>
                                            <input type="text" class="form-control" id="first-name" value="${user.firstName}" name="first_name" disabled="true" required>
                                        </div><!-- End .col-sm-6 -->
                                        <div class="col-sm-6">
                                            <label for="last-name">Last Name *</label>
                                            <input type="text" class="form-control" id="last-name" name="last_name" value="${user.lastName}" disabled="true" required>
                                        </div><!-- End .col-sm-6 -->
                                    </div><!-- End .row -->

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label for="phone">Phone *</label>
                                            <input type="tel" class="form-control" id="phone" name="phone" value="${user.mobileNo}" disabled="true" required>
                                        </div><!-- End .col-sm-6 -->
                                        <div class="col-sm-6">
                                            <label for="email">Email Address *</label>
                                            <input type="email" class="form-control" id="email" name="email" value="${user.email}" disabled="true" required>
                                        </div><!-- End .col-sm-6 -->
                                    </div><!-- End .row -->
                                    <c:set var="addno" value=""/>
                                    <c:set var="addline1" value=""/>
                                    <c:set var="addline2" value=""/>
                                    <c:set var="cityname" value=""/>
                                    <c:set var="disname" value=""/>
                                    <c:set var="proname" value=""/>
                                    <c:set var="postcode" value=""/>
                                    <c:set var="isDisabled" value="${false}"/>
                                    <c:choose>
                                        <c:when test="${user.userAddress!=null}">
                                            <c:set var="addno" value="${user.userAddress.addressNo}"/>
                                            <c:set var="addline1" value="${user.userAddress.line1}"/>
                                            <c:set var="addline2" value="${user.userAddress.line2}"/>
                                            <c:set var="cityname" value="${user.userAddress.city.cityName}"/>
                                            <c:set var="disname" value="${user.userAddress.city.district.nameEn}"/>
                                            <c:set var="proname" value="${user.userAddress.city.district.province.nameEn}"/>
                                            <c:set var="postcode" value="${user.userAddress.city.postCode}"/>
                                            <c:set var="isDisabled" value="${true}"/>
                                        </c:when>
                                    </c:choose>
                                    <label>Street Address *</label>
                                    <div class="row">
                                        <div class="col-sm-4 col-xl-2">
                                            <input type="text" value="${addno}" class="form-control disable-feild" id="address-no" name="address_no" placeholder="Address No" ${isDisabled ? 'disabled' : ''} required>
                                        </div><!-- End .col-sm-4 col-xl-2 -->
                                        <div class="col-sm-4 col-xl-5">
                                            <input type="text" value="${addline1}"  class="form-control disable-feild" id="address-line1" name="address_line1" placeholder="Line 01" ${isDisabled ? 'disabled' : ''} required>
                                        </div><!-- End .col-sm-4 col-xl-5 -->
                                        <div class="col-sm-4 col-xl-5">
                                            <input type="text" value="${addline2}" class="form-control disable-feild" id="address-line2" name="address_line2" placeholder="Line 02 (optional)" ${isDisabled ? 'disabled' : ''}>
                                        </div><!-- End .col-sm-4 col-xl-5 -->
                                    </div><!-- End .row -->

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label for="province">Province *</label>
                                            <select class="form-control disable-feild" id="province" name="province" ${isDisabled ? 'disabled' : ''} required>
                                                <option value="">Select Province</option>
                                                <c:forEach var="province" items="${provinces}">
                                                    <c:choose>
                                                        <c:when test="${proname==province.nameEn}">
                                                            <option value="${province.id}" selected="">${province.nameEn}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${province.id}">${province.nameEn}</option>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </c:forEach>
                                                <!-- Add more provinces as needed -->
                                            </select>
                                        </div><!-- End .col-sm-6 -->
                                        <div class="col-sm-6">
                                            <label for="district">District *</label>
                                            <select class="form-control disable-feild" id="district" name="district" ${isDisabled ? 'disabled' : ''} required>
                                                <option value="">Select District</option>
                                                <!-- Options can be populated dynamically via JS or JSP -->
                                                <c:forEach var="district" items="${districts}">
                                                    <c:choose>
                                                        <c:when test="${disname==district.nameEn}">
                                                            <option value="${district.id}" selected="">${district.nameEn}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${district.id}">${district.nameEn}</option>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </c:forEach>
                                                <!-- Add more districts as needed -->
                                            </select>
                                        </div><!-- End .col-sm-6 -->
                                    </div><!-- End .row -->

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label for="city">Town / City *</label>
                                            <select class="form-control disable-feild" id="city" name="city" ${isDisabled ? 'disabled' : ''} required>
                                                <option value="">Select City</option>
                                                <!-- Options can be populated dynamically via JS or JSP -->
                                                <c:forEach var="city" items="${cities}">
                                                    <c:choose>
                                                        <c:when test="${cityname==city.cityName}">
                                                            <option value="${city.cityId}" selected="">${city.cityName}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${city.cityId}">${city.cityName}</option>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </c:forEach>
                                                <!-- Add more cities as needed -->
                                            </select>
                                        </div><!-- End .col-sm-6 -->
                                        <div class="col-sm-6">
                                            <label for="postcode">Postcode / ZIP *</label>
                                            <input type="text" value="${postcode}" class="form-control" id="postcode" disabled="true" name="postcode" required>
                                        </div><!-- End .col-sm-6 -->
                                    </div><!-- End .row -->

                                    <c:if test="${isDisabled}">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="checkout-diff-address" name="diff_address">
                                            <label class="custom-control-label" for="checkout-diff-address">Ship to a different address?</label>
                                        </div><!-- End .custom-checkbox -->
                                    </c:if>



                                </div><!-- End .col-lg-9 -->
                                <aside class="col-lg-3">
                                    <div class="summary">
                                        <h3 class="summary-title">Your Order</h3><!-- End .summary-title -->

                                        <c:set var="subTotal" value="${0}"/>
                                        <table class="table table-summary">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <c:choose>
                                                <c:when test="${!empty requestScope.cart}">
                                                    <tbody>
                                                        <c:forEach var="cartItem" items="${cart.cartItems}">
                                                            <c:set var="subTotal" value="${cartTotal+(cartItem.product.price * cartItem.quantity)}"/>
                                                            <tr>
                                                                <td><a href="product?pid=${cartItem.product.id}">${cartItem.product.name} <br/>x ${cartItem.quantity}</a></td>
                                                                <td>${setting.value} <fmt:formatNumber value="${cartItem.product.price * cartItem.quantity}" pattern="###,###.00" /></td>
                                                            </tr>
                                                        </c:forEach>
                                                        <tr class="summary-subtotal">
                                                            <td>Subtotal:</td>
                                                            <td>${setting.value} <fmt:formatNumber value="${subTotal}" pattern="###,###.00" /></td>
                                                        </tr><!-- End .summary-subtotal -->
                                                        <tr>
                                                            <td>Shipping:</td>
                                                            <c:set var="shipping" value="${200}"/>
                                                            <td>${setting.value} <fmt:formatNumber value="${shipping}" pattern="###,###.00" /></td>
                                                        </tr>
                                                        <tr class="summary-total">
                                                            <td>Total:</td>
                                                            <td>${setting.value} <fmt:formatNumber value="${subTotal+shipping}" pattern="###,###.00" /></td>
                                                        </tr><!-- End .summary-total -->
                                                    </tbody>
                                                </c:when>
                                                <c:otherwise>
                                                    <tbody>
                                                        <c:set var="subTotal" value="${cartTotal+(product.price * qty)}"/>
                                                        <tr>
                                                            <td><a href="product?pid=${product.id}">${product.name} <br/>x ${qty}</a></td>
                                                            <td>${setting.value} <fmt:formatNumber value="${product.price *qty}" pattern="###,###.00" /></td>
                                                        </tr>

                                                        <tr class="summary-subtotal">
                                                            <td>Subtotal:</td>
                                                            <td>${setting.value} <fmt:formatNumber value="${subTotal}" pattern="###,###.00" /></td>
                                                        </tr><!-- End .summary-subtotal -->
                                                        <tr>
                                                            <td>Shipping:</td>
                                                            <c:set var="shipping" value="${200}"/>
                                                            <td>${setting.value} <fmt:formatNumber value="${shipping}" pattern="###,###.00" /></td>
                                                        </tr>
                                                        <tr class="summary-total">
                                                            <td>Total:</td>
                                                            <td>${setting.value} <fmt:formatNumber value="${subTotal+shipping}" pattern="###,###.00" /></td>
                                                        </tr><!-- End .summary-total -->
                                                    </tbody>
                                                </c:otherwise>
                                            </c:choose>


                                        </table><!-- End .table table-summary -->

                                        <div class="accordion-summary" id="accordion-payment">

                                            <div class="payment-option">
                                                <input type="radio" name="payment_method" id="cash-on-delivery" value="CASH_ON_DELIVERY">
                                                <label for="cash-on-delivery">Cash on Delivery</label>
                                            </div>
                                            <div class="payment-option">
                                                <input type="radio" name="payment_method" id="paypal" value="PAYPAL">
                                                <label for="paypal">PayPal</label>
                                            </div>
                                            <div class="payment-option">
                                                <input type="radio" name="payment_method" id="card-payment" value="CARD_PAYMENT" checked="">
                                                <label for="card-payment">Card Payment</label>
                                            </div>
                                            <div class="payment-images">
                                                <img src="${base_url}assets/images/payments-summary.png" alt="Accepted payment cards">
                                            </div>
                                        </div><!-- End .accordion -->

                                        <button type="submit" class="btn btn-outline-primary-2 btn-order btn-block">
                                            <span class="btn-text">Place Order</span>
                                            <span class="btn-hover-text">Proceed to Checkout</span>
                                        </button>
                                    </div><!-- End .summary -->
                                </aside><!-- End .col-lg-3 -->
                            </div><!-- End .row -->
                        </form>
                    </div><!-- End .container -->
                </div><!-- End .checkout -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->
    </layout:put>
    <layout:put block="scripts" type="REPLACE">
         <script src="${base_url}assets/js/just-validate.production.min.js"></script>
        <script type="text/javascript">
            <c:if test="${isDisabled}">
            document.getElementById('checkout-diff-address').addEventListener('change', function () {
                // Get all form controls within the .col-lg-9 container
                const formControls = document.querySelectorAll('.col-lg-9 .disable-feild');

                // Enable/disable based on checkbox state
                formControls.forEach(control => {
                    control.disabled = !this.checked;
                });
            });
            </c:if>

            document.getElementById('province').addEventListener('change', function () {
                if (this.disabled)
                    return;
                const name = this.value;
                let district = document.querySelector("#district");

                let data = new URLSearchParams();
                data.append("province", name);

                fetch("${base_url}get-district", {
                    method: "POST",
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: data
                }).then(response => response.json())
                        .then(response => {
                            if (response.msg == "success") {
                                district.innerHTML = response.content;
                            }
                        }).catch(ex => console.log(ex));
            });
            document.getElementById('district').addEventListener('change', function () {
                if (this.disabled)
                    return;
                let name = this.value;
                let city = document.querySelector("#city");

                let data = new URLSearchParams();
                data.append("district", name);

                fetch("${base_url}get-city", {
                    method: "POST",
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: data
                }).then(response => response.json())
                        .then(response => {
                            if (response.msg == "success") {
                                city.innerHTML = response.content;
                            }
                        }).catch(ex => console.log(ex));
            });

            document.getElementById('city').addEventListener('change', function () {
                if (this.disabled)
                    return;
                let name = this.value;
                let postcode = document.querySelector("#postcode");

                let data = new URLSearchParams();
                data.append("city", name);

                fetch("${base_url}get-postcode", {
                    method: "POST",
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: data
                }).then(response => response.json())
                        .then(response => {
                            if (response.msg == "success") {
                                postcode.value = response.postcode;
                            }
                        }).catch(ex => console.log(ex));
            });
            const validateCheckout = new JustValidate('#checkout-form');
            validateCheckout
                    .addField('#address-no', [
                        {rule: 'required', errorMessage: 'Address No is required'},
                        {rule: 'maxLength', value: 40}
                    ])
                    .addField('#address-line1', [
                        {rule: 'required', errorMessage: 'Address Line 1 is required'},
                        {rule: 'maxLength', value: 100}
                    ])
                    .addField('#address-line2', [
                        {rule: 'maxLength', value: 100}
                    ])
                    .addField('#city', [
                        {rule: 'required', errorMessage: 'City is required'}
                    ])
                    .onSuccess((event) => {
                        let addressNo = document.querySelector('#address-no').value;
                        let addressLine1 = document.querySelector('#address-line1').value;
                        let addressLine2 = document.querySelector('#address-line2').value;
                        let city = document.querySelector('#city').value;
                        let method = document.querySelector('input[name="payment_method"]:checked').value;

                        let checkoutData = new URLSearchParams();
                        checkoutData.append("address_no", addressNo);
                        checkoutData.append("address_line1", addressLine1);
                        checkoutData.append("address_line2", addressLine2);
                        checkoutData.append("city", city);
                        checkoutData.append("payment_method", method);
            <c:choose>
                <c:when test="${empty requestScope.cart}">
                        checkoutData.append("pid", ${product.id});
                        checkoutData.append("qty", ${qty});
                </c:when>
            </c:choose>
                        fetch("place-order", {
                            method: "POST",
                            headers: {"Content-Type": "application/x-www-form-urlencoded"},
                            body: checkoutData
                        })
                                .then(response => response.json())
                                .then(response => {
                                    if (response.msg === "success") {
//                                        alert("Done");
                                        window.location.href = "${base_url}account";
                                    } else {
                                        console.log(response.msg);
                                    }
                                })
                                .catch(ex => console.log("Error during checkout:", ex));
                    });
        </script>
    </layout:put>
</layout:extends>