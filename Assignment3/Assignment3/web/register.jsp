<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="style.css">
        <script type="text/javascript">
            function check() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                var passwordtwo = document.getElementById("passwordtwo").value;
                if (username === "") {
                    alert("Invalid username!");
                    return false;
                }
                if (password === "") {
                    alert("Invalid password!");
                    return false;
                }
                if (passwordtwo === "") {
                    alert("Please re-enter password!");
                    return false;
                }
                if (password !== passwordtwo) {
                    alert("Passwords don't match!");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <div class="wrapper">
            <div class="title"><span>Register</span></div>
            <br /><br />
            <form class="form-signin" action="${pageContext.request.contextPath }/Register" method="post" onsubmit="return check()">
                <input type="text"  id="username" placeholder="Username" name="username" />
                <input type="password"  id="password" placeholder="Password" name="password" />
                <input type="password"id="passwordtwo" placeholder="Confirm Password" name="passwordtwo" />
                <input type="submit" value="register" class="btn"/>
                <br />
                <a href="${pageContext.request.contextPath }/index.jsp">Click here to login</a>
                <br />
                <font color="red">${register}</font>
            </form>
        </div>
    </body>
</html>
