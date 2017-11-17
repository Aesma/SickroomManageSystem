package service;

import conn.Conn;
import model.User;

import java.sql.*;

/**
 * Created by Rengar on 2017/6/3.
 */
public class UserService {
    private Connection conn;
    private PreparedStatement pstmt;

    public UserService() {
        try{
            conn = Conn.getConn();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public boolean regist(User user){
        try {
            pstmt = conn.prepareStatement("SELECT * FROM USER WHERE \"username\"=? AND \"password\"=?");
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            ResultSet rst = pstmt.executeQuery();
            if (!rst.next()) {
                String insSql = "INSERT INTO USER VALUES('" + user.getUsername() + "','" + user.getPassword() + "')";
                Statement st = conn.createStatement();
                st.execute(insSql);
                if(st != null){
                    st.close();
                    st = null;
                }

                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            try{
                if(pstmt != null){
                    pstmt.close();
                    pstmt = null;
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    public boolean vaildUser(User user) {
        try {
            pstmt = conn.prepareStatement("SELECT * FROM \"User\" WHERE \"username\"=? AND \"password\"=?");
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            ResultSet rst = pstmt.executeQuery();
            if (rst.next()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            try{
                if(pstmt != null){
                    pstmt.close();
                    pstmt = null;
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }
}

