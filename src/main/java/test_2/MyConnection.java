package test_2;

import com.sun.org.apache.bcel.internal.generic.NEW;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
    private String connectionString = "jdbc:mysql://127.0.0.1";
    private String name = "root";
    private String password = "Glory.0808";

    private static final MyConnection MY_CONNECTION = new MyConnection();
    public MyConnection() {
    }

    public MyConnection(String connectionString, String name, String password) {
        this.connectionString = connectionString;
        this.name = name;
        this.password = password;
    }

    private static Connection connection = null;

    public Connection getConnection() {
        if (connection != null) {
            connection = null;
        }
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionString, name, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static MyConnection getInstance() {
        return MY_CONNECTION;
    }
}
