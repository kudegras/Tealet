<%-- 
    Document   : result
    Created on : Nov 8, 2022, 1:31:09 PM
    Author     : maxim
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Milktea"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tealet: Details</title>
        
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
        
        <h1 class="title" align="center">Your Selected Milk Tea</h1>
        <h2 class="promo">Use code "sirLawrencePogi" for 10% discount!</h2>
        <%
            Milktea mt = (Milktea) request.getAttribute("milktea");
            out.print("<div align=\"center\"><br><img src=\"" + mt.getImagePath() + "\" alt=\"milk tea\" style=\"width:250px;height:250px;\"</div>");
        %>
        
        <p>    
            <br/><br/>
            Selected: <strong><% out.print(mt.getName()); %></strong> <br/>
            Base Price: <strong><% out.print(mt.getPrice()); %></strong> <br/>
            Description: <strong><% out.print(mt.getDescription()); %></strong> <br/>
            <% if (mt.getFreebie() != null) out.print("Freebie: " + mt.getFreebie() + " <br/>");%>
        </p>
                
        <div class="common-container">
            <form action="ProcessOrder.do" method="POST">
                <p>Size</p>
                <input type="hidden" name="flavor" value="<%out.print(mt.getName());%>">
                <input type="hidden" name="price" value="<%out.print(mt.getPrice());%>">
                
                <input type="radio" id="small" name="size" value="Small">
                <label for="small">Small</label><br>
                <input type="radio" id="medium" name="size" value="Medium">
                <label for="medium">Medium (+ PHP 20)</label><br>
                <input type="radio" id="large" name="size" value="Large">
                <label for="large">Large (+ PHP 35)</label><br><br>
                
                <label for="quantity">Quantity: </label>
                <input type="number" id="quantity" name="quantity" min="0"><br><br>
                
                <label for="coupon">Coupon: </label>
                <input type="text" id="coupon" name="coupon"><br><br>
                
                <input class="button" type="submit" value="Order" align="center"/>
            </form>
        </div>
        
        <footer>
            <h4 class="orange">Contact us!</h4>
            <h5>email: <% out.print(getServletContext().getInitParameter("emailAddress")); %></h5>
            <h5>hotline: <% out.print(getServletContext().getInitParameter("hotlineNumber")); %></h5
        </footer>
    </body>
</html>
