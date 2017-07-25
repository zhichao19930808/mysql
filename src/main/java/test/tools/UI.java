package test.tools;

import test.entity.Account;

import java.util.Scanner;

public class UI {
    private static Scanner scanner = new Scanner(System.in);
    private static void message(String message) {
        System.out.println(message);
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
}
