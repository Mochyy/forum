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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <title>Show Topic</title>
    <% User user = (User) session.getAttribute("User");
        Topic topic = (Topic) request.getAttribute("topic");
        List<Message> messages = (List<Message>) request.getAttribute("messages");
    %>
</head>
<body>
<p style="text-align: right;">Chao | <%=user.getUsername()%><a href="/logout">  Thoat</a></p>


<h3>Chủ đề: <%=topic.getTitle()%></h3>
<p>Bài mới nhất gửi <%=topic.getDate().getDayOfMonth()%> - <%=topic.getDate().getMonth().getValue()%> - <%=topic.getDate().getYear()%> <%=topic.getDate().getHour()%>:<%=topic.getDate().getMinute()%> PM do <b><%=topic.getUser().get().getUsername()%></b>. <%=topic.getNumberRe()%> hồi âm</p>
<%if (messages.size() == 0){%>
<a href="/newReplyTopic/<%=topic.getId()%>"> trả lời</a>
<%}%>

<table class="table table-striped table-bordered" style="width: 500px; margin:20px 0px 0px 30px;">


<%for(Message m : messages){%>
<tr >
    <th style="width: 250px;"><%=m.getCreatedTime().getDayOfMonth()%> - <%=m.getCreatedTime().getMonthValue()%> - <%=m.getCreatedTime().getYear()%> <%=m.getCreatedTime().getHour()%>:<%=m.getCreatedTime().getMinute()%> PM</th>
    <th></th>
</tr>
<tr >
    <td style="width: 250px;"> <%=m.getCreator().get().getUsername()%> </td>
    <td><%=m.getTitle()%> <a href="/newReplyTopic/<%=topic.getId()%>" style="text-align: right;width: 80%;display: inline-block;"> trả lời</a> <br> <%=m.getContent()%></td>
</tr>

<%}%>
</table>

<a href="/topics">Danh sách chủ đề</a>
</body>
</html>