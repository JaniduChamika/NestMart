<%-- 
    Document   : header
    Created on : Jan 16, 2025, 9:13:42?PM
    Author     : ROG STRIX
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.jiat.nestmart.dao.WishlistDao"%>
<%@page import="com.jiat.nestmart.entity.Wishlist"%>
<%@page import="com.jiat.nestmart.entity.Cart"%>
<%@page import="com.jiat.nestmart.dao.CartDao"%>
<%@page import="com.jiat.nestmart.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    int noWishlit = 0;
    Cart cart;
//        User user = new UserDao().getUserById(3);
    if (request.getSession().getAttribute("user") != null) {
        User user = (User) request.getSession().getAttribute("user");
        CartDao cartDao = new CartDao();
        cart = cartDao.getCartByUser(user);
        request.setAttribute("cart", cart);
        noWishlit = new WishlistDao().getWishlistByUser(user).size();

    }
%>

<header class="header header-intro-clearance header-4">
    <div class="header-top">
        <div class="container">
            <div class="header-left">
                <a href="tel:#"><i class="icon-phone"></i>Email: info@nestmart.com</a>
            </div><!-- End .header-left -->

            <div class="header-right">

                <ul class="top-menu">
                    <li>
                        <a href="#">Links</a>
                        <ul>
                            <li>
                                <div class="header-dropdown">
                                    <a href="#">USD</a>
                                    <div class="header-menu">
                                        <ul>
                                            <li><a href="#">Eur</a></li>
                                            <li><a href="#">Usd</a></li>
                                        </ul>
                                    </div><!-- End .header-menu -->
                                </div>
                            </li>
                            <li>
                                <div class="header-dropdown">
                                    <a href="#">English</a>
                                    <div class="header-menu">
                                        <ul>
                                            <li><a href="#">English</a></li>
                                            <li><a href="#">French</a></li>
                                            <li><a href="#">Spanish</a></li>
                                        </ul>
                                    </div><!-- End .header-menu -->
                                </div>
                            </li>


                            <c:if test="${sessionScope.user!=null}">
                                <c:if test="${sessionScope.user.vendor!=null}">
                                    <li><a href="${base_url}seller/">Switch to Seller</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.user.vendor==null}">
                                    <li><a href="${base_url}seller/register">Become a Seller</a></li>
                                    </c:if>
                                <li>
                                    <div class="header-dropdown">
                                        <a href="${base_url}account">Account</a>
                                        <div class="header-menu">
                                            <ul>
                                                <li><button  onclick="logout()" class="custom-btn text-center w-100" type="button" >Logout</button></li>

                                            </ul>
                                        </div><!-- End .header-menu -->
                                    </div> 
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.user==null}">
                                <li>   <a href="${base_url}sign-in">Sign in / Sign up </a> </li>
                                </c:if>

                        </ul>
                    </li>
                </ul><!-- End .top-menu -->
            </div><!-- End .header-right -->

        </div><!-- End .container -->
    </div><!-- End .header-top -->

    <div class="header-middle">
        <div class="container">
            <div class="header-left">
                <button class="mobile-menu-toggler">
                    <span class="sr-only">Toggle mobile menu</span>
                    <i class="icon-bars"></i>
                </button>

                <a href="${base_url}" class="logo">
                    <img src="${base_url}assets/images/demos/demo-4/logo.png" alt="Molla Logo" width="105" height="25">
                </a>
            </div><!-- End .header-left -->

            <div class="header-center">
                <div class="header-search header-search-extended header-search-visible d-none d-lg-block">
                    <a href="#" class="search-toggle" role="button"><i class="icon-search"></i></a>
                    <form action="#" method="get">
                        <div class="header-search-wrapper search-wrapper-wide">
                            <label for="q" class="sr-only">Search</label>
                            <button class="btn btn-primary" id="searchBtn"><i class="icon-search"></i></button>
                            <input type="search" class="form-control" 
                                   value="${param['search'] != null? param['search']:''}" 
                                   name="q" id="q" placeholder="Search product ..." required>
                        </div><!-- End .header-search-wrapper -->
                    </form>
                </div><!-- End .header-search -->
            </div>

            <div class="header-right">
                <!--                <div class="dropdown compare-dropdown">
                                    <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static" title="Compare Products" aria-label="Compare Products">
                                        <div class="icon">
                                            <i class="icon-random"></i>
                                        </div>
                                        <p>Compare</p>
                                    </a>
                
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <ul class="compare-products">
                                            <li class="compare-product">
                                                <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                                                <h4 class="compare-product-title"><a href="product.html">Blue Night Dress</a></h4>
                                            </li>
                                            <li class="compare-product">
                                                <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                                                <h4 class="compare-product-title"><a href="product.html">White Long Skirt</a></h4>
                                            </li>
                                        </ul>
                
                                        <div class="compare-actions">
                                            <a href="#" class="action-link">Clear All</a>
                                            <a href="#" class="btn btn-outline-primary-2"><span>Compare</span><i class="icon-long-arrow-right"></i></a>
                                        </div>
                                    </div> End .dropdown-menu 
                                </div> End .compare-dropdown -->

                <div class="wishlist">
                    <a href="${base_url}wishlist" title="Wishlist">
                        <div class="icon">
                            <i class="icon-heart-o"></i>
                            <span class="wishlist-count badge"><%=noWishlit%></span>
                        </div>
                        <p>Wishlist</p>
                    </a>
                </div><!-- End .compare-dropdown -->

                <div class="dropdown cart-dropdown">
                    <c:choose>
                        <c:when test="${cart!=null && cart.cartItems.size() > 0}">
                            <a href="${base_url}cart" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
                                <div class="icon">
                                    <i class="icon-shopping-cart"></i>
                                    <span class="cart-count">${cart.cartItems.size()}</span>
                                </div>
                                <p>Cart</p>
                            </a>

                            <div class="dropdown-menu dropdown-menu-right">

                                <div class="dropdown-cart-products">

                                    <c:forEach var="cartItem" items="${cart.cartItems}">
                                        <c:set var="cartTotal" value="${cartTotal+(cartItem.product.price * cartItem.quantity)}"/>
                                        <div class="product">
                                            <div class="product-cart-details">
                                                <h4 class="product-title">
                                                    <a href="product?pid=${cartItem.product.id}">${cartItem.product.name}</a>
                                                </h4>

                                                <span class="cart-product-info">
                                                    <span class="cart-product-qty">${cartItem.quantity} x ${setting.value} <fmt:formatNumber value="${cartItem.product.price}" pattern="###,###.00" /> </span> 

                                                </span>
                                            </div><!-- End .product-cart-details -->

                                            <figure class="product-image-container">
                                                <a href="product?pid=${cartItem.product.id}" class="product-image product-image-mini">
                                                    <img src="${cartItem.product.images['0']}" alt="product">
                                                </a>
                                            </figure>
                                            <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                                        </div><!-- End .product -->
                                    </c:forEach>


                                </div><!-- End .cart-product -->

                                <div class="dropdown-cart-total">
                                    <span>Total</span>

                                    <span class="cart-total-price">${setting.value} <fmt:formatNumber value="${cartTotal}" pattern="###,###.00" /></span>
                                </div><!-- End .dropdown-cart-total -->

                                <div class="dropdown-cart-action">
                                    <a href="${base_url}cart" class="btn btn-primary">View Cart</a>

                                    <a href="${base_url}cart/checkout" class="btn btn-outline-primary-2"><span>Checkout</span><i class="icon-long-arrow-right"></i></a>
                                </div><!-- End .dropdown-cart-total -->
                            </div><!-- End .dropdown-menu -->
                        </c:when>
                        <c:otherwise>
                            <a href="${base_url}cart" class="dropdown-toggle" role="button" >
                                <div class="icon">
                                    <i class="icon-shopping-cart"></i>
                                    <span class="cart-count">0</span>
                                </div>
                                <p>Cart</p>
                            </a>

                        </c:otherwise>
                    </c:choose>
                </div><!-- End .cart-dropdown -->
            </div><!-- End .header-right -->
        </div><!-- End .container -->
    </div><!-- End .header-middle -->

    <div class="header-bottom sticky-header">
        <div class="container">
            <div class="header-left">
                <div class="dropdown category-dropdown">
                    <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static" title="Browse Categories">
                        Browse Categories <i class="icon-angle-down"></i>
                    </a>

                    <div class="dropdown-menu">
                        <nav class="side-nav">
                            <ul class="menu-vertical sf-arrows">
                                <jsp:useBean id="categoryDao" class="com.jiat.nestmart.dao.CategoryDao" scope="request" />
                                <c:set var="categories" value="${categoryDao.getAllCategory()}" scope="request" />
                                <c:forEach var="category" items="${categories}">
                                    <li><a href="${base_url}shop?category=${category.id}">${category.name}</a></li>
                                    </c:forEach>
                                    <%-- <li class="item-lead"><a href="#">Daily offers</a></li>--%>

                            </ul><!-- End .menu-vertical -->
                        </nav><!-- End .side-nav -->
                    </div><!-- End .dropdown-menu -->
                </div><!-- End .category-dropdown -->
            </div><!-- End .header-left -->

            <div class="header-center">
                <nav class="main-nav">
                    <ul class="menu sf-arrows">
                        <li class="megamenu-container ${source=='home'?'active':''}">
                            <a href="${base_url}" class="">Home</a>


                        </li>
                        <li class="${param["sub-category"]!='1' &&param["sub-category"]!='7' &&param["sub-category"]!='3'&& source=='shop'?'active':''}">
                            <a href="${base_url}shop" class="sf-with-ul">Shop</a>
                            <div class="megamenu megamenu-md">
                                <div class="row no-gutters">
                                    <div class="col-md-12">
                                        <div class="menu-col">
                                            <div class="row">

                                                <c:forEach var="category" items="${categories}" begin="0" end="5">

                                                    <div class="col-md-6 col-lg-4 col-xxl-3">
                                                        <div class="menu-title">${category.name}</div><!-- End .menu-title -->
                                                        <ul>
                                                            <c:forEach var="subcategory" items="${category.subCategory}">
                                                                <li><a href="${base_url}shop?sub-category=${subcategory.id}">${subcategory.name}</a></li>
                                                                </c:forEach>

                                                            <%--
                                                            <li><a href="category-boxed.html"><span>Shop Boxed No Sidebar<span class="tip tip-hot">Hot</span></span></a></li>
                                                                <li><a href="category-market.html"><span>Shop Market<span class="tip tip-new">New</span></span></a></li>--%>
                                                        </ul>
                                                    </div><!-- End .col-md-6 -->
                                                </c:forEach>



                                            </div><!-- End .row -->
                                            <div class="megamenu-action text-center mt-3">
                                                <a href="#" class="btn btn-outline-primary-2 view-all-demos"><span>View All Category</span><i class="icon-long-arrow-right"></i></a>
                                            </div><!-- End .text-center -->
                                        </div><!-- End .menu-col -->
                                    </div><!-- End .col-md-8 -->


                                </div><!-- End .row -->
                            </div><!-- End .megamenu megamenu-md -->

                        </li>
                        <li class="${param["sub-category"]=='1'?'active':''}">
                            <a href="${base_url}shop?sub-category=1" class="">Mobile Phone</a>

                        </li>

                        <li class="${param["sub-category"]=='7'?'active':''}">
                            <a href="${base_url}shop?sub-category=7" class="">Laptop</a>

                        </li>
                        <li class="${param["sub-category"]=='3'?'active':''}"> 
                            <a href="${base_url}shop?sub-category=3 " class="">Chargers & Power Banks </a>

                        </li>
                    </ul><!-- End .menu -->
                </nav><!-- End .main-nav -->
            </div><!-- End .header-center -->

            <div class="header-right">
                <i class="la la-lightbulb-o"></i><p>Clearance<span class="highlight">&nbsp;Up to 30% Off</span></p>
            </div>
        </div><!-- End .container -->
    </div><!-- End .header-bottom -->
</header><!-- End .header -->