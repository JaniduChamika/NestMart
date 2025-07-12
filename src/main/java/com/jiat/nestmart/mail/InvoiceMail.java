/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.mail;

import com.jiat.nestmart.entity.OrderItem;
import com.jiat.nestmart.util.Env;
import io.rocketbase.mail.EmailTemplateBuilder;
import io.rocketbase.mail.model.HtmlTextEmail;
import java.util.List;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;

/**
 *
 * @author ROG STRIX
 */
public class InvoiceMail extends Mailable {

    private String to;
    private List<OrderItem> orderItems;

    public InvoiceMail(String to, List<OrderItem> orderItems) {
        this.to = to;
        this.orderItems = orderItems;
    }

    @Override
    public void buid(Message message) throws MessagingException {
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject("Your Invoice from Nest Mart");

        // Calculate grand total
        double grandTotal = 0;

        // Build HTML content with invoice table
        StringBuilder tableHtml = new StringBuilder();
        tableHtml.append("<table border='1' style='width: 100%; border-collapse: collapse; text-align: left; padding: 8px;'>")
                .append("<tr style='background-color: #f2f2f2;'>")
                .append("<th style='padding: 8px;'>Product</th>")
                .append("<th style='padding: 8px;'>Unit Price</th>")
                .append("<th style='padding: 8px;'>Quantity</th>")
                .append("<th style='padding: 8px;'>Total</th>")
                .append("</tr>");

        for (OrderItem item : orderItems) {
            tableHtml.append("<tr style='color:white;'>")
                    .append("<td style='padding: 8px;'>").append(item.getProduct().getName()).append("</td>")
                    .append("<td style='padding: 8px;'>$").append(String.format("%.2f", item.getProduct().getPrice())).append("</td>")
                    .append("<td style='padding: 8px;'>").append(item.getQuantity()).append("</td>")
                    .append("<td style='padding: 8px;'>$").append(String.format("%.2f", item.getProduct().getPrice() * item.getQuantity())).append("</td>")
                    .append("</tr>");
            grandTotal = grandTotal + (item.getProduct().getPrice() * item.getQuantity());
        }

        tableHtml.append("<tr style='font-weight: bold;color:white;'>")
                .append("<td colspan='3' style='padding: 8px; text-align: right;'>Grand Total:</td>")
                .append("<td style='padding: 8px;'>$").append(String.format("%.2f", grandTotal)).append("</td>")
                .append("</tr>")
                .append("</table>");

        // Use EmailTemplateConfigBuilder to construct the email
        HtmlTextEmail content = getEmailTemplateBuilder()
                .header()
                .logo("").logoHeight(41)
                .and()
                .text("Hello, " + to).h1().center().and()
                .text("Thank you for your purchase! Below is your invoice.").center().and()
                .html(tableHtml.toString()).and() // Insert the invoice table
                .text("If you have any questions, feel free to contact us.").center().and()
                .button("View Order Details", Env.get("app.base_url") + "/order").blue().and()
                .copyright("Nest Mart").url("http://localhost:8080/netsmart/").suffix(". All rights reserved.")
                .build();
        message.setContent(content.getHtml(), "text/html");
    }

}
