<%-- 
    Document   : approve-waiting
    Created on : Mar 14, 2025, 1:01:20 PM
    Author     : ROG STRIX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Waiting for Admin Approval</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
          <link rel="shortcut icon" href="${base_url}pro-assets/images/favicon.png" />
          <!-- Optional: Add custom CSS for minor adjustments -->
        <style>
            body {
                background-color: #f8f9fa; /* Light gray background */
            }
            .approval-container {
                max-width: 600px;
                margin: auto;
                padding: 20px;
                text-align: center;
                background: #fff; /* White background */
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            }
            .approval-icon {
                font-size: 4rem; /* Large icon */
                color: #ffc107; /* Yellow color for the icon */
                margin-bottom: 20px;
            }
            .btn-home {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <!-- Main Content -->
        <div class="container py-5">
            <div class="approval-container">
                <!-- Icon -->
                <div class="approval-icon">
                    <i class="bi bi-hourglass-split"></i> <!-- Bootstrap Icons: Hourglass icon -->
                </div>

                <!-- Heading -->
                <h1 class="mb-4">Waiting for Admin Approval</h1>

                <!-- Message -->
                <p class="lead mb-4">
                    Thank you for registering as a seller! Your account is currently under review by our admin team. <br>
                    You will receive an email notification once your account has been approved.
                </p>

                <!-- Back to Home Button -->
                <a href="${base_url}" class="btn btn-primary btn-lg btn-home"> <!-- Link to home page -->
                    <i class="bi bi-house-door"></i> Back to Home
                </a>
            </div>
        </div>

        <!-- Bootstrap JS (Optional, only needed if you use Bootstrap JS components) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
</html>
