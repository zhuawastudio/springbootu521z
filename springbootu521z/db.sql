/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - springbootu521z
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`springbootu521z` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `springbootu521z`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/springbootu521z/upload/picture1.jpg');
insert  into `config`(`id`,`name`,`value`) values (2,'picture2','http://localhost:8080/springbootu521z/upload/picture2.jpg');
insert  into `config`(`id`,`name`,`value`) values (3,'picture3','http://localhost:8080/springbootu521z/upload/picture3.jpg');
insert  into `config`(`id`,`name`,`value`) values (6,'homepage',NULL);

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1620524853729 DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`addtime`,`name`,`time`,`status`) values (1620524853728,'2021-05-09 09:47:33','高等数学期末考试',30,1);

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1620524980819 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1620524894087,'2021-05-09 09:48:13',1620524853728,'高等数学期末考试','10以内的质数有几个','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.3\",\"code\":\"B\"},{\"text\":\"C.4\",\"code\":\"C\"},{\"text\":\"D.5\",\"code\":\"D\"}]',25,'C','填写正确答案解析',0,1);
insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1620524920951,'2021-05-09 09:48:40',1620524853728,'高等数学期末考试','10以内的合数有4个','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',25,'B','有5个，分别是468910',2,3);
insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1620524959882,'2021-05-09 09:49:19',1620524853728,'高等数学期末考试','10以内的质数有哪些','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.3\",\"code\":\"B\"},{\"text\":\"C.5\",\"code\":\"C\"},{\"text\":\"D.8\",\"code\":\"D\"}]',25,'A,B,C','FRTRET',1,2);
insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1620524980818,'2021-05-09 09:49:40',1620524853728,'高等数学期末考试','10以内的合数有哪些','[]',25,'468910','STRT',3,4);

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1620525334395 DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1620525317071,'2021-05-09 09:55:16',1620524792015,NULL,1620524853728,'高等数学期末考试',1620524894087,'10以内的质数有几个','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.3\",\"code\":\"B\"},{\"text\":\"C.4\",\"code\":\"C\"},{\"text\":\"D.5\",\"code\":\"D\"}]',25,'C','填写正确答案解析',0,'A');
insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1620525320946,'2021-05-09 09:55:20',1620524792015,NULL,1620524853728,'高等数学期末考试',1620524959882,'10以内的质数有哪些','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.3\",\"code\":\"B\"},{\"text\":\"C.5\",\"code\":\"C\"},{\"text\":\"D.8\",\"code\":\"D\"}]',25,'A,B,C','FRTRET',25,'A,B,C');
insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1620525328534,'2021-05-09 09:55:27',1620524792015,NULL,1620524853728,'高等数学期末考试',1620524920951,'10以内的合数有4个','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',25,'B','有5个，分别是468910',0,'A');
insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1620525334394,'2021-05-09 09:55:33',1620524792015,NULL,1620524853728,'高等数学期末考试',1620524980818,'10以内的合数有哪些','[]',25,'468910','STRT',0,'A');

/*Table structure for table `jiaoshi` */

DROP TABLE IF EXISTS `jiaoshi`;

CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoshigonghao` varchar(200) NOT NULL COMMENT '教师工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  `zhicheng` varchar(200) DEFAULT NULL COMMENT '职称',
  `renjiaokemu` varchar(200) DEFAULT NULL COMMENT '任教科目',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `jiaoshiyouxiang` varchar(200) DEFAULT NULL COMMENT '教师邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaoshigonghao` (`jiaoshigonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1620524816609 DEFAULT CHARSET=utf8 COMMENT='教师';

/*Data for the table `jiaoshi` */

insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (31,'2021-05-09 09:41:15','教师1','123456','教师姓名1','男','http://localhost:8080/springbootu521z/upload/jiaoshi_zhaopian1.jpg','职称1','任教科目1','13823888881','773890001@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (32,'2021-05-09 09:41:15','教师2','123456','教师姓名2','男','http://localhost:8080/springbootu521z/upload/jiaoshi_zhaopian2.jpg','职称2','任教科目2','13823888882','773890002@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (33,'2021-05-09 09:41:15','教师3','123456','教师姓名3','男','http://localhost:8080/springbootu521z/upload/jiaoshi_zhaopian3.jpg','职称3','任教科目3','13823888883','773890003@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (34,'2021-05-09 09:41:15','教师4','123456','教师姓名4','男','http://localhost:8080/springbootu521z/upload/jiaoshi_zhaopian4.jpg','职称4','任教科目4','13823888884','773890004@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (35,'2021-05-09 09:41:15','教师5','123456','教师姓名5','男','http://localhost:8080/springbootu521z/upload/jiaoshi_zhaopian5.jpg','职称5','任教科目5','13823888885','773890005@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (36,'2021-05-09 09:41:15','教师6','123456','教师姓名6','男','http://localhost:8080/springbootu521z/upload/jiaoshi_zhaopian6.jpg','职称6','任教科目6','13823888886','773890006@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (1620524816608,'2021-05-09 09:46:56','2','22','张悦','女','http://localhost:8080/springbootu521z/upload/1620524806538.jpg','高级教师','高等数学','12345678941','12369@qq.com');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'abo','users','管理员','ghdo4hseskx47913sm3ok0qhqitg94op','2021-05-09 09:42:22','2021-05-09 10:51:05');
insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (2,21,'学生1','xuesheng','学生','tf1pjdvh8detvsotfzpwvhn32eg0s178','2021-05-09 09:42:40','2021-05-09 10:42:41');
insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (3,31,'教师1','jiaoshi','管理员','vaihe4dfscvmbuzr2va560ih0lqn2gj4','2021-05-09 09:44:15','2021-05-09 10:44:16');
insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (4,1620524816608,'2','jiaoshi','管理员','qdiy3k5ant8zi05fgxu09getx3low8m6','2021-05-09 09:47:04','2021-05-09 10:50:43');
insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (5,1620524792015,'1','xuesheng','学生','h5hffkcm7fuqn80ycgxeuyr7pyrev7b7','2021-05-09 09:49:51','2021-05-09 10:52:14');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'abo','abo','管理员','2021-05-09 09:41:15');

/*Table structure for table `xuesheng` */

DROP TABLE IF EXISTS `xuesheng`;

CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xueshengxingming` varchar(200) NOT NULL COMMENT '学生姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `zhuanye` varchar(200) DEFAULT NULL COMMENT '专业',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=1620524792016 DEFAULT CHARSET=utf8 COMMENT='学生';

/*Data for the table `xuesheng` */

insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`zhuanye`,`shouji`,`youxiang`) values (21,'2021-05-09 09:41:15','学生1','123456','学生姓名1','男','http://localhost:8080/springbootu521z/upload/xuesheng_touxiang1.jpg','专业1','13823888881','773890001@qq.com');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`zhuanye`,`shouji`,`youxiang`) values (22,'2021-05-09 09:41:15','学生2','123456','学生姓名2','男','http://localhost:8080/springbootu521z/upload/xuesheng_touxiang2.jpg','专业2','13823888882','773890002@qq.com');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`zhuanye`,`shouji`,`youxiang`) values (23,'2021-05-09 09:41:15','学生3','123456','学生姓名3','男','http://localhost:8080/springbootu521z/upload/xuesheng_touxiang3.jpg','专业3','13823888883','773890003@qq.com');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`zhuanye`,`shouji`,`youxiang`) values (24,'2021-05-09 09:41:15','学生4','123456','学生姓名4','男','http://localhost:8080/springbootu521z/upload/xuesheng_touxiang4.jpg','专业4','13823888884','773890004@qq.com');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`zhuanye`,`shouji`,`youxiang`) values (25,'2021-05-09 09:41:15','学生5','123456','学生姓名5','男','http://localhost:8080/springbootu521z/upload/xuesheng_touxiang5.jpg','专业5','13823888885','773890005@qq.com');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`zhuanye`,`shouji`,`youxiang`) values (26,'2021-05-09 09:41:15','学生6','123456','学生姓名6','男','http://localhost:8080/springbootu521z/upload/xuesheng_touxiang6.jpg','专业6','13823888886','773890006@qq.com');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`zhuanye`,`shouji`,`youxiang`) values (1620524792015,'2021-05-09 09:46:32','1','11','陈一','女','http://localhost:8080/springbootu521z/upload/1620524781695.jpg','土木工程','12345678945','159@qq.com');

/*Table structure for table `zhuanye` */

DROP TABLE IF EXISTS `zhuanye`;

CREATE TABLE `zhuanye` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhuanye` varchar(200) NOT NULL COMMENT '专业',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhuanye` (`zhuanye`)
) ENGINE=InnoDB AUTO_INCREMENT=1620524767815 DEFAULT CHARSET=utf8 COMMENT='专业';

/*Data for the table `zhuanye` */

insert  into `zhuanye`(`id`,`addtime`,`zhuanye`) values (11,'2021-05-09 09:41:15','专业1');
insert  into `zhuanye`(`id`,`addtime`,`zhuanye`) values (12,'2021-05-09 09:41:15','专业2');
insert  into `zhuanye`(`id`,`addtime`,`zhuanye`) values (13,'2021-05-09 09:41:15','专业3');
insert  into `zhuanye`(`id`,`addtime`,`zhuanye`) values (14,'2021-05-09 09:41:15','专业4');
insert  into `zhuanye`(`id`,`addtime`,`zhuanye`) values (15,'2021-05-09 09:41:15','专业5');
insert  into `zhuanye`(`id`,`addtime`,`zhuanye`) values (16,'2021-05-09 09:41:15','专业6');
insert  into `zhuanye`(`id`,`addtime`,`zhuanye`) values (1620524767814,'2021-05-09 09:46:07','土木工程');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
