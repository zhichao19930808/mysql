package test_2;

import java.sql.*;
import java.util.Scanner;

public class DbHlper {
    private static Connection connection = MyConnection.getInstance().getConnection();

    public static void next() {
        System.out.println("请选择操作：\n1,添加\t2,查看");
        Scanner scanner = new Scanner(System.in);
        int i = scanner.nextInt();
        switch (i) {
            case 1:
                addStudent();
                break;
            case 2:
                selJavaTo100();
                break;
                default:
                    System.out.println("输入有误");
                    break;
        }
    }

    public static void addStudent() {
        Students student= new Students();
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入姓名：");
        student.setStuName(scanner.next());
        System.out.println("班级：");
        student.setStuClass(scanner.next());

        add(student);
    }
    public static void add(Students students) {
        String sql1= "insert into db_students.students(stuName,stuClass) values(?,?)";
        String sql2= "insert into db_students.mark(stuId,Java,MySQL,Oracle) values(?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql1);
            statement.setString(1,students.getStuName());
            statement.setString(2,students.getStuClass());
            PreparedStatement statement1 = connection.prepareStatement(sql2);
            Scanner scanner = new Scanner(System.in);
            System.out.println("java:");
            students.setJava(scanner.nextInt());
            System.out.println("mysql:");
            students.setMySQL(scanner.nextInt());
            System.out.println("oracle:");
            students.setOracle(scanner.nextInt());
            System.out.println("学生的id：...(没办法，跳不过去)");
            int id = scanner.nextInt();
            statement1.setInt(1,id);
            statement1.setInt(2,students.getJava());
            statement1.setInt(3,students.getMySQL());
            statement1.setInt(4,students.getOracle());
            int i = statement.executeUpdate();
            int j = statement1.executeUpdate();
            if (i>0 &&j>0) {
                System.out.println("添加成功");
            } else {
                System.out.println("添加失败");
            }
            scanner.close();
            statement.close();
            statement1.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void selJavaTo100() {
        String sql1 = "SELECT st.stuName,st.stuClass,mk.Java\n" +
                "FROM db_students.students st INNER JOIN db_students.mark mk\n" +
                "ON st.stuId=mk.stuId\n" +
                "WHERE mk.Java = 100;";
        String sql2 = "SELECT st.stuName,st.stuClass,mk.Oracle\n" +
                "FROM db_students.students st INNER JOIN db_students.mark mk\n" +
                "ON st.stuId=mk.stuId\n" +
                "WHERE mk.Oracle<60";
        try {
            Statement statement = connection.createStatement();
            Scanner scanner = new Scanner(System.in);
            System.out.println("输入：1,java为100的学生\t2,查看Oracle小于60的学生");
            int i = scanner.nextInt();
            ResultSet resultSet;
            switch (i) {
                case 1:
                    resultSet = statement.executeQuery(sql1);
                    System.out.println(resultSet);
                    break;
                case 2:
                    resultSet = statement.executeQuery(sql2);
                    System.out.println(resultSet);
                    break;
                default:
                        System.out.println("输入有误");
                        break;
            }
            scanner.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
