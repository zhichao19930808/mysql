/*
一个学生选课系统的数据库 db_exam，包含以下库表：
student 学生表
id
name
age
gender
dob
departmentId

department 系别表
id
title 系名称
tel

course 课程表
id
title 课程名称
credit 学分

student_course 选课表
id
studentId
departmentId
grade 考试成绩
 */

SHOW DATABASES; -- 查看所有库

DROP DATABASE IF EXISTS db_exam; -- 删除库db_exam

CREATE DATABASE db_exam; -- 创建库
SHOW DATABASES; -- 查看库列表
#student 学生表 id name age gender dob departmentId

CREATE TABLE db_exam.student (
  id           INT AUTO_INCREMENT PRIMARY KEY  -- 创建 student表
  COMMENT 'ID PK',
  name         VARCHAR(255) COMMENT '姓名',
  age          INT COMMENT '年龄',
  gender       CHAR COMMENT '性别',
  dob          DATE COMMENT '出生日期',
  departmentID INT COMMENT '部门编号'
);
SELECT *
FROM db_exam.student;
#    department 系别表   id   title 系名称   tel
CREATE TABLE db_exam.department (-- 创建 系别表
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id pk',
  title VARCHAR(255) COMMENT '系名称',
  tel   INT COMMENT '电话'
);
SELECT *
FROM db_exam.department;

#  course 课程表 id   title 课程名称   credit 学分
CREATE TABLE db_exam.course (-- 创建 课程表 表
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id pk',
  title  VARCHAR(255) COMMENT '课程表名称',
  credit INT COMMENT '学分'
);
SELECT *
FROM db_exam.course;
#      student_course 选课表     id     studentId     courseId     grade 考试成绩

CREATE TABLE db_exam.student_course (-- 创建选课表 表
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id pk',
  studentId INT COMMENT '学生id',
  courseId  INT COMMENT '系别id',
  grade     INT COMMENT '考试成绩'
);
SELECT *
FROM db_exam.student_course;
USE db_exam;
SHOW TABLES ;

/*
1,使用合理的数据类型、约束和规范的语句创建以上各表（40分）
2,写出查询各表字段注释、各表名注释的语句 (10分)
3,为存在关联的表追加合理的外键（10分）
4,为各表添加 5 条样本数据（10分）
5,修改选课表 grade 字段，改名为 score（10分）
6,查询所有姓王的学生（10分）
7,删除各表，删除数据库（10分）
*/
# 3,为存在关联的表追加合理的外键（10分）
ALTER TABLE db_exam.student -- 为student 添加外键
  ADD CONSTRAINT
  fk_student_course_departmentID
FOREIGN KEY (departmentID)
REFERENCES db_exam.department (id);

ALTER TABLE db_exam.student_course -- 为student_course 添加外键
  ADD CONSTRAINT
  fk_student_course_studentId
FOREIGN KEY (studentId)
REFERENCES db_exam.student (id);


ALTER TABLE db_exam.student_course -- 为student_course 添加外键
  ADD CONSTRAINT
  fk_student_course_courseId
FOREIGN KEY (courseId)
REFERENCES db_exam.course (id);


# 4,为各表添加 5 条样本数据（10分）

# 为系增加5条数据
INSERT INTO db_exam.department VALUES (NULL, 'JavaSE', 100001);
INSERT INTO db_exam.department VALUES (NULL, 'HTML', 100002);
INSERT INTO db_exam.department VALUES (NULL, 'CSS', 100003);
INSERT INTO db_exam.department VALUES (NULL, 'JavaScript', 100004);
INSERT INTO db_exam.department VALUES (NULL, 'MYSQL', 100005);
SELECT *
FROM db_exam.department;

# 为学生添加5个数据
DELETE FROM db_exam.student;
SELECT *
FROM db_exam.student;
INSERT INTO db_exam.student VALUES (NULL ,'张三',25,'男','1993-01-01',1);
INSERT INTO db_exam.student VALUES (NULL ,'李四',25,'男','1993-02-02',2);
INSERT INTO db_exam.student VALUES (NULL ,'王五',25,'男','1993-02-02',2);
INSERT INTO db_exam.student VALUES (NULL ,'小蛮',23,'女','1995-06-07',5);
INSERT INTO db_exam.student VALUES (NULL ,'马六',25,'男','1993-02-02',5);

# 为课程表添加5个数据
INSERT INTO db_exam.course VALUES (NULL ,'教你如何面试',3);
INSERT INTO db_exam.course VALUES (NULL ,'太极拳',2);
INSERT INTO db_exam.course VALUES (NULL ,'面试官的心理',3);
INSERT INTO db_exam.course VALUES (NULL ,'钢铁是怎样炼成的',4);
INSERT INTO db_exam.course VALUES (NULL ,'如何快速进入工作状态',4);
SELECT *
FROM db_exam.course;

# 为选课表添加5个数据
INSERT INTO db_exam.student_course VALUES (NULL, 3, 1, 3);
INSERT INTO db_exam.student_course VALUES (NULL, 4, 1, 3);
INSERT INTO db_exam.student_course VALUES (NULL, 5, 5, 4);
INSERT INTO db_exam.student_course VALUES (NULL, 6, 1, 3);
INSERT INTO db_exam.student_course VALUES (NULL, 7, 3, 3);
SELECT *
FROM db_exam.student_course;


# 5,修改选课表 grade 字段，改名为 score（10分）
ALTER TABLE db_exam.student_course
    CHANGE grade score INT;

SELECT *
FROM db_exam.student_course;


# 6,查询所有姓王的学生（10分）
SELECT name
FROM db_exam.student
WHERE name LIKE '王%';
# 7,删除各表，删除数据库（10分）
-- 删除各表
USE db_exam;
DROP TABLE db_exam.student_course;
DROP TABLE db_exam.course;
DROP TABLE db_exam.student;
DROP TABLE db_exam.department;
SHOW TABLES ;
DROP DATABASE db_exam;

/*
完事 收功
 */




