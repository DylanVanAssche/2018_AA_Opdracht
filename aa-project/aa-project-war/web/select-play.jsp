<%-- 
    Document   : select-play.jsp
    Created on : Oct 29, 2018, 6:45:35 PM
    Author     : Dylan Van Assche
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- date formatting -->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value='css/w3.css' />">
        <link rel="stylesheet" href="<c:url value='css/style.css' />">
        <title>Play Selection</title>
    </head>
    <body>
        <!-- Menu -->
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div class="w3-content w3-padding container">

            <!-- Project Section -->
            <div class="w3-container w3-padding-32">
                <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Select an upcoming play to continue</h3>
                <form class="w3-container w3-card-4" method="post" action="<c:url value='order' />">
                    <c:forEach var = "p" items = "${sessionScope.upcomingPlays}">
                        <p>
                            <input class="w3-radio" type="radio" name="selectedPlayId" required value="${p.getId()}">
                            <label>
                                <c:out value="${p.getName()}"/>
                                (<fmt:formatDate value="${p.getDate()}" pattern="HH:mm dd-MM-yyyy" />)
                                <c:out value="${p.getBasicPrice()}"/> &euro; 
                                + <c:out value="${p.getRankFee()}"/> &euro;/rank
                            </label>
                        </p>
                    </c:forEach>
                    <input type="hidden" name="nextOrderState" value="selectSeat" />
                    <button class="w3-button w3-black w3-section" type="submit">
                        <i class="fa fa-paper-plane"></i> SELECT PLAY
                    </button>
                </form> 
            </div>
        </div>
    </body>
</html>
