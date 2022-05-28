<%@ page import="com.example.forum.entity.User" %>
<!doctype html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>New Topic</title>
    <% String id  = (String) request.getAttribute("id");
    User user = (User) session.getAttribute("User");%>
</head>
<body>
<p style="text-align: right;">Chao | <%=user.getUsername()%><a href="/logout">  Thoat</a></p>

    <label> Tieu De</label>
    <input type="text" name="title" id="title">
    <br>
    <label> Noi Dung </label>
    <input type="text" name="content" id="content" height="100px">

    <button type="button" onclick="createTopic()">Goi</button>
    <a href="/topics"><button>Huy bo</button></a>


</body>

<script>
    function createTopic() {
        let title = $("#title").val()
        let content = $("#content").val()
        let id = <%=id%>;
        $.ajax({
            url:'/newReplyTopic',
            type:'post',
            dataType:'text',
            data:{
                id:id,
                title:title,
                content:content
            },
            success:function (data){
                window.location.href = "/topic/<%=id%>"
            },
            error:function () {
                 alert("Thêm không thành công");
            }
        });
    }



</script>
<script type="text/javascript" src="${PageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</html>