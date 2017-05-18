SHOW DATABASES ;
USE db_1702;
SHOW TABLES ;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS student_course;
SELECT *
FROM db_1702.t_student;

TRUNCATE TABLE db_1702.t_student;
-- 1.添加一条内容
INSERT INTO db_1702.t_student VALUES (NULL ,'子豪','男',20,1.8,60.5,'2017-02-01',1999.88,'这家伙很高');-- 插入一条完整的行
INSERT INTO db_1702.t_student(name) -- 插入一行的一个对应的列
    VALUES ('一行');
INSERT INTO db_1702.t_student(name,gender) -- 插入多行的对应的多个列
    VALUES ('张三','男'),('李四','男'),('王五','男'),('马六','男');
SHOW CREATE TABLE db_1702.t_student;


-- 2.更新表中的内容
SELECT *
FROM db_1702.t_student ;

UPDATE db_1702.t_student -- 将 price列的值更新为 1999.88;
    SET price = 1999.88;
UPDATE db_1702.t_student -- 将 id=6的行的price列的值更新为1000.00
    SET price = 1000.00
WHERE id = 6;
UPDATE db_1702.t_student
SET age = 20, height = 1.75, intro = '这家伙66的'
WHERE id = 6;
SELECT *
FROM t_student;


-- 删除表中的内容
DELETE FROM t_student -- 删除id=4 的行
WHERE id = 4;
DELETE FROM t_student -- 删除 name = 马六 的行
WHERE name = '马六';
DELETE FROM t_student -- 删除 height = null 的行
WHERE height IS NULL ;
DELETE FROM t_student -- 删除 age 在19~21之间的行
WHERE age BETWEEN 19 AND 21;
DELETE FROM t_student;-- 删除 t_student 表的所有内容
SELECT *
FROM t_student;