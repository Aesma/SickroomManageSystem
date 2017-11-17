package model;

/**
 * Created by Rengar on 2017/10/25.
 */
public class Section {
    private String name;
    private String dir;
    private String address;
    private int tel;

    public void setName(String name) {
        this.name = name;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }

    public String getName() {
        return name;
    }

    public String getDir() {
        return dir;
    }

    public String getAddress() {
        return address;
    }

    public int getTel() {
        return tel;
    }
}
