# 设计个人好友管理系统，包含以下核心功能：
DROP DATABASE IF EXISTS db_E178;
CREATE DATABASE db_E178;
# 1,显示所有好友基本信息，包括：
DROP TABLE IF EXISTS db_E178.friend;
CREATE TABLE db_E178.friend(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'pk id',
  name VARCHAR(255) NOT NULL COMMENT '姓名',
  gender char COMMENT '性别',
  dob VARCHAR(255) COMMENT '生日',
  cellphone INT(11) COMMENT '手机',
  address VARCHAR(255)COMMENT '住址',
  weixin VARCHAR(255) COMMENT '微信',
  QQ VARCHAR(255) COMMENT 'QQ',
  job_address VARCHAR(255) COMMENT '工作或学习地点',
  interest VARCHAR(255) COMMENT '爱好',
  cognize_time DATE COMMENT '认识时间',
  cognize_mode VARCHAR(255) COMMENT '认识方式',
  trait VARCHAR(255) COMMENT '特点',
  cohesion INT COMMENT '亲密度'
)COMMENT '好友列表';

# 2,记录每一次与朋友沟通时的信息，包括：
DROP TABLE IF EXISTS db_E178.communicate;
CREATE TABLE db_E178.communicate(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'pk id',
  friendID INT COMMENT 'fk id',
  time DATETIME DEFAULT now()COMMENT '沟通时间',
  mode VARCHAR(255) COMMENT '沟通方式',
  main VARCHAR(255) COMMENT '沟通内容',
  job_address VARCHAR(255) COMMENT 'ta当前的工作或学习的地点',
  cohesion INT COMMENT '当前亲密度'
)COMMENT '沟通记录';
# 3,创建表和关联
ALTER TABLE db_E178.communicate
    ADD CONSTRAINT
communicate_fk_friendID
FOREIGN KEY (friendID)
  REFERENCES db_E178.friend(id);
# 4,添加样本数据
INSERT INTO db_E178.friend VALUE
  (NULL, '常宇', '男', '纪检委', 123456789, '1993-07-06', '神经', '11111111', '山西省临汾市蒲县', '上网', '2008-01-01', '同学', '义气', 99);
INSERT INTO db_E178.friend VALUE
  (NULL, '蒲任恬', '女', '钢琴老师', 123456789, '1993-09-26', '一袋大尸凶', '11111111', '海南三亚', '上网', '2011-09-01', '同学', '义气', 99);

INSERT INTO db_E178.communicate VALUES (NULL, 1, '2017-05-26', '电话', '吹牛', '山西省临汾市蒲县', 99);
INSERT INTO db_E178.communicate VALUES (NULL, 2, '2017-06-01', '电话', '吹牛', '海南三亚', 99);

# 5,查询所有朋友及每次沟通记录
SELECT *
FROM db_E178.friend f INNER JOIN db_E178.communicate c
ON f.id = c.friendID;
# 6,列出一个朋友的工作或学习的变迁
UPDATE db_E178.friend
    SET db_E178.friend.job_address = '山西省临汾市政府'
WHERE id=1;

# 7,计算每个朋友的平均亲密程度，降序排序
SELECT name,cohesion
FROM db_E178.friend
ORDER BY cohesion DESC ;