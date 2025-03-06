<%-- 
    Document   : Container
    Created on : Mar 5, 2025, 11:08:08 AM
    Author     : HA DUC
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="sidebar">
    <h3>Categories</h3>
    <ul class="list-group category-block">
        <c:forEach items="${listC}" var="o">
            <li class="list-group-item text-white ${tag == o.cid ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/category?cid=${o.cid}">
                    ${o.cname}
                </a>
            </li>
        </c:forEach>
    </ul>
</div>
