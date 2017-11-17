package model;

/**
 * Created by Rengar on 2017/10/25.
 */
public class Room {
    private String id;
    private int number;
    private String section;

    public void setId(String id) {
        this.id = id;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getId() {
        return id;
    }

    public int getNumber() {
        return number;
    }

    public String getSection() {
        return section;
    }
}
