# 仿 http://dict.cn/ 设计一个简单的在线电子词典数据库表结构，实现从英文查中文，从中文查英文功能

DROP DATABASE if EXISTS db_dict;
CREATE DATABASE db_dict;

DROP TABLE IF EXISTS db_dict.english;
CREATE TABLE db_dict.english(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'pk id',
  word VARCHAR(255) COMMENT '单词'
)COMMENT '英文表';

DROP TABLE IF EXISTS db_dict.chinese;
CREATE TABLE db_dict.chinese(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'pk id',
  Hanzi VARCHAR(255) COMMENT'汉字'
)COMMENT '汉字表';

DROP TABLE IF EXISTS db_dict.english_chinese;
CREATE TABLE db_dict.english_chinese(
  englishID INT COMMENT '中文id',
  chineseID INT COMMENT '英文ID',
  PRIMARY KEY (englishID,chineseID)
)COMMENT '中英关联表';


ALTER TABLE db_dict.english_chinese
    ADD CONSTRAINT
english_fk_englishID
FOREIGN KEY (englishID)
  REFERENCES db_dict.english(id);

ALTER TABLE db_dict.english_chinese
    ADD CONSTRAINT
chinese_fk_chineseID
FOREIGN KEY (chineseID)
  REFERENCES db_dict.chinese(id);


INSERT INTO db_dict.chinese VALUES (NULL, '苹果');
INSERT INTO db_dict.english VALUE (NULL, 'apple');
INSERT INTO db_dict.english VALUE (NULL, 'biffin');

INSERT INTO db_dict.english_chinese VALUE (1, 1);
INSERT INTO db_dict.english_chinese VALUE (2, 1);

SELECT c.Hanzi
FROM db_dict.english e INNER JOIN db_dict.chinese c
  INNER JOIN db_dict.english_chinese ec
    ON e.id = ec.englishId AND c.id = ec.chineseId
WHERE e.word = 'apple';

SELECT e.word
FROM db_dict.english e INNER JOIN db_dict.chinese c
  INNER JOIN db_dict.english_chinese ec
    ON e.id = ec.englishId AND c.id = ec.chineseId
WHERE c.Hanzi = '苹果';
