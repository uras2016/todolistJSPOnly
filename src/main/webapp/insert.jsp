<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>TODO LIST</title>
    </head>
    <body>
        <form action="insertdb.jsp" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Add task</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>Task Name</label></td>
                        <td><input type="text" name="name"/></td>
                    </tr>
                    <tr>
                        <td><label>Category</label></td>
                        <td><input type="text" name="category"/></td>
                    </tr>
                    <tr>
                        <td><label>Complete</label></td>
                        <td><input type="text" name="complete"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Save"/></td>
                        <td><input type="reset" name="Reset"/></td>
                    </tr>
                </tbody>
            </table>
            </form>
            <font color="red"><c:if test="${not empty param.errMsg}">
                <c:out value="${param.errMsg}" />
                <a href="index.jsp">Go back</a>
            </c:if> </font>

            <font color="green"><c:if test="${not empty param.susMsg}">
            <c:out value="${param.errMsg}" />
            <a href="index.jsp">Go back</a>
            </c:if> </font>
    </body>
</html>



