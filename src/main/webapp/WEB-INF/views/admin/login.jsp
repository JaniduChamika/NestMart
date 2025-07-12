<%-- 
    Document   : login
    Created on : Mar 14, 2025, 7:21:06 AM
    Author     : ROG STRIX
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%> 
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Nest Mart | Admin Login</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/feather/feather.css">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/ti-icons/css/themify-icons.css">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/typicons/typicons.css">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/simple-line-icons/css/simple-line-icons.css">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="${base_url}pro-assets/css/vertical-layout-light/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="${base_url}pro-assets/images/favicon.png" />
    </head>

    <body>
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-center auth px-0">
                    <div class="row w-100 mx-0">
                        <div class="col-lg-4 mx-auto">
                            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                                <div class="brand-logo">
                                    <img src="${base_url}pro-assets/images/admin-logo.png" alt="logo">
                                </div>
                                <h4>Hello! let's get started</h4>
                                <h6 class="fw-light">Sign in to continue.</h6>
                                <form class="pt-3" id="login-form" action="${base_url}admin/login" method="post">
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-lg" id="login-email" name="login-email" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-lg" id="login-password" name="login-password" placeholder="Password">
                                    </div>
                                    <span id="msglog" class="text-danger"></span>
                                    <div class="mt-3">
                                        <button class="btn btn-primary btn-md " type="submit">SIGN IN</button>
                                    </div>
                                    <div class="my-2 d-flex justify-content-between align-items-center">

                                        <a href="#" class="auth-link text-black">Forgot password?</a>
                                    </div>


                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="${base_url}pro-assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <script src="${base_url}pro-assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="${base_url}pro-assets/js/off-canvas.js"></script>
        <script src="${base_url}pro-assets/js/hoverable-collapse.js"></script>
        <script src="${base_url}pro-assets/js/template.js"></script>
        <script src="${base_url}pro-assets/js/settings.js"></script>
        <script src="${base_url}pro-assets/js/todolist.js"></script>
         <script src="${base_url}assets/js/just-validate.production.min.js"></script>
        <script type="text/javascript">
            const validatelog = new JustValidate('#login-form');
            validatelog
                    .addField('#login-email', [{rule: 'required'}, {rule: 'email'}])
                    .addField('#login-password', [{rule: 'required'}, {rule: 'minLength', value: 4}])
                    .onSuccess((event) => {
                        let emaillog = document.querySelector("#login-email").value;
                        let passwordlog = document.querySelector("#login-password").value;

//                        let submitbtn = document.querySelector("#login-submit-btn");
//                        submitbtn.enabled = false;
                        let datalog = new URLSearchParams();
                        datalog.append("email", emaillog);
                        datalog.append("password", passwordlog);

                        fetch("${base_url}admin/login", {
                            method: "POST",
                            headers: {"Content-Type": "application/x-www-form-urlencoded"},
                            body: datalog
                        }).then(response => response.json())
                                .then(response => {
                                    if (response.msg == "sucess") {
                                        window.location.href = "${base_url}admin";
                                    } else {
                                        document.querySelector("#msglog").innerHTML = response.msg;
                                    }
                                }).catch(ex => console.log(ex));
                    });
        </script>
        <!-- endinject -->
    </body>

</html>
