<%-- 
    Document   : add-product
    Created on : Feb 3, 2025, 9:03:14 PM
    Author     : ROG STRIX
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%> 
<layout:extends name="vendor">
    <layout:put block="pluginCSS" type="REPLACE">

        <link rel="stylesheet" href="${base_url}pro-assets/vendors/select2/select2.min.css">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">

    </layout:put>
    <layout:put block="customCSS" type="REPLACE">
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${base_url}pro-assets/vendors/multi-image-piker/multi-image-piker.css">
        <style type="text/css">
            .form-group {
                margin-bottom: 0px;
            }

            @media (max-width: 576px) {
                .col-form-label {
                    padding-bottom: 0px;
                }
            }

            .col-form-label {
                padding-top: 0px;
                margin-top: 6px;
                display: flex;
                height: 100%;
            }

            .select2-container--default .select2-selection--single {
                padding: 8px;

            }

            .select2-container--default .select2-selection--single:read-only {
                background-color: white;
            }

            .select2-container--default .select2-selection--single .select2-selection__rendered {
                line-height: 17px;
            }
        </style>
    </layout:put>


    <layout:put block="contents" type="REPLACE">
        <div class="content-wrapper">
            <div class="row">

                <div class="col-12 grid-margin">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Add New Product</h4>
                            <form class="form-sample" action="create-product" method="post" id="create-product-form">
                                <p class="card-description">
                                    Product Info </p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label
                                                class="col-sm-3 col-form-label">Title</label>
                                            <div class="col-sm-9">
                                                <input type="text"
                                                       class="form-control" id="product-title" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label
                                                class="col-sm-3 col-form-label">Category</label>
                                            <div class="col-sm-9">
                                                <select
                                                    class="js-example-basic-single w-100 " id="product-category" onchange="getSubcategory()">
                                                    <option value="">Select Category</option>
                                                    <c:forEach var="category" items="${categories}">
                                                        <option value="${category.id}">${category.name}</option>

                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label
                                                class="col-sm-3 col-form-label">Sub Category</label>
                                            <div class="col-sm-9">
                                                <select
                                                    class="js-example-basic-single w-100 " id="product-subcategory">
                                                    <option value="">Select Sub Category</option>
                                                    <c:forEach var="subcategory" items="${subcategories}">
                                                        <option value="${subcategory.id}">${subcategory.name}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label
                                                class="col-sm-3 col-form-label">Brand</label>
                                            <div class="col-sm-9">
                                                <select
                                                    class="js-example-basic-single w-100 " id="product-brand">
                                                    <option value="">Select Brand</option>
                                                    <c:forEach var="brand" items="${brands}">
                                                        <option value="${brand.id}">${brand.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label
                                                class="col-sm-3 col-form-label">Price</label>
                                            <div class="col-sm-9">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div
                                                            class="input-group-prepend">
                                                            <span
                                                                class="input-group-text bg-primary text-white">Rs</span>
                                                        </div>
                                                        <input type="text"
                                                               class="form-control"
                                                               aria-label="Amount (to the nearest dollar)" id="product-price">
                                                        <div
                                                            class="input-group-append">
                                                            <span
                                                                class="input-group-text">.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label
                                                class="col-sm-3 col-form-label">Quantity</label>
                                            <div class="col-sm-9">
                                                <input class="form-control"
                                                       placeholder="Stock Quantity"
                                                       type="number" min="1" value="1"  id="product-qty"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12" style="margin-bottom: 15px;">
                                        <div class="form-group row">
                                            <label class="col-sm-12 col-form-label"
                                                   style="margin-bottom: 5px;padding-bottom: 5px;">Description</label>
                                            <div class="col-sm-12">

                                                <textarea class="form-control" placeholder="Type here" id="product-description" name="product-description"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group row">
                                        <label
                                            class="col-sm-12 col-form-label"> Product Images</label>
                                        <div class="col-sm-12">
                                            <input type="file" name="images[]" multiple id="imageInput" accept="image/*">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 d-flex justify-content-end ">
                                    <button type="reset" class="btn btn-light me-2" onclick="clearFeilds()">Cancel</button>
                                    <button type="submit" class="btn btn-primary ">Submit</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- content-wrapper ends -->

    </layout:put>
    <layout:put block="pluginJS" type="REPLACE">

        <script src="${base_url}pro-assets/vendors/typeahead.js/typeahead.bundle.min.js"></script>
        <script src="${base_url}pro-assets/vendors/select2/select2.min.js"></script>
        <script src="${base_url}pro-assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>

    </layout:put>
    <layout:put block="customJS" type="REPLACE">

        <script src="${base_url}pro-assets/js/file-upload.js"></script>
        <script src="${base_url}pro-assets/js/typeahead.js"></script>
        <script src="${base_url}pro-assets/js/select2.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="${base_url}pro-assets/js/multi-image-picker-simple.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>
        <script src="${base_url}assets/js/just-validate.production.min.js"></script>
        <script type="text/javascript">
                                        var selector = document.getElementsByClassName("select2-container--default");
                                        for (let i = 0; i < selector.length; i++) {
                                            const element = selector[i];

                                            element.style.width = "100%";
                                        }
                                        $(document).ready(function () {
                                            $('#product-description').summernote({
                                                tabsize: 2,
                                                height: 200
                                            });

                                        });
                                        multiImagePickerSimple({
                                            inputId: "imageInput",
                                            addBtnText: "<i class=\"mdi mdi-cloud-upload\"></i>&emsp;  Add Image"
                                        });

                                        const validate = new JustValidate('#create-product-form');
                                        validate
                                                .addField('#product-title', [{rule: 'required'}])
                                                .addField('#product-category', [{rule: 'required'}])
                                                .addField('#product-subcategory', [{rule: 'required'}])
                                                .addField('#product-brand', [{rule: 'required'}])
                                                .addField('#product-price', [{rule: 'required'}])
                                                .addField('#product-qty', [{rule: 'required'}])
                                                .addField('#imageInput', [
                                                    {rule: 'minFilesCount', value: 1, },
                                                    {rule: 'maxFilesCount', value: 4, },
                                                ])


                                                .onSuccess((event) => {
                                                    let title = document.querySelector("#product-title").value;
                                                    let subcategory = document.querySelector("#product-subcategory").value;
                                                    let brand = document.querySelector("#product-brand").value;
                                                    let price = document.querySelector("#product-price").value;
                                                    let qty = document.querySelector("#product-qty").value;
                                                    let description = $('#product-description').summernote('code');
                                                    let data = new URLSearchParams();
                                                    data.append("title", title);
                                                    data.append("subcategory", subcategory);
                                                    data.append("brand", brand);
                                                    data.append("price", price);
                                                    data.append("qty", qty);
                                                    data.append("descrition", description);
                                                    fetch("create-product", {
                                                        method: "POST",
                                                        headers: {
                                                            'Content-Type': 'application/x-www-form-urlencoded'
                                                        },
                                                        body: data
                                                    }).then(response => response.json())
                                                            .then(data => {
                                                                console.log(data.msg);
                                                                uploadImages(data.productId);
                                                                //document.querySelector("#msg").innerHTML = text;
                                                            }).catch(ex => console.log(ex));

                                                });


                                        function uploadImages(id) {
                                            let data = new FormData();
                                            let input = document.querySelector("#imageInput");

                                            for (let file of input.files) {
                                                data.append("file[]", file);
                                            }

                                            fetch("${base_url}seller/upload-product-images?pid=" + id, {
                                                method: 'POST',
                                                body: data
                                            }).then(response => {
                                                if (response.status === 200) {
                                                              window.location.reload();
//                                                    clearFeilds();
                                                }
                                            });
                                        }
                                        function getSubcategory() {
                                            let id = document.querySelector("#product-category").value;
                                            let subcategory = document.querySelector("#product-subcategory");

                                            let data = new URLSearchParams();
                                            data.append("cid", id);

                                            fetch("get-subcategory", {
                                                method: "POST",
                                                headers: {
                                                    'Content-Type': 'application/x-www-form-urlencoded'
                                                },
                                                body: data
                                            }).then(response => response.json())
                                                    .then(response => {
                                                        if (response.msg == "success") {
                                                            subcategory.innerHTML = response.content;
                                                        }
                                                    }).catch(ex => console.log(ex));
                                        }

                                        function clearFeilds() {
                                            document.querySelector("#product-title").value = "";
                                            document.querySelector("#product-subcategory").value = "";
                                            $('#product-subcategory').trigger('change');
                                            document.querySelector("#product-category").value = "";
                                            $('#product-category').trigger('change');
                                            document.querySelector("#product-brand").value = "";
                                            $('#product-brand').trigger('change');
                                            document.querySelector("#product-price").value = "";
                                            document.querySelector("#product-qty").value = "";
                                            $('#product-description').summernote('code', '');
                                            document.querySelector("#imageInput").value = "";
                                            let imgBox = document.querySelector("#multiImagePickerContainer");
                                            if (imgBox) {
                                                imgBox.remove();
                                            }
                                        }
        </script>

    </layout:put>
</layout:extends>