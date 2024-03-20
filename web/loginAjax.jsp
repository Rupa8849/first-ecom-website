<%-- 
    Document   : loginAjax
    Created on : Feb 28, 2024, 1:48:36 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%--<c:if test="${process eq 'sendOtp'}">
    <% String email = (String) session.getAttribute("sessionEmail");
    %>
</c:if>--%>

<c:if test="${process eq 'insertProfileData'}">
    <input type="text" id="result" value="${result}">
</c:if>

<c:if test="${process eq 'verifyOtp'}">
    <%
        ResultSet rs = (ResultSet) request.getAttribute("result");
        while(rs.next()){
    %>
    <div><%= rs.getString("name")%></div>
    <%
        }
    %>
</c:if>
    
