package model;


/**
 * Created by Rengar on 2017/10/25.
 */
public class Nurse {
    private String name;
    private String title;
    private String section;
    private int age;

    public void setName(String name) {
        this.name = name;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public String getTitle() {
        return title;
    }

    public String getSection() {
        return section;
    }

    public int getAge() {
        return age;
    }
}
