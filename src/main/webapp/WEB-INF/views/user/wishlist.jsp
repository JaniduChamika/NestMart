<%-- 
    Document   : wishlist
    Created on : Feb 2, 2025, 2:18:53 PM
    Author     : ROG STRIX
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%> 
<layout:extends name="base">
    <layout:put block="contents" type="REPLACE">
        <main class="main">
            <div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
                <div class="container">
                    <h1 class="page-title">Wishlist<span>Shop</span></h1>
                </div><!-- End .container -->
            </div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Wishlist</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
                <div class="container">
                    <table class="table table-wishlist table-mobile">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Stock Status</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="wishlist" items="${wishlists}">

                                <tr>
                                    <td class="product-col">
                                        <div class="product">
                                            <figure class="product-media">
                                                <a href="product?pid=${wishlist.product.id}">
                                                    <img src="${wishlist.product.images['0']}" alt="Product image">
                                                </a>
                                            </figure>

                                            <h3 class="product-title">
                                                <a href="#">${wishlist.product.name}</a>
                                            </h3><!-- End .product-title -->
                                        </div><!-- End .product -->
                                    </td>
                                    <td class="price-col"> ${setting.value} <fmt:formatNumber value="${wishlist.product.price}" pattern="###,###.00" /></td>
                                    <td class="stock-col">
                                        <c:choose>
                                            <c:when test="${wishlist.product.stockQuantity>0}">
                                                <span class="in-stock">In stock</span> 
                                            </c:when>
                                            <c:otherwise>
                                                <span class="out-of-stock">Out of stock</span>
                                            </c:otherwise>
                                        </c:choose>


                                    </td>
                                    <td class="action-col">
                                        <%--                                    <div class="dropdown">
                                                                                <button class="btn btn-block btn-outline-primary-2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                    <i class="icon-list-alt"></i>Select Options
                                                                                </button>
                                        
                                                                                <div class="dropdown-menu">
                                                                                    <a class="dropdown-item" href="#">First option</a>
                                                                                    <a class="dropdown-item" href="#">Another option</a>
                                                                                    <a class="dropdown-item" href="#">The best option</a>
                                                                                </div>
                                                                            </div>--%>

                                        <c:choose>
                                            <c:when test="${wishlist.product.stockQuantity>0}">
                                                <button class="btn btn-block btn-outline-primary-2 btn-add-cart" data-product-id="${wishlist.product.id}"><i class="icon-cart-plus"></i>Add to Cart</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-block btn-outline-primary-2 disabled">Out of Stock</button>
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                    <td class="remove-col"><button class="btn-remove btn-remove-wishlist" data-product-id="${wishlist.product.id}"><i class="icon-close"></i></button></td>
                                </tr>

                            </c:forEach>


                        </tbody>
                    </table><!-- End .table table-wishlist -->
                    <div class="wishlist-share">
                        <div class="social-icons social-icons-sm mb-2">
                            <label class="social-label">Share on:</label>
                            <a href="#" class="social-icon" title="Facebook" target="_blank"><i class="icon-facebook-f"></i></a>
                            <a href="#" class="social-icon" title="Twitter" target="_blank"><i class="icon-twitter"></i></a>
                            <a href="#" class="social-icon" title="Instagram" target="_blank"><i class="icon-instagram"></i></a>
                            <a href="#" class="social-icon" title="Youtube" target="_blank"><i class="icon-youtube"></i></a>
                            <a href="#" class="social-icon" title="Pinterest" target="_blank"><i class="icon-pinterest"></i></a>
                        </div><!-- End .soial-icons -->
                    </div><!-- End .wishlist-share -->
                </div><!-- End .container -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->


    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">

            document.querySelectorAll('.btn-add-cart').forEach(button => {
                button.addEventListener('click', function () {

                    let productId = this.getAttribute('data-product-id');

                    let datalog = new URLSearchParams();
                    datalog.append("qty", 1);
                    datalog.append("pid", productId);


                    fetch("add-to-cart", {
                        method: "POST",
                        headers: {"Content-Type": "application/x-www-form-urlencoded"},
                        body: datalog
                    }).then(response => response.json())
                            .then(response => {
                                if (response.msg == "sucess") {
                                    console.log(response.msg);
                                } else {
                                    console.log(response.msg);
                                }
                            })
                            .catch(ex => {
                                console.log(ex);
                            });
                });
            });

            document.querySelectorAll('.btn-remove-wishlist').forEach(button => {
                button.addEventListener('click', function () {
                    let row = this.closest('tr');
                    let productId = this.getAttribute('data-product-id');

                    let datalog = new URLSearchParams();
                    datalog.append("pid", productId);


                    fetch("remove-from-wishlist", {
                        method: "POST",
                        headers: {"Content-Type": "application/x-www-form-urlencoded"},
                        body: datalog
                    }).then(response => response.json())
                            .then(response => {
                                if (response.msg == "sucess") {
                                    row.remove();
                                    console.log(response.msg);
                                } else {
                                    console.log(response.msg);
                                }
                            })
                            .catch(ex => {
                                console.log(ex);
                            });
                });
            });

        </script>
    </layout:put>
</layout:extends>