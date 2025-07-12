<%-- 
    Document   : sidebar
    Created on : Feb 2, 2025, 9:30:46?PM
    Author     : ROG STRIX
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item ${lastResource == 'seller' ? 'active' : ''}">
            <a class="nav-link " href="${base_url}seller">
                <i class="mdi mdi-grid-large menu-icon"></i>
                <span class="menu-title">Dashboard</span>
            </a>
        </li>
        <li class="nav-item nav-category">Managment</li>

        <li class="nav-item ${lastResource == 'order' ? 'active' : ''}">
            <a class="nav-link" data-bs-toggle="collapse" href="#order-manage" aria-expanded="${lastResource == 'order' ? 'true' : 'false'}"
               aria-controls="ui-basic">
                <i class="menu-icon mdi mdi-floor-plan"></i>
                <span class="menu-title">Orders</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse ${lastResource == 'order' ? 'show' : ''}" id="order-manage">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="${base_url}seller/pending-order">Pending Orders</a></li>
                    <li class="nav-item"> <a class="nav-link" href="${base_url}seller/active-order">Active Orders</a></li>
                    <li class="nav-item"> <a class="nav-link" href="${base_url}seller/order-history">Order History</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item ${lastResource == 'product' ? 'active' : ''}">
            <a class="nav-link" data-bs-toggle="collapse" href="#product-manage" aria-expanded="${lastResource == 'product' ? 'true' : 'false'}"
               aria-controls="ui-basic">
                <i class="menu-icon mdi mdi-floor-plan"></i>
                <span class="menu-title">Product</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse ${lastResource == 'product' ? 'show' : ''}" id="product-manage">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="${base_url}seller/add-product">Add Product</a></li>
                    <li class="nav-item"> <a class="nav-link" href="${base_url}seller/view-product">View Product</a></li>
                    <li class="nav-item"> <a class="nav-link" href="${base_url}seller/trash-product">Trash</a></li>
                </ul>
            </div>
        </li>
        <!--        <li class="nav-item nav-category">help</li>
                <li class="nav-item">
                    <a class="nav-link" href="http://bootstrapdash.com/demo/star-admin2-free/docs/documentation.html">
                        <i class="menu-icon mdi mdi-file-document"></i>
                        <span class="menu-title">Documentation</span>
                    </a>
                </li>-->
    </ul>
</nav>