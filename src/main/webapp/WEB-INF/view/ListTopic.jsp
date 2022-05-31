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
    <title>Dien Dan</title>
    <% User user = (User) session.getAttribute("User");
        List<Topic> topicEntities = (List<Topic>) request.getAttribute("topics");
    %>

</head>
<style>
    table, th, td {
        border:1px solid black;
    }
</style>
<body>


<p style="text-align: right;">Chao | <a href="/getTopicById"><%=user.getUsername()%></a> <a href="/logout">  Thoat</a></p>

<p> Dien dan: chuyen hoc phi va cac chinh sach ho tro hoc tap (<%=topicEntities.size()%>)</p>

<a href="/newTopic/<%=topicEntities.get(0).getIdForum()%>">Goi bai moi</a>

<table>

    <tr>
        <th>Chu de</th>
        <th>Hoi am </th>
    </tr>
    <%for(Topic topic: topicEntities){%>

    <tr style="border: 1px black solid">
        <td><a href="/topic/<%=topic.getId()%>"><%=topic.getTitle()%></a><br>
            <p>Bài mới nhất của <a href="#" id="<%=topic.getUser().get().getId()%>"> <%=topic.getUser().get().getUsername()%>  </a>,<%=topic.getDate().getDayOfMonth()%> - <%=topic.getDate().getMonth().getValue()%> - <%=topic.getDate().getYear()%> <%=topic.getDate().getHour()%>:<%=topic.getDate().getMinute()%> PM </p>
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