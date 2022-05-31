<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link  rel="stylesheet" href="${PageContext.request.contextPath}/css/login.css" >
    <script type="text/javascript" src="${PageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <title>Login</title>
</head>
<body>

    <div>

        <form id="formlogin" action="/login" method="post">

            <h3>Đăng nhập</h3>

            <div id="divtk" class="divchung">
                <label id="tendn" class="inputchung">Tên đăng nhập </label> <input id="name" type="text" name="name">
            </div>

            <div id="dvimk" class="divchung">
                <label id="matkhau" class="inputchung">Mật khẩu </label> <input id="password" type="text" name="password">
            </div>
            <div id="btn">
                <button class="btnbt" type="button" onclick="login()"> Đăng nhập</button>
            </div>


        </form>

    </div>

</body>

<script>
    function login() {
        let name = $("#name").val()
        let password = $("#password").val()
        $.ajax({
            url:'/login',
            type:'post',
            dataType:'text',
            data:{
                name:name,
                password:password
            },
            success:function (data){
                window.location.href = "/topics"
            },
            error:function () {
                // alert("Login that bai");
            }
        });
    }



</script>

</html>