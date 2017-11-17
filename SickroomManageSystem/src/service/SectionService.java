package service;

import conn.Conn;
import model.Section;
import model.SectionInfo;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * Created by Rengar on 2017/10/25.
 */
public class SectionService {
    private Connection conn;
    private PreparedStatement pstmt;

    public SectionService() {
        try{
            conn = Conn.getConn();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List getAllSections(){
        List list = new ArrayList();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM SECTION");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Section section = new Section();
                section.setName(rs.getString(1));
                section.setDir(rs.getString(2));
                section.setAddress(rs.getString(3));
                section.setTel(rs.getInt(4));
                list.add(section);
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

    public List selectSection(Section section){
        List list = new ArrayList();
        try{
            pstmt = conn.prepareStatement("SELECT * FROM SECTION WHERE \"name\"=? OR \"dir\"=? OR \"address\"=? OR \"tel\"=?");
            pstmt.setString(1, section.getName());
            pstmt.setString(2, section.getDir());
            pstmt.setString(3, section.getAddress());
            pstmt.setInt(4, section.getTel());
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                Section sec = new Section();
                sec.setName(rs.getString(1));
                sec.setDir(rs.getString(2));
                sec.setAddress(rs.getString(3));
                sec.setTel(rs.getInt(4));
                list.add(sec);
            }
            return list;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public boolean addSection(Section section){
        try{
            pstmt = conn.prepareStatement("SELECT * FROM SECTION WHERE \"name\"=?");
            pstmt.setString(1, section.getName());
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                return false;
            }else {
                String sql = "INSERT INTO SECTION VALUES('" + section.getName() + "','" + section.getDir() + "','" + section.getAddress() + "'," + section.getTel() + ")";
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

    public boolean updateSection(Section section){
        try{
            pstmt = conn.prepareStatement("UPDATE SECTION SET \"dir\"=?,\"address\"=?,\"tel\"=? WHERE \"name\"=?");
            pstmt.setString(4, section.getName());
            pstmt.setString(1, section.getDir());
            pstmt.setString(2, section.getAddress());
            pstmt.setInt(3, section.getTel());
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

    public List getSectionInfomationByName(String name){
        List list = new ArrayList();
        try{
            pstmt = conn.prepareStatement("SELECT * FROM SECTION WHERE \"name\"=?");
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
            stmt = conn.prepareCall("{call SECTIONINFORMATION(?,?)}");
            stmt.setString(1, name);
            stmt.registerOutParameter(2, Types.NVARCHAR);
            stmt.execute();
            String infomation = stmt.getNString(2);
            String []infos = infomation.split("\\|");
            for(String sectionInfo: infos){
                String []info = sectionInfo.split("-");
                SectionInfo sectioninfo = new SectionInfo();
                sectioninfo.roomID = info[0];
                sectioninfo.doctor = info[1];
                sectioninfo.bedNum = Integer.parseInt(info[2]);
                list.add(sectioninfo);
            }
            /*HashSet set = new HashSet(list);
            list.clear();
            list.addAll(set);*/
            for  ( int  i  =   0 ; i  <  list.size()  -   1 ; i ++ )  {
                for  ( int  j  =  list.size()  -   1 ; j  >  i; j -- )  {
                    if  (list.get(j).equals(list.get(i)))  {
                        list.remove(j);
                    }
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

    public Section getSectionByName(String name){
        try{
            pstmt = conn.prepareStatement("SELECT * FROM SECTION WHERE \"name\"=?");
            pstmt.setString(1, name);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Section section = new Section();
                section.setName(rs.getString(1));
                section.setDir(rs.getString(2));
                section.setAddress(rs.getString(3));
                section.setTel(rs.getInt(4));

                return section;
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

    public List getAllSectionName(){
        List list = new ArrayList();
        try{
            pstmt = conn.prepareStatement("SELECT \"name\" FROM SECTION");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                String sectionName = rs.getString(1);
                list.add(sectionName);
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
}
