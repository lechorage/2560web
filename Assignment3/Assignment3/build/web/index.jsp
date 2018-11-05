<%@ page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="style.css">
        <script type="text/javascript">
            function check() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                if (username == "") {
                    alert("Invalid username!");
                    return false;
                }
                if (password == "") {
                    alert("Invalid password!");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <div class="wrapper">
            <div class="title"><span>Login</span></div>
            <br /><br /><br />
            <form action="${pageContext.request.contextPath }/Login" method="post" onsubmit="return check()">
                <input type="text"  id="username" placeholder="Username" name="username" />
                <input type="password"  id="password" placeholder="Password" name="password" />
                <input type="submit" value="login" class="btn"/>
                <br />
                <a href="${pageContext.request.contextPath }/register.jsp">Click here to register</a>
                <br />
                <font color="red">${message}</font>
            </form>
        </div>
    </body>
</html>
