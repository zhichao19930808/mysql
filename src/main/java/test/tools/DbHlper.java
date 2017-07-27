package test.tools;

import test.entity.Account;

import java.sql.*;

public class DbHlper {
    private  static Connection connection = null;
    //注册的方法
    public static int add(String name,String password) {
        connection = MySQLConnection.getInstance().getConnection();
        String sql = "select * from db_test.user where userName='" + name + "'";
        int i =-1;
        try {
            if (query(connection, sql).next()) {
                i= 0;
            } else {
                i=execsql(connection,name,password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public static ResultSet getByName(String name,String pwd) {
        String sql = "select * from db_test.user where userName='" + name + "' and userPSD='" + pwd + "'";
        connection = MySQLConnection.getInstance().getConnection();
        return query(connection,sql);
    }
    private static int execsql(Connection connection, String name,String password) {
        String sql="insert into db_test.user(userName,userPSD) values(?,?)";
        int i =-1;
            try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,name);
            statement.setString(2,password);
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
