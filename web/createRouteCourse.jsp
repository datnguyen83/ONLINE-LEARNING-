<%-- 
    Document   : createRouteCourse
    Created on : Jun 5, 2023, 9:46:07 PM
    Author     : TIEN DAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/optionSetting.css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="css/header.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css">
        <link rel="stylesheet" href="path/to/bootstrap.min.css">
        <style>
            .all{
                border: 1px solid black;
                width: 640px;
                height: 600px;
                background-color: #fdcfc9 ;
                border-radius: 2%;
                margin-top: 100px
            }
            .h1{
                /*                font-family: 'Montserrat',Arial,Helvetica,sans-serif;*/
            }
            .avatar{
                border-radius: 10%;
                width: 45px;
                height: 45px;
                cursor: pointer ;
                margin-left: 280px;
                margin-top: 50px;
            }
            /*            .nhap{
                            background-color: #0000000d;
                            width:380px;
                            height: 49px;
                            margin-left: 128px;
                            border-radius: 24px;
                        }*/
            .form-input{
                border-color: #00000000;
                font-size: 17px;
                /*                font-family: 'Montserrat',Arial,Helvetica,sans-serif;*/
                border-width: 0px;
                height: 26px;
                margin-left: 43px;
                width:340px;
                outline: none;
            }
            .nhap{
                margin-left:29px ;
                font-size: 22px;
                font-weight:600;
            }
            .submit{
                margin-left: 300px;
                width: 90px;
                height: 27px;
                margin-top: 15px;
                cursor: pointer;
                font-size: 19px;
            }
        </style>
    </head>
    <body style="background-image: url(https://accounts.fullstack.edu.vn/static/media/f8_bg_auth_1920.b517075e98f3051de678.png);">
        <jsp:include page="header.jsp"></jsp:include> 
            <form action="createRouteCourse" method="post" enctype="multipart/form-data">
                <div style="display: flex ;
                     justify-content: center;
                     align-items: center;
                     height: 600px">
                    <div class="all" style=" color: #053f1b">
                        <div>
                            <a href="/g4/home" >
                                <img src="https://accounts.fullstack.edu.vn/assets/icon/f8_icon.png" alt="Avatar"  class="avatar" >
                            </a>
                            <h1 class="h1" style="text-align: center;font-size: 35px;margin-top: 10px"> 
                                Tạo lộ trình học</h1>  
                        </div>   
                        <div class="khung" style="margin-top: 25px">
                            <div class="nhap" style="display: flex">
                                <div >Tên lộ trình học
                                    <a style="color: red">*</a>
                                </div>
                                <input type="text" name="routeName" class="form-input" style="width: 296px ; margin-left: 108px" maxlength="100" required> 
                            </div>
                            <div style="font-size: 15px; font-weight: 700;color: red;margin-left: 317px;margin-top: 3px;" >
                            ${error1} 
                        </div>
                        <br>
                        <div class="nhap" style="display: flex">
                            <div >Ảnh lộ trình học
                                <a style="color: red">*</a>
                            </div>
                            <!--                            <input type="text" name="image" class="form-input" style="width: 296px ; margin-left: 105px" required> -->
                            <input id="image" type="file" name="image"/><br>${error7}
                        </div>

                        <br>
                        <div class="nhap" style="display: flex">
                            <div>Giới thiệu bao quát
                                <a style="color: red">*</a>
                            </div>
                            <textarea name="content1" cols="38" rows="5" style="margin-left: 72px" maxlength="2000" required></textarea>
                        </div>
                        <br>
                        <div class="nhap" style="display: flex">
                            <div >Giới thiệu chi tiết
                                <a style="color: red">*</a>
                            </div>
                            <textarea name="content2" cols="38" rows="5" style="margin-left: 93px" maxlength="2000" required></textarea>
                        </div>
                        <div class="nhap" style="display: flex">
                            <div>Giới thiệu bao quát
                                <a style="color: red">*</a>
                            </div>
                            <input type="text" name="status" class="form-input" style="width: 296px ; margin-left: 105px" required> 
                        </div>
                    </div>
                    <input type="submit" Value="Submit" class="submit" />
                </div>
            </div>
        </form>
        <br><br><br><br>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
