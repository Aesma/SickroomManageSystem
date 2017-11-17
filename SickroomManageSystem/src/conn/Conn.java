package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Rengar on 2017/10/25.
 */
public class Conn {

    private static final String driver = "oracle.jdbc.driver.OracleDriver";
    private static final String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
    private static final String user = "scott";
    private static final String password = "123456";

    private static Connection conn = null;

    static {
        try{
            Class.forName(driver);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static Connection getConn(){
        if(conn == null){
            try {
                conn = DriverManager.getConnection(url, user, password);
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return conn;
    }

}
