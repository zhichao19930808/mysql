package test_2;

public class Students {
    private String stuName;
    private String stuClass;
    private int Java;
    private int MySQL;
    private int Oracle;

    public Students() {
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public void setStuClass(String stuClass) {
        this.stuClass = stuClass;
    }

    public void setJava(int java) {
        Java = java;
    }

    public void setMySQL(int mySQL) {
        MySQL = mySQL;
    }

    public void setOracle(int oracle) {
        Oracle = oracle;
    }

    public String getStuName() {
        return stuName;
    }

    public String getStuClass() {
        return stuClass;
    }

    public int getJava() {
        return Java;
    }

    public int getMySQL() {
        return MySQL;
    }

    public int getOracle() {
        return Oracle;
    }
}
