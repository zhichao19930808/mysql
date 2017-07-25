package test.tools;

import test.entity.Account;

import java.sql.*;

public class DbHlper {
    private  static Connection connection = null;
    //注册的方法
    public static int add(Account account) {
        String sql="insert into db_test.user(userName,userPSD) values('"+account.getName()+"','"+account.getPassword()+"')";
        connection = MySQLConnection.getInstance().getConnection();
        return execsql(connection,sql);
    }

    public static ResultSet getByName(String sql) {
        connection = MySQLConnection.getInstance().getConnection();
        return query(connection, sql);
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

    private static ResultSet query(Connection connection,String sql) {
        ResultSet resultSet=null;
        try {
            Statement statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }
}
