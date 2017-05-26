SHOW DATABASES ;

SELECT *
FROM mysql.user;

-- 创建用户
CREATE USER test_dcl@'localhost'
  IDENTIFIED BY 'system';

-- 改用户名
RENAME USER test_dcl@'localhost' TO dcl_test@'localhost';

-- 修改密码
SET PASSWORD  FOR dcl_test@'localhost'= PASSWORD ('glory.0808');

-- 删除用户
DROP USER dcl_test@'localhost';

SELECT *
FROM mysql.user;

-- 授予权限-------------------------------------------------------------------------------
CREATE USER haha@'localhost'
  IDENTIFIED BY 'system';

SELECT *
FROM mysql.user;

GRANT CREATE ON scott.* TO 'haha'@'localhost';
GRANT SELECT ON scott.* TO 'haha'@'localhost';
GRANT ALL ON scott.* TO 'haha'@'localhost';

SELECT *
FROM scott.emp;

SELECT *
FROM mysql.user;
-- 撤销权限-------------------------------------------------------------------------------
REVOKE SELECT ON scott.* FROM 'haha'@'localhost';
