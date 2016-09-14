<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SELECT Operation</title>
    <script>
        function confirmGo(m, u) {
            if (confirm(m)) {
                window.location = u;
            }

        }
    </script>

</head>
<body>


    <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/todo"
                   user="root" password="111"/>
    <sql:query dataSource="${dbsource}" var="result">
        SELECT * FROM todolist;
    </sql:query>

    <center>
        <form>
            <table border="1" width="40%">
                <caption>TODO LIST</caption>
                <tr>
                    <th>Task id</th>
                    <th>Task name</th>
                    <th>Task category</th>
                    <th>Complete</th>
                    <th colspan="2">Action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.id}"/></td>
                        <td><c:out value="${row.name}"/></td>
                        <td><c:out value="${row.category}"/></td>
                        <td><c:out value="${row.complete}"/></td>
                        <td><a href="update.jsp?id=<c:out value="${row.id}"/>">Update</a></td>

                        <td><a href="javascript:confirmGo('Are you sure to delete this record?',
                         'deletedb.jsp?id=<c:out value="${row.id}"/>')">Delete</a> </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
        <a href="index.jsp">Go Home</a>

    </center>
</body>
</html>
