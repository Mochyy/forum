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

            <h3>Dang nhap</h3>

            <label id="tendn">Ten dang nhap: </label> <input id="name" type="text" name="name">
            <br>
            <label id="matkhau">Mat khau: </label> <input id="password" type="text" name="password">

            <button type="button" onclick="login()"> Dang nhap</button>

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