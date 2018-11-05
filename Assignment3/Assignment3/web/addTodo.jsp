<%@ page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Event to TodoList</title>
        <link rel="stylesheet" href="style.css">
        <script type="text/javascript">
            function check() {
                var todo = document.getElementById("todo").value;
                if (todo == "") {
                    alert("Invalid todo!");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <div class="wrapper">
            <div class="title"><span>Add Event to TodoList</span></div>
            <br /><br /><br /><br />
            <form  action="${pageContext.request.contextPath }/AddTodo" method="post" onsubmit="return check()">
                <input type="text"  id="todo" placeholder="Todo" name="todo"/>
                <br /><br />
                <input type="submit" value="add" class="btn"/>
            </form>
        </div>
    </body>
</html>
