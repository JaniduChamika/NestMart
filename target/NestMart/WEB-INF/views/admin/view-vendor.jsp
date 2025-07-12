<%-- 
    Document   : view-product
    Created on : Feb 3, 2025, 10:44:16 PM
    Author     : ROG STRIX
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%> 
<layout:extends name="admin">
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
                            <h4 class="card-title">${source=='pendingVendor'?'Seller Requests':''}
                                ${source=='activeVendor'?'Active Sellers':''}
                                ${source=='BlockVendor'?'Blocked Sellers':''}</h4>

                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">
                                                Business Name
                                            </th>
                                            <th>
                                                Business Email
                                            </th>
                                            <th>
                                                Owner Email
                                            </th>
                                            <th>
                                                Business  Contact
                                            </th>
                                            <th class="text-center">
                                                Registered At
                                            </th>
                                            <th>
                                                Status
                                            </th>
                                            <th>
                                                Action
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="vendorItem" items="${vendors}">
                                            <c:if test="${vendorItem.id!=user.id}">
                                                <tr>
                                                    <td class="py-2 text-center">
                                                        ${vendorItem.businessName}   
                                                    </td>
                                                    <td class="py-2">
                                                        ${vendorItem.businessEmail}
                                                    </td>
                                                    <td>
                                                        ${vendorItem.user.email}
                                                    </td>
                                                    <td class="py-2">
                                                        ${vendorItem.businessContact}
                                                    </td>
                                                    <td class="py-2 text-center">
                                                        ${vendorItem.createdAt}
                                                    </td>
                                                    <td class="py-2">
                                                        ${vendorItem.status}

                                                    </td>
                                                    <td class="py-2">
                                                        <c:choose>
                                                            <c:when test="${vendorItem.status=='inactive'}">
                                                                <button type="button" class="btn btn-success p-2 change-status-btn" data-product-id="${vendorItem.id}"  data-new-status="active"><i class="mdi mdi-check-circle"></i></button>

                                                            </c:when>
                                                            <c:when test="${vendorItem.status=='active'}">
                                                                <button type="button" class="btn btn-danger p-2 change-status-btn" data-product-id="${vendorItem.id}" data-new-status="blocked"><i class="mdi mdi-block-helper"></i></button>

                                                            </c:when>
                                                            <c:otherwise>
                                                                <button type="button" class="btn btn-success p-2 change-status-btn" data-product-id="${vendorItem.id}" data-new-status="active"><i class="mdi mdi-lock-open"></i></button>

                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:if>
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
                        const newStatus = this.getAttribute('data-new-status');
                        let data = new URLSearchParams();
                        data.append("userid", id);
                        data.append("newStatus", newStatus);

                        fetch('${base_url}admin/change-vendro-state', {
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
