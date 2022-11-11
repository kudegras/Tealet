<%-- 
    Document   : order
    Created on : Nov 8, 2022, 9:32:30 PM
    Author     : maxim
--%>

<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Receipt</title>
        
        <link rel="shortcut icon" href="./images/TealetIcon.png">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
            <div class="name">Tealet</div>
            
            <ul class="right-links">
                <li><a class="links" href="./index.jsp">Home</a></li>
                <li><a class="links" href="./menu">Menu</a></li>
                <li><a class="links" href="./contactDetails.jsp">Contact Us</a></li>
            </ul>
        </header>
        
        <%
            Order newOrder = (Order) request.getAttribute("newOrder");
        %>
        
        <div class="common-container">
            <h3 class="title">You have ordered:</h3>
            <p>Flavor: <% out.print(newOrder.getFlavor()); %></p>
            <p>Price: <% out.print("PHP " + newOrder.getPrice()); %></p>
            <p>Size: <% out.print(newOrder.getSize()); %></p>
            <p>Quantity: <% out.print(newOrder.getQuantity()); %></p>
            <p>Coupon Code: <% out.print(newOrder.getCouponCode()); %></p>
            <p>Discount: <% out.print("- PHP " + (newOrder.getDiscount() * newOrder.getQuantity())); %></p>
            <p>Total: <strong><% out.print("PHP " + newOrder.getTotal()); %></strong></p>
        </div>
        
        <footer>
            <h4 class="orange">Contact us!</h4>
            <h5>email: <% out.print(getServletContext().getInitParameter("emailAddress")); %></h5>
            <h5>hotline: <% out.print(getServletContext().getInitParameter("hotlineNumber")); %></h5
        </footer>
    </body>
</html>
