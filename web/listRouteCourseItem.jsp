<%-- 
    Document   : createRouteCourseItem
    Created on : Jun 5, 2023, 11:11:10 PM
    Author     : TIEN DAT
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
    </head>
    <body style="background-image: url(https://accounts.fullstack.edu.vn/static/media/f8_bg_auth_1920.b517075e98f3051de678.png); font-size: 15px;">

        <form action="editRouteTypeItem" method="post">
            <jsp:include page="header.jsp"></jsp:include> 
                <h1 style="text-align: center;font-size: 30px;color: white;font-weight: 700;padding: 20px">DANH SÁCH MỤC LỤC LỘ TRÌNH HỌC </h1>
                <p style="display:flex; align-items:center; justify-content:center;background-color: #3df31b;height: 25px;width: 261px;font-size: 20px;margin-left: 70px;margin-top: 30px;cursor: pointer;margin-bottom: 10px" onclick="window.location = 'createRouteCourseItem'">
                    <i class="fa fa-plus" style="display:flex; align-items:center; justify-content:center;border: 2px solid white;border-radius: 50%;height: 20px"></i>
                    Tạo mục lục lộ trình học</p>
                <div class="table-wrapper" style="margin-top: -10px">
                    <table class="fl-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên lộ trình</th>
                                <th>Tên mục lục</th>
                                <th>Giới thiệu về mục lục</th>
                                <th>Khóa học</th>
                                <th>Buttom</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listRouteTypeItem}" var="i">
                            <tr>
                                <td name="id">${i.id}</td>
                                <td>${i.nameRouteType}</td>
                                <td>${i.nameRoutyTypeItem}</td>
                                <td>${i.description}</td>
                                <td>${i.title}</td>
                                <td style="display: flex"><button value="${i.id}" type="submit" style="text-decoration: none;color: black; width: 40px; cursor: pointer" onclick="window.location = 'editRouteCourseItem?id=${i.id}'">Edit</button> 
                                    <button name="btn_delete" value="${itemCourse.getCourseID()}" type="submit" style="margin-left: 10px; width: 20px; cursor: pointer" class="btn_delete"><ion-icon name="trash-outline"></ion-icon></button>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </form>
        <br><br><br><br>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    </body>
</html>
