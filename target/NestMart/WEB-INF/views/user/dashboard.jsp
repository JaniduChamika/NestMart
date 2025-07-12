<%-- 
    Document   : dashboard
    Created on : Feb 2, 2025, 2:51:10 PM
    Author     : ROG STRIX
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%> 
<layout:extends name="base">
    <layout:put block="contents" type="REPLACE">
        <main class="main">
            <div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
                <div class="container">
                    <h1 class="page-title">My Account<span>Shop</span></h1>
                </div><!-- End .container -->
            </div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav mb-3">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active" aria-current="page">My Account</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
                <div class="dashboard">
                    <div class="container">
                        <div class="row">
                            <aside class="col-md-4 col-lg-3">
                                <ul class="nav nav-dashboard flex-column mb-3 mb-md-0" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="tab-dashboard-link" data-toggle="tab" href="#tab-dashboard" role="tab" aria-controls="tab-dashboard" aria-selected="true">Dashboard</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-orders-link" data-toggle="tab" href="#tab-orders" role="tab" aria-controls="tab-orders" aria-selected="false">Orders</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-downloads-link" data-toggle="tab" href="#tab-downloads" role="tab" aria-controls="tab-downloads" aria-selected="false">Downloads</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-address-link" data-toggle="tab" href="#tab-address" role="tab" aria-controls="tab-address" aria-selected="false">Adresses</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="tab-account-link" data-toggle="tab" href="#tab-account" role="tab" aria-controls="tab-account" aria-selected="false">Account Details</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Sign Out</a>
                                    </li>
                                </ul>
                            </aside><!-- End .col-lg-3 -->

                            <div class="col-md-8 col-lg-9">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="tab-dashboard" role="tabpanel" aria-labelledby="tab-dashboard-link">
                                        <p>Hello <span class="font-weight-normal text-dark">User</span> (not <span class="font-weight-normal text-dark">User</span>? <a href="#">Log out</a>) 
                                            <br>
                                            From your account dashboard you can view your <a href="#tab-orders" class="tab-trigger-link link-underline">recent orders</a>, manage your <a href="#tab-address" class="tab-trigger-link">shipping and billing addresses</a>, and <a href="#tab-account" class="tab-trigger-link">edit your password and account details</a>.</p>
                                    </div><!-- .End .tab-pane -->

                                    <div class="tab-pane fade " id="tab-orders" role="tabpanel" aria-labelledby="tab-orders-link">
                                        <!--                                        <p>No order has been made yet.</p>
                                                                                <a href="category.html" class="btn btn-outline-primary-2"><span>GO SHOP</span><i class="icon-long-arrow-right"></i></a>-->


                                        <div class="row">
                                            <div class="col-12">

                                                <div class="products mb-3 row">
                                                    <div class="product product-list">
                                                        <div class="row">
                                                            <div class="col-6 col-lg-3 ">
                                                                <figure class="product-media">
                                                                    <span class="product-label label-new">New</span>
                                                                    <a href="product.html">
                                                                        <img src="assets/images/products/product-4.jpg" alt="Product image" class="product-image">
                                                                    </a>
                                                                </figure><!-- End .product-media -->
                                                            </div><!-- End .col-sm-6 col-lg-3 -->

                                                            <div class="col-6 col-lg-3 order-lg-last">
                                                                <div class="product-list-action">
                                                                    <div class="product-price">
                                                                        $60.00
                                                                    </div><!-- End .product-price -->
                                                                    <div class="ratings-container">
                                                                        <div class="ratings">
                                                                            <div class="ratings-val" style="width: 20%;"></div><!-- End .ratings-val -->
                                                                        </div><!-- End .ratings -->
                                                                        <span class="ratings-text">( 2 Reviews )</span>
                                                                    </div><!-- End .rating-container -->

                                                                    <div class="product-action">
                                                                        <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                                        <a href="#" class="btn-product btn-compare" title="Compare"><span>compare</span></a>
                                                                    </div><!-- End .product-action -->

                                                                    <a href="#" class="btn-product btn-cart"><span>add to cart</span></a>
                                                                </div><!-- End .product-list-action -->
                                                            </div><!-- End .col-sm-6 col-lg-3 -->

                                                            <div class="col-lg-6">
                                                                <div class="product-body product-action-inner">
                                                                    <a href="#" class="btn-product btn-wishlist" title="Add to wishlist"><span>add to wishlist</span></a>
                                                                    <div class="product-cat">
                                                                        <a href="#">Women</a>
                                                                    </div><!-- End .product-cat -->
                                                                    <h3 class="product-title"><a href="product.html">Brown paperbag waist pencil skirt</a></h3><!-- End .product-title -->

                                                                    <div class="product-content">
                                                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque </p>
                                                                    </div><!-- End .product-content -->

                                                                    <div class="product-nav product-nav-thumbs">
                                                                        <a href="#" class="active">
                                                                            <img src="assets/images/products/product-4-thumb.jpg" alt="product desc">
                                                                        </a>
                                                                        <a href="#">
                                                                            <img src="assets/images/products/product-4-2-thumb.jpg" alt="product desc">
                                                                        </a>

                                                                        <a href="#">
                                                                            <img src="assets/images/products/product-4-3-thumb.jpg" alt="product desc">
                                                                        </a>
                                                                    </div><!-- End .product-nav -->
                                                                </div><!-- End .product-body -->
                                                            </div><!-- End .col-lg-6 -->
                                                        </div><!-- End .row -->
                                                    </div><!-- End .product -->

                                                    <div class="product product-list">
                                                        <div class="row">
                                                            <div class="col-6 col-lg-3">
                                                                <figure class="product-media">
                                                                    <a href="product.html">
                                                                        <img src="assets/images/products/product-5.jpg" alt="Product image" class="product-image">
                                                                    </a>
                                                                </figure><!-- End .product-media -->
                                                            </div><!-- End .col-sm-6 col-lg-3 -->

                                                            <div class="col-6 col-lg-3 order-lg-last">
                                                                <div class="product-list-action">
                                                                    <div class="product-price">
                                                                        $84.00
                                                                    </div><!-- End .product-price -->
                                                                    <div class="ratings-container">
                                                                        <div class="ratings">
                                                                            <div class="ratings-val" style="width: 0%;"></div><!-- End .ratings-val -->
                                                                        </div><!-- End .ratings -->
                                                                        <span class="ratings-text">( 0 Reviews )</span>
                                                                    </div><!-- End .rating-container -->

                                                                    <div class="product-action">
                                                                        <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                                        <a href="#" class="btn-product btn-compare" title="Compare"><span>compare</span></a>
                                                                    </div><!-- End .product-action -->

                                                                    <a href="#" class="btn-product btn-cart"><span>add to cart</span></a>
                                                                </div><!-- End .product-list-action -->
                                                            </div><!-- End .col-sm-6 col-lg-3 -->

                                                            <div class="col-lg-6">
                                                                <div class="product-body product-action-inner">
                                                                    <a href="#" class="btn-product btn-wishlist" title="Add to wishlist"><span>add to wishlist</span></a>
                                                                    <div class="product-cat">
                                                                        <a href="#">Dresses</a>
                                                                    </div><!-- End .product-cat -->
                                                                    <h3 class="product-title"><a href="product.html">Dark yellow lace cut out swing dress</a></h3><!-- End .product-title -->

                                                                    <div class="product-content">
                                                                        <p>Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. </p>
                                                                    </div><!-- End .product-content -->

                                                                    <div class="product-nav product-nav-thumbs">
                                                                        <a href="#" class="active">
                                                                            <img src="assets/images/products/product-5-thumb.jpg" alt="product desc">
                                                                        </a>
                                                                        <a href="#">
                                                                            <img src="assets/images/products/product-5-2-thumb.jpg" alt="product desc">
                                                                        </a>
                                                                    </div><!-- End .product-nav -->
                                                                </div><!-- End .product-body -->
                                                            </div><!-- End .col-lg-6 -->
                                                        </div><!-- End .row -->
                                                    </div><!-- End .product -->

                                                    <div class="product product-list">
                                                        <div class="row">
                                                            <div class="col-6 col-lg-3">
                                                                <figure class="product-media">
                                                                    <span class="product-label label-out">Out of Stock</span>
                                                                    <a href="product.html">
                                                                        <img src="assets/images/products/product-6.jpg" alt="Product image" class="product-image">
                                                                    </a>
                                                                </figure><!-- End .product-media -->
                                                            </div><!-- End .col-sm-6 col-lg-3 -->

                                                            <div class="col-6 col-lg-3 order-lg-last">
                                                                <div class="product-list-action">
                                                                    <div class="product-price">
                                                                        <span class="out-price">$120.00</span>
                                                                    </div><!-- End .product-price -->
                                                                    <div class="ratings-container">
                                                                        <div class="ratings">
                                                                            <div class="ratings-val" style="width: 80%;"></div><!-- End .ratings-val -->
                                                                        </div><!-- End .ratings -->
                                                                        <span class="ratings-text">( 6 Reviews )</span>
                                                                    </div><!-- End .rating-container -->

                                                                    <div class="product-action">
                                                                        <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                                        <a href="#" class="btn-product btn-compare" title="Compare"><span>compare</span></a>
                                                                    </div><!-- End .product-action -->

                                                                    <a href="#" class="btn-product btn-cart disabled"><span>add to cart</span></a>
                                                                </div><!-- End .product-list-action -->
                                                            </div><!-- End .col-sm-6 col-lg-3 -->

                                                            <div class="col-lg-6">
                                                                <div class="product-body product-action-inner">
                                                                    <a href="#" class="btn-product btn-wishlist" title="Add to wishlist"><span>add to wishlist</span></a>
                                                                    <div class="product-cat">
                                                                        <a href="#">Jackets</a>
                                                                    </div><!-- End .product-cat -->
                                                                    <h3 class="product-title"><a href="product.html">Khaki utility boiler jumpsuit</a></h3><!-- End .product-title -->

                                                                    <div class="product-content">
                                                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque </p>
                                                                    </div><!-- End .product-content -->
                                                                </div><!-- End .product-body -->
                                                            </div><!-- End .col-lg-6 -->
                                                        </div><!-- End .row -->
                                                    </div><!-- End .product -->



                                                    <div class="product product-list">
                                                        <div class="row">
                                                            <div class="col-6 col-lg-3">
                                                                <figure class="product-media">
                                                                    <a href="product.html">
                                                                        <img src="assets/images/products/product-9.jpg" alt="Product image" class="product-image">
                                                                    </a>
                                                                </figure><!-- End .product-media -->
                                                            </div><!-- End .col-sm-6 col-lg-3 -->

                                                            <div class="col-6 col-lg-3 order-lg-last">
                                                                <div class="product-list-action">
                                                                    <div class="product-price">
                                                                        $52.00
                                                                    </div><!-- End .product-price -->
                                                                    <div class="ratings-container">
                                                                        <div class="ratings">
                                                                            <div class="ratings-val" style="width: 80%;"></div><!-- End .ratings-val -->
                                                                        </div><!-- End .ratings -->
                                                                        <span class="ratings-text">( 1 Reviews )</span>
                                                                    </div><!-- End .rating-container -->

                                                                    <div class="product-action">
                                                                        <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                                        <a href="#" class="btn-product btn-compare" title="Compare"><span>compare</span></a>
                                                                    </div><!-- End .product-action -->

                                                                    <a href="#" class="btn-product btn-cart"><span>add to cart</span></a>
                                                                </div><!-- End .product-list-action -->
                                                            </div><!-- End .col-sm-6 col-lg-3 -->

                                                            <div class="col-lg-6">
                                                                <div class="product-body product-action-inner">
                                                                    <a href="#" class="btn-product btn-wishlist" title="Add to wishlist"><span>add to wishlist</span></a>
                                                                    <div class="product-cat">
                                                                        <a href="#">Bags</a>
                                                                    </div><!-- End .product-cat -->
                                                                    <h3 class="product-title"><a href="product.html">Orange saddle lock front chain cross body bag</a></h3><!-- End .product-title -->

                                                                    <div class="product-content">
                                                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque </p>
                                                                    </div><!-- End .product-content -->

                                                                    <div class="product-nav product-nav-thumbs">
                                                                        <a href="#" class="active">
                                                                            <img src="assets/images/products/product-9-thumb.jpg" alt="product desc">
                                                                        </a>
                                                                        <a href="#">
                                                                            <img src="assets/images/products/product-9-2-thumb.jpg" alt="product desc">
                                                                        </a>
                                                                        <a href="#">
                                                                            <img src="assets/images/products/product-9-3-thumb.jpg" alt="product desc">
                                                                        </a>
                                                                    </div><!-- End .product-nav -->
                                                                </div><!-- End .product-body -->
                                                            </div><!-- End .col-lg-6 -->
                                                        </div><!-- End .row -->
                                                    </div><!-- End .product -->
                                                </div><!-- End .products -->

                                            </div>
                                        </div>
                                    </div><!-- .End .tab-pane -->

                                    <div class="tab-pane fade" id="tab-downloads" role="tabpanel" aria-labelledby="tab-downloads-link">
                                        <p>No downloads available yet.</p>
                                        <a href="category.html" class="btn btn-outline-primary-2"><span>GO SHOP</span><i class="icon-long-arrow-right"></i></a>
                                    </div><!-- .End .tab-pane -->

                                    <div class="tab-pane fade" id="tab-address" role="tabpanel" aria-labelledby="tab-address-link">
                                        <p>The following addresses will be used on the checkout page by default.</p>

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="card card-dashboard">
                                                    <div class="card-body">
                                                        <h3 class="card-title">Billing Address</h3><!-- End .card-title -->

                                                        <p>User Name<br>
                                                            User Company<br>
                                                            John str<br>
                                                            New York, NY 10001<br>
                                                            1-234-987-6543<br>
                                                            yourmail@mail.com<br>
                                                            <a href="#">Edit <i class="icon-edit"></i></a></p>
                                                    </div><!-- End .card-body -->
                                                </div><!-- End .card-dashboard -->
                                            </div><!-- End .col-lg-6 -->

                                            <div class="col-lg-6">
                                                <div class="card card-dashboard">
                                                    <div class="card-body">
                                                        <h3 class="card-title">Shipping Address</h3><!-- End .card-title -->

                                                        <p>You have not set up this type of address yet.<br>
                                                            <a href="#">Edit <i class="icon-edit"></i></a></p>
                                                    </div><!-- End .card-body -->
                                                </div><!-- End .card-dashboard -->
                                            </div><!-- End .col-lg-6 -->
                                        </div><!-- End .row -->
                                    </div><!-- .End .tab-pane -->

                                    <div class="tab-pane fade" id="tab-account" role="tabpanel" aria-labelledby="tab-account-link">
                                        <form action="#">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <label>First Name *</label>
                                                    <input type="text" class="form-control" required>
                                                </div><!-- End .col-sm-6 -->

                                                <div class="col-sm-6">
                                                    <label>Last Name *</label>
                                                    <input type="text" class="form-control" required>
                                                </div><!-- End .col-sm-6 -->
                                            </div><!-- End .row -->

                                            <label>Display Name *</label>
                                            <input type="text" class="form-control" required>
                                            <small class="form-text">This will be how your name will be displayed in the account section and in reviews</small>

                                            <label>Email address *</label>
                                            <input type="email" class="form-control" required>

                                            <label>Current password (leave blank to leave unchanged)</label>
                                            <input type="password" class="form-control">

                                            <label>New password (leave blank to leave unchanged)</label>
                                            <input type="password" class="form-control">

                                            <label>Confirm new password</label>
                                            <input type="password" class="form-control mb-2">

                                            <button type="submit" class="btn btn-outline-primary-2">
                                                <span>SAVE CHANGES</span>
                                                <i class="icon-long-arrow-right"></i>
                                            </button>
                                        </form>
                                    </div><!-- .End .tab-pane -->
                                </div>
                            </div><!-- End .col-lg-9 -->
                        </div><!-- End .row -->
                    </div><!-- End .container -->
                </div><!-- End .dashboard -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->

    </layout:put>
</layout:extends>