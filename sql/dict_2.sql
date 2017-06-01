# 实现查英文显示简明释义，及词性、音标、详尽释义，例句的功能

DROP DATABASE IF EXISTS db_dict;
CREATE DATABASE db_dict;

DROP TABLE IF EXISTS db_dict.english;
CREATE TABLE db_dict.english(
  id INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'pk id',
  english VARCHAR(255) NOT NULL
    COMMENT '英语单词',
  phoneticUk VARCHAR(255)
  COMMENT '英语音标',
  phoneticUs  VARCHAR(255)
  COMMENT '美语音标'
)COMMENT '单词表';

DROP TABLE IF EXISTS db_dict.part_of_speech;
CREATE TABLE db_dict.part_of_speech(
  id           INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  partOfSpeech VARCHAR(255) COMMENT '词性',
  wordId       INT COMMENT '单词 ID FK'
)COMMENT '词性表';

DROP TABLE IF EXISTS db_dict.concise;
CREATE TABLE db_dict.concise (
  id             INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  conciseChinese VARCHAR(255) COMMENT '简明释义',
  partOfSpeechId INT COMMENT '词性 ID FK'
)
  COMMENT '简明释义表';


DROP TABLE IF EXISTS db_dict.detail;
CREATE TABLE db_dict.detail (
  id             INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  detailChinese  VARCHAR(255) COMMENT '详尽释义',
  partOfSpeechId INT COMMENT '词性 ID FK'
)
  COMMENT '详尽释义表';


DROP TABLE IF EXISTS db_dict.sentence;
CREATE TABLE db_dict.sentence (
  id             INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  english        TEXT COMMENT '英语',
  chinese        TEXT COMMENT '中文',
  partOfSpeechId INT COMMENT '词性 ID FK'

)
  COMMENT '例句表';

#关联外键-----------------------------------------------------------------------------
ALTER TABLE db_dict.part_of_speech
  ADD CONSTRAINT
  part_of_speech_fk_wordID
FOREIGN KEY (wordId)
REFERENCES db_dict.english (id);

ALTER TABLE db_dict.concise
  ADD CONSTRAINT
  concise_fk_partOfSpeechId
FOREIGN KEY (partOfSpeechId)
REFERENCES db_dict.part_of_speech (id);

ALTER TABLE db_dict.detail
  ADD CONSTRAINT
  detail_fk_partOfSpeechId
FOREIGN KEY (partOfSpeechId)
REFERENCES db_dict.part_of_speech (id);

ALTER TABLE db_dict.sentence
  ADD CONSTRAINT
  sentence_fk_partOfSpeechId
FOREIGN KEY (partOfSpeechId)
REFERENCES db_dict.part_of_speech (id);
#添加内容-----------------------------------------------------------------------------------
INSERT INTO db_dict.english VALUES (NULL ,'test','[test]','[test]');

INSERT INTO db_dict.part_of_speech VALUES (NULL, 'n.', 1);
INSERT INTO db_dict.part_of_speech VALUES (NULL, 'vt.', 1);

INSERT INTO db_dict.concise VALUES (NULL, ' 考验；试验；测试', 1);
INSERT INTO db_dict.concise VALUES (NULL, ' 试验；测试；接受测验', 2);

INSERT INTO db_dict.detail VALUES (NULL, '检验，化验，试验', 1);
INSERT INTO db_dict.detail VALUES (NULL, '考验', 1);
INSERT INTO db_dict.detail VALUES (NULL, '测验，小考，考试，测试', 1);
INSERT INTO db_dict.detail VALUES (NULL, '检验标准，化验法', 1);
INSERT INTO db_dict.detail VALUES (NULL, '化验剂，检验用品', 1);
INSERT INTO db_dict.detail VALUES (NULL, '考察，考查，检查', 1);
INSERT INTO db_dict.detail VALUES (NULL, '试金石', 1);
INSERT INTO db_dict.detail VALUES (NULL, '甲壳', 1);
INSERT INTO db_dict.detail VALUES (NULL, '【动】介壳', 1);
INSERT INTO db_dict.detail VALUES (NULL, '【植】种皮', 1);
INSERT INTO db_dict.detail VALUES (NULL, '【化】试药', 1);


