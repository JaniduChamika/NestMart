<%-- 
    Document   : home
    Created on : Jan 16, 2025, 10:11:17 PM
    Author     : ROG STRIX
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%> 
<layout:extends name="base">
    <layout:put block="contents" type="REPLACE">
        <main class="main">
            <div class="intro-slider-container mb-5">
                <div class="intro-slider owl-carousel owl-theme owl-nav-inside owl-light" data-toggle="owl" 
                     data-owl-options='{
                     "dots": true,
                     "nav": false, 
                     "responsive": {
                     "1200": {
                     "nav": true,
                     "dots": false
                     }
                     }
                     }'>
                    <div class="intro-slide" style="background-image: url(assets/images/demos/demo-4/slider/slide-1.png);">
                        <div class="container intro-content">
                            <div class="row justify-content-end">
                                <div class="col-auto col-sm-7 col-md-6 col-lg-5">
                                    <h3 class="intro-subtitle text-third">Deals and Promotions</h3><!-- End .h3 intro-subtitle -->
                                    <h1 class="intro-title">Beats by</h1>
                                    <h1 class="intro-title">Dre Studio 3</h1><!-- End .intro-title -->

                                    <div class="intro-price">
                                        <sup class="intro-old-price">Rs 457,990.00</sup>
                                        <span class="text-third">
                                            Rs 429,990<sup>.00</sup>
                                        </span>
                                    </div><!-- End .intro-price -->

                                    <a href="shop" class="btn btn-primary btn-round">
                                        <span>Shop More</span>
                                        <i class="icon-long-arrow-right"></i>
                                    </a>
                                </div><!-- End .col-lg-11 offset-lg-1 -->
                            </div><!-- End .row -->
                        </div><!-- End .intro-content -->
                    </div><!-- End .intro-slide -->

                    <div class="intro-slide" style="background-image: url(assets/images/demos/demo-4/slider/slide-2.png);">
                        <div class="container intro-content">
                            <div class="row justify-content-end">
                                <div class="col-auto col-sm-7 col-md-6 col-lg-5">
                                    <h3 class="intro-subtitle text-primary">New Arrival</h3><!-- End .h3 intro-subtitle -->
                                    <h1 class="intro-title">Apple iPad Pro <br>12.9 Inch, 64GB </h1><!-- End .intro-title -->

                                    <div class="intro-price">
                                        <sup>Today:</sup>
                                        <span class="text-primary">
                                            Rs 273,990<sup>.00</sup>
                                        </span>
                                    </div><!-- End .intro-price -->

                                    <a href="shop" class="btn btn-primary btn-round">
                                        <span>Shop More</span>
                                        <i class="icon-long-arrow-right"></i>
                                    </a>
                                </div><!-- End .col-md-6 offset-md-6 -->
                            </div><!-- End .row -->
                        </div><!-- End .intro-content -->
                    </div><!-- End .intro-slide -->
                </div><!-- End .intro-slider owl-carousel owl-simple -->

                <span class="slider-loader"></span><!-- End .slider-loader -->
            </div><!-- End .intro-slider-container -->

            <div class="container">
                <h2 class="title text-center mb-4">Explore Popular Categories</h2><!-- End .title text-center -->

                <div class="cat-blocks-container">
                    <div class="row">
                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="${base_url}shop?category=2" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="assets/images/demos/demo-4/cats/1.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Computer & Laptop</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="${base_url}shop?category=5" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="assets/images/demos/demo-4/cats/2.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Cameras & Photography</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="${base_url}shop?category=1" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="assets/images/demos/demo-4/cats/3.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Mobile Phones & Accessories</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="${base_url}shop?category=4" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="assets/images/demos/demo-4/cats/4.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">TVs & Home Entertainment</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="${base_url}shop?category=6" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="assets/images/demos/demo-4/cats/5.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Audio & Headphones</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->

                        <div class="col-6 col-sm-4 col-lg-2">
                            <a href="${base_url}shop?category=9" class="cat-block">
                                <figure>
                                    <span>
                                        <img src="assets/images/demos/demo-4/cats/6.png" alt="Category image">
                                    </span>
                                </figure>

                                <h3 class="cat-block-title">Wearable Technology</h3><!-- End .cat-block-title -->
                            </a>
                        </div><!-- End .col-sm-4 col-lg-2 -->
                    </div><!-- End .row -->
                </div><!-- End .cat-blocks-container -->
            </div><!-- End .container -->

            <div class="mb-4"></div><!-- End .mb-4 -->

            <!--            <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-6 col-lg-4">
                                    <div class="banner banner-overlay banner-overlay-light">
                                        <a href="#">
                                            <img src="assets/images/demos/demo-4/banners/banner-1.png" alt="Banner">
                                        </a>
            
                                        <div class="banner-content">
                                            <h4 class="banner-subtitle"><a href="#">Smart Offer</a></h4> End .banner-subtitle 
                                            <h3 class="banner-title"><a href="#">Save $150 <strong>on Samsung <br>Galaxy Note9</strong></a></h3> End .banner-title 
                                            <a href="#" class="banner-link">Shop Now<i class="icon-long-arrow-right"></i></a>
                                        </div> End .banner-content 
                                    </div> End .banner 
                                </div> End .col-md-4 
            
                                <div class="col-md-6 col-lg-4">
                                    <div class="banner banner-overlay banner-overlay-light">
                                        <a href="#">
                                            <img src="assets/images/demos/demo-4/banners/banner-2.jpg" alt="Banner">
                                        </a>
            
                                        <div class="banner-content">
                                            <h4 class="banner-subtitle"><a href="#">Time Deals</a></h4> End .banner-subtitle 
                                            <h3 class="banner-title"><a href="#"><strong>Bose SoundSport</strong> <br>Time Deal -30%</a></h3> End .banner-title 
                                            <a href="#" class="banner-link">Shop Now<i class="icon-long-arrow-right"></i></a>
                                        </div> End .banner-content 
                                    </div> End .banner 
                                </div> End .col-md-4 
            
                                <div class="col-md-6 col-lg-4">
                                    <div class="banner banner-overlay banner-overlay-light">
                                        <a href="#">
                                            <img src="assets/images/demos/demo-4/banners/banner-3.png" alt="Banner">
                                        </a>
            
                                        <div class="banner-content">
                                            <h4 class="banner-subtitle"><a href="#">Clearance</a></h4> End .banner-subtitle 
                                            <h3 class="banner-title"><a href="#"><strong>GoPro - Fusion 360</strong> <br>Save $70</a></h3> End .banner-title 
                                            <a href="#" class="banner-link">Shop Now<i class="icon-long-arrow-right"></i></a>
                                        </div> End .banner-content 
                                    </div> End .banner 
                                </div> End .col-lg-4 
                            </div> End .row 
                        </div> End .container -->

            <div class="mb-3"></div><!-- End .mb-5 -->

            <div class="container new-arrivals">
                <div class="heading heading-flex mb-3">
                    <div class="heading-left">
                        <h2 class="title">New Arrivals</h2><!-- End .title -->
                    </div><!-- End .heading-left -->

                    <div class="heading-right">
                        <ul class="nav nav-pills nav-border-anim justify-content-center" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="new-all-link" data-toggle="tab" href="#new-all-tab" role="tab" aria-controls="new-all-tab" aria-selected="true">All</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="new-tv-link" data-toggle="tab" href="#new-tv-tab" role="tab" aria-controls="new-tv-tab" aria-selected="false">TV</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="new-computers-link" data-toggle="tab" href="#new-computers-tab" role="tab" aria-controls="new-computers-tab" aria-selected="false">Laptops</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="new-phones-link" data-toggle="tab" href="#new-phones-tab" role="tab" aria-controls="new-phones-tab" aria-selected="false">Smartphones</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="new-watches-link" data-toggle="tab" href="#new-watches-tab" role="tab" aria-controls="new-watches-tab" aria-selected="false">Smartwatches</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="new-acc-link" data-toggle="tab" href="#new-acc-tab" role="tab" aria-controls="new-acc-tab" aria-selected="false">Tablets</a>
                            </li>
                        </ul>
                    </div><!-- End .heading-right -->
                </div><!-- End .heading -->

                <div class="tab-content tab-content-carousel just-action-icons-sm">
                    <div class="tab-pane p-0 fade show active" id="new-all-tab" role="tabpanel" aria-labelledby="new-all-link">
                        <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                             data-owl-options='{
                             "nav": true, 
                             "dots": true,
                             "margin": 20,
                             "loop": false,
                             "responsive": {
                             "0": {
                             "items":2
                             },
                             "480": {
                             "items":2
                             },
                             "768": {
                             "items":3
                             },
                             "992": {
                             "items":4
                             },
                             "1200": {
                             "items":5
                             }
                             }
                             }'>
                            <c:forEach var="product" items="${All}">

                                <div class="product product-2">
                                    <figure class="product-media">
                                        <!--<span class="product-label label-circle label-top">Top</span>-->
                                        <a href="product?pid=${product.id}">
                                            <img src="${product.images['0']}" alt="Product image" class="product-image">
                                        </a>

                                        <div class="product-action-vertical">
                                            <a class="btn-product-icon btn-wishlist" data-product-id="${product.id}" title="Add to wishlist"></a>
                                        </div><!-- End .product-action -->

                                        <div class="product-action">
                                            <a href="#" data-product-id="${product.id}" class="btn-product btn-cart btn-add-cart" title="Add to cart"><span>add to cart</span></a>
                                            <!--<a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>-->
                                        </div><!-- End .product-action -->
                                    </figure><!-- End .product-media -->

                                    <div class="product-body">
                                        <div class="product-cat">
                                            <a href="product?pid=${product.id}">${product.subCategory.name}</a>
                                        </div><!-- End .product-cat -->
                                        <h3 class="product-title"><a href="product?pid=${product.id}">${product.name}</a></h3><!-- End .product-title -->
                                        <div class="product-price">
                                            ${currency} <fmt:formatNumber value="${product.price}" pattern="###,###.00" />
                                        </div><!-- End .product-price -->
                                        <!--                                        <div class="ratings-container">
                                                                                    <div class="ratings">
                                                                                        <div class="ratings-val" style="width: 100%;"></div> End .ratings-val 
                                                                                    </div> End .ratings 
                                                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                                                </div> End .rating-container -->
                                    </div><!-- End .product-body -->
                                </div><!-- End .product -->
                            </c:forEach>

                        </div><!-- End .owl-carousel -->
                    </div><!-- .End .tab-pane -->
                    <div class="tab-pane p-0 fade" id="new-tv-tab" role="tabpanel" aria-labelledby="new-tv-link">
                        <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                             data-owl-options='{
                             "nav": true, 
                             "dots": true,
                             "margin": 20,
                             "loop": false,
                             "responsive": {
                             "0": {
                             "items":2
                             },
                             "480": {
                             "items":2
                             },
                             "768": {
                             "items":3
                             },
                             "992": {
                             "items":4
                             },
                             "1200": {
                             "items":5
                             }
                             }
                             }'>
                            <c:forEach var="product" items="${TV}">


                                <div class="product product-2">
                                    <figure class="product-media">
                                        <!--<span class="product-label label-circle label-top">Top</span>-->
                                        <a href="product?pid=${product.id}">
                                            <img src="${product.images['0']}" alt="Product image" class="product-image">
                                        </a>

                                        <div class="product-action-vertical">
                                            <a class="btn-product-icon btn-wishlist" data-product-id="${product.id}" title="Add to wishlist"></a>
                                        </div><!-- End .product-action -->

                                        <div class="product-action">
                                            <a href="#" data-product-id="${product.id}" class="btn-product btn-cart btn-add-cart" title="Add to cart"><span>add to cart</span></a>
                                            <!--<a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>-->
                                        </div><!-- End .product-action -->
                                    </figure><!-- End .product-media -->

                                    <div class="product-body">
                                        <div class="product-cat">
                                            <a href="product?pid=${product.id}">${product.subCategory.name}</a>
                                        </div><!-- End .product-cat -->
                                        <h3 class="product-title"><a href="product?pid=${product.id}">${product.name}</a></h3><!-- End .product-title -->
                                        <div class="product-price">
                                            ${currency} <fmt:formatNumber value="${product.price}" pattern="###,###.00" />
                                        </div><!-- End .product-price -->
                                        <!--                                        <div class="ratings-container">
                                                                                    <div class="ratings">
                                                                                        <div class="ratings-val" style="width: 100%;"></div> End .ratings-val 
                                                                                    </div> End .ratings 
                                                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                                                </div> End .rating-container -->
                                    </div><!-- End .product-body -->
                                </div><!-- End .product -->
                            </c:forEach>

                        </div><!-- End .owl-carousel -->
                    </div><!-- .End .tab-pane -->
                    <div class="tab-pane p-0 fade" id="new-computers-tab" role="tabpanel" aria-labelledby="new-computers-link">
                        <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                             data-owl-options='{
                             "nav": true, 
                             "dots": true,
                             "margin": 20,
                             "loop": false,
                             "responsive": {
                             "0": {
                             "items":2
                             },
                             "480": {
                             "items":2
                             },
                             "768": {
                             "items":3
                             },
                             "992": {
                             "items":4
                             },
                             "1200": {
                             "items":5
                             }
                             }
                             }'>
                            <c:forEach var="product" items="${laptop}">


                                <div class="product product-2">
                                    <figure class="product-media">
                                        <!--<span class="product-label label-circle label-top">Top</span>-->
                                        <a href="product?pid=${product.id}">
                                            <img src="${product.images['0']}" alt="Product image" class="product-image">
                                        </a>

                                        <div class="product-action-vertical">
                                            <a class="btn-product-icon btn-wishlist" data-product-id="${product.id}" title="Add to wishlist"></a>
                                        </div><!-- End .product-action -->

                                        <div class="product-action">
                                            <a href="#" data-product-id="${product.id}" class="btn-product btn-cart btn-add-cart" title="Add to cart"><span>add to cart</span></a>
                                            <!--<a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>-->
                                        </div><!-- End .product-action -->
                                    </figure><!-- End .product-media -->

                                    <div class="product-body">
                                        <div class="product-cat">
                                            <a href="product?pid=${product.id}">${product.subCategory.name}</a>
                                        </div><!-- End .product-cat -->
                                        <h3 class="product-title"><a href="product?pid=${product.id}">${product.name}</a></h3><!-- End .product-title -->
                                        <div class="product-price">
                                            ${currency} <fmt:formatNumber value="${product.price}" pattern="###,###.00" />
                                        </div><!-- End .product-price -->
                                        <!--                                        <div class="ratings-container">
                                                                                    <div class="ratings">
                                                                                        <div class="ratings-val" style="width: 100%;"></div> End .ratings-val 
                                                                                    </div> End .ratings 
                                                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                                                </div> End .rating-container -->
                                    </div><!-- End .product-body -->
                                </div><!-- End .product -->
                            </c:forEach>

                        </div><!-- End .owl-carousel -->
                    </div><!-- .End .tab-pane -->
                    <div class="tab-pane p-0 fade" id="new-phones-tab" role="tabpanel" aria-labelledby="new-phones-link">
                        <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                             data-owl-options='{
                             "nav": true, 
                             "dots": true,
                             "margin": 20,
                             "loop": false,
                             "responsive": {
                             "0": {
                             "items":2
                             },
                             "480": {
                             "items":2
                             },
                             "768": {
                             "items":3
                             },
                             "992": {
                             "items":4
                             },
                             "1200": {
                             "items":5
                             }
                             }
                             }'>
                            <c:forEach var="product" items="${Smartphones}">
                                <div class="product product-2">
                                    <figure class="product-media">
                                        <!--<span class="product-label label-circle label-top">Top</span>-->
                                        <a href="product?pid=${product.id}">
                                            <img src="${product.images['0']}" alt="Product image" class="product-image">
                                        </a>

                                        <div class="product-action-vertical">
                                            <a class="btn-product-icon btn-wishlist" data-product-id="${product.id}" title="Add to wishlist"></a>
                                        </div><!-- End .product-action -->

                                        <div class="product-action">
                                            <a href="#" data-product-id="${product.id}" class="btn-product btn-cart btn-add-cart" title="Add to cart"><span>add to cart</span></a>
                                            <!--<a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>-->
                                        </div><!-- End .product-action -->
                                    </figure><!-- End .product-media -->

                                    <div class="product-body">
                                        <div class="product-cat">
                                            <a href="product?pid=${product.id}">${product.subCategory.name}</a>
                                        </div><!-- End .product-cat -->
                                        <h3 class="product-title"><a href="product?pid=${product.id}">${product.name}</a></h3><!-- End .product-title -->
                                        <div class="product-price">
                                            ${currency} <fmt:formatNumber value="${product.price}" pattern="###,###.00" />
                                        </div><!-- End .product-price -->
                                        <!--                                        <div class="ratings-container">
                                                                                    <div class="ratings">
                                                                                        <div class="ratings-val" style="width: 100%;"></div> End .ratings-val 
                                                                                    </div> End .ratings 
                                                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                                                </div> End .rating-container -->
                                    </div><!-- End .product-body -->
                                </div><!-- End .product -->
                            </c:forEach>

                        </div><!-- End .owl-carousel -->
                    </div><!-- .End .tab-pane -->
                    <div class="tab-pane p-0 fade" id="new-watches-tab" role="tabpanel" aria-labelledby="new-watches-link">
                        <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                             data-owl-options='{
                             "nav": true, 
                             "dots": true,
                             "margin": 20,
                             "loop": false,
                             "responsive": {
                             "0": {
                             "items":2
                             },
                             "480": {
                             "items":2
                             },
                             "768": {
                             "items":3
                             },
                             "992": {
                             "items":4
                             },
                             "1200": {
                             "items":5
                             }
                             }
                             }'>
                            <c:forEach var="product" items="${Smartwatches}">
                                <div class="product product-2">
                                    <figure class="product-media">
                                        <!--<span class="product-label label-circle label-top">Top</span>-->
                                        <a href="product?pid=${product.id}">
                                            <img src="${product.images['0']}" alt="Product image" class="product-image">
                                        </a>

                                        <div class="product-action-vertical">
                                            <a class="btn-product-icon btn-wishlist" data-product-id="${product.id}" title="Add to wishlist"></a>
                                        </div><!-- End .product-action -->

                                        <div class="product-action">
                                            <a href="#" data-product-id="${product.id}" class="btn-product btn-cart btn-add-cart" title="Add to cart"><span>add to cart</span></a>
                                            <!--<a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>-->
                                        </div><!-- End .product-action -->
                                    </figure><!-- End .product-media -->

                                    <div class="product-body">
                                        <div class="product-cat">
                                            <a href="product?pid=${product.id}">${product.subCategory.name}</a>
                                        </div><!-- End .product-cat -->
                                        <h3 class="product-title"><a href="product?pid=${product.id}">${product.name}</a></h3><!-- End .product-title -->
                                        <div class="product-price">
                                            ${currency} <fmt:formatNumber value="${product.price}" pattern="###,###.00" />
                                        </div><!-- End .product-price -->
                                        <!--                                        <div class="ratings-container">
                                                                                    <div class="ratings">
                                                                                        <div class="ratings-val" style="width: 100%;"></div> End .ratings-val 
                                                                                    </div> End .ratings 
                                                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                                                </div> End .rating-container -->
                                    </div><!-- End .product-body -->
                                </div><!-- End .product -->
                            </c:forEach>


                        </div><!-- End .owl-carousel -->
                    </div><!-- .End .tab-pane -->
                    <div class="tab-pane p-0 fade" id="new-acc-tab" role="tabpanel" aria-labelledby="new-acc-link">
                        <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                             data-owl-options='{
                             "nav": true, 
                             "dots": true,
                             "margin": 20,
                             "loop": false,
                             "responsive": {
                             "0": {
                             "items":2
                             },
                             "480": {
                             "items":2
                             },
                             "768": {
                             "items":3
                             },
                             "992": {
                             "items":4
                             },
                             "1200": {
                             "items":5
                             }
                             }
                             }'>
                            <c:forEach var="product" items="${Tablets}">
                                <div class="product product-2">
                                    <figure class="product-media">
                                        <!--<span class="product-label label-circle label-top">Top</span>-->
                                        <a href="product?pid=${product.id}">
                                            <img src="${product.images['0']}" alt="Product image" class="product-image">
                                        </a>

                                        <div class="product-action-vertical">
                                            <a class="btn-product-icon btn-wishlist" data-product-id="${product.id}" title="Add to wishlist"></a>
                                        </div><!-- End .product-action -->

                                        <div class="product-action">
                                            <a href="#" data-product-id="${product.id}" class="btn-product btn-cart btn-add-cart" title="Add to cart"><span>add to cart</span></a>
                                            <!--<a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>-->
                                        </div><!-- End .product-action -->
                                    </figure><!-- End .product-media -->

                                    <div class="product-body">
                                        <div class="product-cat">
                                            <a href="product?pid=${product.id}">${product.subCategory.name}</a>
                                        </div><!-- End .product-cat -->
                                        <h3 class="product-title"><a href="product?pid=${product.id}">${product.name}</a></h3><!-- End .product-title -->
                                        <div class="product-price">
                                            ${currency} <fmt:formatNumber value="${product.price}" pattern="###,###.00" />
                                        </div><!-- End .product-price -->
                                        <!--                                        <div class="ratings-container">
                                                                                    <div class="ratings">
                                                                                        <div class="ratings-val" style="width: 100%;"></div> End .ratings-val 
                                                                                    </div> End .ratings 
                                                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                                                </div> End .rating-container -->
                                    </div><!-- End .product-body -->
                                </div><!-- End .product -->
                            </c:forEach>

                        </div><!-- End .owl-carousel -->
                    </div><!-- .End .tab-pane -->
                </div><!-- End .tab-content -->
            </div><!-- End .container -->

            <div class="mb-6"></div><!-- End .mb-6 -->

            <div class="container">
                <div class="cta cta-border mb-5" style="background-image: url(assets/images/demos/demo-4/bg-1.jpg);">
                    <img src="assets/images/demos/demo-4/camera.png" alt="camera" class="cta-img">
                    <div class="row justify-content-center">
                        <div class="col-md-12">
                            <div class="cta-content">
                                <div class="cta-text text-right text-white">
                                    <p>Shop Today’s Deals <br><strong>Awesome Made Easy. HERO7 Black</strong></p>
                                </div><!-- End .cta-text -->
                                <a href="#" class="btn btn-primary btn-round"><span>Shop Now - $429.99</span><i class="icon-long-arrow-right"></i></a>
                            </div><!-- End .cta-content -->
                        </div><!-- End .col-md-12 -->
                    </div><!-- End .row -->
                </div><!-- End .cta -->
            </div><!-- End .container -->

            <div class="container">
                <div class="heading text-center mb-3">
                    <h2 class="title">Deals & Outlet</h2><!-- End .title -->
                    <p class="title-desc">Today’s deal and more</p><!-- End .title-desc -->
                </div><!-- End .heading -->

                <div class="row">
                    <div class="col-lg-6 deal-col">
                        <div class="deal" style="background-image: url('assets/images/demos/demo-4/deal/bg-1.jpg');">
                            <div class="deal-top">
                                <h2>Deal of the Day.</h2>
                                <h4>Limited quantities. </h4>
                            </div><!-- End .deal-top -->

                            <div class="deal-content">
                                <h3 class="product-title"><a href="product.html">Home Smart Speaker with  Google Assistant</a></h3><!-- End .product-title -->

                                <div class="product-price">
                                    <span class="new-price"> Rs 12,990.00</span>
                                    <span class="old-price">Was Rs 18,990.00</span>
                                </div><!-- End .product-price -->

                                <a href="product.html" class="btn btn-link"><span>Shop Now</span><i class="icon-long-arrow-right"></i></a>
                            </div><!-- End .deal-content -->

                            <div class="deal-bottom">
                                <div class="deal-countdown daily-deal-countdown" data-until="+10h"></div><!-- End .deal-countdown -->
                            </div><!-- End .deal-bottom -->
                        </div><!-- End .deal -->
                    </div><!-- End .col-lg-6 -->

                    <div class="col-lg-6 deal-col">
                        <div class="deal" style="background-image: url('assets/images/demos/demo-4/deal/bg-2.jpg');">
                            <div class="deal-top">
                                <h2>Your Exclusive Offers.</h2>
                                <h4>Sign in to see amazing deals.</h4>
                            </div><!-- End .deal-top -->

                            <div class="deal-content">
                                <h3 class="product-title"><a href="product.html">Certified Wireless Charging  Pad for iPhone / Android</a></h3><!-- End .product-title -->

                                <div class="product-price">
                                    <span class="new-price"> Rs 3,990</span>
                                </div><!-- End .product-price -->

                                <a href="login.html" class="btn btn-link"><span>Sign In and Save money</span><i class="icon-long-arrow-right"></i></a>
                            </div><!-- End .deal-content -->

                            <div class="deal-bottom">
                                <div class="deal-countdown offer-countdown" data-until="+11d"></div><!-- End .deal-countdown -->
                            </div><!-- End .deal-bottom -->
                        </div><!-- End .deal -->
                    </div><!-- End .col-lg-6 -->
                </div><!-- End .row -->

                <div class="more-container text-center mt-1 mb-5">
                    <a href="#" class="btn btn-outline-dark-2 btn-round btn-more"><span>Shop more Outlet deals</span><i class="icon-long-arrow-right"></i></a>
                </div><!-- End .more-container -->
            </div><!-- End .container -->

            <div class="container">
                <hr class="mb-0">
                <div class="owl-carousel mt-5 mb-5 owl-simple" data-toggle="owl" 
                     data-owl-options='{
                     "nav": false, 
                     "dots": false,
                     "margin": 30,
                     "loop": false,
                     "responsive": {
                     "0": {
                     "items":2
                     },
                     "420": {
                     "items":3
                     },
                     "600": {
                     "items":4
                     },
                     "900": {
                     "items":5
                     },
                     "1024": {
                     "items":6
                     }
                     }
                     }'>
                    <a href="#" class="brand">
                        <img src="assets/images/brands/1.png" alt="Brand Name">
                    </a>

                    <a href="#" class="brand">
                        <img src="assets/images/brands/2.png" alt="Brand Name">
                    </a>

                    <a href="#" class="brand">
                        <img src="assets/images/brands/3.png" alt="Brand Name">
                    </a>

                    <a href="#" class="brand">
                        <img src="assets/images/brands/4.png" alt="Brand Name">
                    </a>

                    <a href="#" class="brand">
                        <img src="assets/images/brands/5.png" alt="Brand Name">
                    </a>

                    <a href="#" class="brand">
                        <img src="assets/images/brands/6.png" alt="Brand Name">
                    </a>
                </div><!-- End .owl-carousel -->
            </div><!-- End .container -->

