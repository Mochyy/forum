<%@ page import="java.util.Optional" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.forum.entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Show Topic</title>
    <% User user = (User) session.getAttribute("User");
        Topic topic = (Topic) request.getAttribute("topic");
        List<Message> messages = (List<Message>) request.getAttribute("messages");
    %>
</head>
<style>

    table, th, td {
        border:1px solid black;
    }


</style>
<body>
<p style="text-align: right;">Chao | <%=user.getUsername()%><a href="/logout">  Thoat</a></p>


<h3>Chủ đề: <%=topic.getTitle()%></h3>
<p>Bài mới nhất gửi <%=topic.getDate().getDayOfMonth()%> - <%=topic.getDate().getMonth().getValue()%> - <%=topic.getDate().getYear()%> <%=topic.getDate().getHour()%>:<%=topic.getDate().getMinute()%> PM do <b><%=topic.getUser().get().getUsername()%></b>. <%=topic.getNumberRe()%> hồi âm</p>
<a href="/newReplyTopic/<%=topic.getId()%>"> trả lời</a>
<table>


<%for(Message m : messages){%>
<tr>
    <th><%=m.getCreatedTime().getDayOfMonth()%> - <%=m.getCreatedTime().getMonthValue()%> - <%=m.getCreatedTime().getYear()%> <%=m.getCreatedTime().getHour()%>:<%=m.getCreatedTime().getMinute()%> PM</th>
    <th></th>
</tr>
<tr style="border: 1px black solid">
    <td> <%=m.getCreator().get().getUsername()%> </td>
    <td><%=m.getTitle()%> <a href="/newReplyTopic/<%=topic.getId()%>"> trả lời</a> <br> <%=m.getContent()%></td>
</tr>

<%}%>
</table>

<a href="/topics">Danh sách chủ đề</a>
</body>
</html>