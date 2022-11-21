<%-- 
    Document   : menu.jsp
    Created on : Nov 7, 2022, 8:39:40 PM
    Author     : maxim
--%>

<%@page import="service.MilkteaService"%>
<%@page import="java.util.List"%>
<%@page import="model.Milktea"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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
            <h1 class="title">Our Flavors!</h1>
            <h2>The best milk tea trinity</h2>
            
            <%
                MilkteaService milkteaService = (MilkteaService) getServletContext().getAttribute("updatedMilkteaService");
                List<Milktea> milkteas = milkteaService.getMilkteas();
            %>
            
            <table border="1" style="width: 100%" height="100%">
		<thead align="center">
			<tr>
				<th>Flavor Image</th>
				<th>Flavor</th>
				<th>Price</th>
                                <th>Order Here</th>
			</tr>
		</thead>
		<tbody>
			<% 
                            for (Milktea milktea : milkteas) {
                                out.print("<tr>");
                                out.print("<td> <img src=\"" + milktea.getImagePath() + "\" alt=\"milk tea\" style=\"width:100px;height:100px;\" </td>");
                                out.print("<td class=\"promo\">" + milktea.getName() + "</td>");
                                out.print("<td>" + milktea.getPrice() + "</td>");
                                out.print("<td> <a href=\"SelectMilkTea.do?flavor=" + milktea.getName() + "\"> <button>Buy</button> </a> </td>");
                                out.print("</tr>");
                            }
			%>
		</tbody>

            </table>
            
            <!-- Current Promo -->
            <br/><br/>
            <form action="ImageRedirect.do" method="GET">
                <h4 class="orange" align="center">Check out our promos!</h4>
                For more information: <input class="button" type="submit" value="Click Here">
            </form>
                
            <!-- Download Option -->
            <h4>Download our menu!</h4>
            Menu: <a href="download"><u>Tealet Menu</u></a>
            
        </div>
        
        <footer>
            <h4 class="orange">Contact us!</h4>
            <h5>email: <% out.print(getServletContext().getInitParameter("emailAddress")); %></h5>
            <h5>hotline: <% out.print(getServletContext().getInitParameter("hotlineNumber")); %></h5>
            <a href="https://github.com/kudegras/Tealet" target="_blank">
            <img src="./images/github.svg" alt="github icon" width="30px" height="30px">
            </a>
        </footer>
    </body>
</html>
