<%-- 
    Document   : base
    Created on : Jan 16, 2025, 9:12:18 PM
    Author     : ROG STRIX
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <!-- molla/index-4.html  22 Nov 2019 09:53:08 GMT -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Nest Mart</title>
        <meta name="keywords" content="HTML5 Template">
        <meta name="description" content="Molla - Bootstrap eCommerce Template">
        <meta name="author" content="p-themes">
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="${base_url}assets/images/icons/favicon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="${base_url}assets/images/icons/favicon.png">
        <link rel="icon" type="image/png" sizes="16x16" href="${base_url}assets/images/icons/favicon.png">
        <link rel="manifest" href="${base_url}assets/images/icons/site.html">
        <link rel="mask-icon" href="${base_url}assets/images/icons/safari-pinned-tab.svg" color="#666666">
        <meta name="apple-mobile-web-app-title" content="Molla">
        <meta name="application-name" content="Molla">
        <meta name="msapplication-TileColor" content="#cc9966">
        <meta name="msapplication-config" content="${base_url}assets/images/icons/browserconfig.xml">
        <meta name="theme-color" content="#ffffff">

        <!-- Plugins CSS File -->
        <link rel="stylesheet" href="${base_url}assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${base_url}assets/css/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="${base_url}assets/css/plugins/magnific-popup/magnific-popup.css">
        <link rel="stylesheet" href="${base_url}assets/css/plugins/jquery.countdown.css"> 
        <!-- Main CSS File -->
        <link rel="stylesheet" href="${base_url}assets/css/style.css">
        <link rel="stylesheet" href="${base_url}assets/css/skins/skin.css">
        <link rel="stylesheet" href="${base_url}assets/css/slider.css">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/mdi/css/materialdesignicons.min.css">
        <layout:block name="styles"/>
    </head>

    <body>
        <div class="page-wrapper">
            <jsp:include page="includes/header.jsp"/>
            <layout:block name="contents"/>
            <jsp:include page="includes/footer.jsp"/>
        </div><!-- End .page-wrapper -->
        <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>


        <jsp:include page="includes/mobile-menu.jsp"/>





        <!-- Plugins JS File -->
        <script src="${base_url}assets/js/jquery.min.js"></script>
        <script src="${base_url}assets/js/bootstrap.bundle.min.js"></script>
        <script src="${base_url}assets/js/jquery.hoverIntent.min.js"></script>
        <script src="${base_url}assets/js/jquery.waypoints.min.js"></script>
        <script src="${base_url}assets/js/superfish.min.js"></script>
        <script src="${base_url}assets/js/owl.carousel.min.js"></script>
        <script src="${base_url}assets/js/bootstrap-input-spinner.js"></script>
        <script src="${base_url}assets/js/jquery.plugin.min.js"></script>
        <script src="${base_url}assets/js/jquery.magnific-popup.min.js"></script>
        <script src="${base_url}assets/js/jquery.countdown.min.js"></script>
        <!-- Main JS File -->
        <script src="${base_url}assets/js/main.js"></script>
        <script src="${base_url}assets/js/demos/demo-4.js"></script>
        <script type="text/javascript">
            function logout() {
                fetch("logout", {
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
            <c:if test="${source!='shop'}">
            $('#searchBtn').on('click', function (e) {
                e.preventDefault();
                let search = $('#q').val() || '';
                 let url = '${base_url}shop?search=' + search;
                window.location.href = url;
            });
            </c:if>

        </script>
        <layout:block name="scripts"/>

    </body>

</html>