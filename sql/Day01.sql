# 查看当前有多少库
SHOW DATABASES ;
#建立一个库
CREATE DATABASE db_1702;
#删除一个库
DROP DATABASE db_1702;
#使用某个数据库
USE db_1702;
#查看当前库的表
SHOW TABLES ;
#建立一个表
CREATE TABLE t_student (
  sno    VARCHAR(10),
  sname  VARCHAR(10),
  gender CHAR(1),
  age    INT(2)
);
#查询数据库某个表的内容
SELECT *
FROM t_student;
#为表添加一条内容
INSERT INTO t_student
VALUES ('2017001', '张三', '男', '18');

