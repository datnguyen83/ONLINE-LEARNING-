<%-- 
    Document   : listQuizLesson
    Created on : 21/06/2023, 9:57:26 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List</title>
        <link rel="stylesheet" href="css/header.css"/>
        <link rel="stylesheet" href="css/footer.css"/>
        <link rel="stylesheet" href="css/user_list.css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="./font/fontawesome-free-6.4.0-web/fontawesome-free-6.4.0-web/css/all.min.css">
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <style>
            .add_btn {
                display: flex;
                justify-content: space-between;
            }
            .content_dropdown_lesson select {
                background-color: #4CAF50;
                border: none;
                border-radius: 6px;
                width: 210px;
                height: 40px;
                margin-left: 20px;
                color: white;
            }
            .filter_instruction {
                font-size: 18px;
                color: white;
                margin-top: 14px;
            }
            .add_btn input {
                width: 60px;
                height: 40px;
                background: #4CAF50;
                color: white;
                margin-bottom: 10px;
                border-radius: 8px;
                border: none;
                cursor: pointer;
            }
        </style>
    </head>
    
    <body style="background-image: url('image/anhnen.png')">
        <jsp:include page="header.jsp"></jsp:include>
            <form id="f" action="listQuizLesson" method="get">
                <h2>DANH SÁCH QUIZ</h2>
                <div class="table-wrapper">

                    <table class="fl-table">
                        <thead>
                            <tr>
                                <th>QUIZ ID</th>
                                <th>COURSE NAME</th>
                                <th>LESSON NAME</th>
                                <th>QUIZ CONTENT</th>
                                <th>QUIZ EXPLAIN</th>
                                <th>BUTTON</th>
                            </tr>
                        </thead>
                        <div class="add_btn">
                            <input onclick="window.location = 'newQuizLesson'" type="button" value="Add" />
                            <div style="display: flex;">
                                <div class="filter_instruction">FilterByLesson: </div>
                                <div class="content_dropdown_lesson">
                                    <select onchange="document.getElementById('f').submit()" id="mySelect2" name="lesson" required>
                                        <option selected value="default">Chọn bài học</option>
                                    <c:forEach items="${listLessons}" var="l">
                                        <option <c:if test="${l.id == lessonID}">selected</c:if> value="${l.id}">${l.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <tbody>  
                        <c:forEach items="${listQ}" var="q">
                            <tr>
                                <td>${q.id}</td>
                                <td>${q.courseTitle}</td>
                                <td>${q.lessonName}</td>
                                <td>${q.content}</td>
                                <td>${q.explain}</td>
                                <td style="display: flex; justify-content: center ;font-size: 18px; padding: 4px;">
                                    <input onclick="window.location = 'listQuizLesson?mode=edit&id=${q.id}'" style="text-decoration: none;color: black; width: 40px; cursor: pointer" value="EDIT"/>
                                    <div onclick="deleteQuiz(${q.id})" style="margin-top: 4px ;margin-left: 10px; width: 30px; cursor: pointer"><ion-icon name="trash-outline"></ion-icon></div>
                                </td>
                            </tr>
                        </c:forEach>
                    <tbody>
                </table>
            </div>
        </form>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <script>
            
            function deleteQuiz(qid) {
                if(confirm('Bạn có muốn xóa câu hỏi này không?')){
                    window.location = 'listQuizLesson?mode=delete&id='+qid;
                }
            }
            function activeErrorToast() {
                    toastr.error('${savedBlogStatus}');
            }
            function activeSuccessToast(abc) {
                toastr.success(abc);
            }
            if ('${editBlogStatus}' !== '')
                activeSuccessToast('${editBlogStatus}');
        </script>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
