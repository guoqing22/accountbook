<%--
  Created by IntelliJ IDEA.
  User: hanhuide
  Date: 2017/9/23
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <base href="<%=basePath%>">
    <%--<script type="text/javascript" src="js/jquery-1.7.1.js"></script>--%>
    <title>用户列表</title>

</head>

<body>
<%--<h6><a href="<%=basePath%>/user_t/hhd/insert">添加用户</a></h6>--%>
<table border="1">
    <tbody>
    <c:if test="${!empty userList }">
        <c:forEach items="${userList}" var="user">
            <tr>
                <td>${user.username }</td>
                <td>${user.password }</td>
                <td>${user.birthday }</td>
                <td>${user.name }</td>
                <td>${user.sex}</td>
                <td>${user.useramount}</td>
                <td>${user.userinfo}</td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
</body>
</html>
