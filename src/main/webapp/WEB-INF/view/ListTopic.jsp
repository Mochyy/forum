<%@ page import="com.example.forum.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.forum.entity.TopicEntity" %>
<%@ page import="com.example.forum.service.ForumService" %>
<%@ page import="com.example.forum.entity.UserEntity" %>
<%@ page import="com.example.forum.entity.Topic" %>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <title>Dien Dan</title>
    <% User user = (User) session.getAttribute("User");
        List<Topic> topicEntities = (List<Topic>) request.getAttribute("topics");
    %>

</head>
<%--<style>--%>
<%--    table, th, td {--%>
<%--        border:1px solid black;--%>
<%--    }--%>
<%--</style>--%>
<body>


<p style="text-align: right;">Chao | <a href="/getTopicById"><%=user.getUsername()%></a> <a href="/logout">  Thoat</a></p>

<h3 style="margin: auto"> Diễn đàn: Chuyện học phí và chính sách hỗ trợ học tập</h3>

<a href="/newTopic/<%=topicEntities.get(0).getIdForum()%>" style="margin:20px 0px 0px 30px;"><button style="border: none" >Gửi bài mới</button></a>

<table class="table table-striped table-bordered" style="width: 500px; margin:20px 0px 0px 30px;">

    <tr class="danger">
        <th>Chủ đề</th>
        <th>Hồi âm </th>
    </tr>
    <%for(Topic topic: topicEntities){%>

    <tr >
        <td><a href="/topic/<%=topic.getId()%>"><%=topic.getTitle()%></a><br>
            <p>Bài mới nhất của <a href="#" id="<%=topic.getUser().get().getId()%>"> <%=topic.getUser().get().getUsername()%>  </a>,<%=topic.getDate().getDayOfMonth()%> - <%=topic.getDate().getMonth().getValue()%> - <%=topic.getDate().getYear()%> <%=topic.getDate().getHour()%>:<%=topic.getDate().getMinute()%>  </p>
        </td>
        <td> <%=topic.getNumberRe()%></td>
    </tr>

    <%}%>


</table>


</body>

<script>

    function getuser(e) {
        console.log(e)
        let id = e.getAttribute("id");

        $.ajax({
            url:'/getUserById',
            type:'get',
            dataType:'text',
            data:{
                id:id,
            },
            success:function (data){
               e.html = data;
            },
            error:function () {
                // alert("Login that bai");
            }
        });
    }

</script>

</html>