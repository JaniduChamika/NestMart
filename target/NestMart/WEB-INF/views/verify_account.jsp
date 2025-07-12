<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="contents">
        <!--====== App Content ======-->
        <div class="app-content">

            <!--====== Section 1 ======-->
            <div class="py-5"> 
                <div class="container">
                    <div class="row justify-content-center"> <!-- Center the content horizontally -->
                        <div class="col-lg-8 col-md-10 col-sm-12"> <!-- Responsive column sizing -->
                            <div class="text-center"> <!-- Center-align text -->
                                <h2 class="mb-4">Account Disabled</h2> <!-- Bootstrap margin utility: mb-4 (margin-bottom) -->
                                <p class="lead mb-4"> <!-- Bootstrap lead class for larger text -->
                                    Your account has been disabled. If you have any questions or concerns, please contact the system administrator at <b>support@nestmart.com</b>.
                                </p>
                                <a href="mailto:support@nestmart.com" class="btn btn-primary btn-lg">Contact Support</a> <!-- Bootstrap button classes -->
                            </div>
                        </div>
                    </div>
                </div>
               
            </div>

        </div>
      
    </layout:put>
</layout:extends>