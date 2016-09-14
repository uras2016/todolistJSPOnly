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
<sql:query dataSource="${dbsource}" var="result">
    SELECT * FROM todolist WHERE id=?;
    <sql:param value="${param.id}"/>
</sql:query>

<form action="updatedb.jsp" method="post">
    <table border="1" width=30%">
        <caption>Update task</caption>
        <tr>
            <th colspan="2">Task name</th>
            <th>Task category</th>
            <th>Complete</th>

        </tr>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td><input type="hidden" value="${param.id}" name="id"/>
                <td><input type="text" value="${param.name}" name="name"/>
                <td><input type="text" value="${param.category}" name="category"/>
                <td><input type="text" value="${param.complete}" name="complete"/>
                <td><input type="submit" value="Update"/></td>
            </tr>
                </c:forEach>
    </table>
    <a href="index.jsp">Go Home</a>
</form>
</body>
</html>



