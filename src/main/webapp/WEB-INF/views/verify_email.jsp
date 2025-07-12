<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout"%>
<layout:extends name="base">
    <layout:put block="contents">
        <div class="app-content">
            <!--====== Section 1 ======-->
            <div class="py-5"> <!-- Bootstrap padding utility: py-5 (padding-top and padding-bottom) -->

                <!--====== Section Content ======-->
                <div class="container">
                    <div class="row justify-content-center"> <!-- Center the content horizontally -->
                        <div class="col-lg-8 col-md-10 col-sm-12"> <!-- Responsive column sizing -->
                            <div class="text-center"> <!-- Center-align text -->
                                <h2 class="mb-4">Verify your email</h2> <!-- Bootstrap margin utility: mb-4 (margin-bottom) -->
                                <p class="lead mb-4"> <!-- Bootstrap lead class for larger text -->
                                    We've sent an email to <b>${sessionScope.user.email}</b> to verify your email address and activate your account. <br>The link in the email will expire in 24 hours.
                                </p>
                                <button class="btn btn-primary btn-lg" id="sendbutton" onclick="resendToken()">Resend Email</button> <!-- Bootstrap button classes -->
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section Content ======-->
            </div>
        </div>
    </layout:put>   

    <layout:put block="scripts" type="REPLACE">
        <script type="text/javascript">
            function resendToken() {

                const resendButton = document.querySelector('#sendbutton');
                resendButton.innerHTML = 'Sending...';
                resendButton.disabled = true;

                fetch("send-verification", {
                    method: "GET",
                    headers: {"Content-Type": "application/x-www-form-urlencoded"}
                }).then(response => response.json())
                        .then(response => {
                            if (response.msg == "sucess") {
                                alert('Verification email sent successfully!');
                                resendButton.innerHTML = 'Resend Email';
                                resendButton.disabled = false;
                            } else {
                                alert('Failed to send verification email. Please try again.');
                                resendButton.innerHTML = 'Resend Email';
                                resendButton.disabled = false;
                            }
                        }).catch(ex => console.log(ex));
            }
        </script>
    </layout:put>
</layout:extends>