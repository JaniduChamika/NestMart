<%-- 
    Document   : shop
    Created on : Feb 2, 2025, 6:51:34 PM
    Author     : ROG STRIX
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%> 
<layout:extends name="base">
    <layout:put block="styles" type="REPLACE">
        <!--<link rel="stylesheet" href="assets/css/custom.css">-->
    </layout:put>
    <layout:put block="contents" type="REPLACE">
        <main class="main">
            <div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
                <div class="container">
                    <h1 class="page-title">Shopping

                        <span>${topic}</span>
                    </h1>
                </div><!-- End .container -->
            </div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav mb-2">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Product List</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="toolbox">
                                <div class="toolbox-left">
                                    <div class="toolbox-info">
                                        <span> ${products.size()}</span> Products Found
                                    </div>
                                </div> 

                                <div class="toolbox-right">
                                    <div class="toolbox-sort">
                                        <label for="sortby">Sort by:</label>
                                        <div class="select-custom">
                                            <select name="sortby" id="sortby" class="form-control">
                                                <option value="">Select sort</option>
                                                <option value="LH" ${param['sortby'] == 'LH'? 'selected':''}>Price Low to High</option>
                                                <option value="HL" ${param['sortby'] == 'HL'? 'selected':''}>Price High to Low</option>
                                            </select>
                                        </div>
                                    </div><!-- End .toolbox-sort -->

                                </div><!-- End .toolbox-right -->
                            </div><!-- End .toolbox -->

                            <div class="products mb-3">
                                <div class="row justify-content-center">
                                    <jsp:useBean id="now" class="java.util.Date" /><!-- Current date -->
                                    <fmt:formatDate var="currentYear" value="${now}" pattern="yyyy" />
                                    <fmt:formatDate var="currentMonth" value="${now}" pattern="MM" />
                                    <c:forEach var="product" items="${products}">
                                        <div class="col-6 col-md-4 col-lg-4 col-xl-3">
                                            <div class="product product-7 text-center">
                                                <figure class="product-media">
                                                    <fmt:formatDate var="productYear" value="${product.createdAt}" pattern="yyyy" />
                                                    <fmt:formatDate var="productMonth" value="${product.createdAt}" pattern="MM" />
                                                    <c:if test="${productYear == currentYear && productMonth == currentMonth}">
                                                        <span class="product-label label-new">New</span>
                                                    </c:if>
                                                    <a href="product?pid=${product.id}">
                                                        <img src="${product.images['0']}" alt="Product image" class="product-image">
                                                    </a>

                                                    <div class="product-action-vertical">
                                                        <a href="#" class="btn-product-icon btn-wishlist btn-expandable"><span>add to wishlist</span></a>
                                                        <a href="product?pid=${product.id}" class="btn-product-icon btn-quickview" title="Quick view"><span>Quick view</span></a>
                                                        <!--<a href="#" class="btn-product-icon btn-compare" title="Compare"><span>Compare</span></a>-->
                                                    </div><!-- End .product-action-vertical -->

                                                    <div class="product-action">
                                                        <c:if test="${sessionScope.user==null}">
                                                            <a href="sign-in" class="btn-product btn-cart"><span>add to cart</span></a>

                                                        </c:if>
                                                        <c:if test="${sessionScope.user!=null}">
                                                            <a href="javascript:void(0);" class="btn-product btn-cart btn-add-cart" data-product-id="${product.id}"><span>add to cart</span></a>

                                                        </c:if>
                                                    </div><!-- End .product-action -->
                                                </figure><!-- End .product-media -->

                                                <div class="product-body">
                                                    <div class="product-cat">
                                                        <a href="product?pid=${product.id}">${product.subCategory.name}</a>
                                                    </div><!-- End .product-cat -->
                                                    <h3 class="product-title"><a href="product?pid=${product.id}">${product.name}</a></h3><!-- End .product-title -->
                                                    <div class="product-price">
                                                        ${setting.value} <fmt:formatNumber value="${product.price}" pattern="###,###.00" />


                                                    </div><!-- End .product-price -->
                                                    <div class="ratings-container">
                                                        <div class="ratings">
                                                            <div class="ratings-val" style="width: 20%;"></div><!-- End .ratings-val -->
                                                        </div><!-- End .ratings -->
                                                        <span class="ratings-text">( 2 Reviews )</span>
                                                    </div><!-- End .rating-container -->

                                                    <div class="product-nav product-nav-thumbs">
                                                        <c:forEach var="image" items="${product.images}" varStatus="loop" begin="0" end="2">

                                                            <a href="product?pid=${product.id}" class="active">
                                                                <img src="${image}" alt="${product.name}">
                                                            </a>
                                                        </c:forEach>

                                                    </div><!-- End .product-nav -->
                                                </div><!-- End .product-body -->
                                            </div><!-- End .product -->
                                        </div><!-- End .col-sm-6 col-lg-4 col-xl-3 -->
                                    </c:forEach>


                                </div><!-- End .row -->
                            </div><!-- End .products -->


                        </div><!-- End .col-lg-9 -->
                        <aside class="col-lg-3 order-lg-first">
                            <div class="sidebar sidebar-shop">
                                <div class="widget widget-clean">
                                    <label>Filters:</label>
                                    <a href="${base_url}shop" class="">Clean All</a>
                                </div><!-- End .widget widget-clean -->
                                <c:if test="${!empty param['category']}">
                                    <div class="widget widget-collapsible">
                                        <h3 class="widget-title">
                                            <a data-toggle="collapse" href="#widget-1" role="button" aria-expanded="false" aria-controls="widget-1">
                                                Sub Category
                                            </a>
                                        </h3><!-- End .widget-title -->

                                        <div class="collapse" id="widget-1">
                                            <div class="widget-body">
                                                <div class="filter-items filter-items-count">

                                                    <c:forEach var="subcategory" items="${subCategory}">
                                                        <div class="filter-item">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" name="subcategory" class="custom-control-input" 
                                                                       value="${subcategory.id}" id="cat-${subcategory.id}"
                                                                        ${paramValues['sub-category'] != null && fn:contains(fn:join(paramValues['sub-category'], ','), subcategory.id) ? 'checked' : ''}>
                                                                <label class="custom-control-label" for="cat-${subcategory.id}">${subcategory.name}</label>
                                                            </div><!-- End .custom-checkbox -->
                                                            <!--<span class="item-count">3</span>-->
                                                        </div><!-- End .filter-item -->
                                                    </c:forEach>



                                                </div><!-- End .filter-items -->
                                            </div><!-- End .widget-body -->
                                        </div><!-- End .collapse -->
                                    </div><!-- End .widget -->

                                </c:if>

                                <c:if test="${!empty param['sub-category']}">
                                    <div class="widget widget-collapsible">
                                        <h3 class="widget-title">
                                            <a data-toggle="collapse" href="#widget-4" role="button" aria-expanded="false" aria-controls="widget-4">
                                                Brand
                                            </a>
                                        </h3><!-- End .widget-title -->

                                        <div class="collapse" id="widget-4">
                                            <div class="widget-body">
                                                <div class="filter-items">

                                                    <c:forEach var="brand" items="${brands}">
                                                        <div class="filter-item">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="brand"
                                                                       value="${brand.id}" id="brand-${brand.id}"
                                                                       ${paramValues['brand'] != null && fn:contains(fn:join(paramValues['brand'], ','), brand.id) ? 'checked' : ''}>
                                                                <label class="custom-control-label" for="brand-${brand.id}">${brand.name}</label>
                                                            </div><!-- End .custom-checkbox -->
                                                        </div><!-- End .filter-item -->
                                                    </c:forEach>
                                                </div><!-- End .filter-items -->
                                            </div><!-- End .widget-body -->
                                        </div><!-- End .collapse -->
                                    </div><!-- End .widget -->
                                </c:if>
                                <div class="widget widget-collapsible">
                                    <h3 class="widget-title">
                                        <a data-toggle="collapse" href="#widget-5" role="button" aria-expanded="false" aria-controls="widget-5">
                                            Price Range
                                        </a>
                                    </h3><!-- End .widget-title -->

                                    <div class="collapse " id="widget-5">
                                        <div class="widget-body">
                                            <div class="filter-items">
                                                <div class="input-fields">
                                                    <div class="input-group">
                                                        <label for="min-price">Min Price (Rs)</label>
                                                        <input type="number" id="min-price" placeholder="Min" 
                                                               value="${param['minPrice'] != null? param['minPrice']:''}"
                                                               min="0" step="10000">
                                                    </div>
                                                    <div class="input-group">
                                                        <label for="max-price">Max Price (Rs)</label>
                                                        <input type="number" id="max-price"
                                                               value="${param['maxprice'] != null? param['maxprice']:''}"
                                                               placeholder="Max" min="0" step="10000">
                                                    </div>
                                                    <div class="input-group mt-2">
                                                        <input type="button" class="btn btn-secondary btn-md w-100" id="filter" value="Filter" ">
                                                    </div>
                                                </div>

                                            </div><!-- End .filter-items -->
                                        </div><!-- End .widget-body -->
                                    </div><!-- End .collapse -->
                                </div>

                            </div><!-- End .sidebar sidebar-shop -->
                        </aside><!-- End .col-lg-3 -->
                    </div><!-- End .row -->
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
//                                    alert("Failed to remove item: " + response.msg);
                                }
                            })
                            .catch(ex => {
                                console.log(ex);
//                                alert("Error removing item");
                            });
                });
            });



            function updateProductList() {

                let subCategoryIds = [];
                $('input[name="subcategory"]:checked').each(function () {
                    subCategoryIds.push($(this).val());
                });
                let brandIds = [];
                $('input[name="brand"]:checked').each(function () {
                    brandIds.push($(this).val());
                });
                let categoryId = new URLSearchParams(window.location.search).get('category') || '';

                let minPrice = $('#min-price').val() || '';
                let maxPrice = $('#max-price').val() || '';

                let search = $('#q').val() || '';
                let sortBy = $('#sortby').val() || 'LH';

                // Construct query parameters
                let params = new URLSearchParams();
                if (categoryId)
                    params.append('category', categoryId);
                subCategoryIds.forEach(id => params.append('sub-category', id));
                brandIds.forEach(id => params.append('brand', id));
                if (minPrice)
                    params.append('minPrice', minPrice);
                if (maxPrice)
                    params.append('maxPrice', maxPrice);
                if (search)
                    params.append('search', search);
                params.append('sortby', sortBy);

                let url = '${base_url}shop?' + params.toString();
                window.location.href = url;
//                console.log(url);

            }

            $(document).ready(function () {
                // Subcategory and brand checkboxes
                $('.custom-control-input').on('change', updateProductList);

                // Price inputs (on blur or enter)
                $('#filter').on('click', updateProductList);



                $('#searchBtn').on('click', function (e) {
                    e.preventDefault();
                    updateProductList();
                });

                // Sort dropdown
                $('#sortby').on('change', updateProductList);
            });
        </script>

    </layout:put>
</layout:extends>
