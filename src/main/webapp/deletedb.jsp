<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/todo"
                           user="root" password="111"/>
        <sql:update dataSource="${dbsource}" var="count">
            DELETE FROM todolist WHERE id='${param.id}'
        </sql:update>
        <c:if test="${count>=1}">
            <font size="5" color="green"> Congratulation! Data was deleted successfully</font>
            <a href="display.jsp">Go Back</a>
        </c:if>

    </body>
</html>



