<%-- 
    Document   : view-product
    Created on : Feb 3, 2025, 10:44:16 PM
    Author     : ROG STRIX
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%> 
<layout:extends name="vendor">
    <layout:put block="customCSS" type="REPLACE">
    </layout:put>
    <layout:put block="pluginJS" type="REPLACE">
        <script src="${base_url}pro-assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>

    </layout:put>

    <layout:put block="contents" type="REPLACE">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">My Products</h4>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">
                                                Product
                                            </th>
                                            <th>
                                                Title
                                            </th>
                                            <th>
                                                Category
                                            </th>
                                            <th class="text-center">
                                                Quantity
                                            </th>
                                            <th>
                                                Unit Price
                                            </th>
                                            <th>
                                                Action
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="product" items="${products}">
                                            <tr>
                                                <td class="py-2 text-center">
                                                    <img src="${product.images['0']}"
                                                         alt="image" class="rounded img-fluid square-img"/>
                                                </td>
                                                <td class="py-2">
                                                    ${product.name}
                                                </td>
                                                <td class="py-2">
                                                    ${product.subCategory.name}
                                                </td>
                                                <td class="py-2 text-center">
                                                    ${product.stockQuantity}
                                                </td>
                                                <td class="py-2">

                                                    ${currency} <fmt:formatNumber value="${product.price}"  pattern="###,###.00"/>
                                                </td>
                                                <td class="py-2">
                                                    <button type="button" class="btn btn-primary p-2 edit-product-btn" data-product-id="${product.id}"><i class="mdi mdi-tooltip-edit"></i></button>
                                                    <button type="button" class="btn btn-danger p-2 change-status-btn" data-product-id="${product.id}" ><i class="mdi mdi-delete"></i></button>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>

                            </div>
                            <!--                            <div class="w-100  text-center">
                                                            <div class="btn-group pt-2 " role="group" aria-label="Basic example">
                                                                <button type="button" class="btn btn-outline-secondary">1</button>
                                                                <button type="button" class="btn btn-outline-secondary">2</button>
                                                                <button type="button" class="btn btn-outline-secondary">3</button>
                                                            </div>
                                                        </div>-->

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </layout:put>
    <layout:put block="customJS" type="REPLACE">
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const buttons = document.querySelectorAll('.change-status-btn');

                buttons.forEach(button => {
                    button.addEventListener('click', function () {
                        const id = this.getAttribute('data-product-id');

                        let data = new URLSearchParams();
                        data.append("pid", id);

                        fetch('${base_url}seller/move-trash', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded',
                            },
                            body: data
                        }).then(response => response.json())
                                .then(data => {
                                    if (data.msg == "success") {
//                                        alert("succes")
                                        window.location.reload();
                                    } else {
                                        console.log(data.msg);

                                    }
                                }).catch(ex => console.log(ex));
                    });
                });
                const editbuttons = document.querySelectorAll('.edit-product-btn');

                editbuttons.forEach(button => {
                    button.addEventListener('click', function () {
                        const id = this.getAttribute('data-product-id');
                        const form = document.createElement('form');
                        form.method = 'post';          // Set method to POST
                        form.action = '${base_url}seller/edit-product';     // Set target URL

                        // Create hidden input for product_id
                        const productIdInput = document.createElement('input');
                        productIdInput.type = 'hidden';
                        productIdInput.name = 'pid';
                        productIdInput.value = id;
                        form.appendChild(productIdInput);


                        // Append form to the document body
                        document.body.appendChild(form);
                        form.submit();

                    });
                });
            });
        </script>
    </layout:put>
</layout:extends>
