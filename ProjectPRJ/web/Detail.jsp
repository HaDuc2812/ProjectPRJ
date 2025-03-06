<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Wine Details</title>
        <style>
            /* Global Styles */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f8f8;
            }
            header, footer {
                background-color: #333;
                color: #fff;
                padding: 15px;
                text-align: center;
            }
            /* Container for sidebar and detail content */
            .container {
                display: flex;
                max-width: 1200px;
                margin: 20px auto;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            /* Sidebar Styles (same as Home.jsp) */
            .sidebar {
                width: 200px;
                background-color: #f4f4f4;
                padding: 15px;
            }
            .sidebar h3 {
                margin-top: 0;
            }
            .sidebar a {
                display: block;
                padding: 8px;
                text-decoration: none;
                color: #333;
                margin-bottom: 5px;
            }
            .sidebar a.active {
                background-color: #333;
                color: #fff;
            }
            /* Detail Content Styles */
            .detail-content {
                flex: 1;
                padding: 20px;
            }
            .detail-content h1 {
                margin-top: 0;
            }
            .detail-content p {
                margin: 10px 0;
                line-height: 1.6;
            }
            /* Back Link Styles */
            .back-link {
                text-align: center;
                margin: 20px;
            }
            .back-link a {
                text-decoration: none;
                color: #333;
                border: 1px solid #333;
                padding: 8px 15px;
                border-radius: 5px;
            }
            .back-link a:hover {
                background-color: #333;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <!-- Include the Menu/Header -->
        <jsp:include page="Menu.jsp"></jsp:include>

            <!-- Main Container: Sidebar + Detail Content -->
            <div class="container">
                <!-- Sidebar: Category Navigation (same as Home.jsp) -->
                <div class="sidebar">
                    <h3>Categories</h3>
                <c:forEach items="${listC}" var="o">
                    <li class="list-group-item text-white ${tag == o.cid ? 'active' : ''}">
                        <a href="${pageContext.request.contextPath}/category?cid=${o.cid}">
                            ${o.cname}
                        </a>
                    </li>
                </c:forEach>
            </div>

            <!-- Detail Content: Product Details -->
            <div class="detail-content">
                <h1>${detail.name}</h1>
                <p><strong>Price:</strong> <fmt:formatNumber value="${detail.price}" type="currency" /></p>
                <p><strong>Description:</strong> ${detail.description}</p>
                <p><strong>Country:</strong> ${detail.country}</p>
                <p><strong>Year:</strong> ${detail.year}</p>
            </div>
        </div>

        <!-- Back Link -->
        <div class="back-link">
            <a href="${pageContext.request.contextPath}/home">Back to Home</a>
        </div>

        <!-- Include the Footer -->
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
