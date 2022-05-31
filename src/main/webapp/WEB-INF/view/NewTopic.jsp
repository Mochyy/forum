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
    <% String id  = (String) request.getAttribute("id"); %>

        <% User user = (User) session.getAttribute("User");%>

</head>
<body>
<p style="text-align: right;">Chao | <a href="/getTopicById"><%=user.getUsername()%></a> <a href="/logout">  Thoat</a></p>

<div style="margin: auto;width: 100%;">
    <label style="font-weight: bold"> Tiêu Đề </label> <br>
    <input type="text" name="title" style="width: 500px;" id="title">
    <br>
    <label style="font-weight: bold;"> Nội Dung </label> <br>
    <textarea type="text" rows="7" cols="66" name="content" style="overflow-y: scroll" id="content" height="100px"></textarea>


    <div>
        <button type="button" onclick="createTopic()">Gởi</button>
        <a href="/topics"><button>Hủy bỏ</button></a>
    </div>
</div>


</body>

<script>
    function createTopic() {
        let title = $("#title").val()
        let description = $("#content").val()
        let id = <%=id%>;
        $.ajax({
            url:'/newTopic',
            type:'post',
            dataType:'text',
            data:{
                id:id,
                title:title,
                description:description
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