<!--            <div class="bg-light pt-5 pb-6">
                <div class="container trending-products">
                    <div class="heading heading-flex mb-3">
                        <div class="heading-left">
                            <h2 class="title">Trending Products</h2> End .title 
                        </div> End .heading-left 

                        <div class="heading-right">
                            <ul class="nav nav-pills nav-border-anim justify-content-center" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="trending-top-link" data-toggle="tab" href="#trending-top-tab" role="tab" aria-controls="trending-top-tab" aria-selected="true">Top Rated</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="trending-best-link" data-toggle="tab" href="#trending-best-tab" role="tab" aria-controls="trending-best-tab" aria-selected="false">Best Selling</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="trending-sale-link" data-toggle="tab" href="#trending-sale-tab" role="tab" aria-controls="trending-sale-tab" aria-selected="false">On Sale</a>
                                </li>
                            </ul>
                        </div> End .heading-right 
                    </div> End .heading 

                    <div class="row">
                        <div class="col-xl-5col d-none d-xl-block">
                            <div class="banner">
                                <a href="#">
                                    <img src="assets/images/demos/demo-4/banners/banner-4.jpg" alt="banner">
                                </a>
                            </div> End .banner 
                        </div> End .col-xl-5col 

                        <div class="col-xl-4-5col">
                            <div class="tab-content tab-content-carousel just-action-icons-sm">
                                <div class="tab-pane p-0 fade show active" id="trending-top-tab" role="tabpanel" aria-labelledby="trending-top-link">
                                    <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                                         data-owl-options='{
                                         "nav": true, 
                                         "dots": false,
                                         "margin": 20,
                                         "loop": false,
                                         "responsive": {
                                         "0": {
                                         "items":2
                                         },
                                         "480": {
                                         "items":2
                                         },
                                         "768": {
                                         "items":3
                                         },
                                         "992": {
                                         "items":4
                                         }
                                         }
                                         }'>
                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <span class="product-label label-circle label-top">Top</span>
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-6.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">Headphones</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Bose - SoundSport  wireless headphones</a></h3> End .product-title 
                                                <div class="product-price">
                                                    $199.99
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 100%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                </div> End .rating-container 

                                                <div class="product-nav product-nav-dots">
                                                    <a href="#" style="background: #69b4ff;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" style="background: #ff887f;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                                </div> End .product-nav 
                                            </div> End .product-body 
                                        </div> End .product 

                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-7.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">Video Games</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Microsoft - Refurbish Xbox One S 500GB</a></h3> End .product-title 
                                                <div class="product-price">
                                                    $279.99
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 60%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 6 Reviews )</span>
                                                </div> End .rating-container 
                                            </div> End .product-body 
                                        </div> End .product 

                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <span class="product-label label-circle label-new">New</span>
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-8.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">Smartwatches</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Apple Watch Series 4 Gold Aluminum Case</a></h3> End .product-title 
                                                <div class="product-price">
                                                    $499.99
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 80%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                </div> End .rating-container 

                                                <div class="product-nav product-nav-dots">
                                                    <a href="#" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                                </div> End .product-nav 
                                            </div> End .product-body 
                                        </div> End .product 

                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <span class="product-label label-circle label-top">Top</span>
                                                <span class="product-label label-circle label-sale">Sale</span>
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-9.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">TV & Home Theater</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Sony - Class LED 2160p Smart 4K Ultra HD</a></h3> End .product-title 
                                                <div class="product-price">
                                                    <span class="new-price">$1,699.99</span>
                                                    <span class="old-price">Was $1,999.99</span>
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 80%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 10 Reviews )</span>
                                                </div> End .rating-container 
                                            </div> End .product-body 
                                        </div> End .product 

                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <span class="product-label label-circle label-new">New</span>
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-3.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">Tablets</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Apple - 11 Inch iPad Pro  with Wi-Fi 256GB </a></h3> End .product-title 
                                                <div class="product-price">
                                                    $899.99
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 80%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                </div> End .rating-container 

                                                <div class="product-nav product-nav-dots">
                                                    <a href="#" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                                </div> End .product-nav 
                                            </div> End .product-body 
                                        </div> End .product 
                                    </div> End .owl-carousel 
                                </div> .End .tab-pane 
                                <div class="tab-pane p-0 fade" id="trending-best-tab" role="tabpanel" aria-labelledby="trending-best-link">
                                    <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                                         data-owl-options='{
                                         "nav": true, 
                                         "dots": false,
                                         "margin": 20,
                                         "loop": false,
                                         "responsive": {
                                         "0": {
                                         "items":2
                                         },
                                         "480": {
                                         "items":2
                                         },
                                         "768": {
                                         "items":3
                                         },
                                         "992": {
                                         "items":4
                                         }
                                         }
                                         }'>
                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <span class="product-label label-circle label-new">New</span>
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-3.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">Tablets</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Apple - 11 Inch iPad Pro  with Wi-Fi 256GB </a></h3> End .product-title 
                                                <div class="product-price">
                                                    $899.99
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 80%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                </div> End .rating-container 

                                                <div class="product-nav product-nav-dots">
                                                    <a href="#" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                                </div> End .product-nav 
                                            </div> End .product-body 
                                        </div> End .product 

                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-2.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">Audio</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Bose - SoundLink Bluetooth Speaker</a></h3> End .product-title 
                                                <div class="product-price">
                                                    $79.99
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 60%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 6 Reviews )</span>
                                                </div> End .rating-container 
                                            </div> End .product-body 
                                        </div> End .product 

                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <span class="product-label label-circle label-top">Top</span>
                                                <span class="product-label label-circle label-sale">Sale</span>
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-4.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">Cell Phone</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Google - Pixel 3 XL  128GB</a></h3> End .product-title 
                                                <div class="product-price">
                                                    <span class="new-price">$35.41</span>
                                                    <span class="old-price">Was $41.67</span>
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 100%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 10 Reviews )</span>
                                                </div> End .rating-container 

                                                <div class="product-nav product-nav-dots">
                                                    <a href="#" class="active" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                                </div> End .product-nav 
                                            </div> End .product-body 
                                        </div> End .product 

                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <span class="product-label label-circle label-top">Top</span>
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-5.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">TV & Home Theater</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Samsung - 55" Class  LED 2160p Smart</a></h3> End .product-title 
                                                <div class="product-price">
                                                    $899.99
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 60%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 5 Reviews )</span>
                                                </div> End .rating-container 
                                            </div> End .product-body 
                                        </div> End .product 

                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <span class="product-label label-circle label-top">Top</span>
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-1.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">Laptops</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">MacBook Pro 13" Display, i5</a></h3> End .product-title 
                                                <div class="product-price">
                                                    $1,199.99
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 100%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                </div> End .rating-container 
                                            </div> End .product-body 
                                        </div> End .product 
                                    </div> End .owl-carousel 
                                </div> .End .tab-pane 
                                <div class="tab-pane p-0 fade" id="trending-sale-tab" role="tabpanel" aria-labelledby="trending-sale-link">
                                    <div class="owl-carousel owl-full carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                                         data-owl-options='{
                                         "nav": true, 
                                         "dots": false,
                                         "margin": 20,
                                         "loop": false,
                                         "responsive": {
                                         "0": {
                                         "items":2
                                         },
                                         "480": {
                                         "items":2
                                         },
                                         "768": {
                                         "items":3
                                         },
                                         "992": {
                                         "items":4
                                         }
                                         }
                                         }'>
                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <span class="product-label label-circle label-new">New</span>
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-8.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">Smartwatches</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Apple Watch Series 4 Gold Aluminum Case</a></h3> End .product-title 
                                                <div class="product-price">
                                                    $499.99
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 80%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                </div> End .rating-container 

                                                <div class="product-nav product-nav-dots">
                                                    <a href="#" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                                </div> End .product-nav 
                                            </div> End .product-body 
                                        </div> End .product 

                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <span class="product-label label-circle label-top">Top</span>
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-6.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">Headphones</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Bose - SoundSport  wireless headphones</a></h3> End .product-title 
                                                <div class="product-price">
                                                    $199.99
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 100%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                </div> End .rating-container 

                                                <div class="product-nav product-nav-dots">
                                                    <a href="#" style="background: #69b4ff;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" style="background: #ff887f;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                                </div> End .product-nav 
                                            </div> End .product-body 
                                        </div> End .product 

                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-7.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">Video Games</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Microsoft - Refurbish Xbox One S 500GB</a></h3> End .product-title 
                                                <div class="product-price">
                                                    $279.99
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 60%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 6 Reviews )</span>
                                                </div> End .rating-container 
                                            </div> End .product-body 
                                        </div> End .product 

                                        <div class="product product-2">
                                            <figure class="product-media">
                                                <span class="product-label label-circle label-new">New</span>
                                                <a href="product.html">
                                                    <img src="assets/images/demos/demo-4/products/product-3.jpg" alt="Product image" class="product-image">
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                                </div> End .product-action 

                                                <div class="product-action">
                                                    <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                                    <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                                </div> End .product-action 
                                            </figure> End .product-media 

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="#">Tablets</a>
                                                </div> End .product-cat 
                                                <h3 class="product-title"><a href="product.html">Apple - 11 Inch iPad Pro  with Wi-Fi 256GB </a></h3> End .product-title 
                                                <div class="product-price">
                                                    $899.99
                                                </div> End .product-price 
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 80%;"></div> End .ratings-val 
                                                    </div> End .ratings 
                                                    <span class="ratings-text">( 4 Reviews )</span>
                                                </div> End .rating-container 

                                                <div class="product-nav product-nav-dots">
                                                    <a href="#" style="background: #edd2c8;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                                    <a href="#" class="active" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                                </div> End .product-nav 
                                            </div> End .product-body 
                                        </div> End .product 
                                    </div> End .owl-carousel 
                                </div> .End .tab-pane 
                            </div> End .tab-content 
                        </div> End .col-xl-4-5col 
                    </div> End .row 
                </div> End .container 
            </div> End .bg-light pt-5 pb-6 

            <div class="mb-5"></div> End .mb-5 

            <div class="container for-you">
                <div class="heading heading-flex mb-3">
                    <div class="heading-left">
                        <h2 class="title">Recommendation For You</h2> End .title 
                    </div> End .heading-left 

                    <div class="heading-right">
                        <a href="#" class="title-link">View All Recommendadion <i class="icon-long-arrow-right"></i></a>
                    </div> End .heading-right 
                </div> End .heading 

                <div class="products">
                    <div class="row justify-content-center">
                        <div class="col-6 col-md-4 col-lg-3">
                            <div class="product product-2">
                                <figure class="product-media">
                                    <span class="product-label label-circle label-sale">Sale</span>
                                    <a href="product.html">
                                        <img src="assets/images/demos/demo-4/products/product-10.jpg" alt="Product image" class="product-image">
                                    </a>

                                    <div class="product-action-vertical">
                                        <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                    </div> End .product-action 

                                    <div class="product-action">
                                        <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                        <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                    </div> End .product-action 
                                </figure> End .product-media 

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="#">Headphones</a>
                                    </div> End .product-cat 
                                    <h3 class="product-title"><a href="product.html">Beats by Dr. Dre Wireless  Headphones</a></h3> End .product-title 
                                    <div class="product-price">
                                        <span class="new-price">$279.99</span>
                                        <span class="old-price">Was $349.99</span>
                                    </div> End .product-price 
                                    <div class="ratings-container">
                                        <div class="ratings">
                                            <div class="ratings-val" style="width: 40%;"></div> End .ratings-val 
                                        </div> End .ratings 
                                        <span class="ratings-text">( 4 Reviews )</span>
                                    </div> End .rating-container 

                                    <div class="product-nav product-nav-dots">
                                        <a href="#" class="active" style="background: #666666;"><span class="sr-only">Color name</span></a>
                                        <a href="#" style="background: #ff887f;"><span class="sr-only">Color name</span></a>
                                        <a href="#" style="background: #6699cc;"><span class="sr-only">Color name</span></a>
                                        <a href="#" style="background: #f3dbc1;"><span class="sr-only">Color name</span></a>
                                        <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    </div> End .product-nav 
                                </div> End .product-body 
                            </div> End .product 
                        </div> End .col-sm-6 col-md-4 col-lg-3 

                        <div class="col-6 col-md-4 col-lg-3">
                            <div class="product product-2">
                                <figure class="product-media">
                                    <a href="product.html">
                                        <img src="assets/images/demos/demo-4/products/product-11.jpg" alt="Product image" class="product-image">
                                    </a>

                                    <div class="product-action-vertical">
                                        <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                    </div> End .product-action 

                                    <div class="product-action">
                                        <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                        <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                    </div> End .product-action 
                                </figure> End .product-media 

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="#">Cameras & Camcorders</a>
                                    </div> End .product-cat 
                                    <h3 class="product-title"><a href="product.html">GoPro - HERO7 Black HD Waterproof Action</a></h3> End .product-title 
                                    <div class="product-price">
                                        $349.99
                                    </div> End .product-price 
                                    <div class="ratings-container">
                                        <div class="ratings">
                                            <div class="ratings-val" style="width: 60%;"></div> End .ratings-val 
                                        </div> End .ratings 
                                        <span class="ratings-text">( 2 Reviews )</span>
                                    </div> End .rating-container 
                                </div> End .product-body 
                            </div> End .product 
                        </div> End .col-sm-6 col-md-4 col-lg-3 

                        <div class="col-6 col-md-4 col-lg-3">
                            <div class="product product-2">
                                <figure class="product-media">
                                    <span class="product-label label-circle label-new">New</span>
                                    <a href="product.html">
                                        <img src="assets/images/demos/demo-4/products/product-12.jpg" alt="Product image" class="product-image">
                                        <img src="assets/images/demos/demo-4/products/product-12-2.jpg" alt="Product image" class="product-image-hover">
                                    </a>

                                    <div class="product-action-vertical">
                                        <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                    </div> End .product-action 

                                    <div class="product-action">
                                        <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                        <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                    </div> End .product-action 
                                </figure> End .product-media 

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="#">Smartwatches</a>
                                    </div> End .product-cat 
                                    <h3 class="product-title"><a href="product.html">Apple - Apple Watch Series 3 with White Sport Band</a></h3> End .product-title 
                                    <div class="product-price">
                                        $214.49
                                    </div> End .product-price 
                                    <div class="ratings-container">
                                        <div class="ratings">
                                            <div class="ratings-val" style="width: 0%;"></div> End .ratings-val 
                                        </div> End .ratings 
                                        <span class="ratings-text">( 0 Reviews )</span>
                                    </div> End .rating-container 

                                    <div class="product-nav product-nav-dots">
                                        <a href="#" class="active" style="background: #e2e2e2;"><span class="sr-only">Color name</span></a>
                                        <a href="#" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                        <a href="#" style="background: #f2bc9e;"><span class="sr-only">Color name</span></a>
                                    </div> End .product-nav 
                                </div> End .product-body 
                            </div> End .product 
                        </div> End .col-sm-6 col-md-4 col-lg-3 

                        <div class="col-6 col-md-4 col-lg-3">
                            <div class="product product-2">
                                <figure class="product-media">
                                    <a href="product.html">
                                        <img src="assets/images/demos/demo-4/products/product-13.jpg" alt="Product image" class="product-image">
                                    </a>

                                    <div class="product-action-vertical">
                                        <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                    </div> End .product-action 

                                    <div class="product-action">
                                        <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                        <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                    </div> End .product-action 
                                </figure> End .product-media 

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="#">Laptops</a>
                                    </div> End .product-cat 
                                    <h3 class="product-title"><a href="product.html">Lenovo - 330-15IKBR 15.6"</a></h3> End .product-title 
                                    <div class="product-price">
                                        <span class="out-price">$339.99</span>
                                        <span class="out-text">Out Of Stock</span>
                                    </div> End .product-price 
                                    <div class="ratings-container">
                                        <div class="ratings">
                                            <div class="ratings-val" style="width: 60%;"></div> End .ratings-val 
                                        </div> End .ratings 
                                        <span class="ratings-text">( 11 Reviews )</span>
                                    </div> End .rating-container 
                                </div> End .product-body 
                            </div> End .product 
                        </div> End .col-sm-6 col-md-4 col-lg-3 

                        <div class="col-6 col-md-4 col-lg-3">
                            <div class="product product-2">
                                <figure class="product-media">
                                    <a href="product.html">
                                        <img src="assets/images/demos/demo-4/products/product-14.jpg" alt="Product image" class="product-image">
                                    </a>

                                    <div class="product-action-vertical">
                                        <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                    </div> End .product-action 

                                    <div class="product-action">
                                        <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                        <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                    </div> End .product-action 
                                </figure> End .product-media 

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="#">Digital Cameras</a>
                                    </div> End .product-cat 
                                    <h3 class="product-title"><a href="product.html">Sony - Alpha a5100 Mirrorless Camera</a></h3> End .product-title 
                                    <div class="product-price">
                                        $499.99
                                    </div> End .product-price 
                                    <div class="ratings-container">
                                        <div class="ratings">
                                            <div class="ratings-val" style="width: 50%;"></div> End .ratings-val 
                                        </div> End .ratings 
                                        <span class="ratings-text">( 11 Reviews )</span>
                                    </div> End .rating-container 
                                </div> End .product-body 
                            </div> End .product 
                        </div> End .col-sm-6 col-md-4 col-lg-3 

                        <div class="col-6 col-md-4 col-lg-3">
                            <div class="product product-2">
                                <figure class="product-media">
                                    <a href="product.html">
                                        <img src="assets/images/demos/demo-4/products/product-15.jpg" alt="Product image" class="product-image">
                                    </a>

                                    <div class="product-action-vertical">
                                        <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                    </div> End .product-action 

                                    <div class="product-action">
                                        <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                        <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                    </div> End .product-action 
                                </figure> End .product-media 

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="#">Laptops</a>
                                    </div> End .product-cat 
                                    <h3 class="product-title"><a href="product.html">Home Mini - Smart Speaker  with Google Assistant</a></h3> End .product-title 
                                    <div class="product-price">
                                        $49.00
                                    </div> End .product-price 
                                    <div class="ratings-container">
                                        <div class="ratings">
                                            <div class="ratings-val" style="width: 60%;"></div> End .ratings-val 
                                        </div> End .ratings 
                                        <span class="ratings-text">( 24 Reviews )</span>
                                    </div> End .rating-container 

                                    <div class="product-nav product-nav-dots">
                                        <a href="#" class="active" style="background: #ef837b;"><span class="sr-only">Color name</span></a>
                                        <a href="#" style="background: #333333;"><span class="sr-only">Color name</span></a>
                                        <a href="#" style="background: #e2e2e2;"><span class="sr-only">Color name</span></a>
                                    </div> End .product-nav 
                                </div> End .product-body 
                            </div> End .product 
                        </div> End .col-sm-6 col-md-4 col-lg-3 

                        <div class="col-6 col-md-4 col-lg-3">
                            <div class="product product-2">
                                <figure class="product-media">
                                    <span class="product-label label-circle label-sale">Sale</span>
                                    <a href="product.html">
                                        <img src="assets/images/demos/demo-4/products/product-16.jpg" alt="Product image" class="product-image">
                                    </a>

                                    <div class="product-action-vertical">
                                        <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                    </div> End .product-action 

                                    <div class="product-action">
                                        <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                        <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                    </div> End .product-action 
                                </figure> End .product-media 

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="#">Audio</a>
                                    </div> End .product-cat 
                                    <h3 class="product-title"><a href="product.html">WONDERBOOM Portable Bluetooth Speaker</a></h3> End .product-title 
                                    <div class="product-price">
                                        <span class="new-price">$99.99</span>
                                        <span class="old-price">Was $129.99</span>
                                    </div> End .product-price 
                                    <div class="ratings-container">
                                        <div class="ratings">
                                            <div class="ratings-val" style="width: 40%;"></div> End .ratings-val 
                                        </div> End .ratings 
                                        <span class="ratings-text">( 4 Reviews )</span>
                                    </div> End .rating-container 

                                    <div class="product-nav product-nav-dots">
                                        <a href="#" class="active" style="background: #666666;"><span class="sr-only">Color name</span></a>
                                        <a href="#" style="background: #ff887f;"><span class="sr-only">Color name</span></a>
                                        <a href="#" style="background: #6699cc;"><span class="sr-only">Color name</span></a>
                                        <a href="#" style="background: #f3dbc1;"><span class="sr-only">Color name</span></a>
                                        <a href="#" style="background: #eaeaec;"><span class="sr-only">Color name</span></a>
                                    </div> End .product-nav 
                                </div> End .product-body 
                            </div> End .product 
                        </div> End .col-sm-6 col-md-4 col-lg-3 

                        <div class="col-6 col-md-4 col-lg-3">
                            <div class="product product-2">
                                <figure class="product-media">
                                    <a href="product.html">
                                        <img src="assets/images/demos/demo-4/products/product-17.jpg" alt="Product image" class="product-image">
                                    </a>

                                    <div class="product-action-vertical">
                                        <a href="#" class="btn-product-icon btn-wishlist" title="Add to wishlist"></a>
                                    </div> End .product-action 

                                    <div class="product-action">
                                        <a href="#" class="btn-product btn-cart" title="Add to cart"><span>add to cart</span></a>
                                        <a href="popup/quickView.html" class="btn-product btn-quickview" title="Quick view"><span>quick view</span></a>
                                    </div> End .product-action 
                                </figure> End .product-media 

                                <div class="product-body">
                                    <div class="product-cat">
                                        <a href="#">Smart Home</a>
                                    </div> End .product-cat 
                                    <h3 class="product-title"><a href="product.html">Google - Home Hub with  Google Assistant</a></h3> End .product-title 
                                    <div class="product-price">
                                        $149.00
                                    </div> End .product-price 
                                    <div class="ratings-container">
                                        <div class="ratings">
                                            <div class="ratings-val" style="width: 60%;"></div> End .ratings-val 
                                        </div> End .ratings 
                                        <span class="ratings-text">( 2 Reviews )</span>
                                    </div> End .rating-container 
                                </div> End .product-body 
                            </div> End .product 
                        </div> End .col-sm-6 col-md-4 col-lg-3 
                    </div> End .row 
                </div> End .products 
            </div> End .container -->

            <div class="mb-4"></div><!-- End .mb-4 -->

            <div class="container">
                <hr class="mb-0">
            </div><!-- End .container -->

            <div class="icon-boxes-container bg-transparent">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-lg-3">
                            <div class="icon-box icon-box-side">
                                <span class="icon-box-icon text-dark">
                                    <i class="icon-rocket"></i>
                                </span>
                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Free Shipping</h3><!-- End .icon-box-title -->
                                    <p>Orders Rs 12,990 or more</p>
                                </div><!-- End .icon-box-content -->
                            </div><!-- End .icon-box -->
                        </div><!-- End .col-sm-6 col-lg-3 -->

                        <div class="col-sm-6 col-lg-3">
                            <div class="icon-box icon-box-side">
                                <span class="icon-box-icon text-dark">
                                    <i class="icon-rotate-left"></i>
                                </span>

                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Free Returns</h3><!-- End .icon-box-title -->
                                    <p>Within 30 days</p>
                                </div><!-- End .icon-box-content -->
                            </div><!-- End .icon-box -->
                        </div><!-- End .col-sm-6 col-lg-3 -->

                        <div class="col-sm-6 col-lg-3">
                            <div class="icon-box icon-box-side">
                                <span class="icon-box-icon text-dark">
                                    <i class="icon-info-circle"></i>
                                </span>

                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Get 20% Off 1 Item</h3><!-- End .icon-box-title -->
                                    <p>when you sign up</p>
                                </div><!-- End .icon-box-content -->
                            </div><!-- End .icon-box -->
                        </div><!-- End .col-sm-6 col-lg-3 -->

                        <div class="col-sm-6 col-lg-3">
                            <div class="icon-box icon-box-side">
                                <span class="icon-box-icon text-dark">
                                    <i class="icon-life-ring"></i>
                                </span>

                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">We Support</h3><!-- End .icon-box-title -->
                                    <p>24/7 amazing services</p>
                                </div><!-- End .icon-box-content -->
                            </div><!-- End .icon-box -->
                        </div><!-- End .col-sm-6 col-lg-3 -->
                    </div><!-- End .row -->
                </div><!-- End .container -->
            </div><!-- End .icon-boxes-container -->
        </main><!-- End .main -->



        <!--
        -->    </layout:put>
</layout:extends>