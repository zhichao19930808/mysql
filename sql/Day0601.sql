
# 找出奖金为空的员工
SELECT *
FROM scott.emp
WHERE COMM IS NULL ;

# 找出有奖金的员工
SELECT *
FROM scott.emp
WHERE COMM IS NOT NULL ;

# 找出员工为空的员工
SELECT *
FROM scott.emp
WHERE COMM<=>NULL ; -- 当两个操作数中可能含有null时，可以使用<=>

# 找出奖金不为空的员工
SELECT *
FROM scott.emp
WHERE NOT (COMM<=>NULL );-- 可以把<=>堪称mysql的方言