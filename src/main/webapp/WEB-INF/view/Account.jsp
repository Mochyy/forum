<%@ page import="java.util.List" %>
<%@ page import="com.example.forum.entity.TopicEntity" %>
<%@ page import="com.example.forum.entity.User" %>
<!doctype html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <title>Account</title>
    <%User user = (User) session.getAttribute("User");
        List<TopicEntity> topicEntities = (List<TopicEntity>) request.getAttribute("topics");
    %>
</head>
<body>

<p style="text-align: right;">Chao | <a href="/getTopicById"><%=user.getUsername()%></a> <a href="/logout">  Thoat</a></p>

    <h2>Danh sách các Topic đã đăng</h2>

    <form action="/deleteTopic" method="get">
        <button type="text" style=" margin:20px 0px 0px 10px;" disabled id="deletestudent" onclick="deleteStudent()">Delete</button>
        <input type="hidden" name="listId" id="inputid">
    </form>

    <table class="table table-striped table-bordered" style="width: 500px; margin:20px 0px 0px 30px;">
        <tr>
            <th>Select</th>
            <th>Title</th>
            <th>Description</th>
            <th>Date</th>
        </tr>
        <%for (TopicEntity topic: topicEntities){%>
        <tr >
            <th><input type="checkbox" value="<%=topic.getId()%>" class="cbxmale" onclick="setdelete()"></th>
            <td><%=topic.getTitle()%></td>
            <td><%=topic.getDescription()%></td>
            <td><%=topic.getDate().getDayOfMonth()%>/<%=topic.getDate().getMonthValue()%>/<%=topic.getDate().getYear()%></td>
        </tr>
        <%}%>

    </table>




</body>
<script>

    function deleteStudent(){
        let a = document.getElementsByClassName("cbxmale");
        let listid = "";

        for (let i = 0;i<a.length;i++){
            if (a[i].checked){
                listid+=a[i].value + "-";
            }
        }
        document.getElementById("inputid").value = listid;
        document.getElementById("deletestudent").onsubmit();

    }

    function setdelete(){
        let dest = document.getElementById("deletestudent");
        let a = document.getElementsByClassName("cbxmale");
        let c = 0;
        for (let i = 0;i<a.length;i++){
            if (a[i].checked){
                dest.disabled = false;
                c++;
            }
        }
        if (c == 0){
            dest.disabled = true;
        }
    }

</script>

</html>