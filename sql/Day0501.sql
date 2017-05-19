
-- SQL Top   limit 限制\ ['lɪmɪt]------------------------------------------------------------------------------
SELECT *
FROM scott.emp;

-- 显示前三行(默认为0)
SELECT *
FROM scott.emp
LIMIT 3;-- limit 限制\ ['lɪmɪt]


# 从第3行开始显示之后的4行信息
SELECT *
FROM scott.emp
LIMIT 3,4;


# 从第3行开始 显示之后的4行内容
SELECT *
FROM scott.emp
LIMIT 4 OFFSET 3;

# 按照ENAME的升序排序，显示前3行
SELECT *
FROM scott.emp
ORDER BY ENAME
LIMIT 3;