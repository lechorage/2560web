<%@page import="bean.User"%>
<%@page language="java" import="bean.Todo"%>
<%@page language="java" import="java.util.ArrayList"%>
<%@page language="java" import="dao.TodoDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Todo List</title>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <jsp:useBean id="user" class="bean.User" scope="session"></jsp:useBean>  
        <%
            TodoDao dao = new TodoDao();
            ArrayList<Todo> todos = dao.getTodo(user.getId());
        %>
        <div class="wrapper">
            <div class="title"><span><jsp:getProperty property="username" name="user"/>'s Todo List</span></div>
            <div>
                <ol class="rounded-list">
                    <%
                        for (Todo todo : todos) {
                    %>
                    <li style="width: 300px; margin: auto;">
                        <%
                            if (todo.isComplete()) {
                        %>
                        <input style="float:right; margin: 7px -22px 0 0;" type="checkbox" checked="checked" onchange ="<% dao.changeStatus(todo.getId());%>">
                        <%
                        } else {
                        %>
                        <input style="float:right; margin: 7px -22px 0 0;" type="checkbox" onchange ="<% dao.changeStatus(todo.getId());%>">
                        <% }%>
                        <a><%=todo.getTodo()%></a>
                    </li>
                    <% }%>
                </ol>
            </div>
            <form action="${pageContext.request.contextPath }/addTodo.jsp" method="post">
                <input type="submit" value="Add New Event" class="btn"/>
            </form>
        </div>

    </body>
</html>
