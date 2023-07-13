/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Chapter;
import Model.Lesson;
import Model.QAOfLesson;
import Model.RepQAOfLesson;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dell
 */
public class LessonDAO {
    
    Connection con = null;

    public ArrayList<Lesson> getAllLessons() {
        ArrayList<Lesson> list = new ArrayList<>();
        String sql = "SELECT * FROM lesson";
        try {
            con = DBContext.getConnection();
            PreparedStatement pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                list.add(new Lesson(String.valueOf(rs.getInt("id")),
                        rs.getString("name"),
                        rs.getString("content"),
                        rs.getString("link"),
                        rs.getString("retry"),
                        rs.getString("date"),
                        rs.getString("numOfLikes"),
                        rs.getString("type"),
                        String.valueOf("courseID"),
                        String.valueOf(rs.getInt("chapterID"))));
            }
        } catch (Exception e) {
            System.out.println("getAllBlogByAccountID: " + e.getMessage());
        }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public ArrayList<Lesson> getAllLesson(int courseID) {
        ArrayList<Lesson> list = new ArrayList<>();
        String sql = "SELECT * FROM lesson where courseID = ?";
        try {
            con = DBContext.getConnection();
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, courseID);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                list.add(new Lesson(String.valueOf(rs.getInt("id")),
                        rs.getString("name"),
                        rs.getString("content"),
                        rs.getString("link"),
                        rs.getString("retry"),
                        rs.getString("date"),
                        rs.getString("numOfLikes"),
                        rs.getString("type"),
                        String.valueOf(courseID),
                        String.valueOf(rs.getInt("chapterID"))));
            }
        } catch (Exception e) {
            System.out.println("getAllBlogByAccountID: " + e.getMessage());
        }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public int getTotalLesson(int courseID) {
        String sql = "SELECT count(*) as 'total' FROM lesson where courseID = ?";
        try {
            con = DBContext.getConnection();
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, courseID);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            System.out.println("getAllBlogByAccountID: " + e.getMessage());
        }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return -1;
    }

    public Lesson getLessonByID(int selectedID) {
        String sql = "SELECT * FROM lesson where id = ?;";
        try {
            con = DBContext.getConnection();
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, selectedID);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                return new Lesson(String.valueOf(rs.getInt("id")),
                        rs.getString("name"),
                        rs.getString("content"),
                        rs.getString("link"),
                        rs.getString("retry"),
                        rs.getString("date"),
                        rs.getString("numOfLikes"),
                        rs.getString("type"),
                        String.valueOf(rs.getInt("courseID")),
                        String.valueOf(rs.getInt("chapterID")));
            }
        } catch (Exception e) {
            System.out.println("getAllBlogByAccountID: " + e.getMessage());
        }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    //Dai
    public ArrayList<Lesson> getAllLessonTypePracticeByCourseID(String courseID) {
        ArrayList<Lesson> list = new ArrayList<>();
        String sql = "SELECT * FROM lesson where type = 'practice' and courseID = " + courseID;
        try {
            con = DBContext.getConnection();
            PreparedStatement pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                list.add(new Lesson(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8),
                        rs.getString(9), rs.getString(10)));
            }
        } catch (Exception e) {
            System.out.println("getAllLessonByCourseID: " + e.getMessage());
        }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    /* Add Q&A of lesson */
    public void addQAOfLesson(String lessonID, String contentComment, String date, String userID) {
        try {
            String strInsert = "Insert into QAOfLesson\n"
                    + "(content, date, userID, lessonID)\n"
                    + "values(?, ?, ?, ?)";
            con = DBContext.getConnection();
            PreparedStatement pstm = con.prepareStatement(strInsert);
            pstm.setString(1, contentComment);
            pstm.setString(2, date);
            pstm.setString(3, userID);
            pstm.setString(4, lessonID);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("addQAOfLesson: " + e.getMessage());
        }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /* Get list Q&A of lesson by lesson ID*/
    public ArrayList<QAOfLesson> getListQAOfLesson(String lessonId) {
        ArrayList<QAOfLesson> listQA = new ArrayList<QAOfLesson>();
        try {
            String strSelect = "SELECT * FROM QAOfLesson \n"
                    + "WHERE lessonID = ?";
            con = DBContext.getConnection();
            PreparedStatement pstm = con.prepareStatement(strSelect);
            pstm.setString(1, lessonId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                listQA.add(new QAOfLesson(String.valueOf(rs.getInt(1)), rs.getString(2),
                        rs.getString(3), String.valueOf(rs.getInt(4)),
                        String.valueOf(rs.getInt(5))));
            }

        } catch (Exception e) {
            System.out.println("getListQAOfLesson: " + e.getMessage());
        }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listQA;
    }

    /* Add rep Q&A of lesson */
    public void addRepQAOfLesson(String lessonID, String contentRep, String date, String userID, String parentID) {
        try {
            String strInsert = "Insert into ReplyQAOfLesson\n"
                    + "(content, date, userID, lessonID, parentID)\n"
                    + "values(?, ?, ?, ?, ?)";
            con = DBContext.getConnection();
            PreparedStatement pstm = con.prepareStatement(strInsert);
            pstm.setString(1, contentRep);
            pstm.setString(2, date);
            pstm.setString(3, userID);
            pstm.setString(4, lessonID);
            pstm.setString(5, parentID);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("addRepQAOfLesson: " + e.getMessage());
        }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /* Get list Q&A of lesson by lesson ID*/
    public ArrayList<RepQAOfLesson> getListRepQAOfLesson(String lessonId) {
        ArrayList<RepQAOfLesson> listRepQA = new ArrayList<RepQAOfLesson>();
        try {
            String strSelect = "SELECT * FROM ReplyQAOfLesson\n"
                    + "where lessonID = ?";
            con = DBContext.getConnection();
            PreparedStatement pstm = con.prepareStatement(strSelect);
            pstm.setString(1, lessonId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                listRepQA.add(new RepQAOfLesson(String.valueOf(rs.getInt(1)),
                        rs.getString(2), rs.getString(3), String.valueOf(rs.getInt(4)),
                        String.valueOf(rs.getInt(5)), String.valueOf(rs.getInt(6))));
            }
        } catch (Exception e) {
            System.out.println("getListRepQAOfLesson: "+e.getMessage());
        }finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listRepQA;
    }

}
