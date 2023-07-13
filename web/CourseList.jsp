<%-- 
    Document   : CourseList
    Created on : Jun 10, 2023, 11:55:29 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/header.css"/>
        <link rel="stylesheet" href="css/footer.css"/>
        <link rel="stylesheet" href="css/course_list.css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
        <form action="course" method="post">
            <h2>DANH SÁCH Khóa Học</h2>

            <div class="table-wrapper">
                <table class="fl-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Price</th>
                            <th>Course Description</th>
                            <th>Level</th>
                            <th>BUTTON</th>
                        </tr>
                    </thead>
                    <div class="add_btn">
                            <input onclick="window.location = 'createCourse'" type="button" value="Add" />
                            <div style="display: flex;">
                                <div class="filter_instruction">FilterByLevel: </div>
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
                    <c:forEach items="${listCourse}" var="itemCourse">  


                        <tr>

                            <td id="${itemCourse.getCourseID()}">${itemCourse.getCourseID()}</td> 
                        <input type="text" name="cid" value="${itemCourse.getCourseID()}" readonly="" style="display: none">
                        <td style="color: blue; cursor: pointer;"  onclick="redirectToURL2(${itemCourse.getCourseID()})">${itemCourse.getTitle()}</td>
                        <td>${itemCourse.getPrice()}</td>
                        <td style="max-width: 600px;   word-wrap: break-word;">${itemCourse.getDetailCourseDes()}</td>
                        <td>${itemCourse.getLevel()}</td>

                        <td><button name="btn_edit" onclick="redirectToURL1(${itemCourse.getCourseID()})" value="${itemCourse.getCourseID()}" type="button" style="text-decoration: none;color: black; width: 40px; cursor: pointer">Edit</button> 
                            <button name="btn_delete" onclick="redirectToURL2()" value="${itemCourse.getCourseID()}" type="submit" style="margin-left: 10px; width: 20px; cursor: pointer" class="btn_delete"><ion-icon name="trash-outline"></ion-icon></button>
                        </td>
                        <c:choose>
                            <c:when test="${btn_delete != null}">
                                <div class="message_popup_show">
                                    <p style="font-size: 18px; margin-top: 20px; font-style: italic ">Bạn có chắc chắn muốn xóa <b> ${course.getTitle()} </b> không?</p>
                                    <a class="btn_yes" href="course?cid=${course.getId()}&mod=1&btn_find=&actor="><i class='bx bx-check'></i> Đồng ý</a>
                                    <button  class="btn_no"><i class='bx bx-x'></i>Hủy</button>
                                </div>
                            </c:when>
                        </c:choose>
                        </tr>
                </c:forEach>
                <tbody>
            </table>
        </div>
        </form>
            

        <div class="footer">
            <jsp:include page="footer.jsp"></jsp:include>
            </div>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <script>
                function activeErrorToast() {
                    toastr.error('${savedBlogStatus}');
                }
                if ('${savedBlogStatus}' === 'Ðã xóa khóa học')
                    activeErrorToast();
                
                function redirectToURL1(n){
                    window.location='editCourseServlet?courseId=' + n;
                }
                function redirectToURL2(n){
                    window.location='editLessonServlet?courseId=' + n;
                }
                
                function redirect(){
                    window.location.href='/g4/home';
                }
        </script>        
    </body>
</html>
