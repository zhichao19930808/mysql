package test.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnection {
    //明确要连接的数据库
    private String connectionString = "jdbc:mysql://127.0.0.1";
    private String mysqlName = "root";
    private String password = "Glory.0808";
    private final int DB_Version =1;

    public MySQLConnection() {
    }

    public MySQLConnection(String connectionString, String mysqlName, String password) {
        this.connectionString = connectionString;
        this.mysqlName = mysqlName;
        this.password = password;
    }

    //创建出唯一个一个实例
    private  static  final MySQLConnection MY_SQL_CONNECTION = new MySQLConnection();


    //获取数据库要连接的对象
    Connection connection = null;
    public Connection getConnection() {
        //判断，如果connection不为空，则使其为空
        if (connection != null) {
            connection = null;
        }
        try {
            //通过反射来获取jdbc驱动中的数据,然后为connection赋值
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionString, mysqlName, password);
            //由于MySQL的保护机制，如果连接失败就再连接一次。
            if (connection.isClosed()) {
                connection = DriverManager.getConnection(connectionString, mysqlName, password);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        //将赋值后的connection给出
        return connection;
    }
    //懒汉模式，只会返回唯一一个MySQLConnection的对象
    public static MySQLConnection getInstance() {
        return MY_SQL_CONNECTION;
    }


    //给出get方法

    public String getConnectionString() {
        return connectionString;
    }

    public String getMysqlName() {
        return mysqlName;
    }

    public String getPassword() {
        return password;
    }

    public int getDB_Version() {
        return DB_Version;
    }

}