INSERT INTO db_dict.detail VALUES (NULL, '试验，测验，进行测验，测试', 2);
INSERT INTO db_dict.detail VALUES (NULL, '考验', 2);
INSERT INTO db_dict.detail VALUES (NULL, '受试验，受测验', 2);
INSERT INTO db_dict.detail VALUES (NULL, '测得结果', 2);
INSERT INTO db_dict.detail VALUES (NULL, '考察，考查，检查', 2);
INSERT INTO db_dict.detail VALUES (NULL, '【化】检验，化验', 2);
INSERT INTO db_dict.detail VALUES (NULL, '分析', 2);
INSERT INTO db_dict.detail VALUES (NULL, '摸清底细', 2);
INSERT INTO db_dict.detail VALUES (NULL, '测试鉴定某物', 2);
INSERT INTO db_dict.detail VALUES (NULL, '勘探，探测', 2);
INSERT INTO db_dict.detail VALUES (NULL, '在烤钵中精炼（金属）', 2);


INSERT INTO db_dict.sentence VALUES (NULL,'We achieved within seven months an agreement that has stood the test of time.','我们在七个月内完成一项协议,而且经受住了时间的考验。',1);
INSERT INTO db_dict.sentence VALUES (NULL,'Our test flight was to discover the bugs in the new plane.','试验飞行是为了发现新飞机有何毛病。',1);
INSERT INTO db_dict.sentence VALUES (NULL,'Tomorrow we''ll have a history test.','明天我们将进行历史测验。',1);

INSERT INTO db_dict.sentence VALUES (NULL ,'By doing so, you can test the strength of steel.','这样做,你可以试验一下钢的强度。',2);
INSERT INTO db_dict.sentence VALUES (NULL ,'Listening to his continuous stream of empty chatter really tested my patience.','听他那没完没了的连篇空话对我的耐心真是一大考验。',2);
INSERT INTO db_dict.sentence VALUES (NULL ,'The teacher will test the class on spelling today.','今天, 老师要对这个班进行一次拼写测验。',2);

-- 直接搜索test
SELECT *
FROM db_dict.english
WHERE english ='test';

-- 搜索test及词性
SELECT  e.english,
  e.phoneticUk,
  e.phoneticUs,
  p.partOfSpeech
FROM db_dict.english e INNER JOIN db_dict.part_of_speech p
ON e.id=p.wordId;

-- 搜索test,词性，简单释义
SELECT e.english,
  e.phoneticUk,
  e.phoneticUs,
  p.partOfSpeech,
  c.conciseChinese
FROM db_dict.english e
  INNER JOIN db_dict.part_of_speech p
  INNER JOIN db_dict.concise c
ON e.id = p.wordId AND p.id = c.partOfSpeechId;

-- 搜索test的 发音，词性，简单释义，复杂释义
SELECT  e.english,
  e.phoneticUk,
  e.phoneticUs,
  p.partOfSpeech,
  c.conciseChinese,
  d.detailChinese
FROM db_dict.english e
  INNER JOIN db_dict.part_of_speech p
  INNER JOIN db_dict.concise c
  INNER JOIN db_dict.detail d
    ON e.id = p.wordId AND p.id = c.partOfSpeechId AND p.id =d.partOfSpeechId;

-- 搜索test的 发音，词性，简单释义，复杂释义,造句
SELECT
  e.english,
  e.phoneticUk,
  e.phoneticUs,
  p.partOfSpeech,
  c.conciseChinese,
  d.detailChinese,
  s.chinese,
  s.english
FROM db_dict.english e
  INNER JOIN db_dict.part_of_speech p
  INNER JOIN db_dict.concise c
  INNER JOIN db_dict.detail d
  INNER JOIN db_dict.sentence s
    ON e.id = p.wordId AND p.id = c.partOfSpeechId
       AND p.id = d.partOfSpeechId AND p.id = s.partOfSpeechId;
