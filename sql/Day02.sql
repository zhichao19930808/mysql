SHOW DATABASES ; -- 查询现有的数据库(SHOW DATABASES;返回可用数据库的一个列表。)
DROP DATABASE db_1702;-- 删除名叫db_1702的库
CREATE DATABASE db_1702;-- 建立一个名叫db_1702的库
CREATE TABLE db_1702.t_student(-- 为db_1702库建立一个叫做t_student的表
  id            INT AUTO_INCREMENT PRIMARY KEY COMMENT '学号',-- VARCHAR(M)定义的列的长度为可变长字符串
  name          VARCHAR(4) NOT NULL COMMENT '姓名',-- NOT NULL 非空约束
  gender        CHAR(1)COMMENT '性别',-- CHAR(M)定义的列的长度为固定的
  age           INT UNSIGNED COMMENT '年龄',
  height        DOUBLE(3,2) COMMENT '身高',
  weight        DOUBLE(3,1)COMMENT '体重',
  time          DATE COMMENT '入学时间',
  price         DECIMAL(6,2) COMMENT '学费',
  intro         TEXT COMMENT '简介'
);
#为t_student 表添加一条内容
INSERT INTO db_1702.t_student VALUES (2 ,'郅超 ','男',25,1.71,65.2,'2017-2-1',1998.99,'这个人很帅');
INSERT INTO db_1702.t_student VALUES (3 ,'王帅','男',25,1.71,65.2,'2017-2-1',1998.99,'这个人也很帅');
INSERT INTO db_1702.t_student VALUES (4 ,'张杰','男',25,1.71,65.2,'2017-2-1',1998.99,'这个人不帅');
#查看t_student表
SELECT *
FROM db_1702.t_student;
#查看t_student表的详细信息
SHOW FULL COLUMNS FROM db_1702.t_student;

TRUNCATE TABLE db_1702.t_student;-- 切去db_1702的t_student表中的内容（不走“回收站”）
DELETE FROM db_1702.t_student;-- 切去db_1702的t_student表中的内容（走“回收站”）
#删除id=1或 id=3的两条内容
DELETE FROM db_1702.t_student WHERE id = 1 or id = 3;

#课程表-课程名 学分。。。
#删除db_1702数据库中的course表，如果有的话
DROP TABLE IF EXISTS db_1702.course;
#建立course表
CREATE TABLE db_1702.course(
  id      INT AUTO_INCREMENT PRIMARY KEY COMMENT 'id pk',-- PRIMARY KEY 主键约束
  title   VARCHAR(255) UNIQUE COMMENT '课程名',-- UNIQUE 唯一约束
  creadit INT COMMENT '学分'
);

INSERT INTO db_1702.course VALUES (NULL ,'Java SE',4);
INSERT INTO db_1702.course VALUES (NULL ,'mysql',3);

SELECT *
FROM db_1702.course;

#课程表 学生<->课表
#删除db_1702库中的student_course如果有的话
DROP TABLE IF EXISTS db_1702.student_course;
#建立student_course表
CREATE TABLE db_1702.student_course (
id    INT AUTO_INCREMENT PRIMARY KEY COMMENT 'id pk',
studentId  INT COMMENT '学生 ID',
courseId   INT COMMENT '课程 ID',
score      INT COMMENT '考试成绩'
);

INSERT INTO db_1702.student_course VALUES (NULL, 2, 1, NULL);
INSERT INTO db_1702.student_course VALUES (NULL, 2, 2, NULL);
INSERT INTO db_1702.student_course VALUES (NULL, 3, 1, NULL);

SELECT *
FROM db_1702.student_course;

UPDATE db_1702.student_course
    SET db_1702.student_course.score=75
WHERE id = 2;



