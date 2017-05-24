import com.mysql.jdbc.Driver;

import java.sql.*;

/**
 * Created by Administrator on 2017/5/23.
 * 烦
 */
public class IpTest {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/";
    private static final String USER = "root";
    private static final String PASSWORD = "glory.0808";
    private static final String SQL = "SELECT count(*) FROM db_1702.ip WHERE geo RLIKE ?";
    public static void main(String[] args) throws SQLException {
        new Driver();
        Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);
        preparedStatement.setString(1,"拉萨市");
        ResultSet resultSet =preparedStatement.executeQuery();
        resultSet.next();
        System.out.println(resultSet.getInt(1));

        resultSet.close();
        preparedStatement.close();
        connection.close();

    }
}
