<%-- 
    Document   : contactDetails
    Created on : Nov 7, 2022, 9:35:59 PM
    Author     : maxim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        
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
        <div class="common-container">
            <h1 class="title">Contact Us</h1>
            <form action="mailto:tealet@milktea.com" method="GET">
                <label>
                    First Name
                    <input name="firstName" type="text" maxlength="20"/>
                </label>
                <br>
                <label>
                    Last Name
                    <input name="lastName" type="text" maxlength="20" />
                </label>
                <br/>
                <label>
                    Email
                    <input name="email" type="email" maxlength="30" />
                </label>
                <br/>
                <label>
                    What is this message about?
                    <select name="messageContent">
                        <option selected="selected">-Select-</option>
                        <option value="storeOperation">Store Operation</option>
                        <option value="request">Catering Request</option>
                        <option value="collaboration">Collaboration</option>
                        <option value="others">Others...</option>
                    </select>
                </label>
                <br/>
                <label>
                    Location
                    <input name="location" type="text" maxlength="30" />
                </label>
                <br/>
                <label>
                    Message
                    <textarea name="message" rows="10" cols="30"></textarea>
                </label>
                <br/>
                <input type="submit" class="button" align="right"/>
            </form>
        </div>
        <footer>    
            <h4 class="orange">Our Contact Details:</h4>
            <h5>email: <% out.print(getServletContext().getInitParameter("emailAddress")); %></h5>
            <h5>hotline: <% out.print(getServletContext().getInitParameter("hotlineNumber")); %></h5>
            <a href="https://github.com/kudegras/Tealet" target="_blank">
            <img src="./images/github.svg" alt="github icon" width="30px" height="30px">
            </a>
        </footer>
    </body>
</html>
