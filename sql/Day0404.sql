-- SQL AND & OR 练习----------------------------------------------------------------------
# 查询基本工资在3000元以上并且不是销售的员工
SELECT *
FROM scott.emp
WHERE SAL>=3000 AND JOB<>'salesman';

# 查询基本工资在1500以上，并且是销售的员工
SELECT *
FROM scott.emp
WHERE SAL>=1500 AND JOB='salesman';

-- SQL Order By 排序------------------------------------------------------------------------------
#查询所有的员工信息，并将显示顺序按照入职时间的升序排列
SELECT *
FROM scott.emp
ORDER BY HIREDATE ASC ;-- ASC ascend 上升 默认为升序

#查询所有的员工信息，并将显示顺序按照入职时间的降序排列
SELECT *
FROM scott.emp
ORDER BY HIREDATE DESC ;-- DESC descend 下降

#查询所有的员工信息，并将显示顺序按照部门的升序 工资的降序 排列
SELECT *
FROM scott.emp
ORDER BY DEPTNO DESC,SAL ASC ;-- DESC descend 下降

SELECT DEPTNO,SAL
FROM scott.emp
ORDER BY 1 DESC,2 ASC ;-- DESC descend 下降  1指代查询语句的第一条