<%-- 
    Document   : vendor
    Created on : Feb 2, 2025, 7:16:12 PM
    Author     : ROG STRIX
--%>

<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Nest Mart | Admin </title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/feather/feather.css">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/ti-icons/css/themify-icons.css">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/typicons/typicons.css">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/simple-line-icons/css/simple-line-icons.css">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->

        <layout:block name="pluginCSS"/>
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="${base_url}pro-assets/css/vertical-layout-light/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="${base_url}pro-assets/images/favicon.png" />
        <layout:block name="customCSS"/>
    </head>

    <body>
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <jsp:include page="admin-includes/header.jsp"/>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">

                <!-- partial -->
                <!-- partial:partials/_sidebar.html -->
                <jsp:include page="admin-includes/sidebar.jsp"/>
                <div class="main-panel">
                    <!-- partial -->
                    <layout:block name="contents"/>

                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <jsp:include page="admin-includes/footer.jsp"/>

                    <!-- partial -->

                </div>
                <!-- main-panel ends -->

            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->

        <!-- plugins:js -->
        <script src="${base_url}pro-assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->

        <layout:block name="pluginJS"/>
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="${base_url}pro-assets/js/off-canvas.js"></script>
        <script src="${base_url}pro-assets/js/hoverable-collapse.js"></script>
        <script src="${base_url}pro-assets/js/template.js"></script>
        <script src="${base_url}pro-assets/js/settings.js"></script>
        <script src="${base_url}pro-assets/js/todolist.js"></script>
        <!-- endinject -->
        <script src="${base_url}pro-assets/js/dashboard.js"></script>
        <!-- Custom js for this page-->
        <layout:block name="customJS"/>
        <script type="text/javascript">
            function logout() {
                fetch("${base_url}logout", {
                    method: "GET",
                    headers: {"Content-Type": "application/x-www-form-urlencoded"}
                }).then(response => response.json())
                        .then(response => {
                            if (response.msg === "success") {
                            window.location.href = "${base_url}";
                            } else {
                                console.log(response.msg);
                            }
                        }).catch(ex => {
                    console.log(ex);

                });
            }
        </script>
        <!-- End custom js for this page-->
    </body>

</html>