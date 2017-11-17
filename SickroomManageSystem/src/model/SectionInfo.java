package model;

public class SectionInfo {
    public String roomID;
    public String doctor;
    public int bedNum;

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }

    public void setBedNum(int bedNum) {
        this.bedNum = bedNum;
    }

    public String getRoomID() {
        return roomID;
    }

    public String getDoctor() {
        return doctor;
    }

    public int getBedNum() {
        return bedNum;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        SectionInfo info = (SectionInfo) obj;
        if (roomID.equals(info.roomID))
            return true;
        return false;
    }
}
