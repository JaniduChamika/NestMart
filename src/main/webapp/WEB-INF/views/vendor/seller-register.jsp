<%-- 
    Document   : seller_register
    Created on : Mar 1, 2025, 10:04:25 PM
    Author     : ROG STRIX
--%>





<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%> 
<layout:extends name="base">
    <layout:put block="contents" type="REPLACE">
        <main class="main">
            <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Pages</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Login</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="login-page bg-image pt-8 pb-8 pt-md-12 pb-md-12 pt-lg-17 pb-lg-17" style="background-image: url('${base_url}assets/images/backgrounds/login-bg.jpg')">
                <div class="container">
                    <div class="form-box">
                        <div class="form-tab">
                            <ul class="nav nav-pills nav-fill" role="tablist">

                                <li class="nav-item">
                                    <a class="nav-link active" id="register-tab-1" data-toggle="tab" href="#" role="tab" aria-controls="register-1" aria-selected="true">Register As Seller</a>
                                </li>
                            </ul>
                            <div class="tab-content">

                                <div class="tab-pane active" id="register-1" role="tabpanel" aria-labelledby="register-tab-1">
                                    <form action="register-user" method="post" id="signup-form">
                                        <div class="form-group">
                                            <label for="first-name">Business Name *</label>
                                            <input type="text" class="form-control" id="business-name" name="business-name" required>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for="last-name">Business Email *</label>
                                            <input type="email" class="form-control" id="business-email" name="business-email" required>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for=mobile-number">Business Contact *</label>
                                            <input type="tel" class="form-control" id="business-contact" name="business-contact" required>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for="register-email">Address No*</label>
                                            <input type="text" class="form-control" id="address-no" name="address-no" required>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for="register-email">Address Line 1*</label>
                                            <input type="email" class="form-control" id="address-line1" name="address-line1" required>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for="register-email">Address Line 2</label>
                                            <input type="email" class="form-control" id="address-line2" name="address-line2" >
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for="gender">Province *</label>
                                            <select class="form-control" id="province" name="province" onchange="getDistrict()" required>
                                                <option value="">Select Province</option>
                                                <c:forEach var="province" items="${provinces}">
                                                    <option value="${province.id}">${province.nameEn}</option>
                                                </c:forEach>

                                            </select>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for="gender">District *</label>
                                            <select class="form-control" id="district" onchange="getcities()" name="district" required>
                                                <option value="">Select District</option>
                                                <c:forEach var="district" items="${districts}">
                                                    <option value="${district.id}">${district.nameEn}</option>
                                                </c:forEach>
                                            </select>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for="gender">City *</label>
                                            <select class="form-control" id="city" name="city"  required>
                                                <option value="">Select City</option>

                                                <c:forEach var="city" items="${cities}">
                                                    <option value="${city.cityId}">${city.cityName}</option>
                                                </c:forEach>
                                            </select>
                                        </div><!-- End .form-group -->
                                        <span id="msg" class="text-danger"></span>
                                        <div class="form-footer">
                                            <button type="submit" class="btn btn-outline-primary-2">
                                                <span>REGISTER</span>
                                                <i class="icon-long-arrow-right"></i>
                                            </button>

                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="register-policy-2" required>
                                                <label class="custom-control-label" for="register-policy-2">I agree to the <a href="#">privacy policy</a> *</label>
                                            </div><!-- End .custom-checkbox -->
                                        </div><!-- End .form-footer -->
                                    </form>

                                </div><!-- .End .tab-pane -->
                            </div><!-- End .tab-content -->
                        </div><!-- End .form-tab -->
                    </div><!-- End .form-box -->
                </div><!-- End .container -->
            </div><!-- End .login-page section-bg -->
        </main><!-- End .main -->
    </layout:put>
    <layout:put block="scripts" type="REPLACE">
         <script src="${base_url}assets/js/just-validate.production.min.js"></script>
        <script type="text/javascript">
                                                const validate = new JustValidate('#signup-form');
                                                validate
                                                        .addField('#business-name', [{rule: 'required'}])
                                                        .addField('#business-contact', [{rule: 'required'}, {
                                                                rule: 'customRegexp',
                                                                value: /^(0[1-9][0-9])\d{7}$|^(07[0-9])\d{7}$/,
                                                                errorMessage: 'Invalid mobile no'
                                                            }])
                                                        .addField('#business-email', [{rule: 'required'}, {rule: 'email'}])
                                                        .addField('#address-no', [{rule: 'required'}])
                                                        .addField('#address-line1', [{rule: 'required'}])
                                                        .addField('#city', [{rule: 'required'}])

                                                        .onSuccess((event) => {
                                                            let name = document.querySelector("#business-name").value;
                                                            let email = document.querySelector("#business-email").value;
                                                            let contact = document.querySelector("#business-contact").value;
                                                            let addressno = document.querySelector("#address-no").value;
                                                            let line1 = document.querySelector("#address-line1").value;
                                                            let line2 = document.querySelector("#address-line2").value;
                                                            let city = document.querySelector("#city").value;
                                                            let data = new URLSearchParams();
                                                            data.append("name", name);
                                                            data.append("email", email);
                                                            data.append("contact", contact);
                                                            data.append("addressno", addressno);
                                                            data.append("line1", line1);
                                                            data.append("line2", line2);
                                                            data.append("city", city);
                                                            fetch("${base_url}register-seller", {
                                                                method: "POST",
                                                                headers: {
                                                                    'Content-Type': 'application/x-www-form-urlencoded'
                                                                },
                                                                body: data
                                                            }).then(response => response.json())
                                                                    .then(response => {
                                                                        if (response.status == 201) {
                                                                            window.location.href = "${base_url}";
                                                                        } else {
                                                                            document.querySelector("#msg").innerHTML = response.msg;
                                                                        }
                                                                    }).catch(ex => console.log(ex));
                                                        });


                                                function getDistrict() {
                                                    let name = document.querySelector("#province").value;
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
                                                }
                                                function getcities() {
                                                    let name = document.querySelector("#district").value;
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
                                                }
        </script>
    </layout:put>
</layout:extends>

