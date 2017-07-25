package test.tools;

import test.entity.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DbHlper {

    //注册的方法
    public static int add(Account account) {
        String sql="insert into db_test.user(userName,userPSD) values('"+account.getName()+"','"+account.getPassword()+"')";
        Connection connection = MySQLConnection.getInstance().getConnection();
        return execsql(connection,sql);
    }

    private static int execsql(Connection connection, String sql) {
        int i =-1;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            i = statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
}
