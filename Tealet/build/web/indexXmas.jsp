<%-- 
    Document   : index
    Created on : Nov 7, 2022, 8:36:10 PM
    Author     : maxim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tealet</title>
        
        <link rel="shortcut icon" href="./images/TealetIcon.png">
        <link rel="stylesheet" href="style.css">
    </head>
    <body class="xmas">
        <!-- Links for respective JSPs-->
        <header>
            <div class="name">Tealet</div>
            
            <ul class="right-links">
                <li><a class="links" href="./index.jsp">Home</a></li>
                <li><a class="links" href="./menu">Menu</a></li>
                <li><a class="links" href="./contactDetails.jsp">Contact Us</a></li>
            </ul>
        </header>
        
        <div class="index-container">
            <h1 class="title">Welcome to Tealet!</h1>
            <h2>Christmas SZN</h2>
            <img src="images/TealetLogo.png" alt="TealetLogo">
            <h3 class="promo">Free metal straw for every order of Wintermelon tea</h3>
            <h3>New Muscovado flavor! Only available in December</h3>
        </div>
        
        <footer>
            <!-- ServletContext -->
            <h4 class="orange">Contact us!</h4>
            <h5>email: <% out.print(getServletContext().getInitParameter("emailAddress")); %></h5>
            <h5>hotline: <% out.print(getServletContext().getInitParameter("hotlineNumber")); %></h5>
        </footer>
    </body>
</html>