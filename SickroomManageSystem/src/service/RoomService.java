package service;

import conn.Conn;
import model.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Rengar on 2017/10/25.
 */
public class RoomService {
    private Connection conn;
    private PreparedStatement pstmt;

    public RoomService() {
        try{
            conn = Conn.getConn();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List getAllRoom(){
        List list = new ArrayList();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM ROOM");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Room room = new Room();
                room.setId(rs.getString(1));
                room.setNumber(rs.getInt(2));
                room.setSection(rs.getString(3));
                list.add(room);
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

    public boolean addRoomBed(Room room){
        try{
            pstmt = conn.prepareStatement("SELECT * FROM ROOM WHERE \"id\" = ?");
            pstmt.setString(1, room.getId());
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                return false;
            }else{
                String sql = "INSERT INTO ROOM VALUES('" + room.getId() + "'," + room.getNumber() + ",'" + room.getSection() + "')";
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

    public boolean checkSection(Room room){
        if(room == null){
            return false;
        }
        if(room.getId() == null || room.getId().length() != 5){
            return false;
        }
        if(room.getSection() == null) {
            return false;
        }
        try{
            String roomID = room.getId().substring(0, 3);
            pstmt = conn.prepareStatement("SELECT * FROM ROOM WHERE SUBSTR(\"id\",0,3)=?");
            pstmt.setString(1, roomID);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                if(!rs.getString(3).equals(room.getSection())){
                    return false;
                }else if(rs.getString(3).equals("")){
                    return true;
                }else {
                    return true;
                }
            }else {
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

    public List showRoom(Room room){
        List list = new ArrayList();
        try{
            pstmt = conn.prepareStatement("SELECT * FROM ROOM WHERE \"id\"=? OR \"number\"=? OR \"section\"=?");
            pstmt.setString(1, room.getId());
            pstmt.setInt(2, room.getNumber());
            pstmt.setString(3, room.getSection());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Room r = new Room();
                r.setId(rs.getString(1));
                r.setNumber(rs.getInt(2));
                r.setSection(rs.getString(3));
                list.add(r);
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
/*
    public Room getRoomById(String id){
        try {
            pstmt = conn.prepareStatement("SELECT * FROM ROOM WHERE \"id\" = ?");
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Room room = new Room();
                room.setId(rs.getString(1));
                room.setNumber(rs.getInt(2));
                room.setSection(rs.getString(3));
                return room;
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
*/
    public List getAllRoomID(){
        List list = new ArrayList();
        try{
            pstmt = conn.prepareStatement("SELECT * FROM SURBEDS");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                String id = rs.getString(1);
                list.add(id);
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
