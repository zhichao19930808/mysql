SELECT ENAME,COMM
FROM scott.emp
WHERE ENAME='allen' OR ENAME='ward';
# ---------------------------------------------------------------------------------------------------------------
START TRANSACTION ;-- 开启一次事务

UPDATE scott.emp    -- DML 语句 insert update delete
SET COMM = COMM+100
WHERE ENAME ='allen';

UPDATE scott.emp
SET COMM = COMM-100
WHERE ENAME ='ward';

ROLLBACK ; -- 回滚 ；
COMMIT ;-- 提交；

SELECT ENAME,COMM
FROM scott.emp
WHERE ENAME='allen' OR ENAME='ward';
# -------------------------------------------------------------------------------------------
START TRANSACTION ;-- 开启一次事务

SELECT *
FROM scott.emp;-- DQL 语句与事务无关

UPDATE scott.emp
    SET ENAME ='张三'
WHERE EMPNO='7499';

SAVEPOINT a;      -- SAVEPOINT save_point_name; -- 设置保留点

DELETE FROM scott.emp
    WHERE ENAME='张三';

SAVEPOINT b;       -- SAVEPOINT save_point_name; -- 设置保留点

INSERT INTO scott.emp (EMPNO, ENAME)
VALUES (1234, '李四');

SAVEPOINT c;       -- SAVEPOINT save_point_name; -- 设置保留点

DELETE FROM scott.emp;

ROLLBACK TO a;     -- ROLLBACK TO save_point_name; -- 回滚到保留点，不能结束事务
ROLLBACK ;
COMMIT ;

SELECT *
FROM scott.emp;
# ----------------------------------------------------------------------------------------------
START TRANSACTION ;

SELECT *
FROM scott.emp;

UPDATE scott.emp    -- DML 语句 insert update delete
SET COMM = COMM-100
WHERE ENAME ='allen';

UPDATE scott.emp
SET COMM = COMM+100
WHERE ENAME ='ward';

SELECT *
FROM scott.emp;

CREATE VIEW scott.test  -- DDL 语句 隐式结束事务
    AS
    SELECT *
    FROM scott.emp;

SELECT *
FROM scott.emp;

ROLLBACK ;
SELECT *
FROM scott.emp;
/*
. DTL

Data Transaction Language
在数据库系统中，一个事务是指：由一系列数据库操作组成的一个完整的逻辑过程
事务的 ACID 特性
原子性 Atomicity [ˌætəm'ɪsɪti]
一个事务 transaction 中的所有操作，要么全部完成，要么全部不完成，不会结束在中间某个环节
一致性 Consistency
在事务开始之前和事务结束以后，数据库的完整性没有被破坏
隔离性 Isolation
数据库允许多个并发事务对其数据进行读写和修改的能力，隔离性可以防止多个事务并发执行时由于交叉执行而导致数据的不一致
持久性 Durability
事务处理结束后，对数据的修改就是永久的，即便系统故障也不会丢失
开启一次事务
START TRANSACTION;
事务处理语句
DML 语句 insert update delete
DQL 语句与事务无关
显式结束事务
COMMIT; 提交
ROLLBACK; 回滚
隐式结束事务
DDL 语句
事务保留点
SAVEPOINT save_point_name; -- 设置保留点
ROLLBACK TO save_point_name; -- 回滚到保留点，不能结束事务
SET AUTOCOMMIT = 0;
SET AUTOCOMMIT = 1;
 */