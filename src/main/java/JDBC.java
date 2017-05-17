import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by mingfei on 5/16/17.
 * JDBC Java Database Connectivity Java 语言数据库连接
 */
public class JDBC {

    private static final String URL = "jdbc:mysql://127.0.0.1:3306/";
    private static final String USER = "root";
    private static final String PASSWORD = "system";
    private static final String SQL = "INSERT INTO db_1702.course VALUES (NULL, 'JS', 2 )";

    // demo.JDBC Java Database Connectivity Java 语言数据库连接
    public static void main(String[] args) throws SQLException {
        // 1. 准备数据库驱动
        new Driver();
        // 2. 取得一次数据库连接
        Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
        // 3. 预编译语句
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);
        // 4. 执行语句
        preparedStatement.executeUpdate();
        // 5. 释放资源
        preparedStatement.close();
        connection.close();
    }
}