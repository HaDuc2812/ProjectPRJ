<%-- 
    Document   : Menu
    Created on : Mar 5, 2025, 11:03:48 AM
    Author     : HA DUC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Header Section -->
        <header>
            <h1>Wine Shop</h1>
            <div class="search-login">
                <!-- Search Bar -->
                <div class="search-bar">
                    <form action="${pageContext.request.contextPath}/search" method="get">
                        <input type="text" name="keyword" placeholder="Search wines...">
                        <input type="submit" value="Search">
                    </form>
                </div>
                <!-- Login Form -->
                <div class="login-form">
                    <form action="${pageContext.request.contextPath}/login" method="post">
                        <input type="text" name="username" placeholder="Username">
                        <input type="password" name="password" placeholder="Password">
                        <input type="submit" value="Login">
                    </form>
                </div>
            </div>
        </header>
