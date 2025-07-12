<%-- 
    Document   : sidebar
    Created on : Feb 2, 2025, 9:30:46?PM
    Author     : ROG STRIX
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item ${lastResource == 'admin' ? 'active' : ''}">
            <a class="nav-link " href="${base_url}admin">
                <i class="mdi mdi-grid-large menu-icon"></i>
                <span class="menu-title">Dashboard</span>
            </a>
        </li>
        <li class="nav-item nav-category">Managment</li>

        <li class="nav-item ${lastResource == 'user' ? 'active' : ''}">
            <a class="nav-link" data-bs-toggle="collapse" href="#order-manage" aria-expanded="${lastResource == 'user' ? 'true' : 'false'}"
               aria-controls="ui-basic">
                <i class="menu-icon mdi mdi-floor-plan"></i>
                <span class="menu-title">Users</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse ${lastResource == 'user' ? 'show' : ''}" id="order-manage">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="${base_url}admin/view-user">View Users</a></li>
                    <li class="nav-item"> <a class="nav-link" href="${base_url}admin/blacklist-user">Black list Users</a></li>
                    
                </ul>
            </div>
        </li>
        <li class="nav-item ${lastResource == 'seller' ? 'active' : ''}">
            <a class="nav-link" data-bs-toggle="collapse" href="#product-manage" aria-expanded="${lastResource == 'seller' ? 'true' : 'false'}"
               aria-controls="ui-basic">
                <i class="menu-icon mdi mdi-floor-plan"></i>
                <span class="menu-title">Sellers</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse ${lastResource == 'seller' ? 'show' : ''}" id="product-manage">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="${base_url}admin/pending-req">Pending Request</a></li>
                    <li class="nav-item"> <a class="nav-link" href="${base_url}admin/active-seller">Active Sellers</a></li>
                    <li class="nav-item"> <a class="nav-link" href="${base_url}admin/blocked-seller">Blocked Sellers</a></li>
                    
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