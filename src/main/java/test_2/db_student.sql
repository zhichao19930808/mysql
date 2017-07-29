DROP DATABASE IF EXISTS db_students;
CREATE DATABASE db_students;

DROP TABLE IF EXISTS db_students.students;
CREATE TABLE db_students.students (
  stuId    INT PRIMARY KEY AUTO_INCREMENT
  COMMENT 'pk id',
  stuName  VARCHAR(10) NOT NULL
  COMMENT '姓名',
  stuClass VARCHAR(10) COMMENT '班级'
)
  COMMENT '学生表' ;

DROP TABLE IF EXISTS db_students.mark;
CREATE TABLE db_students.mark (
  stuId  INT NOT NULL
  COMMENT '外键',
  Java   INT NOT NULL
  COMMENT 'Java成绩',
  MySQL  INT NOT NULL
  COMMENT 'MySQL成绩',
  Oracle INT NOT NULL
  COMMENT 'oracle成绩'
)
  COMMENT '成绩表';


-- -------------------------------------------------------
ALTER TABLE db_students.mark
  ADD CONSTRAINT
  fk_mark_stuId
FOREIGN KEY (stuId)
REFERENCES db_students.students (stuId);

SELECT st.stuName,st.stuClass,mk.Java
FROM db_students.students st INNER JOIN db_students.mark mk
ON st.stuId=mk.stuId
WHERE mk.Java = 100;
