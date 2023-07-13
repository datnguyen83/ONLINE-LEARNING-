/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.RouteTypeItem;
import Model.RouteTypeItemAndCourse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class RouteTypeItemAndCourseDAO {
    
    Connection con = null;

    public ArrayList<RouteTypeItemAndCourse> getAllRouteTypeItemAndCourse() {
        ArrayList<RouteTypeItemAndCourse> listR = new ArrayList<>();
        String sql = "select * from RouteTypeItemAndCourse";
        try {
            con = DBContext.getConnection();
            PreparedStatement pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                listR.add(new RouteTypeItemAndCourse(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            System.out.println("getAllRouteTypeItemAndCourse: " + e.getMessage());
        }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listR;
    }

    public void insertRouteTypeItemAndCourse(String id, String routeTypeItemID, String[] listTick) {
        for (String string : listTick) {
            try {
                String sql = "insert into RouteTypeItemAndCourse(id, RouteTypeItemID, CourseID) Values(?, ?, ?);";
                con = DBContext.getConnection();
            PreparedStatement pstm = con.prepareStatement(sql);
                pstm.setString(1, id); id = Integer.parseInt(id)+1+"";
                pstm.setString(2, routeTypeItemID);
                pstm.setString(3, string);
                pstm.executeUpdate();
            } catch (Exception e) {
                System.out.println("insertRouteTypeItemAndCourse: " + e.getMessage());
            }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        }
        
    }
    public static void main(String[] args) {
        String arr[] = {"1"};
        RouteTypeItemAndCourseDAO r = new RouteTypeItemAndCourseDAO();
        r.insertRouteTypeItemAndCourse("1", "1", arr);
    }
}
