package model;

/**
 * Created by Rengar on 2017/10/25.
 */
public class Sick {
    private String name;
    private int id;
    private int age;
    private String sex;
    private String dia;
    private String doctor;
    private String section;
    private String room;

    public void setName(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public int getAge() {
        return age;
    }

    public String getSex() {
        return sex;
    }

    public String getDia() {
        return dia;
    }

    public String getDoctor() {
        return doctor;
    }

    public String getSection() {
        return section;
    }

    public String getRoom() {
        return room;
    }
}
