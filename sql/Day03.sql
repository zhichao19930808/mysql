SHOW DATABASES; -- 查看所有库
USE db_1702; -- 进入db_1702库
SHOW TABLES; -- 查看当前库的所有表

SHOW FULL COLUMNS FROM t_student; -- 查看t_student表的所有列
SHOW FULL COLUMNS FROM course;
SHOW FULL COLUMNS FROM student_course;

SELECT *
FROM t_student; -- 查看t_student表中的内容
SELECT *
FROM course;
SELECT *
FROM student_course;

TRUNCATE TABLE db_1702.student_course; -- 切除表student_course

DELETE FROM course
WHERE id > 2; -- 删除course表中id>2的行

-- 选课表 学生 <-> 课程
DROP TABLE IF EXISTS db_1702.student_course; -- 删除表student_course,如果存在的话
CREATE TABLE db_1702.student_course (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id pk',
  studentid INT COMMENT '学生 id',
  courseid    INT COMMENT '课程 id',
  score     INT COMMENT '考试成绩'
);
-- alter 改变\ ['ɔːltə\;\ 'ɒl-]    DDL
ALTER TABLE db_1702.student_course-- 改变student_course表
  ADD CONSTRAINT -- 增加约束
  fk_student_course_studentId -- 起个别名
FOREIGN KEY (studentid)-- 约束的列是 studentid
REFERENCES db_1702.t_student (id);-- 参考 t_student的主键（id）

ALTER TABLE db_1702.student_course
  ADD CONSTRAINT
  fk_student_course_courseId
FOREIGN KEY (courseid)
REFERENCES db_1702.course (id);

SHOW FULL COLUMNS FROM db_1702.student_course;

SELECT *
FROM student_course;

SELECT *
FROM db_1702.t_student;

SELECT *
FROM db_1702.course;
INSERT INTO db_1702.student_course
VALUES (NULL, 4, 1, NULL);

INSERT INTO db_1702.student_course
VALUES (NULL, 4, 2, NULL);

INSERT INTO db_1702.student_course
VALUES (NULL, 4, 3, NULL);-- 第三个参数 3 错误，因为course表的id没有3

INSERT INTO db_1702.student_course
VALUES (NULL, 5, 2, NULL);-- 第二个参数 5 错误，因为t_student表的id没有5





