SHOW DATABASES;
USE db_1702;
SHOW TABLES;
DROP TABLE IF EXISTS db_1702.alter_test;
CREATE TABLE db_1702.alter_test (
  id  INT  COMMENT 'id pk',
  col VARCHAR(255) COMMENT 'test'
);
SHOW FULL COLUMNS FROM db_1702.alter_test;

# 准备就绪

-- 1,修改表名
ALTER TABLE db_1702.alter_test -- 将 alter_test 的表名修改为alter_study
  RENAME alter_study;
SHOW FULL COLUMNS FROM alter_test;-- 这个表名已经查找不到表了
SHOW FULL COLUMNS FROM alter_study;-- 使用这个表名找到了原先表的详细信息

-- 2,给表内添加一个列
ALTER TABLE db_1702.alter_study -- 为 alter_study 表添加一个列
  ADD COLUMN coll INT;
ALTER TABLE db_1702.alter_study -- 为 alter_study 表添加一个列,位置在 col 后面
  ADD COLUMN colll INT COMMENT '添加' AFTER col;
ALTER TABLE db_1702.alter_study -- 为 alter_study 表添加一个列,位置在第一个
  ADD COLUMN collll INT COMMENT '添加' first ;
SHOW FULL COLUMNS FROM alter_study;

-- 3,删除表内的一条内容
ALTER TABLE db_1702.alter_study -- 删除 alter_study 表内的一个列
    DROP COLUMN  coll;
ALTER TABLE db_1702.alter_study
    DROP COLUMN  colll;
ALTER TABLE db_1702.alter_study
    DROP COLUMN  collll;
SHOW FULL COLUMNS FROM alter_study;

-- 4,更改列的数据类型和位置
ALTER TABLE db_1702.alter_study
    MODIFY COLUMN col VARCHAR(225)  FIRST ;-- 将列从int类型改为varchar类型，并将其位置改为第一个
ALTER TABLE db_1702.alter_study
    MODIFY COLUMN col INT(225)  AFTER id;-- 将列从varchar类型改为int类型，并将其位置改到id后面
SHOW FULL COLUMNS FROM alter_study;

-- 5,更改一个列
ALTER TABLE db_1702.alter_study
    CHANGE col name VARCHAR(255)AFTER id;-- 将col列更名为name，数据类型变为varchar(255),并将其位置放到id后面
SHOW FULL COLUMNS FROM alter_study;

-- 6,


