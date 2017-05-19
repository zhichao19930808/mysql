-- REGEXP 正则--------------------------------------------------------------------------------------------------------------
# 查询包含字母 a-z之外的字符的行
SELECT *
FROM scott.emp
WHERE ENAME REGEXP '[^a-z]+';

#查询包含字符 a-c 的行
SELECT *
FROM scott.emp
WHERE ENAME REGEXP '[a-c]';

#查询姓名不包含字符 a-c 的行
SELECT *
FROM scott.emp
WHERE ENAME NOT REGEXP '[a-c]';

#查询HIREDATE（入职时间）以 02 结束的行
SELECT *
FROM scott.emp
WHERE HIREDATE REGEXP '-02$';

#查询HIREDATE（入职时间）包含 1981 的行
SELECT *
FROM scott.emp
WHERE HIREDATE REGEXP '1981';

-- SQL In   --------------------------------------------

-- 查询部门编号为10，20 的员工
SELECT *
FROM scott.emp
WHERE DEPTNO IN (10,20);

-- 查询部门编号为10，20 以外的员工
SELECT *
FROM scott.emp
WHERE DEPTNO NOT IN (10,20);

#查询职务(job)为经理(manager)，职员(clerk)的员工信息
SELECT *
FROM scott.emp
WHERE JOB IN ('manager','clerk');
-- SQL Between And------------------------------------

#查询基本工资在2000~3000之间的员工
SELECT *
FROM scott.emp
WHERE SAL BETWEEN  2000 AND 3000;

#查询基本工资在2000~3000之外的员工
SELECT *
FROM scott.emp
WHERE SAL NOT BETWEEN  2000 AND 3000;

-- SQL Aliases-----------------------------------------

# 查询每个员工和对应的基本工资
SELECT ENAME AS '姓名',SAL AS '基本工资'-- 起别名
FROM scott.emp;
# 查询每个员工和对应的基本工资
SELECT ENAME  '姓名',SAL  '基本工资'-- AS可有可无
FROM scott.emp;

SELECT e.ENAME
FROM scott.emp AS e;-- 为表起别名

-- ------------------------------------------

# 查询部门编号为 null 的员工
SELECT *
FROM scott.emp
WHERE DEPTNO IS NULL ;

# 查询奖金为 null 的员工
SELECT *
FROM scott.emp
WHERE COMM IS NULL;

# 将jones的工作(job)设置为null
UPDATE scott.emp
SET JOB = NULL
WHERE ENAME = 'jones';

# 查询所有员工的工资（基本工资+奖金）
SELECT
ENAME,
sal + ifnull(COMM, 0)
FROM scott.emp;

SELECT *
FROM scott.emp;

