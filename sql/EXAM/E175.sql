DROP DATABASE IF EXISTS db_user;
CREATE DATABASE db_user;

DROP TABLE IF EXISTS db_user.user;
CREATE TABLE db_user.user (
  id       INT                   AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  email    VARCHAR(191) UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '账号',
  password VARCHAR(255) NOT NULL
  COMMENT '密码',
  role     VARCHAR(255) NOT NULL DEFAULT 'user'
  COMMENT '角色：user-用户； admin-管理员'
)
  COMMENT '用户表';

DROP TABLE IF EXISTS db_user.message;
CREATE TABLE db_user.message (
  id      INT               AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  content TEXT     NOT NULL
  COMMENT '内容',
  time    DATETIME NOT NULL DEFAULT now()
  COMMENT '时间',
  userId  INT      NOT NULL
  COMMENT 'FK 用户ID'
)
  COMMENT '留言表';

ALTER TABLE db_user.message
  ADD CONSTRAINT
  message_fk_userId
FOREIGN KEY (userId)
REFERENCES db_user.user (id);

-- SQL
# 1. 用户注册
INSERT INTO db_user.user (email, username, password) VALUE ('tester@qq.com', 'Tom', '123');

SELECT *
FROM db_user.user;

# 2. 登录判断
SELECT *
FROM db_user.user
WHERE email = 'tester@qq.com' AND password = '123';

# 3. 发布留言
INSERT INTO db_user.message (content, userId)
  VALUE ('留言内容1。。。', 1);
INSERT INTO db_user.message (content, userId)
  VALUE ('留言内容2。。。', 1);

SELECT *
FROM db_user.message;

# 4. 添加管理员
INSERT INTO db_user.user
  VALUE (NULL, 'admin@qq.com', 'Jerry', '123', 'admin');

SELECT *
FROM db_user.user;

# 5. 查询留言列表
SELECT
  u.username,
  m.content,
  m.time
FROM db_user.user u INNER JOIN db_user.message m
    ON u.id = m.userId;

# 6. 删除留言
DELETE FROM db_user.message
WHERE id = 2;

/*
<input type="hidden" name="id" value="2">
 */