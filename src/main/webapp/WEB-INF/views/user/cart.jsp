<%-- 
    Document   : cart
    Created on : Feb 2, 2025, 2:11:41 PM
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
                    <h1 class="page-title">Shopping Cart<span>Shop</span></h1>
                </div><!-- End .container -->
            </div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
                <div class="cart">
                    <div class="container">
                        <div class="row">
                            <c:set var="cartTotal" value="${0}"/>
                            <c:choose>
                                <c:when test="${cart!=null && cart.cartItems.size() > 0}">
                                    <div class="col-lg-9">
                                        <table class="table table-cart table-mobile">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Total</th>
                                                    <th></th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <c:forEach var="cartItem" items="${cart.cartItems}">
                                                    <c:set var="cartTotal" value="${cartTotal+(cartItem.product.price * cartItem.quantity)}"/>
                                                    <tr>
                                                        <td class="product-col">
                                                            <div class="product">
                                                                <figure class="product-media">
                                                                    <a href="#">
                                                                        <img src="${cartItem.product.images['0']}" alt="Product image">
                                                                    </a>
                                                                </figure>

                                                                <h3 class="product-title">
                                                                    <a href="product?pid=${cartItem.product.id}">${cartItem.product.name}</a>
                                                                </h3><!-- End .product-title -->
                                                            </div><!-- End .product -->
                                                        </td>
                                                        <td class="price-col"> ${setting.value} <fmt:formatNumber value="${cartItem.product.price}" pattern="###,###.00" /></td>
                                                        <td class="quantity-col">
                                                            <div class="cart-product-quantity">
                                                                <input type="number" class="form-control qty-input" value="${cartItem.quantity}" min="1" max="${cartItem.product.stockQuantity}" step="1" data-product-id="${cartItem.product.id}" data-decimals="0" data-old-value="${cartItem.quantity}" required>
                                                            </div><!-- End .cart-product-quantity -->
                                                        </td>
                                                        <td class="total-col">${setting.value} <fmt:formatNumber value="${cartItem.product.price * cartItem.quantity}" pattern="###,###.00" /></td>
                                                        <td class="remove-col">
                                                            <button class="btn-remove" data-product-id="${cartItem.product.id}">
                                                                <i class="icon-close"></i></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>


                                            </tbody>
                                        </table><!-- End .table table-wishlist -->

                                        <%--                                <div class="cart-bottom">
                                                                            <div class="cart-discount">
                                                                                <form action="#">
                                                                                    <div class="input-group">
                                                                                        <input type="text" class="form-control" required placeholder="coupon code">
                                                                                        <div class="input-group-append">
                                                                                            <button class="btn btn-outline-primary-2" type="submit"><i class="icon-long-arrow-right"></i></button>
                                                                                        </div> .End .input-group-append 
                                                                                    </div> End .input-group 
                                                                                </form>
                                                                            </div> End .cart-discount 


                                </div> End .cart-bottom --%>
                                    </div><!-- End .col-lg-9 -->
                                    <aside class="col-lg-3">
                                        <div class="summary summary-cart">
                                            <h3 class="summary-title">Cart Total</h3><!-- End .summary-title -->

                                            <table class="table table-summary">
                                                <tbody>
                                                    <tr class="summary-subtotal">
                                                        <td>Subtotal:</td>
                                                        <td id="cart-sub-total" style="min-width: 140px;">${setting.value} <fmt:formatNumber value="${cartTotal}" pattern="###,###.00" /></td>
                                                    </tr><!-- End .summary-subtotal -->
                                                    <tr class="summary-shipping">
                                                        <td>Shipping:</td>
                                                        <td>&nbsp;</td>
                                                    </tr>

                                                    <tr class="summary-shipping-row">
                                                        <c:set var="shiipingPrice" value="${200.00}"/>
                                                        <td>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" id="free-shipping" name="shipping" class="custom-control-input">
                                                                <label class="custom-control-label" for="free-shipping">Free Shipping</label>
                                                            </div><!-- End .custom-control -->
                                                        </td>
                                                        <td>${setting.value} 0.00</td>
                                                    </tr><!-- End .summary-shipping-row -->

                                                    <tr class="summary-shipping-row">
                                                        <td>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" id="standart-shipping" name="shipping" class="custom-control-input">
                                                                <label class="custom-control-label" for="standart-shipping">Standart:</label>
                                                            </div><!-- End .custom-control -->
                                                        </td>
                                                        <td>${setting.value} ${shiipingPrice}</td>
                                                    </tr><!-- End .summary-shipping-row -->

                                                    <tr class="summary-shipping-row">
                                                        <td>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" id="express-shipping" name="shipping" class="custom-control-input">
                                                                <label class="custom-control-label" for="express-shipping">Express:</label>
                                                            </div><!-- End .custom-control -->
                                                        </td>
                                                        <td>${setting.value} ${shiipingPrice}</td>
                                                    </tr><!-- End .summary-shipping-row -->

                                                    <tr class="summary-shipping-estimate">
                                                        <td>Estimate for Your Location<br> <a href="dashboard.html">Change address</a></td>
                                                        <td>&nbsp;</td>
                                                    </tr><!-- End .summary-shipping-estimate -->

                                                    <tr class="summary-total">
                                                        <td>Total:</td>
                                                        <td id="cart-total">${setting.value} <fmt:formatNumber value="${cartTotal+shiipingPrice}" pattern="###,###.00" /></td>
                                                    </tr><!-- End .summary-total -->
                                                </tbody>
                                            </table><!-- End .table table-summary -->

                                            <a href="cart/checkout" class="btn btn-outline-primary-2 btn-order btn-block">PROCEED TO CHECKOUT</a>
                                        </div><!-- End .summary -->

                                        <a href="shop" class="btn btn-outline-dark-2 btn-block mb-3"><span>CONTINUE SHOPPING</span><i class="icon-refresh"></i></a>
                                    </aside><!-- End .col-lg-3 -->
                                </c:when>
                                <c:otherwise>
                                    <div class="col-lg-12 empty-cart text-center" style="height: 200px;">
                                        <h4>Your Cart is Empty</h4>
                                        <p>It looks like you haven’t added any items to your cart yet.</p>
                                        <a href="shop" class="btn btn-outline-dark-2 mt-4">
                                            <span>Start Shopping</span><i class="icon-refresh"></i>
                                        </a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div><!-- End .row -->
                    </div><!-- End .container -->
                </div><!-- End .cart -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->
    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">
            let cartSubTotal = document.querySelector('#cart-sub-total');
            let cartTotal = document.querySelector('#cart-total');
            document.querySelectorAll('.qty-input').forEach(input => {
                input.addEventListener('change', function () {
                    let qty = this.value;
                    let productId = this.getAttribute('data-product-id');
                    let oldqty = this.getAttribute('data-old-value');
                    let row = this.closest('tr');
                    let totalCol = row.querySelector('.total-col');

                    // Prepare data for AJAX
                    let datalog = new URLSearchParams();
                    datalog.append("qty", qty);
                    datalog.append("pid", productId);
                    if (oldqty != qty) {
                        fetch("update-cart-qty", {
                            method: "POST",
                            headers: {"Content-Type": "application/x-www-form-urlencoded"},
                            body: datalog
                        }).then(response => response.json())
                                .then(response => {
                                    if (response.msg === "sucess") {
                                        // Update total in UI
                                        totalCol.textContent = "${setting.value} " + response.productTotal;
                                        cartSubTotal.textContent = "${setting.value} " + response.cartTotal;
                                        cartTotal.textContent = "${setting.value} " + response.GrandcartTotal;
//                                    alert("Quantity updated");
                                        this.setAttribute('data-old-value', qty);
                                    } else {
                                        console.log(response.msg);
//                                    alert("Failed to update quantity: " + response.msg);

                                    }
                                })
                                .catch(ex => {
                                    console.log(ex);
//                                alert("Error updating quantity");
                                });
                    }
                });

            });


            document.querySelectorAll('.btn-remove').forEach(button => {
                button.addEventListener('click', function () {
                    let productId = this.getAttribute('data-product-id');
                    let row = this.closest('tr');

                    let datalog = new URLSearchParams();
                    datalog.append("pid", productId);

                    fetch("remove-from-cart", {
                        method: "POST",
                        headers: {"Content-Type": "application/x-www-form-urlencoded"},
                        body: datalog
                    }).then(response => response.json())
                            .then(response => {
                                if (response.msg == "sucess") {
                                    row.remove(); // Remove row from UI
                                    cartSubTotal.textContent = "${setting.value} " + response.cartTotal;
                                    cartTotal.textContent = "${setting.value} " + response.GrandcartTotal;
                                } else {
                                    console.log(response.msg);
//                                    alert("Failed to remove item: " + response.msg);
                                }
                            })
                            .catch(ex => {
                                console.log(ex);
//                                alert("Error removing item");
                            });
                });
            });

        </script>
    </layout:put>
</layout:extends>