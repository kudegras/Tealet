<%-- 
    Document   : error404
    Created on : 11 9, 22, 5:20:04 PM
    Author     : v
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error: 404</title>
        
        <link rel="shortcut icon" href="./images/TealetIcon.png">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1 class="promo" align="center">Page Not Found! :'(</h1>
        <p align="center">How did it come to this? Oh, well. <br/>
           You're more than welcome to return back to our page!</p>
        <form action="ErrorRedirectHome" method="GET">
            <center>
                <input type="submit" value="HOME" class="button">
            </center>
        </form>
    </body>
</html>
