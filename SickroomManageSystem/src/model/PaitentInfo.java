package model;

public class PaitentInfo{
    public String name;
    public String section;
    public String roomID;
    public int tel;
    public String address;
    public String dir;

    public void setName(String name) {
        this.name = name;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getName() {
        return name;
    }

    public String getSection() {
        return section;
    }

    public String getRoomID() {
        return roomID;
    }

    public int getTel() {
        return tel;
    }

    public String getAddress() {
        return address;
    }

    public String getDir() {
        return dir;
    }
}