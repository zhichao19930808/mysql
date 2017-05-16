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

    public static void main(String[] args) throws SQLException {
        // 1. 准备数据库驱动
        new Driver();
        // 2. 取得一次数据库连接
        Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/db_1702", "root", "glory.0808");
        // 3. 预编译语句
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO db_1702.course VALUES (NULL, 'Front-end', 2 )");
        // 4. 执行语句
        preparedStatement.executeUpdate();
    }
}