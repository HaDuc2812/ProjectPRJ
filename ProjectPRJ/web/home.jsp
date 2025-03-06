<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wine Shop Home</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header, footer {
            background-color: #333;
            color: #fff;
            padding: 15px;
            text-align: center;
        }
        /* Container */
        .container {
            display: flex;
            padding: 20px;
        }
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
        .main {
            flex: 1;
            padding: 15px;
        }
        /* Product Cards */
        .ouct-card {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 15px;
            box-shadow: 2px 2px 5px rgba(0,0,0,0.1);
        }
        .ouct-card img {
            max-width: 100%;
            height: auto;
        }
        /* Footer */
        footer {
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- Include Header/Menu -->
    <jsp:include page="Menu.jsp"></jsp:include>
    
    <!-- Main Container: Sidebar + Main Content -->
    <div class="container">
        <!-- Sidebar: Category Tabs -->
        <div class="sidebar">
            <jsp:include page="Left.jsp"></jsp:include>
        </div>
        
        <!-- Main Content: Product Cards -->
        <div class="main">
            <h2>Products</h2>
            <c:forEach var="o" items="${listP}">
                <div class="ouct-card">
                    <img src="" alt="${o.name}" />
                    <h4 class="card-title show_txt">
                        <a href="detail?wine_id=${o.wine_id}" title="view product">${o.name}</a>
                    </h4>
                    <p>${o.description}</p>
                    <p>
                        <strong>Price:</strong>
                        <fmt:formatNumber value="${o.price}" type="currency"/>
                    </p>
                    <p>
                        <strong>Country:</strong> ${o.country} |
                        <strong>Year:</strong> ${o.year}
                    </p>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <!-- Include Footer -->
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
