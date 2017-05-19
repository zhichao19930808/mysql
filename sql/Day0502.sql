-- 模糊查询 SQL Like ----------------------------------------------------------------------------------------------
#------like 像 模糊匹配

SELECT *
FROM scott.emp;

# 查询ENAME中包含字母 a 的行
SELECT *
FROM scott.emp
WHERE ENAME LIKE '%a%';
# 查询ENAME中以字母 a 开头的行
SELECT *
FROM scott.emp
WHERE ENAME LIKE 'a%';
# 查询ENAME中包以字母 n 结束 的行
SELECT *
FROM scott.emp
WHERE ENAME LIKE '%n';

INSERT INTO scott.emp (EMPNO, ENAME) VALUES (11111111, 'a_abcd');
# 查询包含字母 _ 的行
SELECT *
FROM scott.emp
WHERE ENAME LIKE '%\_%' ESCAPE '\\';

/*
通配符
%       任意长度的任意字符
_       一个字符长度的任意字符
 */




