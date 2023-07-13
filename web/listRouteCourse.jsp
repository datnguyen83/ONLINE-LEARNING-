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
             .add_btn input {
                 display: flex;
                 justify-content: center;
                 text-align: center;
                width: 60px;
                height: 40px;
                background: #4CAF50;
                color: white;
                margin-bottom: 10px;
                border-radius: 8px;
                border: none;
                cursor: pointer;
                margin-left: 70px;
            }
        </style>
    </head>
    <body style="background-image: url('image/anhnen.png')">
        <jsp:include page="header.jsp"></jsp:include>
        <form action="listRouteCourse" method="post" id="form">
                <h2 style="color: #F0F0F0">DANH SÁCH Khóa Học</h2>
                <div class="add_btn" >
                         <input onclick="window.location = 'createRouteCourse'" type="button" value="Add" />
                </div>
                
           
                <div class="table-wrapper">
                    <table class="fl-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên lộ trình</th>
                                <th>Ảnh</th>
                                <th>Giới thiệu lộ trình</th>
                                <th>Ẩn / hiện</th>
                                <th>BUTTON</th>
                            </tr>
                        </thead>

                        <tbody>           
                        <c:forEach items="${listRouteType}" var="i">  
                            <tr>

                                <td >${i.id}</td>

                                <td>${i.name}</td>
                                <td>${i.image}</td>
                                <td>${i.description1}</td>
                                <td>${i.status}</td>

                                <td style="display: flex
                                    "><button name="btn_edit" onclick="window.location = 'editRouteCourse?id=${i.id}'" value="${i.id}" type="button" style="text-decoration: none;color: black; width: 40px; cursor: pointer">Edit</button> 
                                    <div name="btn_delete" onclick="deleteRouteCourse(${i.id})" value="${i.id}"    class="btn_delete" style="text-align: center;justify-content: center;margin-left: 10px; width: 50px; cursor: pointer;height: 25px;border:1px #807171 solid;border-radius: 2px;background-color: #F0F0F0 ">Xóa</div>
                                </td>
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
                                 function deleteRouteCourse(id) {
                                    if (confirm("Ban co dong y xoa khong?")) {
                                        window.location="listRouteCourse?id="+id;
                                    }
                                }
                                
                                function  createRouteType() {
                                            window.location = 'CreateRouteCourse';
                                        }
        </script>        
    </body>
</html>
