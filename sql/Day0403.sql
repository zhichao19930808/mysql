-- SQL where  行检索--------------------------------------------------------------------------------------------------------------------------------------
SHOW DATABASES ;

SHOW TABLE STATUS FROM scott;-- 显示 scott库 的情况

SHOW FULL COLUMNS FROM scott.emp; -- 显示 emp表中所有列 的情况
SHOW FULL COLUMNS FROM scott.dept;-- 显示 emp表中所有列 的情况
SHOW FULL COLUMNS FROM scott.salgrade; -- 显示 emp表中所有列 的情况

SELECT *
FROM scott.emp; -- 查看emp表的数据
SELECT *
FROM scott.salgrade; -- 查看salgrade表的数据
SELECT *
FROM scott.dept; -- 查看dept表的数据

SELECT ENAME,HIREDATE,DEPTNO -- 查询员工的姓名，入职时间，部门编号
FROM scott.emp;

SELECT DISTINCT JOB
FROM scott.emp;-- 查询员工的工作工种

SELECT *
FROM scott.emp
WHERE JOB='salesman';-- 查询所有销售员工的信息

SELECT *
FROM scott.emp
WHERE HIREDATE>='1981-01-01';-- 查询1981-1-1之后入职的员工

SELECT *
FROM scott.emp
WHERE HIREDATE>='1987-01-01';-- 查询1987-1-1之后入职的员工

SELECT *
FROM scott.emp
WHERE HIREDATE!='1987-07-13';-- 查询不是1987-07-13入职的员工

SELECT *
FROM scott.emp
WHERE HIREDATE<>'1987-07-13';-- 查询不是1987-07-13入职的员工