<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>JINSERT Operation</title>
    </head>
    <body>
        <c:if test="${empty param.name or empty param.category}">
            <c:redirect url="insert.jsp">
                <c:param name="errMsg" value="Please enter new task and category"/>
            </c:redirect>
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/todo"
                           user="root" password="111"/>
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO todolist(name, category, complete) VALUES (?,?,?);
            <sql:param value="${param.name}"/>
            <sql:param value="${param.category}"/>
            <sql:param value="${param.complete}"/>

        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color="green"> Congratulation! Data was inserted successfully</font>

            <c:redirect url="insert.jsp">
                <c:param name="susMsg" value="Congatulation! Data was inserted succesfully"/>
            </c:redirect>
        </c:if>

    </body>
</html>



