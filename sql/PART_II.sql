# 1. 返回拥有员工的部门名、部门号-----------------------------------------------------
SELECT DISTINCT
DNAME,
dept.DEPTNO
FROM scott.emp
INNER JOIN scott.dept
ON scott.emp.DEPTNO = scott.dept.DEPTNO;

# 2. 工资多于 scott 的员工信息----------------------------------------------------------
SELECT *
FROM scott.emp e
WHERE e.SAL > (SELECT SAL
               FROM scott.emp e1
               WHERE e1.ENAME = 'scott');

SELECT e1.*
FROM scott.emp e1 INNER JOIN scott.emp e2
ON e1.SAL+ifnull(e1.COMM,0)>e2.SAL+ifnull(e2.COMM,0)
WHERE e2.ENAME = 'scott';
# 3. 返回员工和所属经理的姓名----------------------------------------------------------
SELECT e1.ENAME,e2.ENAME
FROM scott.emp e1 INNER JOIN scott.emp e2
ON e1.MGR = e2.EMPNO;

# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名---------------------------------------------
SELECT e1.ENAME 员工 , e2.ENAME 经理
FROM scott.emp e1 INNER JOIN scott.emp e2
ON e1.MGR=e2.EMPNO
WHERE e2.HIREDATE>e1.HIREDATE;

# 5. 返回员工姓名及其所在的部门名称-------------------------------------------------------------------
SELECT ENAME,dept.DNAME
FROM scott.emp INNER JOIN scott.dept
ON scott.emp.DEPTNO = scott.dept.DEPTNO;

# 6. 返回从事 clerk 工作的员工姓名和所在部门名称--------------------------------------------------------
SELECT e.ENAME,d.DNAME
FROM scott.emp e INNER JOIN scott.dept d
ON e.DEPTNO = d.DEPTNO
WHERE e.JOB='clerk';

# 7. 返回部门号及其本部门的最低工资----------------------------------------------------------------------
# 8. 返回销售部 sales 所有员工的姓名-------------------------------------------------------------------
SELECT e.ENAME
FROM scott.emp e INNER JOIN scott.dept d
ON e.DEPTNO = d.DEPTNO
WHERE d.DNAME='sales';
# 9. 返回工资多于平均工资的员工-------------------------------------------------------------------
# 10. 返回与 scott 从事相同工作的员工-------------------------------------------------------------------
SELECT *
FROM scott.emp e1 INNER JOIN scott.emp e2
ON e1.JOB=e2.JOB
WHERE e2.ENAME='scott';
# 11. 返回比 30 部门员工平均工资高的员工姓名与工资----------------------------------------------------------
# 12. 返回工资高于30部门所有员工工资水平的员工信息-----------------------------------------------------------
# 13. 返回部门号、部门名、部门所在位置及其每个部门的员工总数----------------------------------------------
# 14. 返回员工的姓名、所在部门名及其工资-------------------------------------------------------------------
SELECT e.ENAME,d.DNAME,e.SAL+ifnull(COMM,0)
FROM scott.emp e INNER JOIN scott.dept d
ON e.DEPTNO = d.DEPTNO;
# 15. 返回雇员表中不在同一部门但是从事相同工作的员工信息-----------------------------------------------------
SELECT e1.*
FROM scott.emp e1 INNER  JOIN  scott.emp e2
ON e1.JOB = e2.JOB
WHERE e1.DEPTNO <> e2.DEPTNO;

# 16. 返回员工的详细信息，包括部门名-------------------------------------------------------------------
# 17. 返回员工工作及其从事此工作的最低工资-------------------------------------------------------------------
# 18. 返回不同部门经理的最低工资-------------------------------------------------------------------
# 19. 计算出员工的年薪，并且以年薪排序-------------------------------------------------------------------
SELECT ENAME,(SAL+ifnull(COMM,0))*12 年薪
FROM scott.emp
ORDER BY 年薪;
# 20. 返回工资处于第 4 级别的员工的姓名-----------------------------------------------------------------
SELECT *
FROM scott.emp e INNER JOIN scott.salgrade s
ON (e.SAL+ifnull(COMM,0)) BETWEEN s.LOSAL AND HISAL
WHERE s.GRADE = 4;

SELECT *
FROM scott.salgrade;