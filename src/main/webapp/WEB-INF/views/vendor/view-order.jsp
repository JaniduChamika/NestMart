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
                            <h4 class="card-title">${state=='Active'?'Active Orders':''}${state=='Pending'?'Pending Orders':''}
                                ${state=='History'?'Orders History':''}</h4>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>
                                                Order ID
                                            </th>
                                            <th>
                                                Product Title
                                            </th>
                                            <th class="text-center">
                                                Quantity
                                            </th>
                                            <th>
                                                Customer
                                            </th>
                                            <th>
                                                Contact
                                            </th>

                                            <th>
                                                Address
                                            </th>
                                            <th class="text-center">

                                                <c:choose>
                                                    <c:when test="${state=='History'}">
                                                        Status
                                                    </c:when>

                                                    <c:otherwise>
                                                        Action
                                                    </c:otherwise>
                                                </c:choose>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${orders}">

                                            <tr>
                                                <td class="py-2 text-center">
                                                    ${item.id}
                                                </td>
                                                <td class="py-2">
                                                    <a href="${base_url}product?pid=${item.product.id}" target="_blank"> ${item.product.name}</a>
                                                </td>
                                                <td class="py-2 text-center">
                                                    ${item.quantity}
                                                </td>
                                                <td class="py-2 text-center">
                                                    ${item.order.user.firstName} ${item.order.user.lastName}
                                                </td>
                                                <td class="py-2">

                                                    ${item.order.user.mobileNo}
                                                </td>
                                                <td class="py-2">
                                                    ${item.order.orderAddress.addressNo}, ${item.order.orderAddress.addressLine1},${item.order.orderAddress.addressLine2}
                                                    ${empty item.order.orderAddress.addressLine2 ? '':','}${item.order.orderAddress.city.cityName},
                                                </td>
                                                <td class="py-2">
                                                    <c:choose>
                                                        <c:when test="${state=='Active'}">
                                                            <button class="btn btn-sm btn-success change-status-btn" 
                                                                    data-order-id="${item.id}" 
                                                                    data-new-status="Shipped" 
                                                                    type="button">
                                                                Make Shipping
                                                            </button>
                                                        </c:when>
                                                        <c:when test="${state=='Pending'}">
                                                            <button class="btn btn-sm btn-primary change-status-btn" 
                                                                    data-order-id="${item.id}" 
                                                                    data-new-status="Processing" 
                                                                    type="button">
                                                                Make Processing
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>

                                                            ${item.status}

                                                        </c:otherwise>
                                                    </c:choose>



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
                        const orderId = this.getAttribute('data-order-id');
                        const newStatus = this.getAttribute('data-new-status');

                        if (!confirm('Are you sure you want to change the status to ' + newStatus + '?')) {
                            return;
                        }
                        let data = new URLSearchParams();
                        data.append("orderId", orderId);
                        data.append("status", newStatus);
                        fetch('${base_url}seller/update-order-status', {
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
            });
        </script>
    </layout:put>
</layout:extends>
