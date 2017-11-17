package model;

/**
 * Created by Rengar on 2017/6/3.
 */
public class User {
    private String username;
    private String password;

    public User() {
        username = "";
        password = "";
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public void setPassword(String password) {

        this.password = password;
    }

    public void setUsername(String username) {

        this.username = username;
    }

    public String getPassword() {

        return password;
    }

    public String getUsername() {

        return username;
    }
}
