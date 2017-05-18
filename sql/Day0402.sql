
-- DQL（数据查询语言）


-- MySQL Show /show[ʃəʊ]显现------------------------------------------------------------------
SHOW DATABASES;--  显示服务器中所有的库
USE db_1702;
SHOW TABLES; -- 显示库中所有的表

SHOW TABLE STATUS FROM db_1702; -- 显示库中所有表的状况

SHOW TABLE STATUS WHERE Name = 'ip'; -- 显示库中某个表的状况

SHOW FULL COLUMNS FROM db_1702.ip; -- 显示表中所有列的信息

SHOW FULL TABLES FROM db_1702; -- 显示库中的表和视图

SHOW VARIABLES; -- 显示MYSQL数据库所有的变量

SHOW CREATE TABLE db_1702.ip; -- 显示建表语句

SHOW VARIABLES LIKE 'char%';-- 查看字符集
SHOW VARIABLES LIKE 'coll%';-- 字符集校验



-- SQL select /select[sɪ'lekt] 选择；挑选-------------------------------------------------------
SELECT *
FROM db_1702.ip;-- 查询ip表 所有行，所有列

SELECT min
FROM db_1702.ip; -- 查询ip表 min 列

SELECT min,max
FROM db_1702.ip; -- 查询ip表 min列 和max列（投影操作）

# INSERT INTO db_1702.ip (geo) VALUES ('北京');
SELECT count(*)  -- 查看当前表一共有多少条记录，返回一个记录总的条数
FROM db_1702.ip;

SELECT count(geo)  -- 查看当前列一共有多少条记录，返回一个记录总的条数
FROM db_1702.ip;

-- SQL distinct[dɪ'stɪŋkt] 明显的；清晰的-----------------------------------------------------------
SELECT count(DISTINCT geo)  -- 查看当前列一共有多少条记录，返回一个记录总的条数（不包含重复的条数）
FROM db_1702.ip;
