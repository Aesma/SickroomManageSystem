package service;

import conn.Conn;
import model.Nurse;
import model.NurseInfo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Rengar on 2017/10/25.
 */
public class NurseService {
    private Connection conn;
    private PreparedStatement pstmt;

    public NurseService(){
        try{
            conn = Conn.getConn();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List getAllNurse(){
        List list = new ArrayList();
        try{
            pstmt = conn.prepareStatement("SELECT * FROM NURSE");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Nurse nurse = new Nurse();
                nurse.setName(rs.getString(1));
                nurse.setTitle(rs.getString(2));
                nurse.setSection(rs.getString(3));
                nurse.setAge(rs.getInt(4));

                list.add(nurse);
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

    public boolean addNurse(Nurse nurse){
        try{
            pstmt = conn.prepareStatement("SELECT * FROM NURSE WHERE \"name\" = ?");
            pstmt.setString(1, nurse.getName());
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                return false;
            }else {
                String sql = "INSERT INTO NURSE VALUES('" + nurse.getName() + "','" + nurse.getTitle() + "','" + nurse.getSection() + "'," + nurse.getAge() + ")";
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

    public boolean delNurse(String name){
        try{
            pstmt = conn.prepareStatement("DELETE FROM NURSE WHERE \"name\" = ?");
            pstmt.setString(1, name);
            if(pstmt.executeUpdate() != 0){
                return true;
            }
            return false;
        }catch (Exception e) {
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

    public boolean updateNurse(Nurse nurse){
        try{
            pstmt = conn.prepareStatement("UPDATE NURSE SET \"title\" = ?, \"section\" = ?, \"age\" = ? WHERE \"name\" = ?");
            pstmt.setString(1, nurse.getTitle());
            pstmt.setString(2, nurse.getSection());
            pstmt.setInt(3, nurse.getAge());
            pstmt.setString(4, nurse.getName());
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

    public List getNurseInfoByName(String name){
        List list = new ArrayList();
        try{
            pstmt = conn.prepareStatement("SELECT * FROM NURSE WHERE \"name\"=?");
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
            stmt = conn.prepareCall("{call DOCTORINFORMATION(?,?)}");
            stmt.setString(1, name);
            stmt.registerOutParameter(2, Types.NVARCHAR);
            stmt.execute();
            String infomation = stmt.   getNString(2);
            String []docinfos = infomation.split("\\|");
            for(String docinfo: docinfos){
                String []info = docinfo.split("-");
                if(info.length == 4) {
                    NurseInfo nurseInfo = new NurseInfo();
                    nurseInfo.name = name;
                    nurseInfo.section = info[1];
                    nurseInfo.title = info[2];
                    nurseInfo.paitent = info[3];
                    list.add(nurseInfo);
                }else if(info.length == 3){
                    NurseInfo nurseInfo = new NurseInfo();
                    nurseInfo.name = name;
                    nurseInfo.section = info[1];
                    nurseInfo.title = info[2];
                    nurseInfo.paitent = "";
                    list.add(nurseInfo);
                }
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

    public List showDoc(Nurse nurse){
        List list = new ArrayList();
        try{
            pstmt = conn.prepareStatement("SELECT * FROM NURSE WHERE \"name\"=? OR \"title\"=? OR \"section\"=? OR \"age\"=?");
            pstmt.setString(1, nurse.getName());
            pstmt.setString(2, nurse.getTitle());
            pstmt.setString(3, nurse.getSection());
            pstmt.setInt(4, nurse.getAge());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Nurse nr = new Nurse();
                nr.setName(rs.getString(1));
                nr.setTitle(rs.getString(2));
                nr.setSection(rs.getString(3));
                nr.setAge(rs.getShort(4));
                list.add(nr);
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

    public Nurse getDoctorByName(String name){
        try{
            pstmt = conn.prepareStatement("SELECT * FROM NURSE WHERE \"name\"=?");
            pstmt.setString(1, name);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Nurse nurse = new Nurse();
                nurse.setName(rs.getString(1));
                nurse.setTitle(rs.getString(2));
                nurse.setSection(rs.getString(3));
                nurse.setAge(rs.getInt(4));
                return nurse;
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

    public List getAllDoctorName(){
        List list = new ArrayList();
        try {
            pstmt = conn.prepareStatement("SELECT \"name\" FROM NURSE");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                String name = rs.getString(1);
                list.add(name);
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

    public boolean checkSection(Nurse nurse){
        if(nurse == null){
            return false;
        }
        if(nurse.getName() == null || nurse.getSection() == null){
            return false;
        }
        try{
            pstmt = conn.prepareStatement("SELECT \"section\" FROM NURSE WHERE \"name\"=?");
            pstmt.setString(1, nurse.getName());
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                String section = rs.getString(1);
                if (section.equals(nurse.getSection())){
                    return true;
                }
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
}
