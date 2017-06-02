#简书----------------------------------------------------------------------------
DROP DATABASE IF EXISTS db_jianshu;
CREATE DATABASE db_jianshu;

DROP TABLE IF EXISTS db_jianshu.user;
CREATE TABLE db_jianshu.user (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'pk id',
  nick     VARCHAR(8)   NOT NULL UNIQUE
  COMMENT '昵称',
  mobile   INT(11)      NOT NULL
  COMMENT '手机号码',
  password VARCHAR(255) NOT NULL
  COMMENT '密码'
)
  COMMENT '用户表';

DROP TABLE IF EXISTS db_jianshu.notebook;
CREATE TABLE db_jianshu.notebook (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'pk id',
  title  VARCHAR(255) COMMENT '名称',
  userID INT COMMENT 'fk 用户id'
)
  COMMENT '文集表';

DROP TABLE IF EXISTS db_jianshu.note;
CREATE TABLE db_jianshu.note (
  id         INT      AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  content    TEXT NOT NULL
  COMMENT '内容',
  time       DATETIME DEFAULT now()
  COMMENT '时间',
  views      INT      DEFAULT 0
  COMMENT '阅读次数',
  likes      INT      DEFAULT 0
  COMMENT '喜欢次数',
  notebookId INT COMMENT 'FK 文集 ID'
)
  COMMENT '文章表';

DROP TABLE IF EXISTS db_jianshu.comment;
CREATE TABLE db_jianshu.comment (
  id        INT      AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  content   TEXT NOT NULL
  COMMENT '内容',
  time      DATETIME DEFAULT now()
  COMMENT '时间',
  noteId    INT COMMENT 'FK 文章 ID',
  userId    INT COMMENT 'FK 用户 ID',
  commentId INT COMMENT 'FK 评论 ID'
)
  COMMENT '评论表';

#外键---------------------------------------------------------------------------------
ALTER TABLE db_jianshu.notebook
  ADD CONSTRAINT
  notebook_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user (id);

ALTER TABLE db_jianshu.note
  ADD CONSTRAINT
  note_fk_notebookId
FOREIGN KEY (notebookId)
REFERENCES db_jianshu.notebook (id);


ALTER TABLE db_jianshu.comment
  ADD CONSTRAINT
  comment_fk_noteId
FOREIGN KEY (noteId)
REFERENCES db_jianshu.note (id);


ALTER TABLE db_jianshu.comment
  ADD CONSTRAINT
  comment_fk_userId
FOREIGN KEY (userId)
REFERENCES db_jianshu.user (id);


ALTER TABLE db_jianshu.comment
  ADD CONSTRAINT
  comment_fk_commentId
FOREIGN KEY (commentId)
REFERENCES db_jianshu.comment (id);

#添加内容----------------------------------------------------------------------
INSERT INTO db_jianshu.user VALUES (NULL, '张三', 10086, '666');
INSERT INTO db_jianshu.user VALUES (NULL, '李四', 10086, '666');

INSERT INTO db_jianshu.notebook VALUES (NULL, '张三的书集', 1);

INSERT INTO db_jianshu.note(content, notebookId) VALUES ('张三的第一篇文章', 1);

INSERT INTO db_jianshu.comment VALUES (NULL, '李四对张三的第一篇文章的第一条评论', now(), 1, 2, NULL);
INSERT INTO db_jianshu.comment VALUES (NULL, '张三对李四的评论的回复', now(), NULL , 1, 1);
