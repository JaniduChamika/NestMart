<%-- 
    Document   : product
    Created on : Feb 2, 2025, 2:29:52 PM
    Author     : ROG STRIX
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%> 
<layout:extends name="base">
    <layout:put block="contents" type="REPLACE">
        <main class="main">
            <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
                <div class="container d-flex align-items-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">${product.subCategory.category.name}</a></li>
                        <li class="breadcrumb-item active" aria-current="page">${product.subCategory.name}</li>
                    </ol>

                    <nav class="product-pager ml-auto" aria-label="Product">
                        <a class="product-pager-link product-pager-prev" href="#" aria-label="Previous" tabindex="-1">
                            <i class="icon-angle-left"></i>
                            <span>Prev</span>
                        </a>

                        <a class="product-pager-link product-pager-next" href="#" aria-label="Next" tabindex="-1">
                            <span>Next</span>
                            <i class="icon-angle-right"></i>
                        </a>
                    </nav><!-- End .pager-nav -->
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
                <div class="container">
                    <div class="product-details-top">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="product-gallery product-gallery-vertical">
                                    <div class="row">
                                        <figure class="product-main-image">
                                            <img id="product-zoom" src="${product.images['0']}" data-zoom-image="${product.images['0']}" alt="product image">

                                            <a href="#" id="btn-product-gallery" class="btn-product-gallery">
                                                <i class="icon-arrows"></i>
                                            </a>
                                        </figure><!-- End .product-main-image -->

                                        <div id="product-zoom-gallery" class="product-image-gallery" style="height: fit-content">
                                            <c:forEach var="image" items="${product.images}" varStatus="loop" begin="0" end="2">
                                                <a style="max-height: 100px" class="product-gallery-item ${loop.first ? ' active' : ''}" href="#" data-image="${image}" data-zoom-image="${image}">
                                                    <img src="${image}" alt="product" >
                                                </a>
                                            </c:forEach>

                                        </div><!-- End .product-image-gallery -->
                                    </div><!-- End .row -->
                                </div><!-- End .product-gallery -->
                            </div><!-- End .col-md-6 -->

                            <div class="col-md-6">
                                <div class="product-details">
                                    <h1 class="product-title">${product.name}</h1><!-- End .product-title -->

                                    <div class="ratings-container">
                                        <div class="ratings">
                                            <div class="ratings-val" style="width: 80%;"></div><!-- End .ratings-val -->
                                        </div><!-- End .ratings -->
                                        <a class="ratings-text" href="#product-review-link" id="review-link">( 2 Reviews )</a>
                                    </div><!-- End .rating-container -->

                                    <div class="product-price">
                                        ${setting.value} <fmt:formatNumber value="${product.price}" pattern="###,###.00" />

                                    </div><!-- End .product-price -->

                                    <%--   <div class="product-content">
                                           <p>describtion</p>
                                       </div><!-- End .product-content -->
                                      <div class="details-filter-row details-row-size">
                                           <label>Color:</label>

                                        <div class="product-nav product-nav-thumbs">
                                            <a href="#" class="active">
                                                <img src="assets/images/products/single/1-thumb.jpg" alt="product desc">
                                            </a>
                                            <a href="#">
                                                <img src="assets/images/products/single/2-thumb.jpg" alt="product desc">
                                            </a>
                                        </div><!-- End .product-nav -->
                                    </div><!-- End .details-filter-row -->

                                    <div class="details-filter-row details-row-size">
                                        <label for="size">Size:</label>
                                        <div class="select-custom">
                                            <select name="size" id="size" class="form-control">
                                                <option value="#" selected="selected">Select a size</option>
                                                <option value="s">Small</option>
                                                <option value="m">Medium</option>
                                                <option value="l">Large</option>
                                                <option value="xl">Extra Large</option>
                                            </select>
                                        </div><!-- End .select-custom -->

                                      
                                    </div><!-- End .details-filter-row -->
                                    --%>
                                    <div class="details-filter-row details-row-size">
                                        <label for="qty">Qty:</label>
                                        <div class="product-details-quantity">
                                            <input type="number" id="qty" class="form-control" value="1" min="1" max="${product.stockQuantity}" step="1" data-decimals="0" required>
                                        </div><!-- End .product-details-quantity -->
                                    </div><!-- End .details-filter-row -->

                                    <div class="product-details-action">
                                        <c:if test="${empty sessionScope.user}">
                                            <button  class="btn btn-primary btn-rounded btn-shadow " onclick="login()"><span>Add to cart</span></button>

                                        </c:if>
                                        <c:if test="${!empty sessionScope.user}">
                                            <button  class="btn btn-primary btn-rounded btn-shadow " onclick="addToCart()"><span>Add to cart</span></button>

                                        </c:if>

                                        <div class="details-action-wrapper">
                                            <c:if test="${empty sessionScope.user}">
                                                <button  class="btn-product custom-btn" onclick="login()"><span> Buy Now</span></button>
                                            </c:if>
                                            <c:if test="${!empty sessionScope.user}">
                                                <button  class="btn-product custom-btn" onclick="buynow()"><span> Buy Now</span></button>

                                            </c:if>

                                            <c:if test="${!empty sessionScope.user}">
                                                <c:if test="${isInwishlist}">
                                                    <button  class="btn-product btn-wishlist custom-btn active" id="wishlistbtn" onclick="removeFromWishlist()" ><span>Remove from Wishlist</span></button>
                                                </c:if>
                                                <c:if test="${!isInwishlist}">
                                                    <button  class="btn-product btn-wishlist custom-btn " id="wishlistbtn" onclick="addToWishlist()" ><span>Add to Wishlist</span></button>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${empty sessionScope.user}">
                                                <button  class="btn-product btn-wishlist custom-btn " id="wishlistbtn" onclick="login()" ><span>Add to Wishlist</span></button>

                                            </c:if>
                                        </div><!-- End .details-action-wrapper -->
                                    </div><!-- End .product-details-action -->

                                    <div class="product-details-footer">
                                        <div class="product-cat">
                                            <span>Tag:</span>
                                            <a href="#">Phone</a>,
                                            <a href="#">iPhone</a>,
                                            <a href="#">Green</a>
                                        </div><!-- End .product-cat -->

                                        <div class="social-icons social-icons-sm">
                                            <span class="social-label">Share:</span>
                                            <a href="#" class="social-icon" title="Facebook" target="_blank"><i class="icon-facebook-f"></i></a>
                                            <a href="#" class="social-icon" title="Twitter" target="_blank"><i class="icon-twitter"></i></a>
                                            <a href="#" class="social-icon" title="Instagram" target="_blank"><i class="icon-instagram"></i></a>
                                            <a href="#" class="social-icon" title="Pinterest" target="_blank"><i class="icon-pinterest"></i></a>
                                        </div>
                                    </div><!-- End .product-details-footer -->
                                </div><!-- End .product-details -->
                            </div><!-- End .col-md-6 -->
                        </div><!-- End .row -->
                    </div><!-- End .product-details-top -->

                    <div class="product-details-tab">
                        <ul class="nav nav-pills justify-content-center" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="product-desc-link" data-toggle="tab" href="#product-desc-tab" role="tab" aria-controls="product-desc-tab" aria-selected="true">Description</a>
                            </li>
                            <%-- <li class="nav-item">
                               <a class="nav-link" id="product-info-link" data-toggle="tab" href="#product-info-tab" role="tab" aria-controls="product-info-tab" aria-selected="false">Additional information</a>
                           </li>
                           <li class="nav-item">
                               <a class="nav-link" id="product-shipping-link" data-toggle="tab" href="#product-shipping-tab" role="tab" aria-controls="product-shipping-tab" aria-selected="false">Shipping & Returns</a>
                           </li> --%>
                            <li class="nav-item">
                                <a class="nav-link" id="product-review-link" data-toggle="tab" href="#product-review-tab" role="tab" aria-controls="product-review-tab" aria-selected="false">Reviews (2)</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="product-desc-tab" role="tabpanel" aria-labelledby="product-desc-link">
                                <div class="product-desc-content">
                                    ${product.description}
                                </div><!-- End .product-desc-content -->
                            </div><!-- .End .tab-pane -->
                            <%--  <div class="tab-pane fade" id="product-info-tab" role="tabpanel" aria-labelledby="product-info-link">
                                  <div class="product-desc-content">
                                      <h3>Information</h3>
                                      <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. </p>

                                    <h3>Fabric & care</h3>
                                    <ul>
                                        <li>Faux suede fabric</li>
                                        <li>Gold tone metal hoop handles.</li>
                                        <li>RI branding</li>
                                        <li>Snake print trim interior </li>
                                        <li>Adjustable cross body strap</li>
                                        <li> Height: 31cm; Width: 32cm; Depth: 12cm; Handle Drop: 61cm</li>
                                    </ul>

                                    <h3>Size</h3>
                                    <p>one size</p>
                                </div><!-- End .product-desc-content -->
                            </div><!-- .End .tab-pane -->
                            <div class="tab-pane fade" id="product-shipping-tab" role="tabpanel" aria-labelledby="product-shipping-link">
                                <div class="product-desc-content">
                                    <h3>Delivery & returns</h3>
                                    <p>We deliver to over 100 countries around the world. For full details of the delivery options we offer, please view our <a href="#">Delivery information</a><br>
                                        We hope you’ll love every purchase, but if you ever need to return an item you can do so within a month of receipt. For full details of how to make a return, please view our <a href="#">Returns information</a></p>
                                </div><!-- End .product-desc-content -->
                            </div><!-- .End .tab-pane --> 
                            --%>
                            <div class="tab-pane fade" id="product-review-tab" role="tabpanel" aria-labelledby="product-review-link">
                                <div class="reviews">
                                    <h3>Reviews (2)</h3>
                                    <div class="review">
                                        <div class="row no-gutters">
                                            <div class="col-auto">
                                                <h4><a href="#">Samanta J.</a></h4>
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 80%;"></div><!-- End .ratings-val -->
                                                    </div><!-- End .ratings -->
                                                </div><!-- End .rating-container -->
                                                <span class="review-date">6 days ago</span>
                                            </div><!-- End .col -->
                                            <div class="col">
                                                <h4>Good, perfect size</h4>

                                                <div class="review-content">
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus cum dolores assumenda asperiores facilis porro reprehenderit animi culpa atque blanditiis commodi perspiciatis doloremque, possimus, explicabo, autem fugit beatae quae voluptas!</p>
                                                </div><!-- End .review-content -->

                                                <div class="review-action">
                                                    <a href="#"><i class="icon-thumbs-up"></i>Helpful (2)</a>
                                                    <a href="#"><i class="icon-thumbs-down"></i>Unhelpful (0)</a>
                                                </div><!-- End .review-action -->
                                            </div><!-- End .col-auto -->
                                        </div><!-- End .row -->
                                    </div><!-- End .review -->

                                    <div class="review">
                                        <div class="row no-gutters">
                                            <div class="col-auto">
                                                <h4><a href="#">John Doe</a></h4>
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 100%;"></div><!-- End .ratings-val -->
                                                    </div><!-- End .ratings -->
                                                </div><!-- End .rating-container -->
                                                <span class="review-date">5 days ago</span>
                                            </div><!-- End .col -->
                                            <div class="col">
                                                <h4>Very good</h4>

                                                <div class="review-content">
                                                    <p>Sed, molestias, tempore? Ex dolor esse iure hic veniam laborum blanditiis laudantium iste amet. Cum non voluptate eos enim, ab cumque nam, modi, quas iure illum repellendus, blanditiis perspiciatis beatae!</p>
                                                </div><!-- End .review-content -->

                                                <div class="review-action">
                                                    <a href="#"><i class="icon-thumbs-up"></i>Helpful (0)</a>
                                                    <a href="#"><i class="icon-thumbs-down"></i>Unhelpful (0)</a>
                                                </div><!-- End .review-action -->
                                            </div><!-- End .col-auto -->
                                        </div><!-- End .row -->
                                    </div><!-- End .review -->
                                </div><!-- End .reviews -->
                            </div><!-- .End .tab-pane -->
                        </div><!-- End .tab-content -->
                    </div><!-- End .product-details-tab -->

                   


                        




                    </div><!-- End .owl-carousel -->
                </div><!-- End .container -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->
    </layout:put>
    <layout:put block="scripts" type="REPLACE">
        <script src="${base_url}assets/js/jquery.elevateZoom.min.js"></script>
        <script type="text/javascript">
                                                    function addToCart() {
                                                        let qty = document.querySelector("#qty").value;
                                                        let prodcutId =${product.id};

                                                        let datalog = new URLSearchParams();
                                                        datalog.append("qty", qty);
                                                        datalog.append("pid", prodcutId);

                                                        fetch("add-to-cart", {
                                                            method: "POST",
                                                            headers: {"Content-Type": "application/x-www-form-urlencoded"},
                                                            body: datalog
                                                        }).then(response => response.json())
                                                                .then(response => {

                                                                    if (response.msg == "sucess") {
                                                                        window.location.reload();
//                                                                        alert("done");
                                                                    } else {
                                                                        console.log(response.msg);
                                                                    }
                                                                }).catch(ex => console.log(ex));
                                                    }

                                                    function addToWishlist() {

                                                        let btn = document.getElementById("wishlistbtn");
                                                        let prodcutId =${product.id};
                                                        let datalog = new URLSearchParams();
                                                        datalog.append("pid", prodcutId);
                                                        if (${sessionScope.user!=null}) {
                                                            fetch("add-to-wishlist", {
                                                                method: "POST",
                                                                headers: {"Content-Type": "application/x-www-form-urlencoded"},
                                                                body: datalog
                                                            }).then(response => response.json())
                                                                    .then(response => {

                                                                        if (response.msg == "sucess") {
                                                                            window.location.reload();
//                                                                            alert("done");
                                                                        } else {
                                                                            console.log(response.msg);
                                                                        }
                                                                    }).catch(ex => console.log(ex));
                                                        } else {
                                                            alert("login");
                                                        }
                                                    }

                                                    function removeFromWishlist() {
                                                        let btn = document.getElementById("wishlistbtn");
                                                        let prodcutId =${product.id};
                                                        let datalog = new URLSearchParams();
                                                        datalog.append("pid", prodcutId);
                                                        if (${sessionScope.user!=null}) {
                                                            fetch("remove-from-wishlist", {
                                                                method: "POST",
                                                                headers: {"Content-Type": "application/x-www-form-urlencoded"},
                                                                body: datalog
                                                            }).then(response => response.json())
                                                                    .then(response => {

                                                                        if (response.msg == "sucess") {
                                                                            window.location.reload();
//                                                                            alert("done");
                                                                        } else {
                                                                            console.log(response.msg);
                                                                        }
                                                                    }).catch(ex => console.log(ex));
                                                        } else {
                                                            alert("login");
                                                        }
                                                    }
                                                    function buynow() {
                                                        let qty = document.querySelector("#qty").value;
                                                        let productId =${product.id};


                                                        const form = document.createElement('form');
                                                        form.method = 'post';          // Set method to POST
                                                        form.action = '${base_url}product/checkout';     // Set target URL

                                                        // Create hidden input for product_id
                                                        const productIdInput = document.createElement('input');
                                                        productIdInput.type = 'hidden';
                                                        productIdInput.name = 'pid';
                                                        productIdInput.value = productId;
                                                        form.appendChild(productIdInput);

                                                        // Create hidden input for quantity
                                                        const quantityInputHidden = document.createElement('input');
                                                        quantityInputHidden.type = 'hidden';
                                                        quantityInputHidden.name = 'qty';
                                                        quantityInputHidden.value = qty;
                                                        form.appendChild(quantityInputHidden);

                                                        // Append form to the document body
                                                        document.body.appendChild(form);
                                                        form.submit();
                                                    }
                                                    function login() {
                                                        window.location.href = "${base_url}sign-in";
                                                    }
        </script>

    </layout:put>
</layout:extends>