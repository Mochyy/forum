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
    String title = (String) request.getAttribute("title");
    User user = (User) session.getAttribute("User");%>
</head>
<body>
<p style="text-align: right;">Chao | <%=user.getUsername()%><a href="/logout">  Thoat</a></p>

<label style="font-weight: bold"> Tiêu Đề </label> <br>
<input type="text" name="title" style="width: 500px;" value="Re:<%=title%>" id="title">
<br>
<label style="font-weight: bold;"> Nội Dung </label> <br>
<textarea type="text" rows="7" cols="66" name="content" style="overflow-y: scroll" id="content" height="100px"></textarea>

<div>
    <button type="button" onclick="createTopic()">Gởi</button>
    <a href="/topic/<%=id%>"><button>Hủy bỏ</button></a>
</div>



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