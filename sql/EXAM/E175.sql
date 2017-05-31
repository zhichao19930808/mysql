SHOW DATABASES ;
-- 1.设计一个能够简单实现用户注册、登录、注销的数据库表结构---------------------------------------
DROP DATABASE IF EXISTS E175;
CREATE DATABASE E175;
DROP TABLE IF EXISTS E175.zhuce;
CREATE TABLE E175.zhuce (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'id pk',
  email VARCHAR(255) NOT NULL COMMENT '邮箱',
  title VARCHAR(255) NOT NULL UNIQUE COMMENT '账号',
  password VARCHAR(255) COMMENT '密码'
);
-- 用户注册
INSERT INTO E175.zhuce VALUES (NULL ,'邮箱','账户','密码');
-- 用户登录
SELECT *
FROM E175.zhuce
WHERE (email='输入的email'OR title='输入的账号') AND password='输入的密码';
-- 2.在题 1 的基础上，实现用户留言功能------------------------------------------------------------
DROP TABLE IF EXISTS E175.liuyan;
CREATE TABLE E175.liuyan (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id pk',
  liuyan  TEXT COMMENT '留言',
  shijian DATETIME COMMENT '留言时间',
  yonghuID INT COMMENT '留言人id'
);
ALTER TABLE E175.liuyan
  ADD CONSTRAINT
  E175_liuyan_fk_liuyanID
FOREIGN KEY (yonghuID)
REFERENCES E175.zhuce (id);
INSERT INTO E175.liuyan VALUES (NULL ,'留言内容','2017-5-27 15:49:36',1);
-- 3.在题 3 的基础上，添加管理员管理留言功能，管理员无须注册，使用 SQL 初始化
-- 查看留言功能
SELECT z.title,l.liuyan,l.shijian
FROM E175.liuyan l CROSS JOIN E175.zhuce z
ON l.yonghuID=z.id;
-- 删除一条留言
DELETE FROM E175.liuyan
WHERE id=1;

