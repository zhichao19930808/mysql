SHOW DATABASES ; -- 查询现有的数据库(SHOW DATABASES;返回可用数据库的一个列表。)
DROP DATABASE db_1702;-- 删除名叫db_1702的库
CREATE DATABASE db_1702;-- 建立一个名叫db_1702的库
CREATE TABLE db_1702.t_student(-- 为db_1702库建立一个叫做t_student的表
  number        INT(10),-- 学号，VARCHAR(M)定义的列的长度为可变长字符串
  name          VARCHAR(4),-- 姓名
  gender        CHAR(1),-- 性别，CHAR(M)定义的列的长度为固定的
  age           INT UNSIGNED,-- 年龄
  height        DOUBLE(3,2),-- 身高
  weight        DOUBLE(3,1),-- 体重
  time          DATE,-- 入学时间
  price         DECIMAL(6,2),-- 学费
  intro         TEXT-- 简介
);
INSERT INTO db_1702.t_student VALUES (11150123,'郅超','男',25,1.71,65.2,'2017-2-1',1998.99,'这个人是个大帅哥');
SELECT *
FROM db_1702.t_student;