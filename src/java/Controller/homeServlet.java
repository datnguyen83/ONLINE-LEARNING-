/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CourseAccountDAO;
import DAO.CourseDetailDAO;
import DAO.NotificationDAO;
import Model.Account;
import Model.CourseAccount;
import Model.CourseDetail;
import Model.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class homeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet homeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet homeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
//        String saveDraft = request.getParameter("saveDraft");
//        if(saveDraft!=null){
//            System.out.println("saveDraft");
//        }

        HttpSession sesson = request.getSession();
        Account account = (Account) sesson.getAttribute("account");
        CourseDetailDAO c = new CourseDetailDAO();

//        String editBlogStatus = (String)request.getAttribute("editBlogStatus");
        String editBlogStatus = request.getParameter("editBlogStatus");
        String createRouteTypeStatus = request.getParameter("createRouteTypeStatus");
        String createRouteCourseItemStatus = request.getParameter("createRouteCourseItemStatus");
        String changePasswordStatus = request.getParameter("changePasswordStatus");
        String ResetPasswordStatus = request.getParameter("ResetPasswordStatus");

        System.out.println(editBlogStatus);
        //Load Notify
        if (sesson.getAttribute("account") != null) {
            NotificationDAO n = new NotificationDAO();
            account = (Account) sesson.getAttribute("account");
            ArrayList<Notification> listN = n.getAllNotificationByAccountID(account.getId());
            sesson.setAttribute("notificationList", listN);
            
            CourseAccountDAO caDao = new CourseAccountDAO();
            ArrayList<CourseAccount> courseAccount = caDao.getAll(Integer.parseInt(account.getId()));
            request.setAttribute("courseAccount", courseAccount);
        }
        if (editBlogStatus != null) {
            request.setAttribute("editBlogStatus", editBlogStatus);
        }
        if (createRouteTypeStatus != null) {
            request.setAttribute("createRouteTypeStatus", createRouteTypeStatus);
        }
        if (createRouteCourseItemStatus != null) {
            request.setAttribute("createRouteCourseItemStatus", createRouteCourseItemStatus);
        }
        if (changePasswordStatus != null) {
            request.setAttribute("changePasswordStatus", changePasswordStatus);
        }
        if (ResetPasswordStatus != null) {
            request.setAttribute("ResetPasswordStatus", ResetPasswordStatus);
        }

        //Load myCourses
        if (account != null) {
            String uId = account.getId();
            ArrayList<CourseDetail> listCourseDetail = c.getAllPublishedCourseByUserId(uId);
            ArrayList<CourseDetail> myCourses = new ArrayList<>();
            String currentTime = getCurrentTime();
            for (CourseDetail courseDetail : listCourseDetail) {
                courseDetail.setTimeRegistration(getTime(courseDetail.getTimeRegistration(), currentTime));
            }
            int size = listCourseDetail.size();
            if(size>3){
                for(int i=size-3; i<=size-1; i++){myCourses.add(listCourseDetail.get(i));}
            }else{
                myCourses = listCourseDetail;
            }
            sesson.setAttribute("myCourses", myCourses);
        }

        ArrayList<CourseDetail> listC = c.getAllPublishedCourse();
        ArrayList<CourseDetail> listProCourse = c.getAllPublishedProCourse();
        request.setAttribute("listProCourse", listProCourse);
        request.setAttribute("listCourse", listC);
        request.setAttribute("mode", "Home");
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    public String getCurrentTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d = new Date();
        return sdf.format(d);
    }

    public String getTime(String dbf, String dat) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d = null;
        Date d1 = null;
        long duration = 0;
        int second = 0;
        String result = "";
        try {
            d = sdf.parse(dbf);
            d1 = sdf.parse(dat);
        } catch (Exception e) {
        }
        if (d != null && d1 != null) {
            duration = d1.getTime() - d.getTime();
        }

        // Print out the duration in seconds
        second = (int) duration / 1000;
        result = "vài giây trước";
        if (second > 60) {
            result = second / 60 + " phút trước";
        }
        if (second > 3600) {
            result = second / 3600 + " giờ trước";
        }
        if (second > 86400) {
            result = second / 86400 + " ngày trước";
        }
        return result;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
