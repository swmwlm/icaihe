-- DROP TABLE IF EXISTS `ich_admin_user`;

CREATE TABLE `ich_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_name` varchar(45) NOT NULL COMMENT '后台用户名',
  `pass_word` varchar(45) NOT NULL COMMENT '后台密码',
  `show_name` varchar(100)  DEFAULT '' COMMENT '名称',
  `head_img`  varchar(100)  DEFAULT '' COMMENT '头像地址',
  `create_time` TIMESTAMP  COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='后台用户表';


INSERT INTO `ich_admin_user` (`id`, `user_name`, `pass_word`, `show_name`, `head_img`, `create_time`)
VALUES(1,'admin','cf3061f0abf1d19a9a168694356f1e26','管理员','',sysdate());


CREATE TABLE hardware_report_log(
`id` BIGINT NOT NUll AUTO_INCREMENT COMMENT 'ID',
`ich_id` VARCHAR(50)  NOT NULL COMMENT 'ICHID',
`action_type` int NOT NULL COMMENT '上报类型(1：WIFI配置成功；2：报警；3：电量不足；4：开箱；5：关箱。)',
`create_time` TIMESTAMP  COMMENT '创建时间',
`remark` VARCHAR(200)  COMMENT '备注',
PRIMARY KEY (id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='硬件上报记录';


-- 新增表【↓】

-- CREATE TABLE `xxxxx`(
--   `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
--   `xxxxx`  BIGINT   COMMENT 'xxxxx',
--   `xxxxx` varchar(xxxxx)  COMMENT 'xxxxx',
--   `xxxxx`  TINYINT   COMMENT 'xxxxx',
--   `xxxxx`  DATE   COMMENT 'xxxxx',
--   `create_time` TIMESTAMP  COMMENT '创建时间',
--   `update_time` TIMESTAMP  COMMENT '修改时间',
--   PRIMARY KEY (`id`)
-- ) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='xxxxx';


CREATE TABLE `ich_user`(
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `phone` varchar(11)  COMMENT '手机号',
  `name` varchar(50)  COMMENT '姓名',
  `sex`  TINYINT  DEFAULT 0 COMMENT '性别',
  `head` varchar(200)  COMMENT '头像',
  `type`  TINYINT DEFAULT 0 COMMENT '用户类型',
  `create_time` TIMESTAMP  COMMENT '创建时间',
  `update_time` TIMESTAMP  COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='用户表';


CREATE TABLE `ich_group`(
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_name` varchar(100)  COMMENT '企业组织名称',
  `group_create_time`  DATE   COMMENT '企业组织创立日期',
  `group_address` varchar(150)  COMMENT '企业组织地址',
  `address_x` varchar(50)  COMMENT '地图X坐标',
  `address_y` varchar(50)  COMMENT '地图Y坐标',
  `create_time` TIMESTAMP  COMMENT '创建时间',
  `update_time` TIMESTAMP  COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='群组表';



CREATE TABLE `ich_box`(
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ich_id` varchar(100)  COMMENT 'ICHID',
  `ibeacon_id` varchar(100)  COMMENT 'iBeacon广播ID',
  `wifi_id` varchar(100)  COMMENT 'WIFI ID',
  `wifi_password` varchar(100)  COMMENT 'WIFI 密码',
  `box_name` varchar(100)  COMMENT '财盒昵称',
  `group_id`  BIGINT   COMMENT '群组ID',
  `create_time` TIMESTAMP  COMMENT '创建时间',
  `update_time` TIMESTAMP  COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='保险箱表';



CREATE TABLE `ich_group_member`(
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id`  BIGINT   COMMENT '群组id',
  `user_id`  BIGINT   COMMENT '用户id',
  `join_date`  DATE   COMMENT '加入组织日期',
  `type`  TINYINT   COMMENT '成员类型',
  `create_time` TIMESTAMP  COMMENT '创建时间',
  `update_time` TIMESTAMP  COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='群组成员表';



CREATE TABLE `ich_box_user`(
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id`  BIGINT   COMMENT '保险箱id',
  `user_id`  BIGINT   COMMENT '用户id',
  `type`  TINYINT   COMMENT '权限类型',
  `create_time` TIMESTAMP  COMMENT '创建时间',
  `update_time` TIMESTAMP  COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='保险箱用户表';



CREATE TABLE `ich_box_record`(
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id`  BIGINT   COMMENT '保险箱id',
  `user_id`  BIGINT   COMMENT '用户id',
  `type`  TINYINT   COMMENT '操作类型',
  `remark` varchar(500)  COMMENT '备注',
  `back_time`  TIMESTAMP   COMMENT '预计归还日期',
  `create_time` TIMESTAMP  COMMENT '创建时间',
  `update_time` TIMESTAMP  COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='保险箱记录表';



CREATE TABLE `ich_box_message`(
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id`  BIGINT   COMMENT '保险箱id',
  `user_id`  BIGINT   COMMENT '通知用户id',
  `type`  TINYINT   COMMENT '事件类型',
  `message` varchar(255)  COMMENT '消息内容',
  `create_time` TIMESTAMP  COMMENT '创建时间',
  `update_time` TIMESTAMP  COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='保险箱消息表';



CREATE TABLE `ich_suggestion`(
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id`  BIGINT  COMMENT '用户id',
  `message` varchar(500)  COMMENT '反馈内容',
  `create_time` TIMESTAMP  COMMENT '创建时间',
  `update_time` TIMESTAMP  COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='意见反馈表';




