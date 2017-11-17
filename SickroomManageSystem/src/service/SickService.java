package service;

import conn.Conn;
import model.PaitentInfo;
import model.Sick;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Rengar on 2017/10/25.
 */
public class SickService {
    private Connection conn;
    private PreparedStatement pstmt;

    public SickService() {
        try{
            conn = Conn.getConn();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List getAllPaitents() {
        List list = new ArrayList();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM SICK");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Sick sick = new Sick();
                sick.setName(rs.getString(1));
                sick.setId(rs.getInt(2));
                sick.setAge(rs.getInt(3));
                sick.setSex(rs.getString(4));
                sick.setDia(rs.getString(5));
                sick.setDoctor(rs.getString(6));
                sick.setSection(rs.getString(7));
                sick.setRoom(rs.getString(8));
                list.add(sick);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
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

    public boolean updatePaitent(Sick sick){
        try{
            pstmt = conn.prepareStatement("UPDATE SICK SET \"name\"=?,\"age\"=?,\"sex\"=?,\"dia\"=?,\"doctor\"=?,\"section\"=?,\"room\"=? WHERE \"id\"=?");
            pstmt.setString(1, sick.getName());
            pstmt.setInt(8, sick.getId());
            pstmt.setInt(2, sick.getAge());
            pstmt.setString(3, sick.getSex());
            pstmt.setString(4, sick.getDia());
            pstmt.setString(5, sick.getDoctor());
            pstmt.setString(6, sick.getSection());
            pstmt.setString(7, sick.getRoom());
            if(pstmt.executeUpdate() != 0){
                return true;
            }
            return false;
        }catch (Exception e){
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

    public List showPaitents(Sick sick){
        List list = new ArrayList();
        try{
            pstmt = conn.prepareStatement("SELECT * FROM SICK WHERE \"name\"=? OR \"id\"=? OR \"age\"=? OR \"sex\"=? OR \"dia\"=? OR \"doctor\"=? OR \"section\"=? OR \"room\"=?");
            pstmt.setString(1, sick.getName());
            pstmt.setInt(2, sick.getId());
            pstmt.setInt(3, sick.getAge());
            pstmt.setString(4, sick.getSex());
            pstmt.setString(5, sick.getDia());
            pstmt.setString(6, sick.getDoctor());
            pstmt.setString(7, sick.getSection());
            pstmt.setString(8, sick.getRoom());
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                Sick s = new Sick();
                s.setName(rs.getString(1));
                s.setId(rs.getInt(2));
                s.setAge(rs.getInt(3));
                s.setSex(rs.getString(4));
                s.setDia(rs.getString(5));
                s.setDoctor(rs.getString(6));
                s.setSection(rs.getString(7));
                s.setRoom(rs.getString(8));
                list.add(s);
            }
            return list;
        }catch (Exception e){
            e.printStackTrace();
            return null;
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

    public PaitentInfo getPaitentInfoByName(String name){
        try{
            pstmt = conn.prepareStatement("SELECT * FROM SICK WHERE \"name\"=?");
            pstmt.setString(1, name);
            ResultSet rs = pstmt.executeQuery();
            if(!rs.next()){
                return null;
            }
            rs.close();
            rs = null;
            pstmt.close();
            pstmt = null;
            CallableStatement stmt = null;
            stmt = conn.prepareCall("{call PAITENTINFORMATION(?,?)}");
            stmt.setString(1, name);
            stmt.registerOutParameter(2, Types.NVARCHAR);
            stmt.execute();
            String infomation = stmt.getNString(2);
            String []info = infomation.split("-");
            PaitentInfo paitentInfo = new PaitentInfo();
            paitentInfo.name = info[0];
            paitentInfo.section = info[1];
            paitentInfo.roomID = info[2];
            paitentInfo.tel = Integer.parseInt(info[3]);
            paitentInfo.address = info[4];
            paitentInfo.dir = info[5];
            return paitentInfo;
        }catch (Exception e){
            e.printStackTrace();
            return null;
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

    public boolean addPaitent(Sick sick){
        try{
            pstmt = conn.prepareStatement("SELECT * FROM SICK WHERE \"id\" = ?");
            pstmt.setInt(1, sick.getId());
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                return false;
            }else{
                String sql = "INSERT INTO SICK VALUES('" + sick.getName() + "'," + sick.getId() + "," + sick.getAge() + ",'" + sick.getSex() + "','" + sick.getDia() + "','" + sick.getDoctor() + "','" + sick.getSection() + "','" + sick.getRoom() + "')";
                Statement st = conn.createStatement();
                st.execute(sql);
                if(st != null){
                    st.close();
                    st = null;
                }
                return true;
            }
        }catch (Exception e){
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

    public boolean delPaitent(int id){
        try{
            pstmt = conn.prepareStatement("DELETE FROM SICK WHERE \"id\" = ?");
            pstmt.setInt(1, id);
            if(pstmt.executeUpdate() != 0){
                return true;
            }
            return false;
        }catch (Exception e){
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

    public Sick getPaitentById(int id){
        try{
            pstmt = conn.prepareStatement("SELECT * FROM SICK WHERE \"id\"=?");
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Sick s = new Sick();
                s.setName(rs.getString(1));
                s.setId(rs.getInt(2));
                s.setAge(rs.getInt(3));
                s.setSex(rs.getString(4));
                s.setDia(rs.getString(5));
                s.setDoctor(rs.getString(6));
                s.setSection(rs.getString(7));
                s.setRoom(rs.getString(8));

                return s;
            }
        }catch (Exception e){
            e.printStackTrace();
            return null;
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
        return null;
    }

    public int getPaitentID(){
        try {
            pstmt = conn.prepareStatement("SELECT MAX(\"id\") FROM \"SCOTT\".\"SICK\"");
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                int id = rs.getInt(1);
                return id;
            }
            return 0;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
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
}
