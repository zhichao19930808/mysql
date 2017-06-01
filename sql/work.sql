/*
实现一个工作日志系统的数据库表设计
注册时选择组别（第一组；第二组；第三组）以及员工或组长身份
员工登录可以发布当天的工作日志，并可以查看自己的所有日志
组长登录可以发布当天的工作日志，并可以查看本组的所有日志
组长可以按姓名和日期进行日志查询
 */
DROP DATABASE IF EXISTS db_work;
CREATE DATABASE db_work;

DROP TABLE IF EXISTS db_work.user;
CREATE TABLE db_work.user(
  id INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'pk id',
  name VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
    COMMENT '密码',
  team VARCHAR(255) NOT NULL
  COMMENT '组别',
  role VARCHAR(255) NOT NULL DEFAULT '员工'
  COMMENT '角色'
)COMMENT '员工表';

DROP TABLE IF EXISTS db_work.log;
CREATE TABLE db_work.log(
  id INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'pk id',
  content TEXT NOT NULL
  COMMENT '留言内容',
  time DATETIME NOT NULL
  COMMENT '留言时间',
  userID INT NOT NULL
  COMMENT '用户ID'
)COMMENT '留言表';

ALTER TABLE db_work.log
  ADD CONSTRAINT
  log_pk_userID
FOREIGN KEY (userID)
REFERENCES db_work.user (id);

# 1.注册
INSERT INTO db_work.user (name,password,team)VALUES('张三','666','一');
INSERT INTO db_work.user (name,password,team)VALUES('李四','666','一');
INSERT INTO db_work.user (name,password,team)VALUES('王五','666','二');
INSERT INTO db_work.user (name,password,team)VALUES('马六','666','二');

INSERT INTO db_work.user (name,password,team,role)VALUES('王朝','888','一','组长');
INSERT INTO db_work.user (name,password,team,role)VALUES('马汉','888','二','组长');

INSERT INTO db_work.log(content, time, userID) VALUES ('张三的日志',now(),1);
INSERT INTO db_work.log(content, time, userID) VALUES ('李四的日志',now(),2);
INSERT INTO db_work.log(content, time, userID) VALUES ('王五的日志',now(),3);
INSERT INTO db_work.log(content, time, userID) VALUES ('马六的日志',now(),4);
INSERT INTO db_work.log(content, time, userID) VALUES ('王朝的日志',now(),5);
INSERT INTO db_work.log(content, time, userID) VALUES ('马汉的日志',now(),6);

#登陆
SELECT *
FROM db_work.user
WHERE name='张三'AND password='666';

#员工查看自己的日志
SELECT content,time
FROM db_work.log
WHERE id=1;

#组长查看员工的日志
SELECT u.name,team,content,time
FROM db_work.user u LEFT JOIN db_work.log l
ON u.id = l.userID
WHERE team='一';

SELECT u.name,team,content,time
FROM db_work.user u LEFT JOIN db_work.log l
ON u.id = l.userID
WHERE u.team='一' AND u.name='张三';

SELECT u.name,team,content,time
FROM db_work.user u LEFT JOIN db_work.log l
ON u.id = l.userID
WHERE u.team='一' AND l.time LIKE '2017-06-01%';

