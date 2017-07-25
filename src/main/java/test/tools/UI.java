package test.tools;

import test.entity.Account;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class UI {
    private static Scanner scanner = new Scanner(System.in);

    private static void message(String message) {
        System.out.println(message);
    }

    public static void select() {
        System.out.print("1:注册\t2:登陆：\n");
        int i = scanner.nextInt();
        scanner.nextLine();
        switch (i) {
            case 1:
                log();
                break;
            case 2:
                login();
                break;
            default:
                break;
        }
    }

    public static void log() {
        message("请输入要注册的账号：");
        String name = scanner.nextLine();
        message("请输入要注册的密码：");
        String password = scanner.nextLine();
        if (name.trim().length() == 0 && password.length() == 0) {
            message("账号或密码不规范。");
        } else {
            int i = DbHlper.add(new Account(name, password));
            if (i > 0) {
                message("注册成功。");
            } else {
                message("注册失败。");
            }
        }
    }

    public static void login() {
        message("输入账号密码登陆\n请输入账号：");

        String name = scanner.nextLine();
        message("输入密码:");
        String pwd = scanner.nextLine();
        String sql = "select * from db_test.user where userName='" + name + "' and userPSD='" + pwd + "'";
        ResultSet resultSet = DbHlper.getByName(sql);
        if (resultSet != null) {
            try {
                if (resultSet.next()) {
                    message("登陆成功");
                } else {
                    message("登陆失败");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
