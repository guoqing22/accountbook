<%@ page import="java.net.URL" %><%--
  Created by IntelliJ IDEA.
  User: qing
  Date: 2017/12/10
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<html>
<head>
   <%--<script type="text/javascript">
var msg = <%= request.getAttribute("error")%>
if(msg.equals("用户名或密码错误")){
    setTimeout("javascript:location.href='<%= basePath%>login.jsp>'", 3000);
}
    /*switch(msg){
        case "用户名或密码错误":
            setTimeout("javascript:location.href='<%= basePath%>login.jsp>'", 3000);
            break;
        default:
            setTimeout("javascript:location.href='<%= basePath%>login.jsp>'", 300000000);
    }*/
    </script>--%>

</head>
<body>
<div align="center">
    <br/>
    <br/>
    <br/>
    <h4>${error}</h4>
    <c:choose>
        <c:when test="${error.equals('用户名或密码错误')}">
           <h4><a href="<%= basePath%>login.jsp" >立即跳转</a></h4>
        </c:when>
        <%--<c:otherwise>
            not 11 、 12 、 13
        </c:otherwise>--%>
    </c:choose>


</div>

</body>
</html>