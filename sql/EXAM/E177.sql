
DROP DATABASE IF EXISTS db_E177;
CREATE DATABASE db_E177;
# 1,创建student和score表
DROP TABLE IF EXISTS db_E177.student;
CREATE TABLE db_E177.student(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'pk id',
  name VARCHAR(255) NOT NULL COMMENT '姓名',
  gender CHAR NOT NULL COMMENT '性别',
  dob DATE NOT NULL COMMENT '出生日期',
  department VARCHAR(255) COMMENT '系名称',
  address VARCHAR(255)COMMENT '住址'
)COMMENT '学生表';

DROP TABLE IF EXISTS db_E177.Score;
CREATE TABLE db_E177.score(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'pk id',
  studentID INT COMMENT 'fk id ',
  course VARCHAR(255) COMMENT '课程名',
  grade VARCHAR(255) COMMENT '成绩'
)COMMENT '成绩表';

# 2,创建合理的外键关联
ALTER TABLE db_E177.score
    ADD CONSTRAINT
score_fk_studentID
FOREIGN KEY (studentID)
  REFERENCES db_E177.student(id);
# 3,为student表和score表各增加5条记录
INSERT INTO db_E177.student (name, gender, dob, department, address) VALUES ('张三', '男', '1997-02-08', '计算机', '山西');
INSERT INTO db_E177.student (name, gender, dob, department, address) VALUES ('李四', '男', '1993-07-28', '计算机', '湖南');
INSERT INTO db_E177.student (name, gender, dob, department, address) VALUES ('王五', '男', '1995-09-22', '电子系', '湖南');
INSERT INTO db_E177.student (name, gender, dob, department, address) VALUES ('马六', '男', '1996-05-30', '电子系', '山西');
INSERT INTO db_E177.student (name, gender, dob, department, address) VALUES ('小花', '女', '1993-12-01', '计算机', '山西');

INSERT INTO db_E177.score (studentID, course, grade) VALUES (1, 'java', '90');
INSERT INTO db_E177.score (studentID, course, grade) VALUES (1, 'english', '87');
INSERT INTO db_E177.score (studentID, course, grade) VALUES (3, 'java', '95');
INSERT INTO db_E177.score (studentID, course, grade) VALUES (4, 'java', '68');
INSERT INTO db_E177.score (studentID, course, grade) VALUES (5, 'java', '83');
INSERT INTO db_E177.score (studentID, course, grade) VALUES (2, 'english', '93');

# 4,查询student表的所有记录
SELECT *
FROM db_E177.student;
# 5,查询student表的第2条到4条记录
SELECT *
FROM db_E177.student
LIMIT 1,3;
# 6,从student表查询所有学生的学号（id）、姓名（name）和院系（department）的信息
SELECT id,name,department
FROM db_E177.student;
# 7,从student表中查询计算机系和电子系的学生的信息
SELECT *
FROM db_E177.student
WHERE department ='计算机' OR department='电子系';
# 8,从student表中查询年龄18~22岁的学生信息
SELECT *
FROM db_E177.student
WHERE left(dob,4)>1995 AND left(dob,4)<1999;
# 9,从student表中查询每个院系有多少人-------------------------------------------------------------------
SELECT
  department,
  count(*) sum
FROM db_E177.student
GROUP BY department;
# 10,从score表中查询每个科目的最高分
SELECT *
FROM db_E177.score
WHERE course='java'
ORDER BY grade DESC LIMIT 1;
SELECT *
FROM db_E177.score
WHERE course='english'
ORDER BY grade DESC LIMIT 1;
# 11,查询李四的考试科目（c_name）和考试成绩（grade）
SELECT st.name,sc.course, sc.grade
FROM db_E177.student st INNER JOIN db_E177.score sc
ON st.id = sc.studentID
WHERE st.name='李四';
# 12，用连接的方式查询所有学生的信息和考试信息
SELECT *
FROM db_E177.student st INNER JOIN db_E177.score sc
ON st.id = sc.studentID;
# 13,计算每个学生的总成绩-------------------------------------------------
# 计算每个考试科目的平均成绩----------------------------------------------
# 15,查询计算机成绩低于95的学生信息
SELECT *
FROM db_E177.student st INNER JOIN db_E177.score sc
ON st.id = sc.studentID
WHERE st.department='计算机'AND sc.grade<95;
# 16,查询同时参加计算机和英语考试的学生的信息-------------------------------
# 17,将计算机考试成绩按从高到低进行排序
SELECT st.name,st.department,sc.course,sc.grade
FROM db_E177.student st INNER JOIN db_E177.score sc
    ON st.id = sc.studentID
WHERE st.department='计算机'
ORDER BY grade DESC ;
# 18,从student表和score表中查询出学生的学号，然后合并查询结果
SELECT *
FROM db_E177.student st INNER JOIN db_E177.score sc
    ON st.id = sc.studentID;
# 19,查询姓张或者姓王的同学的姓名、院系和考试科目及成绩;
SELECT st.name,st.department,sc.course,sc.grade
FROM db_E177.student st INNER JOIN db_E177.score sc
    ON st.id = sc.studentID
WHERE st.name LIKE '张%' OR st.name LIKE '王%';
# 20,查询都是湖南的学生的姓名、年龄、院系和考试科目及成绩
SELECT st.name,st.address, st.department,sc.course,sc.grade
FROM db_E177.student st INNER JOIN db_E177.score sc
    ON st.id = sc.studentID
WHERE st.address='湖南';
SELECT *
FROM db_E177.student;