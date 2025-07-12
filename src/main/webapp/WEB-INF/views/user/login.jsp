<%-- 
    Document   : login
    Created on : Jan 31, 2025, 11:36:22 PM
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

            <div class="login-page bg-image pt-8 pb-8 pt-md-12 pb-md-12 pt-lg-17 pb-lg-17" style="background-image: url('assets/images/backgrounds/login-bg.jpg')">
                <div class="container">
                    <div class="form-box">
                        <div class="form-tab">
                            <ul class="nav nav-pills nav-fill" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="signin-tab-2" data-toggle="tab" href="#signin-2" role="tab" aria-controls="signin-2" aria-selected="false">Sign In</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " id="register-tab-2" data-toggle="tab" href="#register-2" role="tab" aria-controls="register-2" aria-selected="true">Register</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="signin-2" role="tabpanel" aria-labelledby="signin-tab-2">
                                    <c:set var="email" value=""/>
                                    <c:if test="${cookie.authenticateEm.value!=null}">
                                        <c:set var="email" value="${cookie.authenticateEm.value}"/>
                                    </c:if>
                                    <c:set var="pw" value=""/>
                                    <c:if test="${cookie.authenticatePw.value!=null}">
                                        <c:set var="pw" value="${cookie.authenticatePw.value}"/>
                                    </c:if>
                                    <form action="login-user" method="post" id="login-form">
                                        <div class="form-group">
                                            <label for="singin-email">Email address *</label>
                                            <input type="email" class="form-control" id="login-email" name="login-email" value="${email}" required>
                                        </div><!-- End .form-group -->

                                        <div class="form-group">
                                            <label for="singin-password">Password *</label>
                                            <input type="password" class="form-control" id="login-password" name="login-password" value="${pw}" required>
                                        </div><!-- End .form-group -->
                                        <span id="msglog" class="text-danger"></span>

                                        <div class="form-footer">
                                            <button type="submit" class="btn btn-outline-primary-2" id="login-submit-btn">
                                                <span>LOG IN</span>
                                                <i class="icon-long-arrow-right"></i>
                                            </button>

                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="signin-remember">
                                                <label class="custom-control-label" for="signin-remember">Remember Me</label>
                                            </div><!-- End .custom-checkbox -->

                                            <a href="#" class="forgot-link">Forgot Your Password?</a>
                                        </div><!-- End .form-footer -->
                                    </form>
                                    <div class="form-choice">
                                        <p class="text-center">or sign in with</p>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <a href="#" class="btn btn-login btn-g">
                                                    <i class="icon-google"></i>
                                                    Login With Google
                                                </a>
                                            </div><!-- End .col-6 -->
                                            <div class="col-sm-6">
                                                <a href="#" class="btn btn-login btn-f">
                                                    <i class="icon-facebook-f"></i>
                                                    Login With Facebook
                                                </a>
                                            </div><!-- End .col-6 -->
                                        </div><!-- End .row -->
                                    </div><!-- End .form-choice -->
                                </div><!-- .End .tab-pane -->
                                <div class="tab-pane fade  " id="register-2" role="tabpanel" aria-labelledby="register-tab-2">
                                    <form action="register-user" method="post" id="signup-form">
                                        <div class="form-group">
                                            <label for="first-name">First Name *</label>
                                            <input type="text" class="form-control" id="first-name" name="first-name" required>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for="last-name">Last Name *</label>
                                            <input type="text" class="form-control" id="last-name" name="last-name" required>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for=mobile-number">Mobile Number *</label>
                                            <input type="tel" class="form-control" id="mobile-number" name="mobile-number" required>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for="register-email">Your email address *</label>
                                            <input type="email" class="form-control" id="register-email" name="register-email" required>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for="dob">Date of birth *</label>
                                            <input type="date" class="form-control" id="dob" name="dob" required>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for="gender">Gender *</label>
                                            <select class="form-control" id="gender" name="gender" required>
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                            </select>
                                        </div><!-- End .form-group -->
                                        <div class="form-group">
                                            <label for="register-password">Password *</label>
                                            <input type="password" class="form-control" id="register-password" name="register-password" required>
                                        </div><!-- End .form-group -->
                                        <span id="msg" class="text-danger"></span>
                                        <div class="form-footer">
                                            <button type="submit" class="btn btn-outline-primary-2">
                                                <span>SIGN UP</span>
                                                <i class="icon-long-arrow-right"></i>
                                            </button>

                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="register-policy-2" required>
                                                <label class="custom-control-label" for="register-policy-2">I agree to the <a href="#">privacy policy</a> *</label>
                                            </div><!-- End .custom-checkbox -->
                                        </div><!-- End .form-footer -->
                                    </form>
                                    <!--                                    <div class="form-choice">
                                                                            <p class="text-center">or sign in with</p>
                                                                            <div class="row">
                                                                                <div class="col-sm-6">
                                                                                    <a href="#" class="btn btn-login btn-g">
                                                                                        <i class="icon-google"></i>
                                                                                        Login With Google
                                                                                    </a>
                                                                                </div> End .col-6 
                                                                                <div class="col-sm-6">
                                                                                    <a href="#" class="btn btn-login  btn-f">
                                                                                        <i class="icon-facebook-f"></i>
                                                                                        Login With Facebook
                                                                                    </a>
                                                                                </div> End .col-6 
                                                                            </div> End .row 
                                                                        </div> End .form-choice -->
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
                    .addField('#first-name', [{rule: 'required'}])
                    .addField('#last-name', [{rule: 'required'}])
                    .addField('#mobile-number', [{rule: 'required'}, {
                            rule: 'customRegexp',
                            value: /^07[1245678]\d{7}$/,
                            errorMessage: 'Invalid mobile no'
                        }])
                    .addField('#register-email', [{rule: 'required'}, {rule: 'email'}])
                    .addField('#dob', [{rule: 'required'}])
                    .addField('#gender', [{rule: 'required'}])
                    .addField('#register-password', [{rule: 'required'}, {rule: 'minLength', value: 4}])
                    .onSuccess((event) => {
                        let fname = document.querySelector("#first-name").value;
                        let lname = document.querySelector("#last-name").value;
                        let dob = document.querySelector("#dob").value;
                        let gender = document.querySelector("#gender").value;
                        let email = document.querySelector("#register-email").value;
                        let mobile = document.querySelector("#mobile-number").value;
                        let password = document.querySelector("#register-password").value;
                        let data = new URLSearchParams();
                        data.append("firstName", fname);
                        data.append("lastName", lname);
                        data.append("mobileNo", mobile);
                        data.append("email", email);
                        data.append("dob", dob);
                        data.append("gender", gender);
                        data.append("password", password);
                        fetch("register-user", {
                            method: "POST",
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: data
                        }).then(response => response.json())
                                .then(response => {
                                    if (response.msg == "sucess") {
                                        location.reload();
                                    } else {
                                        document.querySelector("#msg").innerHTML = response.msg;
                                    }
                                }).catch(ex => console.log(ex));
                    });



            const validatelog = new JustValidate('#login-form');
            validatelog
                    .addField('#login-email', [{rule: 'required'}, {rule: 'email'}])
                    .addField('#login-password', [{rule: 'required'}, {rule: 'minLength', value: 4}])
                    .onSuccess((event) => {
                        let emaillog = document.querySelector("#login-email").value;
                        let passwordlog = document.querySelector("#login-password").value;
                        let remember = document.querySelector("#signin-remember").checked;
//                        let submitbtn = document.querySelector("#login-submit-btn");
//                        submitbtn.enabled = false;
                        let datalog = new URLSearchParams();
                        datalog.append("email", emaillog);
                        datalog.append("password", passwordlog);
                        datalog.append("rem", remember);
                        fetch("login-user", {
                            method: "POST",
                            headers: {"Content-Type": "application/x-www-form-urlencoded"},
                            body: datalog
                        }).then(response => response.json())
                                .then(response => {
                                    if (response.msg == "sucess") {
                                        window.location.href = "${base_url}";
                                    } else {
                                        document.querySelector("#msglog").innerHTML = response.msg;
                                    }
                                }).catch(ex => console.log(ex));
                    });
        </script>
    </layout:put>
</layout:extends>

