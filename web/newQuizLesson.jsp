<%-- 
    Document   : newQuizLesson
    Created on : 17/06/2023, 3:03:02 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/header.css">
        <link rel="stylesheet" type="text/css" href="./css/newQuizLesson.css">
        <link rel="stylesheet" type="text/css" href="./css/footer.css">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="./header.jsp"></jsp:include>
            <form id="f" action="newQuizLesson" method="post">
                <!--hidden field-->
            <c:if test="${mode==null}"><c:set var="mode" value="add"></c:set></c:if>
            <input type="hidden" name="quesID" value="${qac.question.id}"/>
            <div class="wrap">
                <div class="content">
                    <div class="content_head">
                        <a href="/g4/home" >
                            <img src="https://accounts.fullstack.edu.vn/assets/icon/f8_icon.png" alt="Avatar"  class="avatar" >
                        </a>
                        <h1><c:if test="${mode=='edit'}">Chỉnh sửa </c:if>
                            <c:if test="${mode=='add'}">Tạo </c:if>
                                Quiz cho bài học</h1>  
                        </div>
                        <div class="content_dropdown">
                            <div class="content_dropdown_course">
                                <select id="mySelect1" name="course" required onchange="changeMySelect1()">
                                    <option selected value="default">Chọn khóa học</option>
                                <c:forEach items="${listCourses}" var="c">
                                    <option <c:if test="${mode=='edit' && c.id == qe.courseID}">selected</c:if> <c:if test="${c.id == courseID}">selected</c:if> value="${c.id}">${c.title}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="content_dropdown_lesson">
                            <select id="mySelect2" name="lesson" required>
                                <option selected value="default">Chọn bài học</option>
                                <c:forEach items="${listLessons}" var="l">
                                    <option <c:if test="${mode=='edit' && l.id == qe.lessonID}">selected</c:if> value="${l.id}">${l.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="error_select">
                        <div class="error_select1" style="display: none">Chọn khóa học muốn tạo Quiz</div>
                        <div class="error_select2" style="display: none">Chọn bài học muốn tạo Quiz</div>
                    </div>
                    <div class="content_bot">
                        <div class="content_bot_question">
                            <div>Câu hỏi: </div> 
                            <textarea name="question" required>${question}${qac.question.content}</textarea>
                        </div><br>
                        <div class="content_bot_answer">
                            <div>Đáp án: </div>
                            <c:if test="${mode == 'add'}">
                                <input type="text" name="answer" required class="answer"/><br>
                                <input type="text" name="answer" required class="answer"/><br>
                            </c:if>
                            <c:if test="${mode == 'edit'}">
                                <c:forEach items="${qac.answer}" var="a">
                                    <input type="text" name="answer" value="${a.content}" required class="answer"/><br>
                                </c:forEach>
                            </c:if>
                        </div>
                        <div class="add_remove_btn">
                            <img onclick="add()" style="width: 30px; cursor: pointer;" src="./image/plus.png" alt="alt"/>
                            <img onclick="remove()" style="width: 29px; cursor: pointer; margin-left: 10px;" src="./image/minus.png" alt="alt"/><br>
                        </div>
                        <div class="content_bot_explain">
                            <div>Giải thích: </div> 
                            <textarea id="explain_textarea" name="explain" required>${qac.question.explain}</textarea>
                        </div><br>
                        <div class="ctld">Đáp án đúng: </div>
                        <div class="submit_wrap">
                            <div class="content_dropdown_correctAns">
                                <select id="mySelect3" name="correctAnswer" required>
                                    <option selected value="default">Chọn dáp án đúng</option>
                                    <c:if test="${mode == 'add'}">
                                        <option class="opans" value="1">1</option>
                                        <option class="opans" value="2">2</option>
                                    </c:if>
                                    <c:if test="${mode == 'edit'}">
                                        <c:set var="count" value="1"></c:set>
                                        <c:forEach items="${qac.answer}" var="a">
                                            <option <c:if test="${a.content == qac.correctAnswer.content}">selected</c:if> class="opans" value="${count}">${count}</option>
                                            <c:set var="count" value="${count+1}"></c:set>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>

                            <input onclick="validateForm()" type="submit" value="<c:if test="${mode == 'edit'}">Edit</c:if><c:if test="${mode == 'add'}">Add</c:if>" class="submit_btn"/>
                            </div>
                            <div style="position: relative">
                                <div class="error_select3" style="display: none">Chọn đáp án đúng</div>
                            </div>
                        </div>
                    </div>
                </div>
            <c:if test="${mode == 'edit'}"><c:set var="mode" value="edit"></c:set></c:if>
            <input type="hidden" name="mode" value="${mode}"/>
        </form>

        <jsp:include page="./footer.jsp"></jsp:include>  
            <script>
                //Status
                function activeErrorToast(abc) {
                    toastr.error(abc);
                }
                function activeSuccessToast(abc) {
                    toastr.success(abc);
                }
                if ('${newQuizLessonStatus}' !== '')
                    activeErrorToast('${newQuizLessonStatus}');

                function changeMySelect1() {
                    var form = document.getElementById("f");
                    form.method = 'get';
                    form.submit();
                }
                function getValueAns() {
                    var numOfAnsTag = document.getElementsByClassName("opans").length;
                    return numOfAnsTag + 1;
                }
                function add() {
                    const contain = document.querySelector(".content_bot_answer");
                    const inputTag = document.createElement('input');
                    //style="width: 750px; height: 40px; margin-bottom: 10px" type="text" name="answer" value=""
                    inputTag.style.width = '471px';
                    inputTag.style.height = '26px';
                    inputTag.style.marginBottom = '10px';
                    inputTag.type = "text";
                    inputTag.name = "answer";
                    inputTag.className = "answer";
                    contain.appendChild(inputTag);

                    //add more answer tag
                    const contain1 = document.getElementById("mySelect3");
                    const answertag = document.createElement('option');
                    answertag.value = getValueAns();
                    answertag.className = "opans";
                    answertag.text = getValueAns();
                    contain1.appendChild(answertag);
                }
                function remove() {
                    const select = document.querySelector(".content_bot_answer");
                    var numOfInputTag = document.getElementsByClassName("answer");
                    const contain1 = document.getElementById("mySelect3");
                    if (numOfInputTag.length > 2) {
                        select.removeChild(select.lastChild);
                        contain1.removeChild(contain1.lastChild);
                    }
                }
                function validateForm() {
                    //select 1
                    var selectBox1 = document.getElementById("mySelect1");
                    var selectedValue1 = selectBox1.options[selectBox1.selectedIndex].value;

                    if (selectedValue1 === "default") {
                        document.querySelector(".error_select1").style.display = 'block';
                        return false;
                    } else {
                        document.querySelector(".error_select1").style.display = 'none';
                    }

                    //select 2
                    var selectBox2 = document.getElementById("mySelect2");
                    var selectedValue2 = selectBox2.options[selectBox2.selectedIndex].value;

                    if (selectedValue2 === "default") {
                        document.querySelector(".error_select2").style.display = 'block';
                        return false;
                    } else {
                        document.querySelector(".error_select2").style.display = 'none';
                    }

                    //select 3
                    var selectBox3 = document.getElementById("mySelect3");
                    var selectedValue3 = selectBox3.options[selectBox3.selectedIndex].value;

                    if (selectedValue3 === "default") {
                        document.querySelector(".error_select3").style.display = 'block';
                        return false;
                    } else {
                        document.querySelector(".error_select3").style.display = 'none';
                    }
                }
        </script>
    </body>
</html>
