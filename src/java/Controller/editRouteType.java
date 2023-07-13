/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.RouteTypeDAO;
import Model.RouteType;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author TIEN DAT
 */
public class editRouteType extends HttpServlet {

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
            out.println("<title>Servlet editListRouteTypeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editListRouteTypeServlet at " + request.getContextPath() + "</h1>");
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
        String listRouteTypeID = request.getParameter("id");
        RouteTypeDAO routeTypeDAO = new RouteTypeDAO();

        RouteType routeType = routeTypeDAO.getRouteTypeByID(listRouteTypeID);
        request.setAttribute("routeType", routeType);
//        request.setAttribute("routeName", routeType.getName());
//        request.setAttribute("image", routeType.getImage());
//        request.setAttribute("content1", routeType.getDescription1());
//        request.setAttribute("content2", routeType.getDescription2());
        request.getRequestDispatcher("editRouteType.jsp").forward(request, response);

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

        String listRouteTypeID = request.getParameter("routeTypeID");
        RouteTypeDAO routeTypeDAO = new RouteTypeDAO();

        String routeName = request.getParameter("routeName");
        String image = request.getParameter("image");
        String content1 = request.getParameter("content1");
        String content2 = request.getParameter("content2");
         String status = request.getParameter("status");
        RouteType routeType = new RouteType(listRouteTypeID, routeName, image, content1, content2,status);
//         routeTypeDAO.insertRouteType(routeType);
        routeTypeDAO.editRouteTypeByID(routeType);
        response.sendRedirect("home?createRouteTypeStatus=edit routetype successfully");
    }

    public int getMaxRouteTypeID(ArrayList<RouteType> listR) {
        int max = 0;
        for (RouteType routeType : listR) {
            int id = Integer.parseInt(routeType.getId());
            if (max < id) {
                max = id;
            }
        }
        return max;
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
