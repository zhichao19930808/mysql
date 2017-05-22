# sql join sql联合查询或连接查询
#       用于把两个或多个表的行连合到一起
#         链接条件=n-1
SELECT ENAME 姓名,JOB 工作
FROM scott.emp
WHERE JOB = 'clerk';


SELECT *
FROM scott.emp;-- 14

SELECT *
FROM scott.dept; -- 4

# 第一种关联查询 cross join 交叉连接
SELECT *
FROM scott.emp CROSS JOIN scott.dept; -- 56 =14*4






#第二种连接 内连接
SELECT ENAME,DNAME
FROM scott.emp INNER JOIN scott.dept
ON scott.emp.DEPTNO = scott.dept.DEPTNO;            -- 连接条件  fk ?= pk;不是，但一般都是 外键=主键

SHOW FULL COLUMNS FROM scott.emp;
SHOW FULL COLUMNS FROM scott.dept;

#test 返回拥有员工的部门名 和 部门号
SELECT *
FROM scott.dept;
SELECT DISTINCT DNAME,dept.DEPTNO
FROM scott.emp
  INNER JOIN scott.dept
ON scott.emp.DEPTNO = scott.dept.DEPTNO;

-- 自连接
#test 返回员工和所属经理的姓名
SELECT *
FROM scott.emp;
SELECT DISTINCT e1.ENAME,e2.ENAME
FROM scott.emp e1 INNER JOIN scott.emp e2
ON e1.MGR=e2.EMPNO;                 -- 建议为表添加别名，可以提高查询效率




#第三种，外连接outer join

-- left outer join        左外连接
SELECT e.ENAME,d.DNAME
FROM scott.emp e LEFT OUTER JOIN scott.dept d
ON e.DEPTNO = d.DEPTNO

UNION -- 自动去重
    ALL -- union后面+all 不会去重 一般不需要

-- right outer join       右外连接
SELECT e.ENAME,d.DNAME
FROM scott.emp e RIGHT OUTER JOIN scott.dept d
ON e.DEPTNO = d.DEPTNO;

