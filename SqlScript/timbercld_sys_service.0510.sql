-- MySQL dump 10.16  Distrib 10.2.6-MariaDB, for osx10.12 (x86_64)
--
-- Host: localhost    Database: timbercld_sys_service
-- ------------------------------------------------------
-- Server version	10.2.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `SCHED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `QRTZ_LOCKS` VALUES ('TimbercldScheduler','STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('TimbercldScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('TimbercldScheduler','Zhiyuans-MacBook-Pro.local1684080701350',1684081513899,5000);
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(6) DEFAULT NULL,
  `JOB_DATA` blob DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority_token`
--

DROP TABLE IF EXISTS `authority_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authority_token` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token` varchar(100) NOT NULL COMMENT '用户token',
  `expire_date` datetime DEFAULT NULL COMMENT '过期时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_id` (`user_id`) USING BTREE,
  UNIQUE KEY `uk_token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统用户Token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority_token`
--

LOCK TABLES `authority_token` WRITE;
/*!40000 ALTER TABLE `authority_token` DISABLE KEYS */;
INSERT INTO `authority_token` VALUES (1655765192379777026,1683566875800000001,'ba556ef11e10710cf016cfa53f2b0db8','2023-06-13 22:49:01','2023-05-14 22:49:01','2023-05-09 10:42:39');
INSERT INTO `authority_token` VALUES (1656102283340988417,1656102156412960769,'ec0acfbf48b0eee343fb8e60c71d05a5','2023-06-09 09:02:07','2023-05-10 09:02:07','2023-05-10 09:02:07');
INSERT INTO `authority_token` VALUES (1656106016158302209,1656105809286840321,'52d747687d510e4c7df03814984fd203','2023-06-13 18:09:48','2023-05-14 18:09:48','2023-05-10 09:16:57');
INSERT INTO `authority_token` VALUES (1657759824802222081,1657759744837816322,'2fd1e34d0ddd9045960b82518fa4cec4','2023-06-13 22:50:13','2023-05-14 22:50:13','2023-05-14 22:48:36');
/*!40000 ALTER TABLE `authority_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_product`
--

DROP TABLE IF EXISTS `demo_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_product` (
  `creator_id` bigint(20) DEFAULT NULL,
  `updater_id` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `marks` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_product`
--

LOCK TABLES `demo_product` WRITE;
/*!40000 ALTER TABLE `demo_product` DISABLE KEYS */;
INSERT INTO `demo_product` VALUES (1683566875800000001,1683566875800000001,'2023-05-09 10:44:15','2023-05-09 10:44:15','./upload/demo/693723-1_w.jpg',42.50,'商品一',1655765596953952258,0,'这是商品一的描述');
/*!40000 ALTER TABLE `demo_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logger_error`
--

DROP TABLE IF EXISTS `logger_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logger_error` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `request_url` varchar(200) DEFAULT NULL COMMENT '请求URI',
  `request_method` varchar(20) DEFAULT NULL COMMENT '请求方式',
  `request_params` text DEFAULT NULL COMMENT '请求参数',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户代理',
  `ip` varchar(32) DEFAULT NULL COMMENT '操作IP',
  `error_info` text DEFAULT NULL COMMENT '异常信息',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='异常日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logger_error`
--

LOCK TABLES `logger_error` WRITE;
/*!40000 ALTER TABLE `logger_error` DISABLE KEYS */;
INSERT INTO `logger_error` VALUES (1655767682181545985,'/timbercld/login','POST',NULL,'PostmanRuntime/7.28.3','0:0:0:0:0:0:0:1','org.springframework.http.converter.HttpMessageNotReadableException: Required request body is missing: public com.timbercld.core.utils.Result com.timbercld.ws.authority.controller.LoginController.login(javax.servlet.http.HttpServletRequest,com.timbercld.ws.authority.dto.LoginInfoDTO)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor.readWithMessageConverters(RequestResponseBodyMethodProcessor.java:163)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor.resolveArgument(RequestResponseBodyMethodProcessor.java:133)\n	at org.springframework.web.method.support.HandlerMethodArgumentResolverComposite.resolveArgument(HandlerMethodArgumentResolverComposite.java:122)\n	at org.springframework.web.method.support.InvocableHandlerMethod.getMethodArgumentValues(InvocableHandlerMethod.java:179)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:146)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:665)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:750)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.XssFilter.doFilter(XssFilter.java:45)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.SqlFilter.doFilter(SqlFilter.java:44)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:829)\n',NULL,'2023-05-09 10:52:32');
INSERT INTO `logger_error` VALUES (1657745715516010497,'/timbercld/login','POST',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.timbercld.ws.system.dao.SystemUserDAO.getByUsername\n	at org.apache.ibatis.binding.MapperMethod$SqlCommand.<init>(MapperMethod.java:229)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.<init>(MybatisMapperMethod.java:50)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.lambda$cachedInvoker$0(MybatisMapperProxy.java:111)\n	at java.base/java.util.concurrent.ConcurrentHashMap.computeIfAbsent(ConcurrentHashMap.java:1705)\n	at com.baomidou.mybatisplus.core.toolkit.CollectionUtils.computeIfAbsent(CollectionUtils.java:115)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.cachedInvoker(MybatisMapperProxy.java:98)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy86.getByUsername(Unknown Source)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl.getByUsername(SystemUserServiceImpl.java:107)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl$$FastClassBySpringCGLIB$$ec3ad46a.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy.invokeMethod(CglibAopProxy.java:386)\n	at org.springframework.aop.framework.CglibAopProxy.access$000(CglibAopProxy.java:85)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl$$EnhancerBySpringCGLIB$$22cc2ccc.getByUsername(<generated>)\n	at com.timbercld.ws.authority.controller.LoginController.loginValidation(LoginController.java:136)\n	at com.timbercld.ws.authority.controller.LoginController.login(LoginController.java:124)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:665)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:750)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.XssFilter.doFilter(XssFilter.java:45)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.SqlFilter.doFilter(SqlFilter.java:44)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:829)\n',NULL,'2023-05-14 21:52:32');
INSERT INTO `logger_error` VALUES (1657745857182822401,'/timbercld/login','POST',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.timbercld.ws.system.dao.SystemUserDAO.getByUsername\n	at org.apache.ibatis.binding.MapperMethod$SqlCommand.<init>(MapperMethod.java:229)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.<init>(MybatisMapperMethod.java:50)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.lambda$cachedInvoker$0(MybatisMapperProxy.java:111)\n	at java.base/java.util.concurrent.ConcurrentHashMap.computeIfAbsent(ConcurrentHashMap.java:1705)\n	at com.baomidou.mybatisplus.core.toolkit.CollectionUtils.computeIfAbsent(CollectionUtils.java:115)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.cachedInvoker(MybatisMapperProxy.java:98)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy86.getByUsername(Unknown Source)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl.getByUsername(SystemUserServiceImpl.java:107)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl$$FastClassBySpringCGLIB$$ec3ad46a.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy.invokeMethod(CglibAopProxy.java:386)\n	at org.springframework.aop.framework.CglibAopProxy.access$000(CglibAopProxy.java:85)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl$$EnhancerBySpringCGLIB$$22cc2ccc.getByUsername(<generated>)\n	at com.timbercld.ws.authority.controller.LoginController.loginValidation(LoginController.java:136)\n	at com.timbercld.ws.authority.controller.LoginController.login(LoginController.java:124)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:665)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:750)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.XssFilter.doFilter(XssFilter.java:45)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.SqlFilter.doFilter(SqlFilter.java:44)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:829)\n',NULL,'2023-05-14 21:53:06');
INSERT INTO `logger_error` VALUES (1657746266907602946,'/timbercld/login','POST',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.timbercld.ws.system.dao.SystemUserDAO.getByUsername\n	at org.apache.ibatis.binding.MapperMethod$SqlCommand.<init>(MapperMethod.java:229)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.<init>(MybatisMapperMethod.java:50)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.lambda$cachedInvoker$0(MybatisMapperProxy.java:111)\n	at java.base/java.util.concurrent.ConcurrentHashMap.computeIfAbsent(ConcurrentHashMap.java:1705)\n	at com.baomidou.mybatisplus.core.toolkit.CollectionUtils.computeIfAbsent(CollectionUtils.java:115)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.cachedInvoker(MybatisMapperProxy.java:98)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy86.getByUsername(Unknown Source)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl.getByUsername(SystemUserServiceImpl.java:107)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl$$FastClassBySpringCGLIB$$ec3ad46a.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy.invokeMethod(CglibAopProxy.java:386)\n	at org.springframework.aop.framework.CglibAopProxy.access$000(CglibAopProxy.java:85)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl$$EnhancerBySpringCGLIB$$22cc2ccc.getByUsername(<generated>)\n	at com.timbercld.ws.authority.controller.LoginController.loginValidation(LoginController.java:136)\n	at com.timbercld.ws.authority.controller.LoginController.login(LoginController.java:124)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:665)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:750)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.XssFilter.doFilter(XssFilter.java:45)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.SqlFilter.doFilter(SqlFilter.java:44)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:829)\n',NULL,'2023-05-14 21:54:44');
INSERT INTO `logger_error` VALUES (1657747651724079105,'/timbercld/login','POST',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.timbercld.ws.system.dao.SystemUserDAO.getByUsername\n	at org.apache.ibatis.binding.MapperMethod$SqlCommand.<init>(MapperMethod.java:229)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.<init>(MybatisMapperMethod.java:50)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.lambda$cachedInvoker$0(MybatisMapperProxy.java:111)\n	at java.base/java.util.concurrent.ConcurrentHashMap.computeIfAbsent(ConcurrentHashMap.java:1705)\n	at com.baomidou.mybatisplus.core.toolkit.CollectionUtils.computeIfAbsent(CollectionUtils.java:115)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.cachedInvoker(MybatisMapperProxy.java:98)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy86.getByUsername(Unknown Source)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl.getByUsername(SystemUserServiceImpl.java:107)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl$$FastClassBySpringCGLIB$$ec3ad46a.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy.invokeMethod(CglibAopProxy.java:386)\n	at org.springframework.aop.framework.CglibAopProxy.access$000(CglibAopProxy.java:85)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl$$EnhancerBySpringCGLIB$$f9d27ad4.getByUsername(<generated>)\n	at com.timbercld.ws.authority.controller.LoginController.loginValidation(LoginController.java:136)\n	at com.timbercld.ws.authority.controller.LoginController.login(LoginController.java:124)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:665)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:750)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.XssFilter.doFilter(XssFilter.java:45)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.SqlFilter.doFilter(SqlFilter.java:44)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:829)\n',NULL,'2023-05-14 22:00:14');
INSERT INTO `logger_error` VALUES (1657748312809332737,'/timbercld/login','POST',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.timbercld.ws.system.dao.SystemUserDAO.getByUsername\n	at org.apache.ibatis.binding.MapperMethod$SqlCommand.<init>(MapperMethod.java:229)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.<init>(MybatisMapperMethod.java:50)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.lambda$cachedInvoker$0(MybatisMapperProxy.java:111)\n	at java.base/java.util.concurrent.ConcurrentHashMap.computeIfAbsent(ConcurrentHashMap.java:1705)\n	at com.baomidou.mybatisplus.core.toolkit.CollectionUtils.computeIfAbsent(CollectionUtils.java:115)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.cachedInvoker(MybatisMapperProxy.java:98)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy86.getByUsername(Unknown Source)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl.getByUsername(SystemUserServiceImpl.java:107)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl$$FastClassBySpringCGLIB$$ec3ad46a.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy.invokeMethod(CglibAopProxy.java:386)\n	at org.springframework.aop.framework.CglibAopProxy.access$000(CglibAopProxy.java:85)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\n	at com.timbercld.ws.system.service.impl.SystemUserServiceImpl$$EnhancerBySpringCGLIB$$f9d27ad4.getByUsername(<generated>)\n	at com.timbercld.ws.authority.controller.LoginController.loginValidation(LoginController.java:136)\n	at com.timbercld.ws.authority.controller.LoginController.login(LoginController.java:124)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:665)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:750)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.XssFilter.doFilter(XssFilter.java:45)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.SqlFilter.doFilter(SqlFilter.java:44)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:829)\n',NULL,'2023-05-14 22:02:51');
INSERT INTO `logger_error` VALUES (1657756125208010753,'/timbercld/shop/products/save','PUT',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'PUT\' not supported\n	at org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.handleNoMatch(RequestMappingInfoHandlerMapping.java:253)\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.lookupHandlerMethod(AbstractHandlerMethodMapping.java:442)\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:383)\n	at org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.getHandlerInternal(RequestMappingInfoHandlerMapping.java:125)\n	at org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.getHandlerInternal(RequestMappingInfoHandlerMapping.java:67)\n	at org.springframework.web.servlet.handler.AbstractHandlerMapping.getHandler(AbstractHandlerMapping.java:498)\n	at org.springframework.web.servlet.DispatcherServlet.getHandler(DispatcherServlet.java:1265)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1047)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPut(FrameworkServlet.java:920)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:668)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:750)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.XssFilter.doFilter(XssFilter.java:45)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.SqlFilter.doFilter(SqlFilter.java:44)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:829)\n',1683566875800000001,'2023-05-14 22:33:54');
INSERT INTO `logger_error` VALUES (1657766896159698946,'/timbercld/shop/products/page','GET','{\"_t\":\"1684077402181\",\"limit\":\"10\",\"page\":\"1\"}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'t2.dept_id\' in \'field list\'\n### The error may exist in file [/Users/zouzhiyuan/IDE/IdeaProjects/SDEV/timbercld-sys-service/timbercld-starter/target/classes/mapper/shop/ShopProductsDAO.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT t1.*, t2.name AS shopName, t2.dept_id FROM shop_product t1 LEFT JOIN system_dept t2 ON t2.id = t3.dept_id LEFT JOIN system_user t3 ON t1.creator_id = t3.id ORDER BY update_date DESC LIMIT ?\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'t2.dept_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'t2.dept_id\' in \'field list\'\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\n	at com.sun.proxy.$Proxy85.selectList(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:224)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForMany(MybatisMapperMethod.java:166)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:77)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy118.getProductsList(Unknown Source)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:344)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:198)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:215)\n	at com.sun.proxy.$Proxy119.getProductsList(Unknown Source)\n	at com.timbercld.ws.shop.service.impl.ProductsServiceImpl.page(ProductsServiceImpl.java:26)\n	at com.timbercld.ws.shop.service.impl.ProductsServiceImpl$$FastClassBySpringCGLIB$$28ca4479.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy.invokeMethod(CglibAopProxy.java:386)\n	at org.springframework.aop.framework.CglibAopProxy.access$000(CglibAopProxy.java:85)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\n	at com.timbercld.ws.shop.service.impl.ProductsServiceImpl$$EnhancerBySpringCGLIB$$37e77499.page(<generated>)\n	at com.timbercld.ws.shop.controller.ProductsController.page(ProductsController.java:56)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:898)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:645)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:750)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.XssFilter.doFilter(XssFilter.java:45)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.SqlFilter.doFilter(SqlFilter.java:44)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:829)\nCaused by: java.sql.SQLSyntaxErrorException: Unknown column \'t2.dept_id\' in \'field list\'\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:121)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:916)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:354)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:483)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:58)\n	at com.sun.proxy.$Proxy183.execute(Unknown Source)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.query(PreparedStatementHandler.java:65)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.query(RoutingStatementHandler.java:80)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\n	at com.sun.proxy.$Proxy181.query(Unknown Source)\n	at org.apache.ibatis.executor.SimpleExecutor.doQuery(SimpleExecutor.java:65)\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:333)\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:158)\n	at com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor.intercept(MybatisPlusInterceptor.java:81)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:59)\n	at com.sun.proxy.$Proxy180.query(Unknown Source)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:154)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:147)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:142)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:427)\n	... 122 more\n',1657759744837816322,'2023-05-14 23:16:42');
INSERT INTO `logger_error` VALUES (1657767048547160065,'/timbercld/shop/products/page','GET','{\"_t\":\"1684077438460\",\"limit\":\"10\",\"page\":\"1\"}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'t3.dept_id\' in \'on clause\'\n### The error may exist in file [/Users/zouzhiyuan/IDE/IdeaProjects/SDEV/timbercld-sys-service/timbercld-starter/target/classes/mapper/shop/ShopProductsDAO.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT t1.*, t2.name AS shopName, t2.id AS dept_id FROM shop_product t1 LEFT JOIN system_dept t2 ON t2.id = t3.dept_id LEFT JOIN system_user t3 ON t1.creator_id = t3.id ORDER BY update_date DESC LIMIT ?\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'t3.dept_id\' in \'on clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'t3.dept_id\' in \'on clause\'\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\n	at com.sun.proxy.$Proxy85.selectList(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:224)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForMany(MybatisMapperMethod.java:166)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:77)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy118.getProductsList(Unknown Source)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:344)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:198)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:215)\n	at com.sun.proxy.$Proxy119.getProductsList(Unknown Source)\n	at com.timbercld.ws.shop.service.impl.ProductsServiceImpl.page(ProductsServiceImpl.java:26)\n	at com.timbercld.ws.shop.service.impl.ProductsServiceImpl$$FastClassBySpringCGLIB$$28ca4479.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy.invokeMethod(CglibAopProxy.java:386)\n	at org.springframework.aop.framework.CglibAopProxy.access$000(CglibAopProxy.java:85)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\n	at com.timbercld.ws.shop.service.impl.ProductsServiceImpl$$EnhancerBySpringCGLIB$$c2f33465.page(<generated>)\n	at com.timbercld.ws.shop.controller.ProductsController.page(ProductsController.java:56)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:898)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:645)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:750)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.XssFilter.doFilter(XssFilter.java:45)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.SqlFilter.doFilter(SqlFilter.java:44)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:829)\nCaused by: java.sql.SQLSyntaxErrorException: Unknown column \'t3.dept_id\' in \'on clause\'\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:121)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:916)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:354)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:483)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:58)\n	at com.sun.proxy.$Proxy183.execute(Unknown Source)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.query(PreparedStatementHandler.java:65)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.query(RoutingStatementHandler.java:80)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\n	at com.sun.proxy.$Proxy181.query(Unknown Source)\n	at org.apache.ibatis.executor.SimpleExecutor.doQuery(SimpleExecutor.java:65)\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:333)\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:158)\n	at com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor.intercept(MybatisPlusInterceptor.java:81)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:59)\n	at com.sun.proxy.$Proxy180.query(Unknown Source)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:154)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:147)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:142)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:427)\n	... 122 more\n',1657759744837816322,'2023-05-14 23:17:18');
INSERT INTO `logger_error` VALUES (1657779867451666434,'/timbercld/shop/products/page','GET','{\"_t\":\"1684080494705\",\"limit\":\"10\",\"page\":\"1\"}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'where (t1.dept_id in(1657759458853392386) or t1.creator_id=1657759744837816322) \' at line 1\n### The error may exist in file [/Users/zouzhiyuan/IDE/IdeaProjects/SDEV/timbercld-sys-service/timbercld-starter/target/classes/mapper/shop/ShopProductsDAO.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT t1.*, t2.name AS shopName FROM shop_product t1 LEFT JOIN system_dept t2 ON t2.id = t1.dept_id WHERE  where (t1.dept_id in(1657759458853392386) or t1.creator_id=1657759744837816322) ORDER BY update_date DESC LIMIT ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'where (t1.dept_id in(1657759458853392386) or t1.creator_id=1657759744837816322) \' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'where (t1.dept_id in(1657759458853392386) or t1.creator_id=1657759744837816322) \' at line 1\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\n	at com.sun.proxy.$Proxy84.selectList(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:224)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForMany(MybatisMapperMethod.java:166)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:77)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy118.getProductsList(Unknown Source)\n	at com.timbercld.ws.shop.service.impl.ProductsServiceImpl.page(ProductsServiceImpl.java:28)\n	at com.timbercld.ws.shop.service.impl.ProductsServiceImpl$$FastClassBySpringCGLIB$$28ca4479.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\n	at com.timbercld.ws.shop.service.impl.ProductsServiceImpl$$EnhancerBySpringCGLIB$$e70679a7.page(<generated>)\n	at com.timbercld.ws.shop.controller.ProductsController.page(ProductsController.java:56)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:898)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:645)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:750)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.XssFilter.doFilter(XssFilter.java:45)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.SqlFilter.doFilter(SqlFilter.java:44)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:829)\nCaused by: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'where (t1.dept_id in(1657759458853392386) or t1.creator_id=1657759744837816322) \' at line 1\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:121)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:916)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:354)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:483)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:58)\n	at com.sun.proxy.$Proxy182.execute(Unknown Source)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.query(PreparedStatementHandler.java:65)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.query(RoutingStatementHandler.java:80)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\n	at com.sun.proxy.$Proxy180.query(Unknown Source)\n	at org.apache.ibatis.executor.SimpleExecutor.doQuery(SimpleExecutor.java:65)\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:333)\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:158)\n	at com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor.intercept(MybatisPlusInterceptor.java:81)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:59)\n	at com.sun.proxy.$Proxy179.query(Unknown Source)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:154)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:147)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:142)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:427)\n	... 116 more\n',1657759744837816322,'2023-05-15 00:08:15');
INSERT INTO `logger_error` VALUES (1657780521872130049,'/timbercld/shop/products/page','GET','{\"_t\":\"1684080650685\",\"limit\":\"10\",\"page\":\"1\"}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'on t2.id=t1.dept_id) shopName from shop_product t1) TOTAL\' at line 1\n### The error may exist in file [/Users/zouzhiyuan/IDE/IdeaProjects/SDEV/timbercld-sys-service/timbercld-starter/target/classes/mapper/shop/ShopProductsDAO.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: SELECT COUNT(*) FROM (select t1.*, (select t2.name from system_dept t2 on t2.id=t1.dept_id) shopName from shop_product t1) TOTAL\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'on t2.id=t1.dept_id) shopName from shop_product t1) TOTAL\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'on t2.id=t1.dept_id) shopName from shop_product t1) TOTAL\' at line 1\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\n	at com.sun.proxy.$Proxy84.selectList(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:224)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.executeForMany(MybatisMapperMethod.java:166)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:77)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy118.getProductsList(Unknown Source)\n	at com.timbercld.ws.shop.service.impl.ProductsServiceImpl.page(ProductsServiceImpl.java:28)\n	at com.timbercld.ws.shop.service.impl.ProductsServiceImpl$$FastClassBySpringCGLIB$$28ca4479.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:793)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.framework.adapter.MethodBeforeAdviceInterceptor.invoke(MethodBeforeAdviceInterceptor.java:58)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:763)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\n	at com.timbercld.ws.shop.service.impl.ProductsServiceImpl$$EnhancerBySpringCGLIB$$ebdd35fe.page(<generated>)\n	at com.timbercld.ws.shop.controller.ProductsController.page(ProductsController.java:56)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1071)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:964)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:898)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:645)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:750)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.XssFilter.doFilter(XssFilter.java:45)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:458)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:373)\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:388)\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:370)\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:154)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.timbercld.core.filter.SqlFilter.doFilter(SqlFilter.java:44)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:541)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:360)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1789)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.base/java.lang.Thread.run(Thread.java:829)\nCaused by: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'on t2.id=t1.dept_id) shopName from shop_product t1) TOTAL\' at line 1\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:121)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:916)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:354)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:483)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:58)\n	at com.sun.proxy.$Proxy182.execute(Unknown Source)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.query(PreparedStatementHandler.java:65)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.query(RoutingStatementHandler.java:80)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\n	at com.sun.proxy.$Proxy180.query(Unknown Source)\n	at org.apache.ibatis.executor.SimpleExecutor.doQuery(SimpleExecutor.java:65)\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:333)\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:158)\n	at com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor.willDoQuery(PaginationInnerInterceptor.java:135)\n	at com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor.intercept(MybatisPlusInterceptor.java:75)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:59)\n	at com.sun.proxy.$Proxy179.query(Unknown Source)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:154)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:147)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:142)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:566)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:427)\n	... 116 more\n',1657759744837816322,'2023-05-15 00:10:51');
/*!40000 ALTER TABLE `logger_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logger_login`
--

DROP TABLE IF EXISTS `logger_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logger_login` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `operation` tinyint(3) unsigned DEFAULT NULL COMMENT '用户操作   0：用户登录   1：用户退出',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态  0：失败    1：成功    2：账号已锁定',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户代理',
  `ip` varchar(32) DEFAULT NULL COMMENT '操作IP',
  `creator_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logger_login`
--

LOCK TABLES `logger_login` WRITE;
/*!40000 ALTER TABLE `logger_login` DISABLE KEYS */;
INSERT INTO `logger_login` VALUES (1655765192321056769,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',NULL,'2023-05-09 10:42:39');
INSERT INTO `logger_login` VALUES (1655766609106616321,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',1683566875800000001,'2023-05-09 10:48:16');
INSERT INTO `logger_login` VALUES (1655767215724609538,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',NULL,'2023-05-09 10:50:41');
INSERT INTO `logger_login` VALUES (1655768228934238209,0,1,'PostmanRuntime/7.28.3','0:0:0:0:0:0:0:1','admin',NULL,'2023-05-09 10:54:43');
INSERT INTO `logger_login` VALUES (1656102283290656769,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/109.0','127.0.0.1','useradmin',NULL,'2023-05-10 09:02:07');
INSERT INTO `logger_login` VALUES (1656105967454044161,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/109.0','127.0.0.1','useradmin',1656102156412960769,'2023-05-10 09:16:46');
INSERT INTO `logger_login` VALUES (1656106016149913601,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/109.0','127.0.0.1','bistu_admin',NULL,'2023-05-10 09:16:57');
INSERT INTO `logger_login` VALUES (1656107516716695554,0,1,'PostmanRuntime/7.28.3','0:0:0:0:0:0:0:1','bistu_admin',NULL,'2023-05-10 09:22:55');
INSERT INTO `logger_login` VALUES (1656114534227664897,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',NULL,'2023-05-10 09:50:48');
INSERT INTO `logger_login` VALUES (1656161887819218945,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',NULL,'2023-05-10 12:58:58');
INSERT INTO `logger_login` VALUES (1657669583563128833,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',NULL,'2023-05-14 16:50:01');
INSERT INTO `logger_login` VALUES (1657669675804262401,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',1683566875800000001,'2023-05-14 16:50:23');
INSERT INTO `logger_login` VALUES (1657669714857426945,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','bistu_admin',NULL,'2023-05-14 16:50:32');
INSERT INTO `logger_login` VALUES (1657669748156006402,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','bistu_admin',1656105809286840321,'2023-05-14 16:50:40');
INSERT INTO `logger_login` VALUES (1657669797233557506,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',NULL,'2023-05-14 16:50:52');
INSERT INTO `logger_login` VALUES (1657669972559659010,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',1683566875800000001,'2023-05-14 16:51:34');
INSERT INTO `logger_login` VALUES (1657670027630870530,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','bistu_admin',NULL,'2023-05-14 16:51:47');
INSERT INTO `logger_login` VALUES (1657684993545076738,0,1,'PostmanRuntime/7.28.3','0:0:0:0:0:0:0:1','bistu_admin',NULL,'2023-05-14 17:51:15');
INSERT INTO `logger_login` VALUES (1657688427543502849,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','bistu_admin',1656105809286840321,'2023-05-14 18:04:54');
INSERT INTO `logger_login` VALUES (1657688459822866434,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',NULL,'2023-05-14 18:05:01');
INSERT INTO `logger_login` VALUES (1657688687296749570,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/109.0','127.0.0.1','bistu_admin',NULL,'2023-05-14 18:05:56');
INSERT INTO `logger_login` VALUES (1657689662728282113,0,1,'PostmanRuntime/7.28.3','0:0:0:0:0:0:0:1','bistu_admin',NULL,'2023-05-14 18:09:48');
INSERT INTO `logger_login` VALUES (1657749374123470849,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',NULL,'2023-05-14 22:07:04');
INSERT INTO `logger_login` VALUES (1657759781517004802,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',1683566875800000001,'2023-05-14 22:48:26');
INSERT INTO `logger_login` VALUES (1657759824735113218,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','book_admin',NULL,'2023-05-14 22:48:36');
INSERT INTO `logger_login` VALUES (1657759887918108673,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','book_admin',1657759744837816322,'2023-05-14 22:48:51');
INSERT INTO `logger_login` VALUES (1657759931081691138,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',NULL,'2023-05-14 22:49:01');
INSERT INTO `logger_login` VALUES (1657760196262367234,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','admin',1683566875800000001,'2023-05-14 22:50:05');
INSERT INTO `logger_login` VALUES (1657760232891224065,0,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','book_admin',NULL,'2023-05-14 22:50:13');
/*!40000 ALTER TABLE `logger_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logger_operation`
--

DROP TABLE IF EXISTS `logger_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logger_operation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `request_url` varchar(200) DEFAULT NULL COMMENT '请求URI',
  `request_method` varchar(20) DEFAULT NULL COMMENT '请求方式',
  `request_params` text DEFAULT NULL COMMENT '请求参数',
  `request_time` int(10) unsigned NOT NULL COMMENT '请求时长(毫秒)',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户代理',
  `ip` varchar(32) DEFAULT NULL COMMENT '操作IP',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态  0：失败   1：成功',
  `creator_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logger_operation`
--

LOCK TABLES `logger_operation` WRITE;
/*!40000 ALTER TABLE `logger_operation` DISABLE KEYS */;
INSERT INTO `logger_operation` VALUES (1655765589223849986,'图片上传','/timbercld/demo/product/upload/','POST','{\"fileName\":\"693723-1_w\",\"file\":\"受限的支持类型\"}',5,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-09 10:44:13');
INSERT INTO `logger_operation` VALUES (1655765597146890241,'保存','/timbercld/demo/product','POST','{\"dto\":{\"marks\":\"这是商品一的描述\",\"pic\":\"./upload/demo/693723-1_w.jpg\",\"price\":42.5,\"productName\":\"商品一\"}}',31,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-09 10:44:15');
INSERT INTO `logger_operation` VALUES (1656101940746043394,'保存','/timbercld/system/role','POST','{\"dto\":{\"comment\":\"\",\"deptIdList\":[1683560269189599233,1650384491958087682],\"menuIdList\":[1683566875800000002,1683566875800000055,1683566875800000056,1683566875800000003,1683566875800000004,1683566875800000005,1683566875800000006],\"name\":\"用户管理员\"}}',116,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:00:46');
INSERT INTO `logger_operation` VALUES (1656102156509429762,'保存','/timbercld/system/user','POST','{\"dto\":{\"deptId\":1650384491958087682,\"deptName\":\"研发部\",\"email\":\"user@sdev.com\",\"gender\":0,\"mobile\":\"18800001111\",\"realName\":\"用户管理员\",\"roleIdList\":[1656101940255309825],\"status\":1,\"username\":\"useradmin\"}}',147,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:01:37');
INSERT INTO `logger_operation` VALUES (1656102511985082369,'修改','/timbercld/system/role','PUT','{\"dto\":{\"comment\":\"\",\"deptIdList\":[1683560269189599233,1650384491958087682],\"id\":1656101940255309825,\"menuIdList\":[1683566875800000002,1683566875800000055,1683566875800000056,1683566875800000003,1683566875800000004,1683566875800000005,1683566875800000006],\"name\":\"用户管理员\"}}',40,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:03:02');
INSERT INTO `logger_operation` VALUES (1656103021328777217,'保存','/timbercld/system/menu','POST','{\"dto\":{\"children\":[],\"icon\":\"Food\",\"name\":\"商家管理\",\"order\":0,\"parentName\":\"一级菜单\",\"permissions\":\"\",\"pid\":0,\"type\":0,\"url\":\"\"}}',40,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:05:03');
INSERT INTO `logger_operation` VALUES (1656103641255297026,'保存','/timbercld/system/menu','POST','{\"dto\":{\"children\":[],\"icon\":\"GobletFull\",\"name\":\"商品管理\",\"order\":1,\"parentName\":\"商家管理\",\"permissions\":\"\",\"pid\":1656103021190365186,\"type\":0,\"url\":\"\"}}',47,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:07:31');
INSERT INTO `logger_operation` VALUES (1656103773598171137,'修改','/timbercld/system/menu','PUT','{\"dto\":{\"children\":[],\"icon\":\"GobletFull\",\"id\":1656103641142050818,\"name\":\"商品管理\",\"order\":1,\"parentName\":\"商家管理\",\"permissions\":\"\",\"pid\":1656103021190365186,\"type\":0,\"url\":\"shop/product\"}}',28,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:08:03');
INSERT INTO `logger_operation` VALUES (1656103879105888257,'保存','/timbercld/system/menu','POST','{\"dto\":{\"children\":[],\"icon\":\"DocumentCopy\",\"name\":\"订单管理\",\"order\":0,\"parentName\":\"商家管理\",\"permissions\":\"\",\"pid\":1656103021190365186,\"type\":0,\"url\":\"shop/order\"}}',12,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:08:28');
INSERT INTO `logger_operation` VALUES (1656103908285661186,'修改','/timbercld/system/menu','PUT','{\"dto\":{\"children\":[],\"icon\":\"DocumentCopy\",\"id\":1656103879089111042,\"name\":\"订单管理\",\"order\":2,\"parentName\":\"商家管理\",\"permissions\":\"\",\"pid\":1656103021190365186,\"type\":0,\"url\":\"shop/order\"}}',12,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:08:35');
INSERT INTO `logger_operation` VALUES (1656104065366540290,'保存','/timbercld/system/menu','POST','{\"dto\":{\"children\":[],\"icon\":\"Loading\",\"name\":\"评价管理\",\"order\":3,\"parentName\":\"商家管理\",\"permissions\":\"\",\"pid\":1656103021190365186,\"type\":0,\"url\":\"shop/comment\"}}',17,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:09:12');
INSERT INTO `logger_operation` VALUES (1656105272684363778,'修改','/timbercld/system/menu','PUT','{\"dto\":{\"children\":[],\"icon\":\"Grid\",\"id\":1683566875800000012,\"name\":\"商铺管理\",\"order\":1,\"parentName\":\"权限管理\",\"pid\":1683566875800000002,\"type\":0,\"url\":\"system/dept\"}}',12,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:14:00');
INSERT INTO `logger_operation` VALUES (1656105426887950338,'保存','/timbercld/system/dept','POST','{\"dto\":{\"children\":[],\"name\":\"BISTU二手店\",\"order\":0,\"parentName\":\"一级部门\",\"pid\":0}}',18,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:14:37');
INSERT INTO `logger_operation` VALUES (1656105587424935937,'保存','/timbercld/system/role','POST','{\"dto\":{\"comment\":\"\",\"deptIdList\":[1656105426841812994],\"menuIdList\":[1656103021190365186,1656103641142050818,1656103879089111042,1656104065328791553],\"name\":\"BISTU二手店管理员\"}}',29,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:15:15');
INSERT INTO `logger_operation` VALUES (1656105736595357698,'保存','/timbercld/system/user','POST','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"\",\"gender\":0,\"mobile\":\"\",\"realName\":\"123456\",\"roleIdList\":[1656105587387187201],\"status\":1,\"username\":\"bistu_admin\"}}',50,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',0,'admin',1683566875800000001,'2023-05-10 09:15:51');
INSERT INTO `logger_operation` VALUES (1656105765544443906,'保存','/timbercld/system/user','POST','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"\",\"gender\":0,\"mobile\":\"18800001111\",\"realName\":\"123456\",\"roleIdList\":[1656105587387187201],\"status\":1,\"username\":\"bistu_admin\"}}',8,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',0,'admin',1683566875800000001,'2023-05-10 09:15:58');
INSERT INTO `logger_operation` VALUES (1656105809312006145,'保存','/timbercld/system/user','POST','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"mobile\":\"18800001111\",\"realName\":\"123456\",\"roleIdList\":[1656105587387187201],\"status\":1,\"username\":\"bistu_admin\"}}',101,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:16:08');
INSERT INTO `logger_operation` VALUES (1656106527137775617,'保存','/timbercld/system/menu','POST','{\"dto\":{\"children\":[],\"icon\":\"Document\",\"name\":\"商铺等组\",\"order\":0,\"parentName\":\"商家管理\",\"permissions\":\"\",\"pid\":1656103021190365186,\"type\":0,\"url\":\"shop/level\"}}',23,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:18:59');
INSERT INTO `logger_operation` VALUES (1656106644465041409,'修改','/timbercld/system/menu','PUT','{\"dto\":{\"children\":[],\"icon\":\"Document\",\"id\":1656106527120998401,\"name\":\"商铺等级\",\"order\":0,\"parentName\":\"商家管理\",\"permissions\":\"\",\"pid\":1656103021190365186,\"type\":0,\"url\":\"shop/level\"}}',13,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:19:27');
INSERT INTO `logger_operation` VALUES (1656114987837448193,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"123456\",\"roleIdList\":[1656105587387187201],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',52124,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:52:36');
INSERT INTO `logger_operation` VALUES (1656115057001521154,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"123456\",\"roleIdList\":[1656105587387187201],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',19,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:52:53');
INSERT INTO `logger_operation` VALUES (1656116102528262145,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"123456\",\"roleIdList\":[],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',193103,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:57:02');
INSERT INTO `logger_operation` VALUES (1656116253204439042,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"123456\",\"roleIdList\":[],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',4197,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 09:57:38');
INSERT INTO `logger_operation` VALUES (1656119479639236609,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"BISTU二手店管理员\",\"roleIdList\":[1656105587387187201],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',120,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 10:10:27');
INSERT INTO `logger_operation` VALUES (1656120127441100801,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"BISTU二手店管理员\",\"roleIdList\":[1656105587387187201],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',20,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 10:13:02');
INSERT INTO `logger_operation` VALUES (1656120172643115010,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"BISTU二手店管理员\",\"roleIdList\":[1656105587387187201],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',152,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 10:13:13');
INSERT INTO `logger_operation` VALUES (1656120272048119810,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"BISTU二手店管理员\",\"roleIdList\":[1656105587387187201],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',41,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 10:13:36');
INSERT INTO `logger_operation` VALUES (1656120846546132994,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"BISTU二手店管理员\",\"roleIdList\":[1656105587387187201],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',49406,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 10:15:53');
INSERT INTO `logger_operation` VALUES (1656121022966947842,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"BISTU二手店管理员\",\"roleIdList\":[1656105587387187201],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',38228,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 10:16:35');
INSERT INTO `logger_operation` VALUES (1656121091061473282,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"BISTU二手店管理员\",\"roleIdList\":[1656105587387187201],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',12,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 10:16:52');
INSERT INTO `logger_operation` VALUES (1656122196407377922,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"BISTU二手店管理员\",\"roleIdList\":[1656105587387187201],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',206602,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 10:21:15');
INSERT INTO `logger_operation` VALUES (1656125231820988417,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"BISTU二手店管理员\",\"roleIdList\":[1656105587387187201],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',720532,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-10 10:33:19');
INSERT INTO `logger_operation` VALUES (1657669868545114114,'修改','/timbercld/system/role','PUT','{\"dto\":{\"comment\":\"\",\"deptIdList\":[1656105426841812994],\"id\":1656105587387187201,\"menuIdList\":[1656103021190365186,1656106527120998401,1656103641142050818,1656103879089111042,1656104065328791553],\"name\":\"BISTU二手店管理员\"}}',42,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-14 16:51:09');
INSERT INTO `logger_operation` VALUES (1657669954603843586,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1656105426841812994,\"deptName\":\"BISTU二手店\",\"email\":\"bistu_admin@sdev.com\",\"gender\":0,\"id\":1656105809286840321,\"mobile\":\"18800001111\",\"realName\":\"BISTU二手店管理员\",\"roleIdList\":[1656105587387187201],\"status\":1,\"subSystemId\":1001,\"username\":\"bistu_admin\"}}',110,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-14 16:51:29');
INSERT INTO `logger_operation` VALUES (1657688606665449474,'修改','/timbercld/system/role','PUT','{\"dto\":{\"comment\":\"\",\"deptIdList\":[1656105426841812994],\"id\":1656105587387187201,\"menuIdList\":[1656103021190365186,1656103641142050818,1656103879089111042,1656104065328791553],\"name\":\"店铺管理员\"}}',44,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-14 18:05:36');
INSERT INTO `logger_operation` VALUES (1657689164289777666,'修改','/timbercld/system/menu','PUT','{\"dto\":{\"children\":[],\"icon\":\"GobletFull\",\"id\":1656103641142050818,\"name\":\"商品管理\",\"order\":1,\"parentName\":\"商家管理\",\"permissions\":\"\",\"pid\":1656103021190365186,\"type\":0,\"url\":\"shop/products\"}}',35,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-14 18:07:49');
INSERT INTO `logger_operation` VALUES (1657722051793862658,'修改','/timbercld/system/menu','PUT','{\"dto\":{\"children\":[],\"icon\":\"GobletFull\",\"id\":1656103641142050818,\"name\":\"商品管理\",\"order\":1,\"parentName\":\"商家管理\",\"permissions\":\"\",\"pid\":1656103021190365186,\"type\":0,\"url\":\"shop/products\"}}',100,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-14 20:18:30');
INSERT INTO `logger_operation` VALUES (1657726592316686338,'修改','/timbercld/system/menu','PUT','{\"dto\":{\"children\":[],\"icon\":\"GobletFull\",\"id\":1656103641142050818,\"name\":\"商品管理\",\"order\":1,\"parentName\":\"商家管理\",\"permissions\":\"\",\"pid\":1656103021190365186,\"type\":0,\"url\":\"demo/products\"}}',16,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-14 20:36:33');
INSERT INTO `logger_operation` VALUES (1657729425455792130,'修改','/timbercld/system/menu','PUT','{\"dto\":{\"children\":[],\"icon\":\"GobletFull\",\"id\":1656103641142050818,\"name\":\"商品管理\",\"order\":1,\"parentName\":\"商家管理\",\"permissions\":\"\",\"pid\":1656103021190365186,\"type\":0,\"url\":\"shop/products\"}}',11,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-14 20:47:48');
INSERT INTO `logger_operation` VALUES (1657759459042136066,'保存','/timbercld/system/dept','POST','{\"dto\":{\"children\":[],\"name\":\"课本专卖店\",\"order\":0,\"parentName\":\"一级部门\",\"pid\":0}}',42,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-14 22:47:09');
INSERT INTO `logger_operation` VALUES (1657759744963645442,'保存','/timbercld/system/user','POST','{\"dto\":{\"deptId\":1657759458853392386,\"deptName\":\"课本专卖店\",\"email\":\"book@sdev.com\",\"gender\":0,\"mobile\":\"18800001111\",\"realName\":\"课本专卖店\",\"roleIdList\":[1656105587387187201],\"status\":1,\"username\":\"book_admin\"}}',136,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-14 22:48:17');
INSERT INTO `logger_operation` VALUES (1657760014284099586,'修改','/timbercld/system/role','PUT','{\"dto\":{\"comment\":\"\",\"deptIdList\":[1656105426841812994],\"id\":1656105587387187201,\"menuIdList\":[1656103021190365186,1656103641142050818,1656103879089111042,1656104065328791553],\"name\":\"BISTU二手店管理员\"}}',18,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-14 22:49:21');
INSERT INTO `logger_operation` VALUES (1657760100015673346,'保存','/timbercld/system/role','POST','{\"dto\":{\"comment\":\"\",\"deptIdList\":[1657759458853392386],\"menuIdList\":[1656103021190365186,1656103641142050818,1656103879089111042,1656104065328791553],\"name\":\"课本专卖店管理员\"}}',15,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-14 22:49:42');
INSERT INTO `logger_operation` VALUES (1657760178012950530,'修改','/timbercld/system/user','PUT','{\"dto\":{\"deptId\":1657759458853392386,\"deptName\":\"课本专卖店\",\"email\":\"book@sdev.com\",\"gender\":0,\"id\":1657759744837816322,\"mobile\":\"18800001111\",\"realName\":\"课本专卖店\",\"roleIdList\":[1657760099982118914],\"status\":1,\"subSystemId\":1001,\"username\":\"book_admin\"}}',97,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1',1,'admin',1683566875800000001,'2023-05-14 22:50:00');
/*!40000 ALTER TABLE `logger_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler`
--

DROP TABLE IF EXISTS `scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(3) unsigned DEFAULT NULL COMMENT '任务状态  0：暂停  1：正常',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler`
--

LOCK TABLES `scheduler` WRITE;
/*!40000 ALTER TABLE `scheduler` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_log`
--

DROP TABLE IF EXISTS `scheduler_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_log` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `scheduler_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(3) unsigned NOT NULL COMMENT '任务状态    0：失败    1：成功',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_job_id` (`scheduler_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='定时任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_log`
--

LOCK TABLES `scheduler_log` WRITE;
/*!40000 ALTER TABLE `scheduler_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduler_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_product` (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `product_name` varchar(128) DEFAULT '' COMMENT '商品名称',
  `product_price` float DEFAULT 0 COMMENT '商品价格',
  `product_intro` varchar(512) DEFAULT '' COMMENT '商品介绍',
  `product_img` varchar(512) DEFAULT '' COMMENT '商品图片',
  `creator_id` bigint(20) DEFAULT 0,
  `create_date` datetime DEFAULT NULL,
  `updater_id` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (1656139301873827842,'《操作系统》课本',20,'九成新','',1656105809286840321,'2023-05-10 11:29:13',1683566875800000001,'2023-05-14 22:41:55',1656105426841812994);
INSERT INTO `shop_product` VALUES (1656140039765110786,'《数据结构》课本',10,'七成新','',1656105809286840321,'2023-05-10 11:32:09',1683566875800000001,'2023-05-14 22:41:33',1656105426841812994);
INSERT INTO `shop_product` VALUES (1656140228412338177,'小桌板',12.4,'好用小桌板','',1656105809286840321,'2023-05-10 11:32:54',1656105809286840321,'2023-05-10 11:32:54',1656105426841812994);
INSERT INTO `shop_product` VALUES (1657685070657355777,'小桌板',12.4,'好用小桌板','',1656105809286840321,'2023-05-14 17:51:33',1656105809286840321,'2023-05-14 17:51:33',1656105426841812994);
INSERT INTO `shop_product` VALUES (1657759289944576001,'水杯',4.5,'500mL','',1656105809286840321,'2023-05-14 22:46:29',1656105809286840321,'2023-05-14 22:46:29',1656105426841812994);
INSERT INTO `shop_product` VALUES (1657760413518925825,'《计算机网络》',19.5,'第六版，九成新','',1657759744837816322,'2023-05-14 22:50:56',1657759744837816322,'2023-05-14 22:50:56',1657759458853392386);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_system`
--

DROP TABLE IF EXISTS `sub_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_system` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `sub_system_id` bigint(20) DEFAULT NULL COMMENT '租户编码',
  `sub_system_name` varchar(50) DEFAULT NULL COMMENT '租户名称',
  `status` tinyint(3) unsigned DEFAULT NULL COMMENT '状态  0：停用    1：正常',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '登录账号ID',
  `username` varchar(50) DEFAULT NULL COMMENT '登录账号',
  `del_flag` tinyint(3) unsigned DEFAULT NULL COMMENT '删除标识 0：未删除    1：删除',
  `sub_system` tinyint(3) unsigned DEFAULT NULL COMMENT '系统租户   0：否   1：是',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_code` (`sub_system_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='租户管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_system`
--

LOCK TABLES `sub_system` WRITE;
/*!40000 ALTER TABLE `sub_system` DISABLE KEYS */;
INSERT INTO `sub_system` VALUES (1683566875800001000,1001,'默认子系统',1,NULL,1683566875800000001,'admin',0,1,NULL,'2019-10-21 15:59:47',NULL,NULL);
/*!40000 ALTER TABLE `sub_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dept`
--

DROP TABLE IF EXISTS `system_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_dept` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级ID',
  `pids` varchar(500) DEFAULT NULL COMMENT '所有上级ID，用逗号分开',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `sub_system_id` bigint(20) DEFAULT NULL COMMENT '租户编码',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_pid` (`pid`) USING BTREE,
  KEY `idx_sort` (`order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dept`
--

LOCK TABLES `system_dept` WRITE;
/*!40000 ALTER TABLE `system_dept` DISABLE KEYS */;
INSERT INTO `system_dept` VALUES (1650384491958087682,1683560269189599233,'1683560269189599233','研发部',0,1001,1683566875800000001,'2023-04-24 14:21:40',NULL,NULL);
INSERT INTO `system_dept` VALUES (1656105426841812994,0,'0','BISTU二手店',0,1001,1683566875800000001,'2023-05-10 09:14:37',1683566875800000001,'2023-05-10 09:14:37');
INSERT INTO `system_dept` VALUES (1657759458853392386,0,'0','课本专卖店',0,1001,1683566875800000001,'2023-05-14 22:47:09',1683566875800000001,'2023-05-14 22:47:09');
INSERT INTO `system_dept` VALUES (1683560269189599233,0,'0','木链云科技有限公司',0,1001,1683566875800000001,'2023-04-24 09:26:44',NULL,NULL);
/*!40000 ALTER TABLE `system_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_language`
--

DROP TABLE IF EXISTS `system_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_language` (
  `table_name` varchar(32) NOT NULL COMMENT '表名',
  `table_id` bigint(20) NOT NULL COMMENT '表主键',
  `field_name` varchar(32) NOT NULL COMMENT '字段名',
  `field_value` varchar(200) NOT NULL COMMENT '字段值',
  `language` varchar(10) NOT NULL COMMENT '语言',
  PRIMARY KEY (`table_name`,`table_id`,`field_name`,`language`) USING BTREE,
  KEY `idx_table_id` (`table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='国际化';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_language`
--

LOCK TABLES `system_language` WRITE;
/*!40000 ALTER TABLE `system_language` DISABLE KEYS */;
INSERT INTO `system_language` VALUES ('system_menu',1113375699198033921,'name','SubSystem Management','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1113375699198033921,'name','子系统管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1113375699198033921,'name','子系統管理','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1113378406403162113,'name','SubSystem Management','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1113378406403162113,'name','子系统用户','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1113378406403162113,'name','子系統用戶','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1114779542196600833,'name','Tenant Role','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1114779542196600833,'name','子系统角色','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1114779542196600833,'name','子系統角色','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1189006068350906370,'name','信息流管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1189019113777197057,'name','信息流列表','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1189022065086623745,'name','已推荐信息','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1189022567878815745,'name','运营配置','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1189022673130680321,'name','数据统计','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1189022774020468737,'name','频道管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1189022926999318529,'name','地图推荐管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1189023018921684993,'name','信息流统计','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1189023106502946818,'name','留言统计','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981313,'name','热词表','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981313,'name','关键词管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981313,'name','热词表','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981314,'name','View','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981314,'name','查看','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981314,'name','查看','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981315,'name','Add','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981315,'name','新增','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981315,'name','新增','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981316,'name','Edit','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981316,'name','修改','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981316,'name','修改','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981317,'name','Delete','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981317,'name','删除','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981317,'name','刪除','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981318,'name','Export','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981318,'name','导出','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1190105235395981318,'name','導出','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1216346571830505473,'name','平台数据统计','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1216346646417813505,'name','用户数据统计','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1216895263222312962,'name','测试权限菜单','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1432632388543254529,'name','新闻','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1607997375781277698,'name','app管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1607997562524274689,'name','新闻管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1610191211475574785,'name','页面管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1613091623449960450,'name','消息管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1613338925828382721,'name','注销申请','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1613339824442613762,'name','频道管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1613339946064846849,'name','工具管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1613340081826078721,'name','用户管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1655388583889481730,'name','功能示例','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1655389242755919874,'name','商品管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1655457251486916609,'name','新增','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1655457440939433986,'name','查看','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1655457567359950850,'name','修改','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1655457676067921922,'name','删除','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1656103021190365186,'name','商家管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1656103641142050818,'name','商品管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1656103879089111042,'name','订单管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1656104065328791553,'name','评价管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1656106527120998401,'name','商铺等级','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000002,'name','Authority Management','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000002,'name','权限管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000002,'name','權限管理','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000003,'name','Add','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000003,'name','新增','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000003,'name','新增','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000004,'name','Edit','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000004,'name','修改','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000004,'name','修改','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000005,'name','Delete','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000005,'name','删除','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000005,'name','刪除','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000006,'name','Export','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000006,'name','导出','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000006,'name','導出','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000007,'name','Role Management','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000007,'name','角色管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000007,'name','角色管理','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000008,'name','View','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000008,'name','查看','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000008,'name','查看','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000009,'name','Add','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000009,'name','新增','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000009,'name','新增','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000010,'name','Edit','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000010,'name','修改','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000010,'name','修改','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000011,'name','Delete','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000011,'name','删除','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000011,'name','刪除','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000012,'name','Department Management','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000012,'name','商铺管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000012,'name','部門管理','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000014,'name','View','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000014,'name','查看','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000014,'name','查看','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000015,'name','Add','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000015,'name','新增','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000015,'name','新增','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000016,'name','Edit','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000016,'name','修改','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000016,'name','修改','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000017,'name','Delete','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000017,'name','删除','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000017,'name','刪除','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000025,'name','Menu Management','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000025,'name','菜单管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000025,'name','菜單管理','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000026,'name','View','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000026,'name','查看','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000026,'name','查看','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000027,'name','Add','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000027,'name','新增','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000027,'name','新增','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000028,'name','Edit','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000028,'name','修改','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000028,'name','修改','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000029,'name','Delete','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000029,'name','删除','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000029,'name','刪除','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000030,'name','Timed Task','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000030,'name','定时任务','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000030,'name','定時任務','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000031,'name','View','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000031,'name','查看','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000031,'name','查看','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000032,'name','Add','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000032,'name','新增','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000032,'name','新增','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000033,'name','Edit','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000033,'name','修改','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000033,'name','修改','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000034,'name','Delete','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000034,'name','删除','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000034,'name','刪除','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000035,'name','Setting','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000035,'name','系统设置','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000035,'name','系統設置','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000036,'name','Pause','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000036,'name','暂停','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000036,'name','暫停','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000037,'name','Resume','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000037,'name','恢复','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000037,'name','恢復','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000038,'name','Execute','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000038,'name','立即执行','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000038,'name','立即執行','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000039,'name','Log List','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000039,'name','日志列表','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000039,'name','日誌列表','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000040,'name','Parameter Management','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000040,'name','参数管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000040,'name','參數管理','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000046,'name','Log Management','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000046,'name','日志管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000046,'name','日誌管理','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000048,'name','Login Log','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000048,'name','登录日志','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000048,'name','登錄日誌','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000049,'name','Operation Log','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000049,'name','操作日志','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000049,'name','操作日誌','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000050,'name','Error Log','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000050,'name','异常日志','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000050,'name','異常日誌','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000051,'name','SQL Monitoring','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000051,'name','SQL监控','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000051,'name','SQL監控','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000053,'name','System Monitoring','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000053,'name','系统监控','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000053,'name','系統監控','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000055,'name','User Management','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000055,'name','用户管理','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000055,'name','用戶管理','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000056,'name','View','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000056,'name','查看','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000056,'name','查看','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000057,'name','Add','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000057,'name','新增','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000057,'name','新增','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000058,'name','Export','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000058,'name','导出','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000058,'name','導出','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000059,'name','View','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000059,'name','查看','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000059,'name','查看','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000060,'name','Edit','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000060,'name','修改','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000060,'name','修改','zh-TW');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000061,'name','Delete','en-US');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000061,'name','删除','zh-CN');
INSERT INTO `system_language` VALUES ('system_menu',1683566875800000061,'name','刪除','zh-TW');
/*!40000 ALTER TABLE `system_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_menu`
--

DROP TABLE IF EXISTS `system_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_menu` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级ID，一级菜单为0',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `permissions` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：sys:user:list,sys:user:save)',
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT '类型   0：菜单   1：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order` int(11) DEFAULT NULL COMMENT '排序',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_pid` (`pid`) USING BTREE,
  KEY `idx_sort` (`order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_menu`
--

LOCK TABLES `system_menu` WRITE;
/*!40000 ALTER TABLE `system_menu` DISABLE KEYS */;
INSERT INTO `system_menu` VALUES (1113375699198033921,0,'','',0,'OfficeBuilding',902,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2023-05-05 14:49:09');
INSERT INTO `system_menu` VALUES (1113378406403162113,1113375699198033921,'subsys/subsys','system:subsys:page,system:subsys:info,system:subsys:password,system:subsys:save,system:subsys:update,system:subsys:delete',0,'User',0,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2023-05-05 14:13:47');
INSERT INTO `system_menu` VALUES (1114779542196600833,1113375699198033921,'subsys/subsys-role','subsys:role:page,subsys:role:list,subsys:role:info,subsys:role:save,subsys:role:update',0,'UserFilled',1,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2023-05-05 14:13:53');
INSERT INTO `system_menu` VALUES (1655388583889481730,0,'','',0,'Opportunity',908,1683566875800000001,'2023-05-08 09:46:08',1683566875800000001,'2023-05-08 09:47:13');
INSERT INTO `system_menu` VALUES (1655389242755919874,1655388583889481730,'demo/product','',0,'Handbag',0,1683566875800000001,'2023-05-08 09:48:45',1683566875800000001,'2023-05-08 13:57:42');
INSERT INTO `system_menu` VALUES (1655457251486916609,1655389242755919874,'','demo:product:save',1,'',1,1683566875800000001,'2023-05-08 14:19:00',NULL,NULL);
INSERT INTO `system_menu` VALUES (1655457440939433986,1655389242755919874,'','demo:product:page,demo:product:info',1,'',0,1683566875800000001,'2023-05-08 14:19:45',1683566875800000001,'2023-05-08 15:03:27');
INSERT INTO `system_menu` VALUES (1655457567359950850,1655389242755919874,'','demo:product:update',1,'',2,1683566875800000001,'2023-05-08 14:20:15',NULL,NULL);
INSERT INTO `system_menu` VALUES (1655457676067921922,1655389242755919874,'','demo:product:delete',1,'',3,1683566875800000001,'2023-05-08 14:20:41',NULL,NULL);
INSERT INTO `system_menu` VALUES (1656103021190365186,0,'','',0,'Food',0,1683566875800000001,'2023-05-10 09:05:03',1683566875800000001,'2023-05-10 09:05:03');
INSERT INTO `system_menu` VALUES (1656103641142050818,1656103021190365186,'shop/products','',0,'GobletFull',1,1683566875800000001,'2023-05-10 09:07:31',1683566875800000001,'2023-05-14 20:47:48');
INSERT INTO `system_menu` VALUES (1656103879089111042,1656103021190365186,'shop/order','',0,'DocumentCopy',2,1683566875800000001,'2023-05-10 09:08:28',1683566875800000001,'2023-05-10 09:08:35');
INSERT INTO `system_menu` VALUES (1656104065328791553,1656103021190365186,'shop/comment','',0,'Loading',3,1683566875800000001,'2023-05-10 09:09:12',1683566875800000001,'2023-05-10 09:09:12');
INSERT INTO `system_menu` VALUES (1656106527120998401,1656103021190365186,'shop/level','',0,'Document',0,1683566875800000001,'2023-05-10 09:18:59',1683566875800000001,'2023-05-10 09:19:27');
INSERT INTO `system_menu` VALUES (1683566875800000002,0,NULL,NULL,0,'Unlock',900,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2023-05-05 11:56:15');
INSERT INTO `system_menu` VALUES (1683566875800000003,1683566875800000055,NULL,'system:user:save,system:dept:list,system:role:list',1,NULL,1,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000004,1683566875800000055,NULL,'system:user:update,system:dept:list,system:role:list',1,NULL,2,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000005,1683566875800000055,NULL,'system:user:delete',1,NULL,3,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000006,1683566875800000055,NULL,'system:user:export',1,NULL,4,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000007,1683566875800000002,'system/role',NULL,0,'UserFilled',2,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2023-05-05 14:13:28');
INSERT INTO `system_menu` VALUES (1683566875800000008,1683566875800000007,NULL,'system:role:page,system:role:info',1,NULL,0,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000009,1683566875800000007,NULL,'system:role:save,system:menu:select,system:dept:list',1,NULL,1,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000010,1683566875800000007,NULL,'system:role:update,system:menu:select,system:dept:list',1,NULL,2,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000011,1683566875800000007,NULL,'system:role:delete',1,NULL,3,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000012,1683566875800000002,'system/dept',NULL,0,'Grid',1,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2023-05-10 09:14:00');
INSERT INTO `system_menu` VALUES (1683566875800000014,1683566875800000012,NULL,'system:dept:list,system:dept:info',1,NULL,0,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2023-04-23 22:18:51');
INSERT INTO `system_menu` VALUES (1683566875800000015,1683566875800000012,NULL,'system:dept:save',1,NULL,1,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000016,1683566875800000012,NULL,'system:dept:update',1,NULL,2,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000017,1683566875800000012,NULL,'system:dept:delete',1,NULL,3,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000025,1683566875800000035,'system/menu',NULL,0,'Menu',0,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2023-05-05 14:04:35');
INSERT INTO `system_menu` VALUES (1683566875800000026,1683566875800000025,NULL,'system:menu:list,system:menu:info',1,NULL,0,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2023-04-14 10:31:21');
INSERT INTO `system_menu` VALUES (1683566875800000027,1683566875800000025,NULL,'system:menu:save',1,NULL,1,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000028,1683566875800000025,NULL,'system:menu:update',1,NULL,2,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000029,1683566875800000025,NULL,'system:menu:delete',1,NULL,3,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000030,1683566875800000035,'scheduler/scheduler',NULL,0,'Timer',3,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2023-05-05 14:13:05');
INSERT INTO `system_menu` VALUES (1683566875800000031,1683566875800000030,NULL,'system:schedule:page,system:schedule:info',1,NULL,0,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000032,1683566875800000030,NULL,'system:schedule:save',1,NULL,1,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000033,1683566875800000030,NULL,'system:schedule:update',1,NULL,2,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
INSERT INTO `system_menu` VALUES (1683566875800000034,1683566875800000030,NULL,'system:schedule:delete',1,NULL,3,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2019-10-21 15:59:48');
INSERT INTO `system_menu` VALUES (1683566875800000035,0,NULL,NULL,0,'Setting',901,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2023-05-05 12:00:04');
INSERT INTO `system_menu` VALUES (1683566875800000036,1683566875800000030,NULL,'system:schedule:pause',1,NULL,4,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2019-10-21 15:59:48');
INSERT INTO `system_menu` VALUES (1683566875800000037,1683566875800000030,NULL,'system:schedule:resume',1,NULL,5,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2019-10-21 15:59:48');
INSERT INTO `system_menu` VALUES (1683566875800000038,1683566875800000030,NULL,'system:schedule:run',1,NULL,6,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2019-10-21 15:59:48');
INSERT INTO `system_menu` VALUES (1683566875800000039,1683566875800000030,NULL,'system:schedule:log',1,NULL,7,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2019-10-21 15:59:48');
INSERT INTO `system_menu` VALUES (1683566875800000040,1683566875800000035,'system/params','',0,'Document',1,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2023-05-05 14:07:30');
INSERT INTO `system_menu` VALUES (1683566875800000046,0,NULL,NULL,0,'Memo',906,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2023-05-05 13:54:22');
INSERT INTO `system_menu` VALUES (1683566875800000048,1683566875800000046,'system/logger-login','system:logger:login',0,'Document',0,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2023-05-05 14:17:09');
INSERT INTO `system_menu` VALUES (1683566875800000049,1683566875800000046,'system/logger-operation','system:logger:operation',0,'Document',1,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2023-05-05 14:17:52');
INSERT INTO `system_menu` VALUES (1683566875800000050,1683566875800000046,'system/logger-error','system:logger:error',0,'Warning',2,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2023-05-05 14:18:06');
INSERT INTO `system_menu` VALUES (1683566875800000051,1683566875800000053,'{{ window.SITE_CONFIG[\"apiURL\"] }}/sqllistenner/sql.html',NULL,0,'MessageBox',1,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2023-05-05 14:20:33');
INSERT INTO `system_menu` VALUES (1683566875800000053,0,NULL,NULL,0,'Monitor',907,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2023-05-05 14:12:49');
INSERT INTO `system_menu` VALUES (1683566875800000055,1683566875800000002,'system/user',NULL,0,'User',0,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2023-05-05 14:09:24');
INSERT INTO `system_menu` VALUES (1683566875800000056,1683566875800000055,NULL,'system:user:page,system:user:info',1,NULL,0,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2019-10-21 15:59:48');
INSERT INTO `system_menu` VALUES (1683566875800000057,1683566875800000040,NULL,'system:params:save',1,NULL,1,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2019-10-21 15:59:48');
INSERT INTO `system_menu` VALUES (1683566875800000058,1683566875800000040,NULL,'system:params:export',1,NULL,4,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2019-10-21 15:59:48');
INSERT INTO `system_menu` VALUES (1683566875800000059,1683566875800000040,'','system:params:page,sys:params:info',1,NULL,0,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2019-10-21 15:59:48');
INSERT INTO `system_menu` VALUES (1683566875800000060,1683566875800000040,NULL,'system:params:update',1,NULL,2,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2019-10-21 15:59:48');
INSERT INTO `system_menu` VALUES (1683566875800000061,1683566875800000040,'','system:params:delete',1,'',3,1683566875800000001,'2019-10-21 15:59:48',1683566875800000001,'2019-10-21 15:59:48');
/*!40000 ALTER TABLE `system_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_params`
--

DROP TABLE IF EXISTS `system_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_params` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `param_code` varchar(32) DEFAULT NULL COMMENT '参数编码',
  `param_value` varchar(2000) DEFAULT NULL COMMENT '参数值',
  `param_type` tinyint(3) unsigned DEFAULT 1 COMMENT '类型   0：系统参数   1：非系统参数',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_param_code` (`param_code`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='参数管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_params`
--

LOCK TABLES `system_params` WRITE;
/*!40000 ALTER TABLE `system_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_region`
--

DROP TABLE IF EXISTS `system_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_region` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级ID，一级为0',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `tree_level` tinyint(4) DEFAULT NULL COMMENT '层级',
  `leaf` tinyint(4) DEFAULT NULL COMMENT '是否叶子节点  0：否   1：是',
  `order` bigint(20) DEFAULT NULL COMMENT '排序',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='行政区域';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_region`
--

LOCK TABLES `system_region` WRITE;
/*!40000 ALTER TABLE `system_region` DISABLE KEYS */;
INSERT INTO `system_region` VALUES (110000,0,'北京市',1,0,110000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110100,110000,'北京市',2,0,110100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110101,110100,'东城区',3,1,110101,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110102,110100,'西城区',3,1,110102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110105,110100,'朝阳区',3,1,110105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110106,110100,'丰台区',3,1,110106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110107,110100,'石景山区',3,1,110107,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110108,110100,'海淀区',3,1,110108,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110109,110100,'门头沟区',3,1,110109,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110111,110100,'房山区',3,1,110111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110112,110100,'通州区',3,1,110112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110113,110100,'顺义区',3,1,110113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110114,110100,'昌平区',3,1,110114,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110115,110100,'大兴区',3,1,110115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110116,110100,'怀柔区',3,1,110116,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110117,110100,'平谷区',3,1,110117,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110118,110100,'密云区',3,1,110118,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (110119,110100,'延庆区',3,1,110119,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120000,0,'天津市',1,0,120000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120100,120000,'天津市',2,0,120100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120101,120100,'和平区',3,1,120101,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120102,120100,'河东区',3,1,120102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120103,120100,'河西区',3,1,120103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120104,120100,'南开区',3,1,120104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120105,120100,'河北区',3,1,120105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120106,120100,'红桥区',3,1,120106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120110,120100,'东丽区',3,1,120110,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120111,120100,'西青区',3,1,120111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120112,120100,'津南区',3,1,120112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120113,120100,'北辰区',3,1,120113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120114,120100,'武清区',3,1,120114,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120115,120100,'宝坻区',3,1,120115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120116,120100,'滨海新区',3,1,120116,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120117,120100,'宁河区',3,1,120117,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120118,120100,'静海区',3,1,120118,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (120119,120100,'蓟州区',3,1,120119,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130000,0,'河北省',1,0,130000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130100,130000,'石家庄市',2,0,130100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130102,130100,'长安区',3,1,130102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130104,130100,'桥西区',3,1,130104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130105,130100,'新华区',3,1,130105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130107,130100,'井陉矿区',3,1,130107,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130108,130100,'裕华区',3,1,130108,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130109,130100,'藁城区',3,1,130109,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130110,130100,'鹿泉区',3,1,130110,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130111,130100,'栾城区',3,1,130111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130121,130100,'井陉县',3,1,130121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130123,130100,'正定县',3,1,130123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130125,130100,'行唐县',3,1,130125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130126,130100,'灵寿县',3,1,130126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130127,130100,'高邑县',3,1,130127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130128,130100,'深泽县',3,1,130128,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130129,130100,'赞皇县',3,1,130129,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130130,130100,'无极县',3,1,130130,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130131,130100,'平山县',3,1,130131,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130132,130100,'元氏县',3,1,130132,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130133,130100,'赵县',3,1,130133,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130181,130100,'辛集市',3,1,130181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130183,130100,'晋州市',3,1,130183,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130184,130100,'新乐市',3,1,130184,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130200,130000,'唐山市',2,0,130200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130202,130200,'路南区',3,1,130202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130203,130200,'路北区',3,1,130203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130204,130200,'古冶区',3,1,130204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130205,130200,'开平区',3,1,130205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130207,130200,'丰南区',3,1,130207,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130208,130200,'丰润区',3,1,130208,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130209,130200,'曹妃甸区',3,1,130209,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130224,130200,'滦南县',3,1,130224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130225,130200,'乐亭县',3,1,130225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130227,130200,'迁西县',3,1,130227,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130229,130200,'玉田县',3,1,130229,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130281,130200,'遵化市',3,1,130281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130283,130200,'迁安市',3,1,130283,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130284,130200,'滦州市',3,1,130284,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130300,130000,'秦皇岛市',2,0,130300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130302,130300,'海港区',3,1,130302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130303,130300,'山海关区',3,1,130303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130304,130300,'北戴河区',3,1,130304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130306,130300,'抚宁区',3,1,130306,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130321,130300,'青龙满族自治县',3,1,130321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130322,130300,'昌黎县',3,1,130322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130324,130300,'卢龙县',3,1,130324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130390,130300,'经济技术开发区',3,1,130390,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130400,130000,'邯郸市',2,0,130400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130402,130400,'邯山区',3,1,130402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130403,130400,'丛台区',3,1,130403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130404,130400,'复兴区',3,1,130404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130406,130400,'峰峰矿区',3,1,130406,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130407,130400,'肥乡区',3,1,130407,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130408,130400,'永年区',3,1,130408,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130423,130400,'临漳县',3,1,130423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130424,130400,'成安县',3,1,130424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130425,130400,'大名县',3,1,130425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130426,130400,'涉县',3,1,130426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130427,130400,'磁县',3,1,130427,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130430,130400,'邱县',3,1,130430,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130431,130400,'鸡泽县',3,1,130431,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130432,130400,'广平县',3,1,130432,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130433,130400,'馆陶县',3,1,130433,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130434,130400,'魏县',3,1,130434,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130435,130400,'曲周县',3,1,130435,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130481,130400,'武安市',3,1,130481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130500,130000,'邢台市',2,0,130500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130502,130500,'桥东区',3,1,130502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130503,130500,'桥西区',3,1,130503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130521,130500,'邢台县',3,1,130521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130522,130500,'临城县',3,1,130522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130523,130500,'内丘县',3,1,130523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130524,130500,'柏乡县',3,1,130524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130525,130500,'隆尧县',3,1,130525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130526,130500,'任县',3,1,130526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130527,130500,'南和县',3,1,130527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130528,130500,'宁晋县',3,1,130528,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130529,130500,'巨鹿县',3,1,130529,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130530,130500,'新河县',3,1,130530,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130531,130500,'广宗县',3,1,130531,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130532,130500,'平乡县',3,1,130532,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130533,130500,'威县',3,1,130533,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130534,130500,'清河县',3,1,130534,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130535,130500,'临西县',3,1,130535,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130581,130500,'南宫市',3,1,130581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130582,130500,'沙河市',3,1,130582,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130600,130000,'保定市',2,0,130600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130602,130600,'竞秀区',3,1,130602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130606,130600,'莲池区',3,1,130606,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130607,130600,'满城区',3,1,130607,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130608,130600,'清苑区',3,1,130608,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130609,130600,'徐水区',3,1,130609,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130623,130600,'涞水县',3,1,130623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130624,130600,'阜平县',3,1,130624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130626,130600,'定兴县',3,1,130626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130627,130600,'唐县',3,1,130627,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130628,130600,'高阳县',3,1,130628,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130629,130600,'容城县',3,1,130629,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130630,130600,'涞源县',3,1,130630,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130631,130600,'望都县',3,1,130631,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130632,130600,'安新县',3,1,130632,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130633,130600,'易县',3,1,130633,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130634,130600,'曲阳县',3,1,130634,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130635,130600,'蠡县',3,1,130635,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130636,130600,'顺平县',3,1,130636,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130637,130600,'博野县',3,1,130637,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130638,130600,'雄县',3,1,130638,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130681,130600,'涿州市',3,1,130681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130682,130600,'定州市',3,1,130682,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130683,130600,'安国市',3,1,130683,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130684,130600,'高碑店市',3,1,130684,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130700,130000,'张家口市',2,0,130700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130702,130700,'桥东区',3,1,130702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130703,130700,'桥西区',3,1,130703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130705,130700,'宣化区',3,1,130705,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130706,130700,'下花园区',3,1,130706,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130708,130700,'万全区',3,1,130708,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130709,130700,'崇礼区',3,1,130709,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130722,130700,'张北县',3,1,130722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130723,130700,'康保县',3,1,130723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130724,130700,'沽源县',3,1,130724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130725,130700,'尚义县',3,1,130725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130726,130700,'蔚县',3,1,130726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130727,130700,'阳原县',3,1,130727,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130728,130700,'怀安县',3,1,130728,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130730,130700,'怀来县',3,1,130730,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130731,130700,'涿鹿县',3,1,130731,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130732,130700,'赤城县',3,1,130732,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130800,130000,'承德市',2,0,130800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130802,130800,'双桥区',3,1,130802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130803,130800,'双滦区',3,1,130803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130804,130800,'鹰手营子矿区',3,1,130804,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130821,130800,'承德县',3,1,130821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130822,130800,'兴隆县',3,1,130822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130824,130800,'滦平县',3,1,130824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130825,130800,'隆化县',3,1,130825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130826,130800,'丰宁满族自治县',3,1,130826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130827,130800,'宽城满族自治县',3,1,130827,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130828,130800,'围场满族蒙古族自治县',3,1,130828,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130881,130800,'平泉市',3,1,130881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130900,130000,'沧州市',2,0,130900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130902,130900,'新华区',3,1,130902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130903,130900,'运河区',3,1,130903,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130921,130900,'沧县',3,1,130921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130922,130900,'青县',3,1,130922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130923,130900,'东光县',3,1,130923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130924,130900,'海兴县',3,1,130924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130925,130900,'盐山县',3,1,130925,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130926,130900,'肃宁县',3,1,130926,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130927,130900,'南皮县',3,1,130927,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130928,130900,'吴桥县',3,1,130928,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130929,130900,'献县',3,1,130929,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130930,130900,'孟村回族自治县',3,1,130930,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130981,130900,'泊头市',3,1,130981,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130982,130900,'任丘市',3,1,130982,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130983,130900,'黄骅市',3,1,130983,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (130984,130900,'河间市',3,1,130984,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131000,130000,'廊坊市',2,0,131000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131002,131000,'安次区',3,1,131002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131003,131000,'广阳区',3,1,131003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131022,131000,'固安县',3,1,131022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131023,131000,'永清县',3,1,131023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131024,131000,'香河县',3,1,131024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131025,131000,'大城县',3,1,131025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131026,131000,'文安县',3,1,131026,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131028,131000,'大厂回族自治县',3,1,131028,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131081,131000,'霸州市',3,1,131081,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131082,131000,'三河市',3,1,131082,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131090,131000,'开发区',3,1,131090,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131100,130000,'衡水市',2,0,131100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131102,131100,'桃城区',3,1,131102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131103,131100,'冀州区',3,1,131103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131121,131100,'枣强县',3,1,131121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131122,131100,'武邑县',3,1,131122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131123,131100,'武强县',3,1,131123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131124,131100,'饶阳县',3,1,131124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131125,131100,'安平县',3,1,131125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131126,131100,'故城县',3,1,131126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131127,131100,'景县',3,1,131127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131128,131100,'阜城县',3,1,131128,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (131182,131100,'深州市',3,1,131182,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140000,0,'山西省',1,0,140000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140100,140000,'太原市',2,0,140100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140105,140100,'小店区',3,1,140105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140106,140100,'迎泽区',3,1,140106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140107,140100,'杏花岭区',3,1,140107,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140108,140100,'尖草坪区',3,1,140108,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140109,140100,'万柏林区',3,1,140109,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140110,140100,'晋源区',3,1,140110,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140121,140100,'清徐县',3,1,140121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140122,140100,'阳曲县',3,1,140122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140123,140100,'娄烦县',3,1,140123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140181,140100,'古交市',3,1,140181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140200,140000,'大同市',2,0,140200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140212,140200,'新荣区',3,1,140212,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140213,140200,'平城区',3,1,140213,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140214,140200,'云冈区',3,1,140214,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140215,140200,'云州区',3,1,140215,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140221,140200,'阳高县',3,1,140221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140222,140200,'天镇县',3,1,140222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140223,140200,'广灵县',3,1,140223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140224,140200,'灵丘县',3,1,140224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140225,140200,'浑源县',3,1,140225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140226,140200,'左云县',3,1,140226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140300,140000,'阳泉市',2,0,140300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140302,140300,'城区',3,1,140302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140303,140300,'矿区',3,1,140303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140311,140300,'郊区',3,1,140311,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140321,140300,'平定县',3,1,140321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140322,140300,'盂县',3,1,140322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140400,140000,'长治市',2,0,140400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140403,140400,'潞州区',3,1,140403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140404,140400,'上党区',3,1,140404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140405,140400,'屯留区',3,1,140405,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140406,140400,'潞城区',3,1,140406,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140423,140400,'襄垣县',3,1,140423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140425,140400,'平顺县',3,1,140425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140426,140400,'黎城县',3,1,140426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140427,140400,'壶关县',3,1,140427,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140428,140400,'长子县',3,1,140428,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140429,140400,'武乡县',3,1,140429,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140430,140400,'沁县',3,1,140430,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140431,140400,'沁源县',3,1,140431,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140500,140000,'晋城市',2,0,140500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140502,140500,'城区',3,1,140502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140521,140500,'沁水县',3,1,140521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140522,140500,'阳城县',3,1,140522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140524,140500,'陵川县',3,1,140524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140525,140500,'泽州县',3,1,140525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140581,140500,'高平市',3,1,140581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140600,140000,'朔州市',2,0,140600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140602,140600,'朔城区',3,1,140602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140603,140600,'平鲁区',3,1,140603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140621,140600,'山阴县',3,1,140621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140622,140600,'应县',3,1,140622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140623,140600,'右玉县',3,1,140623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140681,140600,'怀仁市',3,1,140681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140700,140000,'晋中市',2,0,140700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140702,140700,'榆次区',3,1,140702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140721,140700,'榆社县',3,1,140721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140722,140700,'左权县',3,1,140722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140723,140700,'和顺县',3,1,140723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140724,140700,'昔阳县',3,1,140724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140725,140700,'寿阳县',3,1,140725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140726,140700,'太谷县',3,1,140726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140727,140700,'祁县',3,1,140727,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140728,140700,'平遥县',3,1,140728,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140729,140700,'灵石县',3,1,140729,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140781,140700,'介休市',3,1,140781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140800,140000,'运城市',2,0,140800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140802,140800,'盐湖区',3,1,140802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140821,140800,'临猗县',3,1,140821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140822,140800,'万荣县',3,1,140822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140823,140800,'闻喜县',3,1,140823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140824,140800,'稷山县',3,1,140824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140825,140800,'新绛县',3,1,140825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140826,140800,'绛县',3,1,140826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140827,140800,'垣曲县',3,1,140827,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140828,140800,'夏县',3,1,140828,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140829,140800,'平陆县',3,1,140829,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140830,140800,'芮城县',3,1,140830,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140881,140800,'永济市',3,1,140881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140882,140800,'河津市',3,1,140882,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140900,140000,'忻州市',2,0,140900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140902,140900,'忻府区',3,1,140902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140921,140900,'定襄县',3,1,140921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140922,140900,'五台县',3,1,140922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140923,140900,'代县',3,1,140923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140924,140900,'繁峙县',3,1,140924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140925,140900,'宁武县',3,1,140925,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140926,140900,'静乐县',3,1,140926,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140927,140900,'神池县',3,1,140927,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140928,140900,'五寨县',3,1,140928,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140929,140900,'岢岚县',3,1,140929,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140930,140900,'河曲县',3,1,140930,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140931,140900,'保德县',3,1,140931,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140932,140900,'偏关县',3,1,140932,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (140981,140900,'原平市',3,1,140981,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141000,140000,'临汾市',2,0,141000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141002,141000,'尧都区',3,1,141002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141021,141000,'曲沃县',3,1,141021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141022,141000,'翼城县',3,1,141022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141023,141000,'襄汾县',3,1,141023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141024,141000,'洪洞县',3,1,141024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141025,141000,'古县',3,1,141025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141026,141000,'安泽县',3,1,141026,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141027,141000,'浮山县',3,1,141027,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141028,141000,'吉县',3,1,141028,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141029,141000,'乡宁县',3,1,141029,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141030,141000,'大宁县',3,1,141030,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141031,141000,'隰县',3,1,141031,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141032,141000,'永和县',3,1,141032,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141033,141000,'蒲县',3,1,141033,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141034,141000,'汾西县',3,1,141034,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141081,141000,'侯马市',3,1,141081,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141082,141000,'霍州市',3,1,141082,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141100,140000,'吕梁市',2,0,141100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141102,141100,'离石区',3,1,141102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141121,141100,'文水县',3,1,141121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141122,141100,'交城县',3,1,141122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141123,141100,'兴县',3,1,141123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141124,141100,'临县',3,1,141124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141125,141100,'柳林县',3,1,141125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141126,141100,'石楼县',3,1,141126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141127,141100,'岚县',3,1,141127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141128,141100,'方山县',3,1,141128,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141129,141100,'中阳县',3,1,141129,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141130,141100,'交口县',3,1,141130,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141181,141100,'孝义市',3,1,141181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (141182,141100,'汾阳市',3,1,141182,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150000,0,'内蒙古自治区',1,0,150000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150100,150000,'呼和浩特市',2,0,150100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150102,150100,'新城区',3,1,150102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150103,150100,'回民区',3,1,150103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150104,150100,'玉泉区',3,1,150104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150105,150100,'赛罕区',3,1,150105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150121,150100,'土默特左旗',3,1,150121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150122,150100,'托克托县',3,1,150122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150123,150100,'和林格尔县',3,1,150123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150124,150100,'清水河县',3,1,150124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150125,150100,'武川县',3,1,150125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150200,150000,'包头市',2,0,150200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150202,150200,'东河区',3,1,150202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150203,150200,'昆都仑区',3,1,150203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150204,150200,'青山区',3,1,150204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150205,150200,'石拐区',3,1,150205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150206,150200,'白云鄂博矿区',3,1,150206,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150207,150200,'九原区',3,1,150207,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150221,150200,'土默特右旗',3,1,150221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150222,150200,'固阳县',3,1,150222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150223,150200,'达尔罕茂明安联合旗',3,1,150223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150300,150000,'乌海市',2,0,150300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150302,150300,'海勃湾区',3,1,150302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150303,150300,'海南区',3,1,150303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150304,150300,'乌达区',3,1,150304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150400,150000,'赤峰市',2,0,150400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150402,150400,'红山区',3,1,150402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150403,150400,'元宝山区',3,1,150403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150404,150400,'松山区',3,1,150404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150421,150400,'阿鲁科尔沁旗',3,1,150421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150422,150400,'巴林左旗',3,1,150422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150423,150400,'巴林右旗',3,1,150423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150424,150400,'林西县',3,1,150424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150425,150400,'克什克腾旗',3,1,150425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150426,150400,'翁牛特旗',3,1,150426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150428,150400,'喀喇沁旗',3,1,150428,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150429,150400,'宁城县',3,1,150429,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150430,150400,'敖汉旗',3,1,150430,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150500,150000,'通辽市',2,0,150500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150502,150500,'科尔沁区',3,1,150502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150521,150500,'科尔沁左翼中旗',3,1,150521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150522,150500,'科尔沁左翼后旗',3,1,150522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150523,150500,'开鲁县',3,1,150523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150524,150500,'库伦旗',3,1,150524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150525,150500,'奈曼旗',3,1,150525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150526,150500,'扎鲁特旗',3,1,150526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150581,150500,'霍林郭勒市',3,1,150581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150600,150000,'鄂尔多斯市',2,0,150600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150602,150600,'东胜区',3,1,150602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150603,150600,'康巴什区',3,1,150603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150621,150600,'达拉特旗',3,1,150621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150622,150600,'准格尔旗',3,1,150622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150623,150600,'鄂托克前旗',3,1,150623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150624,150600,'鄂托克旗',3,1,150624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150625,150600,'杭锦旗',3,1,150625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150626,150600,'乌审旗',3,1,150626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150627,150600,'伊金霍洛旗',3,1,150627,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150700,150000,'呼伦贝尔市',2,0,150700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150702,150700,'海拉尔区',3,1,150702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150703,150700,'扎赉诺尔区',3,1,150703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150721,150700,'阿荣旗',3,1,150721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150722,150700,'莫力达瓦达斡尔族自治旗',3,1,150722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150723,150700,'鄂伦春自治旗',3,1,150723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150724,150700,'鄂温克族自治旗',3,1,150724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150725,150700,'陈巴尔虎旗',3,1,150725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150726,150700,'新巴尔虎左旗',3,1,150726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150727,150700,'新巴尔虎右旗',3,1,150727,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150781,150700,'满洲里市',3,1,150781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150782,150700,'牙克石市',3,1,150782,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150783,150700,'扎兰屯市',3,1,150783,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150784,150700,'额尔古纳市',3,1,150784,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150785,150700,'根河市',3,1,150785,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150800,150000,'巴彦淖尔市',2,0,150800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150802,150800,'临河区',3,1,150802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150821,150800,'五原县',3,1,150821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150822,150800,'磴口县',3,1,150822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150823,150800,'乌拉特前旗',3,1,150823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150824,150800,'乌拉特中旗',3,1,150824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150825,150800,'乌拉特后旗',3,1,150825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150826,150800,'杭锦后旗',3,1,150826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150900,150000,'乌兰察布市',2,0,150900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150902,150900,'集宁区',3,1,150902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150921,150900,'卓资县',3,1,150921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150922,150900,'化德县',3,1,150922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150923,150900,'商都县',3,1,150923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150924,150900,'兴和县',3,1,150924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150925,150900,'凉城县',3,1,150925,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150926,150900,'察哈尔右翼前旗',3,1,150926,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150927,150900,'察哈尔右翼中旗',3,1,150927,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150928,150900,'察哈尔右翼后旗',3,1,150928,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150929,150900,'四子王旗',3,1,150929,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (150981,150900,'丰镇市',3,1,150981,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152200,150000,'兴安盟',2,0,152200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152201,152200,'乌兰浩特市',3,1,152201,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152202,152200,'阿尔山市',3,1,152202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152221,152200,'科尔沁右翼前旗',3,1,152221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152222,152200,'科尔沁右翼中旗',3,1,152222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152223,152200,'扎赉特旗',3,1,152223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152224,152200,'突泉县',3,1,152224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152500,150000,'锡林郭勒盟',2,0,152500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152501,152500,'二连浩特市',3,1,152501,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152502,152500,'锡林浩特市',3,1,152502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152522,152500,'阿巴嘎旗',3,1,152522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152523,152500,'苏尼特左旗',3,1,152523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152524,152500,'苏尼特右旗',3,1,152524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152525,152500,'东乌珠穆沁旗',3,1,152525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152526,152500,'西乌珠穆沁旗',3,1,152526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152527,152500,'太仆寺旗',3,1,152527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152528,152500,'镶黄旗',3,1,152528,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152529,152500,'正镶白旗',3,1,152529,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152530,152500,'正蓝旗',3,1,152530,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152531,152500,'多伦县',3,1,152531,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152900,150000,'阿拉善盟',2,0,152900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152921,152900,'阿拉善左旗',3,1,152921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152922,152900,'阿拉善右旗',3,1,152922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (152923,152900,'额济纳旗',3,1,152923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210000,0,'辽宁省',1,0,210000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210100,210000,'沈阳市',2,0,210100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210102,210100,'和平区',3,1,210102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210103,210100,'沈河区',3,1,210103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210104,210100,'大东区',3,1,210104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210105,210100,'皇姑区',3,1,210105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210106,210100,'铁西区',3,1,210106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210111,210100,'苏家屯区',3,1,210111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210112,210100,'浑南区',3,1,210112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210113,210100,'沈北新区',3,1,210113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210114,210100,'于洪区',3,1,210114,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210115,210100,'辽中区',3,1,210115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210123,210100,'康平县',3,1,210123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210124,210100,'法库县',3,1,210124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210181,210100,'新民市',3,1,210181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210190,210100,'经济技术开发区',3,1,210190,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210200,210000,'大连市',2,0,210200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210202,210200,'中山区',3,1,210202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210203,210200,'西岗区',3,1,210203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210204,210200,'沙河口区',3,1,210204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210211,210200,'甘井子区',3,1,210211,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210212,210200,'旅顺口区',3,1,210212,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210213,210200,'金州区',3,1,210213,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210214,210200,'普兰店区',3,1,210214,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210224,210200,'长海县',3,1,210224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210281,210200,'瓦房店市',3,1,210281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210283,210200,'庄河市',3,1,210283,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210300,210000,'鞍山市',2,0,210300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210302,210300,'铁东区',3,1,210302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210303,210300,'铁西区',3,1,210303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210304,210300,'立山区',3,1,210304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210311,210300,'千山区',3,1,210311,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210321,210300,'台安县',3,1,210321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210323,210300,'岫岩满族自治县',3,1,210323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210381,210300,'海城市',3,1,210381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210390,210300,'高新区',3,1,210390,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210400,210000,'抚顺市',2,0,210400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210402,210400,'新抚区',3,1,210402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210403,210400,'东洲区',3,1,210403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210404,210400,'望花区',3,1,210404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210411,210400,'顺城区',3,1,210411,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210421,210400,'抚顺县',3,1,210421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210422,210400,'新宾满族自治县',3,1,210422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210423,210400,'清原满族自治县',3,1,210423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210500,210000,'本溪市',2,0,210500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210502,210500,'平山区',3,1,210502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210503,210500,'溪湖区',3,1,210503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210504,210500,'明山区',3,1,210504,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210505,210500,'南芬区',3,1,210505,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210521,210500,'本溪满族自治县',3,1,210521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210522,210500,'桓仁满族自治县',3,1,210522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210600,210000,'丹东市',2,0,210600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210602,210600,'元宝区',3,1,210602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210603,210600,'振兴区',3,1,210603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210604,210600,'振安区',3,1,210604,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210624,210600,'宽甸满族自治县',3,1,210624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210681,210600,'东港市',3,1,210681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210682,210600,'凤城市',3,1,210682,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210700,210000,'锦州市',2,0,210700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210702,210700,'古塔区',3,1,210702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210703,210700,'凌河区',3,1,210703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210711,210700,'太和区',3,1,210711,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210726,210700,'黑山县',3,1,210726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210727,210700,'义县',3,1,210727,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210781,210700,'凌海市',3,1,210781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210782,210700,'北镇市',3,1,210782,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210793,210700,'经济技术开发区',3,1,210793,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210800,210000,'营口市',2,0,210800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210802,210800,'站前区',3,1,210802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210803,210800,'西市区',3,1,210803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210804,210800,'鲅鱼圈区',3,1,210804,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210811,210800,'老边区',3,1,210811,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210881,210800,'盖州市',3,1,210881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210882,210800,'大石桥市',3,1,210882,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210900,210000,'阜新市',2,0,210900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210902,210900,'海州区',3,1,210902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210903,210900,'新邱区',3,1,210903,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210904,210900,'太平区',3,1,210904,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210905,210900,'清河门区',3,1,210905,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210911,210900,'细河区',3,1,210911,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210921,210900,'阜新蒙古族自治县',3,1,210921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (210922,210900,'彰武县',3,1,210922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211000,210000,'辽阳市',2,0,211000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211002,211000,'白塔区',3,1,211002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211003,211000,'文圣区',3,1,211003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211004,211000,'宏伟区',3,1,211004,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211005,211000,'弓长岭区',3,1,211005,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211011,211000,'太子河区',3,1,211011,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211021,211000,'辽阳县',3,1,211021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211081,211000,'灯塔市',3,1,211081,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211100,210000,'盘锦市',2,0,211100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211102,211100,'双台子区',3,1,211102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211103,211100,'兴隆台区',3,1,211103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211104,211100,'大洼区',3,1,211104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211122,211100,'盘山县',3,1,211122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211200,210000,'铁岭市',2,0,211200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211202,211200,'银州区',3,1,211202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211204,211200,'清河区',3,1,211204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211221,211200,'铁岭县',3,1,211221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211223,211200,'西丰县',3,1,211223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211224,211200,'昌图县',3,1,211224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211281,211200,'调兵山市',3,1,211281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211282,211200,'开原市',3,1,211282,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211300,210000,'朝阳市',2,0,211300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211302,211300,'双塔区',3,1,211302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211303,211300,'龙城区',3,1,211303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211321,211300,'朝阳县',3,1,211321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211322,211300,'建平县',3,1,211322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211324,211300,'喀喇沁左翼蒙古族自治县',3,1,211324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211381,211300,'北票市',3,1,211381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211382,211300,'凌源市',3,1,211382,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211400,210000,'葫芦岛市',2,0,211400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211402,211400,'连山区',3,1,211402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211403,211400,'龙港区',3,1,211403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211404,211400,'南票区',3,1,211404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211421,211400,'绥中县',3,1,211421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211422,211400,'建昌县',3,1,211422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (211481,211400,'兴城市',3,1,211481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220000,0,'吉林省',1,0,220000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220100,220000,'长春市',2,0,220100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220102,220100,'南关区',3,1,220102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220103,220100,'宽城区',3,1,220103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220104,220100,'朝阳区',3,1,220104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220105,220100,'二道区',3,1,220105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220106,220100,'绿园区',3,1,220106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220112,220100,'双阳区',3,1,220112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220113,220100,'九台区',3,1,220113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220122,220100,'农安县',3,1,220122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220182,220100,'榆树市',3,1,220182,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220183,220100,'德惠市',3,1,220183,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220192,220100,'经济技术开发区',3,1,220192,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220200,220000,'吉林市',2,0,220200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220202,220200,'昌邑区',3,1,220202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220203,220200,'龙潭区',3,1,220203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220204,220200,'船营区',3,1,220204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220211,220200,'丰满区',3,1,220211,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220221,220200,'永吉县',3,1,220221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220281,220200,'蛟河市',3,1,220281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220282,220200,'桦甸市',3,1,220282,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220283,220200,'舒兰市',3,1,220283,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220284,220200,'磐石市',3,1,220284,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220300,220000,'四平市',2,0,220300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220302,220300,'铁西区',3,1,220302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220303,220300,'铁东区',3,1,220303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220322,220300,'梨树县',3,1,220322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220323,220300,'伊通满族自治县',3,1,220323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220381,220300,'公主岭市',3,1,220381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220382,220300,'双辽市',3,1,220382,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220400,220000,'辽源市',2,0,220400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220402,220400,'龙山区',3,1,220402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220403,220400,'西安区',3,1,220403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220421,220400,'东丰县',3,1,220421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220422,220400,'东辽县',3,1,220422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220500,220000,'通化市',2,0,220500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220502,220500,'东昌区',3,1,220502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220503,220500,'二道江区',3,1,220503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220521,220500,'通化县',3,1,220521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220523,220500,'辉南县',3,1,220523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220524,220500,'柳河县',3,1,220524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220581,220500,'梅河口市',3,1,220581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220582,220500,'集安市',3,1,220582,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220600,220000,'白山市',2,0,220600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220602,220600,'浑江区',3,1,220602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220605,220600,'江源区',3,1,220605,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220621,220600,'抚松县',3,1,220621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220622,220600,'靖宇县',3,1,220622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220623,220600,'长白朝鲜族自治县',3,1,220623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220681,220600,'临江市',3,1,220681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220700,220000,'松原市',2,0,220700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220702,220700,'宁江区',3,1,220702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220721,220700,'前郭尔罗斯蒙古族自治县',3,1,220721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220722,220700,'长岭县',3,1,220722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220723,220700,'乾安县',3,1,220723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220781,220700,'扶余市',3,1,220781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220800,220000,'白城市',2,0,220800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220802,220800,'洮北区',3,1,220802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220821,220800,'镇赉县',3,1,220821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220822,220800,'通榆县',3,1,220822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220881,220800,'洮南市',3,1,220881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (220882,220800,'大安市',3,1,220882,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (222400,220000,'延边朝鲜族自治州',2,0,222400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (222401,222400,'延吉市',3,1,222401,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (222402,222400,'图们市',3,1,222402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (222403,222400,'敦化市',3,1,222403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (222404,222400,'珲春市',3,1,222404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (222405,222400,'龙井市',3,1,222405,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (222406,222400,'和龙市',3,1,222406,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (222424,222400,'汪清县',3,1,222424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (222426,222400,'安图县',3,1,222426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230000,0,'黑龙江省',1,0,230000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230100,230000,'哈尔滨市',2,0,230100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230102,230100,'道里区',3,1,230102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230103,230100,'南岗区',3,1,230103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230104,230100,'道外区',3,1,230104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230108,230100,'平房区',3,1,230108,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230109,230100,'松北区',3,1,230109,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230110,230100,'香坊区',3,1,230110,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230111,230100,'呼兰区',3,1,230111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230112,230100,'阿城区',3,1,230112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230113,230100,'双城区',3,1,230113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230123,230100,'依兰县',3,1,230123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230124,230100,'方正县',3,1,230124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230125,230100,'宾县',3,1,230125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230126,230100,'巴彦县',3,1,230126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230127,230100,'木兰县',3,1,230127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230128,230100,'通河县',3,1,230128,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230129,230100,'延寿县',3,1,230129,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230183,230100,'尚志市',3,1,230183,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230184,230100,'五常市',3,1,230184,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230200,230000,'齐齐哈尔市',2,0,230200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230202,230200,'龙沙区',3,1,230202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230203,230200,'建华区',3,1,230203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230204,230200,'铁锋区',3,1,230204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230205,230200,'昂昂溪区',3,1,230205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230206,230200,'富拉尔基区',3,1,230206,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230207,230200,'碾子山区',3,1,230207,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230208,230200,'梅里斯达斡尔族区',3,1,230208,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230221,230200,'龙江县',3,1,230221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230223,230200,'依安县',3,1,230223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230224,230200,'泰来县',3,1,230224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230225,230200,'甘南县',3,1,230225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230227,230200,'富裕县',3,1,230227,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230229,230200,'克山县',3,1,230229,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230230,230200,'克东县',3,1,230230,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230231,230200,'拜泉县',3,1,230231,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230281,230200,'讷河市',3,1,230281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230300,230000,'鸡西市',2,0,230300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230302,230300,'鸡冠区',3,1,230302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230303,230300,'恒山区',3,1,230303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230304,230300,'滴道区',3,1,230304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230305,230300,'梨树区',3,1,230305,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230306,230300,'城子河区',3,1,230306,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230307,230300,'麻山区',3,1,230307,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230321,230300,'鸡东县',3,1,230321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230381,230300,'虎林市',3,1,230381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230382,230300,'密山市',3,1,230382,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230400,230000,'鹤岗市',2,0,230400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230402,230400,'向阳区',3,1,230402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230403,230400,'工农区',3,1,230403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230404,230400,'南山区',3,1,230404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230405,230400,'兴安区',3,1,230405,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230406,230400,'东山区',3,1,230406,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230407,230400,'兴山区',3,1,230407,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230421,230400,'萝北县',3,1,230421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230422,230400,'绥滨县',3,1,230422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230500,230000,'双鸭山市',2,0,230500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230502,230500,'尖山区',3,1,230502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230503,230500,'岭东区',3,1,230503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230505,230500,'四方台区',3,1,230505,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230506,230500,'宝山区',3,1,230506,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230521,230500,'集贤县',3,1,230521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230522,230500,'友谊县',3,1,230522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230523,230500,'宝清县',3,1,230523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230524,230500,'饶河县',3,1,230524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230600,230000,'大庆市',2,0,230600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230602,230600,'萨尔图区',3,1,230602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230603,230600,'龙凤区',3,1,230603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230604,230600,'让胡路区',3,1,230604,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230605,230600,'红岗区',3,1,230605,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230606,230600,'大同区',3,1,230606,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230621,230600,'肇州县',3,1,230621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230622,230600,'肇源县',3,1,230622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230623,230600,'林甸县',3,1,230623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230624,230600,'杜尔伯特蒙古族自治县',3,1,230624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230700,230000,'伊春市',2,0,230700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230702,230700,'伊春区',3,1,230702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230703,230700,'南岔区',3,1,230703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230704,230700,'友好区',3,1,230704,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230705,230700,'西林区',3,1,230705,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230706,230700,'翠峦区',3,1,230706,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230707,230700,'新青区',3,1,230707,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230708,230700,'美溪区',3,1,230708,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230709,230700,'金山屯区',3,1,230709,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230710,230700,'五营区',3,1,230710,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230711,230700,'乌马河区',3,1,230711,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230712,230700,'汤旺河区',3,1,230712,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230713,230700,'带岭区',3,1,230713,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230714,230700,'乌伊岭区',3,1,230714,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230715,230700,'红星区',3,1,230715,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230716,230700,'上甘岭区',3,1,230716,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230722,230700,'嘉荫县',3,1,230722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230781,230700,'铁力市',3,1,230781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230800,230000,'佳木斯市',2,0,230800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230803,230800,'向阳区',3,1,230803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230804,230800,'前进区',3,1,230804,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230805,230800,'东风区',3,1,230805,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230811,230800,'郊区',3,1,230811,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230822,230800,'桦南县',3,1,230822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230826,230800,'桦川县',3,1,230826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230828,230800,'汤原县',3,1,230828,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230881,230800,'同江市',3,1,230881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230882,230800,'富锦市',3,1,230882,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230883,230800,'抚远市',3,1,230883,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230900,230000,'七台河市',2,0,230900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230902,230900,'新兴区',3,1,230902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230903,230900,'桃山区',3,1,230903,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230904,230900,'茄子河区',3,1,230904,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (230921,230900,'勃利县',3,1,230921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231000,230000,'牡丹江市',2,0,231000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231002,231000,'东安区',3,1,231002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231003,231000,'阳明区',3,1,231003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231004,231000,'爱民区',3,1,231004,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231005,231000,'西安区',3,1,231005,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231025,231000,'林口县',3,1,231025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231081,231000,'绥芬河市',3,1,231081,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231083,231000,'海林市',3,1,231083,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231084,231000,'宁安市',3,1,231084,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231085,231000,'穆棱市',3,1,231085,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231086,231000,'东宁市',3,1,231086,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231100,230000,'黑河市',2,0,231100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231102,231100,'爱辉区',3,1,231102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231121,231100,'嫩江县',3,1,231121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231123,231100,'逊克县',3,1,231123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231124,231100,'孙吴县',3,1,231124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231181,231100,'北安市',3,1,231181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231182,231100,'五大连池市',3,1,231182,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231200,230000,'绥化市',2,0,231200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231202,231200,'北林区',3,1,231202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231221,231200,'望奎县',3,1,231221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231222,231200,'兰西县',3,1,231222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231223,231200,'青冈县',3,1,231223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231224,231200,'庆安县',3,1,231224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231225,231200,'明水县',3,1,231225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231226,231200,'绥棱县',3,1,231226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231281,231200,'安达市',3,1,231281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231282,231200,'肇东市',3,1,231282,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (231283,231200,'海伦市',3,1,231283,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (232700,230000,'大兴安岭地区',2,0,232700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (232701,232700,'漠河市',3,1,232701,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (232721,232700,'呼玛县',3,1,232721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (232722,232700,'塔河县',3,1,232722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (232790,232700,'松岭区',3,1,232790,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (232791,232700,'呼中区',3,1,232791,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (232792,232700,'加格达奇区',3,1,232792,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (232793,232700,'新林区',3,1,232793,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310000,0,'上海市',1,0,310000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310100,310000,'上海市',2,0,310100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310101,310100,'黄浦区',3,1,310101,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310104,310100,'徐汇区',3,1,310104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310105,310100,'长宁区',3,1,310105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310106,310100,'静安区',3,1,310106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310107,310100,'普陀区',3,1,310107,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310109,310100,'虹口区',3,1,310109,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310110,310100,'杨浦区',3,1,310110,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310112,310100,'闵行区',3,1,310112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310113,310100,'宝山区',3,1,310113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310114,310100,'嘉定区',3,1,310114,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310115,310100,'浦东新区',3,1,310115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310116,310100,'金山区',3,1,310116,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310117,310100,'松江区',3,1,310117,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310118,310100,'青浦区',3,1,310118,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310120,310100,'奉贤区',3,1,310120,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (310151,310100,'崇明区',3,1,310151,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320000,0,'江苏省',1,0,320000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320100,320000,'南京市',2,0,320100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320102,320100,'玄武区',3,1,320102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320104,320100,'秦淮区',3,1,320104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320105,320100,'建邺区',3,1,320105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320106,320100,'鼓楼区',3,1,320106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320111,320100,'浦口区',3,1,320111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320113,320100,'栖霞区',3,1,320113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320114,320100,'雨花台区',3,1,320114,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320115,320100,'江宁区',3,1,320115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320116,320100,'六合区',3,1,320116,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320117,320100,'溧水区',3,1,320117,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320118,320100,'高淳区',3,1,320118,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320200,320000,'无锡市',2,0,320200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320205,320200,'锡山区',3,1,320205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320206,320200,'惠山区',3,1,320206,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320211,320200,'滨湖区',3,1,320211,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320213,320200,'梁溪区',3,1,320213,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320214,320200,'新吴区',3,1,320214,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320281,320200,'江阴市',3,1,320281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320282,320200,'宜兴市',3,1,320282,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320300,320000,'徐州市',2,0,320300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320302,320300,'鼓楼区',3,1,320302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320303,320300,'云龙区',3,1,320303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320305,320300,'贾汪区',3,1,320305,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320311,320300,'泉山区',3,1,320311,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320312,320300,'铜山区',3,1,320312,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320321,320300,'丰县',3,1,320321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320322,320300,'沛县',3,1,320322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320324,320300,'睢宁县',3,1,320324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320381,320300,'新沂市',3,1,320381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320382,320300,'邳州市',3,1,320382,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320391,320300,'工业园区',3,1,320391,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320400,320000,'常州市',2,0,320400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320402,320400,'天宁区',3,1,320402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320404,320400,'钟楼区',3,1,320404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320411,320400,'新北区',3,1,320411,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320412,320400,'武进区',3,1,320412,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320413,320400,'金坛区',3,1,320413,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320481,320400,'溧阳市',3,1,320481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320500,320000,'苏州市',2,0,320500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320505,320500,'虎丘区',3,1,320505,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320506,320500,'吴中区',3,1,320506,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320507,320500,'相城区',3,1,320507,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320508,320500,'姑苏区',3,1,320508,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320509,320500,'吴江区',3,1,320509,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320581,320500,'常熟市',3,1,320581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320582,320500,'张家港市',3,1,320582,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320583,320500,'昆山市',3,1,320583,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320585,320500,'太仓市',3,1,320585,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320590,320500,'工业园区',3,1,320590,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320591,320500,'高新区',3,1,320591,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320600,320000,'南通市',2,0,320600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320602,320600,'崇川区',3,1,320602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320611,320600,'港闸区',3,1,320611,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320612,320600,'通州区',3,1,320612,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320623,320600,'如东县',3,1,320623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320681,320600,'启东市',3,1,320681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320682,320600,'如皋市',3,1,320682,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320684,320600,'海门市',3,1,320684,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320685,320600,'海安市',3,1,320685,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320691,320600,'高新区',3,1,320691,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320700,320000,'连云港市',2,0,320700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320703,320700,'连云区',3,1,320703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320706,320700,'海州区',3,1,320706,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320707,320700,'赣榆区',3,1,320707,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320722,320700,'东海县',3,1,320722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320723,320700,'灌云县',3,1,320723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320724,320700,'灌南县',3,1,320724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320800,320000,'淮安市',2,0,320800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320803,320800,'淮安区',3,1,320803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320804,320800,'淮阴区',3,1,320804,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320812,320800,'清江浦区',3,1,320812,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320813,320800,'洪泽区',3,1,320813,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320826,320800,'涟水县',3,1,320826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320830,320800,'盱眙县',3,1,320830,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320831,320800,'金湖县',3,1,320831,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320890,320800,'经济开发区',3,1,320890,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320900,320000,'盐城市',2,0,320900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320902,320900,'亭湖区',3,1,320902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320903,320900,'盐都区',3,1,320903,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320904,320900,'大丰区',3,1,320904,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320921,320900,'响水县',3,1,320921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320922,320900,'滨海县',3,1,320922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320923,320900,'阜宁县',3,1,320923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320924,320900,'射阳县',3,1,320924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320925,320900,'建湖县',3,1,320925,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (320981,320900,'东台市',3,1,320981,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321000,320000,'扬州市',2,0,321000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321002,321000,'广陵区',3,1,321002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321003,321000,'邗江区',3,1,321003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321012,321000,'江都区',3,1,321012,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321023,321000,'宝应县',3,1,321023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321081,321000,'仪征市',3,1,321081,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321084,321000,'高邮市',3,1,321084,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321090,321000,'经济开发区',3,1,321090,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321100,320000,'镇江市',2,0,321100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321102,321100,'京口区',3,1,321102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321111,321100,'润州区',3,1,321111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321112,321100,'丹徒区',3,1,321112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321181,321100,'丹阳市',3,1,321181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321182,321100,'扬中市',3,1,321182,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321183,321100,'句容市',3,1,321183,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321200,320000,'泰州市',2,0,321200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321202,321200,'海陵区',3,1,321202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321203,321200,'高港区',3,1,321203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321204,321200,'姜堰区',3,1,321204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321281,321200,'兴化市',3,1,321281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321282,321200,'靖江市',3,1,321282,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321283,321200,'泰兴市',3,1,321283,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321300,320000,'宿迁市',2,0,321300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321302,321300,'宿城区',3,1,321302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321311,321300,'宿豫区',3,1,321311,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321322,321300,'沭阳县',3,1,321322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321323,321300,'泗阳县',3,1,321323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (321324,321300,'泗洪县',3,1,321324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330000,0,'浙江省',1,0,330000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330100,330000,'杭州市',2,0,330100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330102,330100,'上城区',3,1,330102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330103,330100,'下城区',3,1,330103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330104,330100,'江干区',3,1,330104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330105,330100,'拱墅区',3,1,330105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330106,330100,'西湖区',3,1,330106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330108,330100,'滨江区',3,1,330108,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330109,330100,'萧山区',3,1,330109,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330110,330100,'余杭区',3,1,330110,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330111,330100,'富阳区',3,1,330111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330112,330100,'临安区',3,1,330112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330122,330100,'桐庐县',3,1,330122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330127,330100,'淳安县',3,1,330127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330182,330100,'建德市',3,1,330182,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330200,330000,'宁波市',2,0,330200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330203,330200,'海曙区',3,1,330203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330205,330200,'江北区',3,1,330205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330206,330200,'北仑区',3,1,330206,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330211,330200,'镇海区',3,1,330211,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330212,330200,'鄞州区',3,1,330212,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330213,330200,'奉化区',3,1,330213,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330225,330200,'象山县',3,1,330225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330226,330200,'宁海县',3,1,330226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330281,330200,'余姚市',3,1,330281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330282,330200,'慈溪市',3,1,330282,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330300,330000,'温州市',2,0,330300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330302,330300,'鹿城区',3,1,330302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330303,330300,'龙湾区',3,1,330303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330304,330300,'瓯海区',3,1,330304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330305,330300,'洞头区',3,1,330305,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330324,330300,'永嘉县',3,1,330324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330326,330300,'平阳县',3,1,330326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330327,330300,'苍南县',3,1,330327,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330328,330300,'文成县',3,1,330328,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330329,330300,'泰顺县',3,1,330329,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330381,330300,'瑞安市',3,1,330381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330382,330300,'乐清市',3,1,330382,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330400,330000,'嘉兴市',2,0,330400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330402,330400,'南湖区',3,1,330402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330411,330400,'秀洲区',3,1,330411,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330421,330400,'嘉善县',3,1,330421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330424,330400,'海盐县',3,1,330424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330481,330400,'海宁市',3,1,330481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330482,330400,'平湖市',3,1,330482,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330483,330400,'桐乡市',3,1,330483,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330500,330000,'湖州市',2,0,330500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330502,330500,'吴兴区',3,1,330502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330503,330500,'南浔区',3,1,330503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330521,330500,'德清县',3,1,330521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330522,330500,'长兴县',3,1,330522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330523,330500,'安吉县',3,1,330523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330600,330000,'绍兴市',2,0,330600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330602,330600,'越城区',3,1,330602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330603,330600,'柯桥区',3,1,330603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330604,330600,'上虞区',3,1,330604,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330624,330600,'新昌县',3,1,330624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330681,330600,'诸暨市',3,1,330681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330683,330600,'嵊州市',3,1,330683,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330700,330000,'金华市',2,0,330700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330702,330700,'婺城区',3,1,330702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330703,330700,'金东区',3,1,330703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330723,330700,'武义县',3,1,330723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330726,330700,'浦江县',3,1,330726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330727,330700,'磐安县',3,1,330727,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330781,330700,'兰溪市',3,1,330781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330782,330700,'义乌市',3,1,330782,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330783,330700,'东阳市',3,1,330783,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330784,330700,'永康市',3,1,330784,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330800,330000,'衢州市',2,0,330800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330802,330800,'柯城区',3,1,330802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330803,330800,'衢江区',3,1,330803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330822,330800,'常山县',3,1,330822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330824,330800,'开化县',3,1,330824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330825,330800,'龙游县',3,1,330825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330881,330800,'江山市',3,1,330881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330900,330000,'舟山市',2,0,330900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330902,330900,'定海区',3,1,330902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330903,330900,'普陀区',3,1,330903,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330921,330900,'岱山县',3,1,330921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (330922,330900,'嵊泗县',3,1,330922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331000,330000,'台州市',2,0,331000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331002,331000,'椒江区',3,1,331002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331003,331000,'黄岩区',3,1,331003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331004,331000,'路桥区',3,1,331004,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331022,331000,'三门县',3,1,331022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331023,331000,'天台县',3,1,331023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331024,331000,'仙居县',3,1,331024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331081,331000,'温岭市',3,1,331081,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331082,331000,'临海市',3,1,331082,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331083,331000,'玉环市',3,1,331083,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331100,330000,'丽水市',2,0,331100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331102,331100,'莲都区',3,1,331102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331121,331100,'青田县',3,1,331121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331122,331100,'缙云县',3,1,331122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331123,331100,'遂昌县',3,1,331123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331124,331100,'松阳县',3,1,331124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331125,331100,'云和县',3,1,331125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331126,331100,'庆元县',3,1,331126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331127,331100,'景宁畲族自治县',3,1,331127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (331181,331100,'龙泉市',3,1,331181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340000,0,'安徽省',1,0,340000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340100,340000,'合肥市',2,0,340100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340102,340100,'瑶海区',3,1,340102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340103,340100,'庐阳区',3,1,340103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340104,340100,'蜀山区',3,1,340104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340111,340100,'包河区',3,1,340111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340121,340100,'长丰县',3,1,340121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340122,340100,'肥东县',3,1,340122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340123,340100,'肥西县',3,1,340123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340124,340100,'庐江县',3,1,340124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340181,340100,'巢湖市',3,1,340181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340190,340100,'高新技术开发区',3,1,340190,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340191,340100,'经济技术开发区',3,1,340191,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340200,340000,'芜湖市',2,0,340200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340202,340200,'镜湖区',3,1,340202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340203,340200,'弋江区',3,1,340203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340207,340200,'鸠江区',3,1,340207,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340208,340200,'三山区',3,1,340208,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340221,340200,'芜湖县',3,1,340221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340222,340200,'繁昌县',3,1,340222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340223,340200,'南陵县',3,1,340223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340225,340200,'无为县',3,1,340225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340300,340000,'蚌埠市',2,0,340300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340302,340300,'龙子湖区',3,1,340302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340303,340300,'蚌山区',3,1,340303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340304,340300,'禹会区',3,1,340304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340311,340300,'淮上区',3,1,340311,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340321,340300,'怀远县',3,1,340321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340322,340300,'五河县',3,1,340322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340323,340300,'固镇县',3,1,340323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340400,340000,'淮南市',2,0,340400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340402,340400,'大通区',3,1,340402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340403,340400,'田家庵区',3,1,340403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340404,340400,'谢家集区',3,1,340404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340405,340400,'八公山区',3,1,340405,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340406,340400,'潘集区',3,1,340406,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340421,340400,'凤台县',3,1,340421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340422,340400,'寿县',3,1,340422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340500,340000,'马鞍山市',2,0,340500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340503,340500,'花山区',3,1,340503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340504,340500,'雨山区',3,1,340504,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340506,340500,'博望区',3,1,340506,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340521,340500,'当涂县',3,1,340521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340522,340500,'含山县',3,1,340522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340523,340500,'和县',3,1,340523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340600,340000,'淮北市',2,0,340600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340602,340600,'杜集区',3,1,340602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340603,340600,'相山区',3,1,340603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340604,340600,'烈山区',3,1,340604,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340621,340600,'濉溪县',3,1,340621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340700,340000,'铜陵市',2,0,340700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340705,340700,'铜官区',3,1,340705,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340706,340700,'义安区',3,1,340706,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340711,340700,'郊区',3,1,340711,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340722,340700,'枞阳县',3,1,340722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340800,340000,'安庆市',2,0,340800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340802,340800,'迎江区',3,1,340802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340803,340800,'大观区',3,1,340803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340811,340800,'宜秀区',3,1,340811,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340822,340800,'怀宁县',3,1,340822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340824,340800,'潜山县',3,1,340824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340825,340800,'太湖县',3,1,340825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340826,340800,'宿松县',3,1,340826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340827,340800,'望江县',3,1,340827,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340828,340800,'岳西县',3,1,340828,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (340881,340800,'桐城市',3,1,340881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341000,340000,'黄山市',2,0,341000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341002,341000,'屯溪区',3,1,341002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341003,341000,'黄山区',3,1,341003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341004,341000,'徽州区',3,1,341004,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341021,341000,'歙县',3,1,341021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341022,341000,'休宁县',3,1,341022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341023,341000,'黟县',3,1,341023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341024,341000,'祁门县',3,1,341024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341100,340000,'滁州市',2,0,341100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341102,341100,'琅琊区',3,1,341102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341103,341100,'南谯区',3,1,341103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341122,341100,'来安县',3,1,341122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341124,341100,'全椒县',3,1,341124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341125,341100,'定远县',3,1,341125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341126,341100,'凤阳县',3,1,341126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341181,341100,'天长市',3,1,341181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341182,341100,'明光市',3,1,341182,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341200,340000,'阜阳市',2,0,341200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341202,341200,'颍州区',3,1,341202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341203,341200,'颍东区',3,1,341203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341204,341200,'颍泉区',3,1,341204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341221,341200,'临泉县',3,1,341221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341222,341200,'太和县',3,1,341222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341225,341200,'阜南县',3,1,341225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341226,341200,'颍上县',3,1,341226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341282,341200,'界首市',3,1,341282,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341300,340000,'宿州市',2,0,341300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341302,341300,'埇桥区',3,1,341302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341321,341300,'砀山县',3,1,341321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341322,341300,'萧县',3,1,341322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341323,341300,'灵璧县',3,1,341323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341324,341300,'泗县',3,1,341324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341390,341300,'经济开发区',3,1,341390,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341500,340000,'六安市',2,0,341500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341502,341500,'金安区',3,1,341502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341503,341500,'裕安区',3,1,341503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341504,341500,'叶集区',3,1,341504,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341522,341500,'霍邱县',3,1,341522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341523,341500,'舒城县',3,1,341523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341524,341500,'金寨县',3,1,341524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341525,341500,'霍山县',3,1,341525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341600,340000,'亳州市',2,0,341600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341602,341600,'谯城区',3,1,341602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341621,341600,'涡阳县',3,1,341621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341622,341600,'蒙城县',3,1,341622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341623,341600,'利辛县',3,1,341623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341700,340000,'池州市',2,0,341700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341702,341700,'贵池区',3,1,341702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341721,341700,'东至县',3,1,341721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341722,341700,'石台县',3,1,341722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341723,341700,'青阳县',3,1,341723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341800,340000,'宣城市',2,0,341800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341802,341800,'宣州区',3,1,341802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341821,341800,'郎溪县',3,1,341821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341822,341800,'广德县',3,1,341822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341823,341800,'泾县',3,1,341823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341824,341800,'绩溪县',3,1,341824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341825,341800,'旌德县',3,1,341825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (341881,341800,'宁国市',3,1,341881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350000,0,'福建省',1,0,350000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350100,350000,'福州市',2,0,350100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350102,350100,'鼓楼区',3,1,350102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350103,350100,'台江区',3,1,350103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350104,350100,'仓山区',3,1,350104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350105,350100,'马尾区',3,1,350105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350111,350100,'晋安区',3,1,350111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350112,350100,'长乐区',3,1,350112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350121,350100,'闽侯县',3,1,350121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350122,350100,'连江县',3,1,350122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350123,350100,'罗源县',3,1,350123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350124,350100,'闽清县',3,1,350124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350125,350100,'永泰县',3,1,350125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350128,350100,'平潭县',3,1,350128,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350181,350100,'福清市',3,1,350181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350200,350000,'厦门市',2,0,350200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350203,350200,'思明区',3,1,350203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350205,350200,'海沧区',3,1,350205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350206,350200,'湖里区',3,1,350206,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350211,350200,'集美区',3,1,350211,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350212,350200,'同安区',3,1,350212,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350213,350200,'翔安区',3,1,350213,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350300,350000,'莆田市',2,0,350300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350302,350300,'城厢区',3,1,350302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350303,350300,'涵江区',3,1,350303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350304,350300,'荔城区',3,1,350304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350305,350300,'秀屿区',3,1,350305,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350322,350300,'仙游县',3,1,350322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350400,350000,'三明市',2,0,350400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350402,350400,'梅列区',3,1,350402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350403,350400,'三元区',3,1,350403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350421,350400,'明溪县',3,1,350421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350423,350400,'清流县',3,1,350423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350424,350400,'宁化县',3,1,350424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350425,350400,'大田县',3,1,350425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350426,350400,'尤溪县',3,1,350426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350427,350400,'沙县',3,1,350427,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350428,350400,'将乐县',3,1,350428,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350429,350400,'泰宁县',3,1,350429,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350430,350400,'建宁县',3,1,350430,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350481,350400,'永安市',3,1,350481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350500,350000,'泉州市',2,0,350500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350502,350500,'鲤城区',3,1,350502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350503,350500,'丰泽区',3,1,350503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350504,350500,'洛江区',3,1,350504,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350505,350500,'泉港区',3,1,350505,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350521,350500,'惠安县',3,1,350521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350524,350500,'安溪县',3,1,350524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350525,350500,'永春县',3,1,350525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350526,350500,'德化县',3,1,350526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350527,350500,'金门县',3,1,350527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350581,350500,'石狮市',3,1,350581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350582,350500,'晋江市',3,1,350582,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350583,350500,'南安市',3,1,350583,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350600,350000,'漳州市',2,0,350600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350602,350600,'芗城区',3,1,350602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350603,350600,'龙文区',3,1,350603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350622,350600,'云霄县',3,1,350622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350623,350600,'漳浦县',3,1,350623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350624,350600,'诏安县',3,1,350624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350625,350600,'长泰县',3,1,350625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350626,350600,'东山县',3,1,350626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350627,350600,'南靖县',3,1,350627,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350628,350600,'平和县',3,1,350628,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350629,350600,'华安县',3,1,350629,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350681,350600,'龙海市',3,1,350681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350700,350000,'南平市',2,0,350700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350702,350700,'延平区',3,1,350702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350703,350700,'建阳区',3,1,350703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350721,350700,'顺昌县',3,1,350721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350722,350700,'浦城县',3,1,350722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350723,350700,'光泽县',3,1,350723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350724,350700,'松溪县',3,1,350724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350725,350700,'政和县',3,1,350725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350781,350700,'邵武市',3,1,350781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350782,350700,'武夷山市',3,1,350782,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350783,350700,'建瓯市',3,1,350783,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350800,350000,'龙岩市',2,0,350800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350802,350800,'新罗区',3,1,350802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350803,350800,'永定区',3,1,350803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350821,350800,'长汀县',3,1,350821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350823,350800,'上杭县',3,1,350823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350824,350800,'武平县',3,1,350824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350825,350800,'连城县',3,1,350825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350881,350800,'漳平市',3,1,350881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350900,350000,'宁德市',2,0,350900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350902,350900,'蕉城区',3,1,350902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350921,350900,'霞浦县',3,1,350921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350922,350900,'古田县',3,1,350922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350923,350900,'屏南县',3,1,350923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350924,350900,'寿宁县',3,1,350924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350925,350900,'周宁县',3,1,350925,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350926,350900,'柘荣县',3,1,350926,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350981,350900,'福安市',3,1,350981,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (350982,350900,'福鼎市',3,1,350982,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360000,0,'江西省',1,0,360000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360100,360000,'南昌市',2,0,360100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360102,360100,'东湖区',3,1,360102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360103,360100,'西湖区',3,1,360103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360104,360100,'青云谱区',3,1,360104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360105,360100,'湾里区',3,1,360105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360111,360100,'青山湖区',3,1,360111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360112,360100,'新建区',3,1,360112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360121,360100,'南昌县',3,1,360121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360123,360100,'安义县',3,1,360123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360124,360100,'进贤县',3,1,360124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360190,360100,'经济技术开发区',3,1,360190,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360192,360100,'高新区',3,1,360192,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360200,360000,'景德镇市',2,0,360200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360202,360200,'昌江区',3,1,360202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360203,360200,'珠山区',3,1,360203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360222,360200,'浮梁县',3,1,360222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360281,360200,'乐平市',3,1,360281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360300,360000,'萍乡市',2,0,360300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360302,360300,'安源区',3,1,360302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360313,360300,'湘东区',3,1,360313,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360321,360300,'莲花县',3,1,360321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360322,360300,'上栗县',3,1,360322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360323,360300,'芦溪县',3,1,360323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360400,360000,'九江市',2,0,360400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360402,360400,'濂溪区',3,1,360402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360403,360400,'浔阳区',3,1,360403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360404,360400,'柴桑区',3,1,360404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360423,360400,'武宁县',3,1,360423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360424,360400,'修水县',3,1,360424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360425,360400,'永修县',3,1,360425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360426,360400,'德安县',3,1,360426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360428,360400,'都昌县',3,1,360428,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360429,360400,'湖口县',3,1,360429,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360430,360400,'彭泽县',3,1,360430,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360481,360400,'瑞昌市',3,1,360481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360482,360400,'共青城市',3,1,360482,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360483,360400,'庐山市',3,1,360483,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360490,360400,'经济技术开发区',3,1,360490,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360500,360000,'新余市',2,0,360500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360502,360500,'渝水区',3,1,360502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360521,360500,'分宜县',3,1,360521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360600,360000,'鹰潭市',2,0,360600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360602,360600,'月湖区',3,1,360602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360603,360600,'余江区',3,1,360603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360681,360600,'贵溪市',3,1,360681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360700,360000,'赣州市',2,0,360700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360702,360700,'章贡区',3,1,360702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360703,360700,'南康区',3,1,360703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360704,360700,'赣县区',3,1,360704,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360722,360700,'信丰县',3,1,360722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360723,360700,'大余县',3,1,360723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360724,360700,'上犹县',3,1,360724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360725,360700,'崇义县',3,1,360725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360726,360700,'安远县',3,1,360726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360727,360700,'龙南县',3,1,360727,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360728,360700,'定南县',3,1,360728,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360729,360700,'全南县',3,1,360729,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360730,360700,'宁都县',3,1,360730,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360731,360700,'于都县',3,1,360731,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360732,360700,'兴国县',3,1,360732,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360733,360700,'会昌县',3,1,360733,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360734,360700,'寻乌县',3,1,360734,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360735,360700,'石城县',3,1,360735,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360781,360700,'瑞金市',3,1,360781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360800,360000,'吉安市',2,0,360800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360802,360800,'吉州区',3,1,360802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360803,360800,'青原区',3,1,360803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360821,360800,'吉安县',3,1,360821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360822,360800,'吉水县',3,1,360822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360823,360800,'峡江县',3,1,360823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360824,360800,'新干县',3,1,360824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360825,360800,'永丰县',3,1,360825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360826,360800,'泰和县',3,1,360826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360827,360800,'遂川县',3,1,360827,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360828,360800,'万安县',3,1,360828,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360829,360800,'安福县',3,1,360829,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360830,360800,'永新县',3,1,360830,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360881,360800,'井冈山市',3,1,360881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360900,360000,'宜春市',2,0,360900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360902,360900,'袁州区',3,1,360902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360921,360900,'奉新县',3,1,360921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360922,360900,'万载县',3,1,360922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360923,360900,'上高县',3,1,360923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360924,360900,'宜丰县',3,1,360924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360925,360900,'靖安县',3,1,360925,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360926,360900,'铜鼓县',3,1,360926,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360981,360900,'丰城市',3,1,360981,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360982,360900,'樟树市',3,1,360982,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (360983,360900,'高安市',3,1,360983,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361000,360000,'抚州市',2,0,361000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361002,361000,'临川区',3,1,361002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361003,361000,'东乡区',3,1,361003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361021,361000,'南城县',3,1,361021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361022,361000,'黎川县',3,1,361022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361023,361000,'南丰县',3,1,361023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361024,361000,'崇仁县',3,1,361024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361025,361000,'乐安县',3,1,361025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361026,361000,'宜黄县',3,1,361026,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361027,361000,'金溪县',3,1,361027,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361028,361000,'资溪县',3,1,361028,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361030,361000,'广昌县',3,1,361030,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361100,360000,'上饶市',2,0,361100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361102,361100,'信州区',3,1,361102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361103,361100,'广丰区',3,1,361103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361121,361100,'上饶县',3,1,361121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361123,361100,'玉山县',3,1,361123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361124,361100,'铅山县',3,1,361124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361125,361100,'横峰县',3,1,361125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361126,361100,'弋阳县',3,1,361126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361127,361100,'余干县',3,1,361127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361128,361100,'鄱阳县',3,1,361128,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361129,361100,'万年县',3,1,361129,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361130,361100,'婺源县',3,1,361130,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (361181,361100,'德兴市',3,1,361181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370000,0,'山东省',1,0,370000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370100,370000,'济南市',2,0,370100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370102,370100,'历下区',3,1,370102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370103,370100,'市中区',3,1,370103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370104,370100,'槐荫区',3,1,370104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370105,370100,'天桥区',3,1,370105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370112,370100,'历城区',3,1,370112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370113,370100,'长清区',3,1,370113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370114,370100,'章丘区',3,1,370114,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370115,370100,'济阳区',3,1,370115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370124,370100,'平阴县',3,1,370124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370126,370100,'商河县',3,1,370126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370190,370100,'高新区',3,1,370190,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370200,370000,'青岛市',2,0,370200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370202,370200,'市南区',3,1,370202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370203,370200,'市北区',3,1,370203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370211,370200,'黄岛区',3,1,370211,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370212,370200,'崂山区',3,1,370212,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370213,370200,'李沧区',3,1,370213,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370214,370200,'城阳区',3,1,370214,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370215,370200,'即墨区',3,1,370215,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370281,370200,'胶州市',3,1,370281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370283,370200,'平度市',3,1,370283,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370285,370200,'莱西市',3,1,370285,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370290,370200,'开发区',3,1,370290,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370300,370000,'淄博市',2,0,370300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370302,370300,'淄川区',3,1,370302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370303,370300,'张店区',3,1,370303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370304,370300,'博山区',3,1,370304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370305,370300,'临淄区',3,1,370305,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370306,370300,'周村区',3,1,370306,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370321,370300,'桓台县',3,1,370321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370322,370300,'高青县',3,1,370322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370323,370300,'沂源县',3,1,370323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370400,370000,'枣庄市',2,0,370400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370402,370400,'市中区',3,1,370402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370403,370400,'薛城区',3,1,370403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370404,370400,'峄城区',3,1,370404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370405,370400,'台儿庄区',3,1,370405,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370406,370400,'山亭区',3,1,370406,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370481,370400,'滕州市',3,1,370481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370500,370000,'东营市',2,0,370500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370502,370500,'东营区',3,1,370502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370503,370500,'河口区',3,1,370503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370505,370500,'垦利区',3,1,370505,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370522,370500,'利津县',3,1,370522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370523,370500,'广饶县',3,1,370523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370600,370000,'烟台市',2,0,370600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370602,370600,'芝罘区',3,1,370602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370611,370600,'福山区',3,1,370611,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370612,370600,'牟平区',3,1,370612,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370613,370600,'莱山区',3,1,370613,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370634,370600,'长岛县',3,1,370634,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370681,370600,'龙口市',3,1,370681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370682,370600,'莱阳市',3,1,370682,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370683,370600,'莱州市',3,1,370683,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370684,370600,'蓬莱市',3,1,370684,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370685,370600,'招远市',3,1,370685,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370686,370600,'栖霞市',3,1,370686,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370687,370600,'海阳市',3,1,370687,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370690,370600,'开发区',3,1,370690,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370700,370000,'潍坊市',2,0,370700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370702,370700,'潍城区',3,1,370702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370703,370700,'寒亭区',3,1,370703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370704,370700,'坊子区',3,1,370704,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370705,370700,'奎文区',3,1,370705,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370724,370700,'临朐县',3,1,370724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370725,370700,'昌乐县',3,1,370725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370781,370700,'青州市',3,1,370781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370782,370700,'诸城市',3,1,370782,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370783,370700,'寿光市',3,1,370783,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370784,370700,'安丘市',3,1,370784,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370785,370700,'高密市',3,1,370785,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370786,370700,'昌邑市',3,1,370786,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370790,370700,'开发区',3,1,370790,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370791,370700,'高新区',3,1,370791,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370800,370000,'济宁市',2,0,370800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370811,370800,'任城区',3,1,370811,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370812,370800,'兖州区',3,1,370812,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370826,370800,'微山县',3,1,370826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370827,370800,'鱼台县',3,1,370827,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370828,370800,'金乡县',3,1,370828,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370829,370800,'嘉祥县',3,1,370829,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370830,370800,'汶上县',3,1,370830,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370831,370800,'泗水县',3,1,370831,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370832,370800,'梁山县',3,1,370832,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370881,370800,'曲阜市',3,1,370881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370883,370800,'邹城市',3,1,370883,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370890,370800,'高新区',3,1,370890,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370900,370000,'泰安市',2,0,370900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370902,370900,'泰山区',3,1,370902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370911,370900,'岱岳区',3,1,370911,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370921,370900,'宁阳县',3,1,370921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370923,370900,'东平县',3,1,370923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370982,370900,'新泰市',3,1,370982,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (370983,370900,'肥城市',3,1,370983,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371000,370000,'威海市',2,0,371000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371002,371000,'环翠区',3,1,371002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371003,371000,'文登区',3,1,371003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371082,371000,'荣成市',3,1,371082,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371083,371000,'乳山市',3,1,371083,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371091,371000,'经济技术开发区',3,1,371091,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371100,370000,'日照市',2,0,371100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371102,371100,'东港区',3,1,371102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371103,371100,'岚山区',3,1,371103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371121,371100,'五莲县',3,1,371121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371122,371100,'莒县',3,1,371122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371200,370000,'莱芜市',2,0,371200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371202,371200,'莱城区',3,1,371202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371203,371200,'钢城区',3,1,371203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371300,370000,'临沂市',2,0,371300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371302,371300,'兰山区',3,1,371302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371311,371300,'罗庄区',3,1,371311,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371312,371300,'河东区',3,1,371312,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371321,371300,'沂南县',3,1,371321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371322,371300,'郯城县',3,1,371322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371323,371300,'沂水县',3,1,371323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371324,371300,'兰陵县',3,1,371324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371325,371300,'费县',3,1,371325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371326,371300,'平邑县',3,1,371326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371327,371300,'莒南县',3,1,371327,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371328,371300,'蒙阴县',3,1,371328,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371329,371300,'临沭县',3,1,371329,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371400,370000,'德州市',2,0,371400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371402,371400,'德城区',3,1,371402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371403,371400,'陵城区',3,1,371403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371422,371400,'宁津县',3,1,371422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371423,371400,'庆云县',3,1,371423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371424,371400,'临邑县',3,1,371424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371425,371400,'齐河县',3,1,371425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371426,371400,'平原县',3,1,371426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371427,371400,'夏津县',3,1,371427,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371428,371400,'武城县',3,1,371428,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371481,371400,'乐陵市',3,1,371481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371482,371400,'禹城市',3,1,371482,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371500,370000,'聊城市',2,0,371500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371502,371500,'东昌府区',3,1,371502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371521,371500,'阳谷县',3,1,371521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371522,371500,'莘县',3,1,371522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371523,371500,'茌平县',3,1,371523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371524,371500,'东阿县',3,1,371524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371525,371500,'冠县',3,1,371525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371526,371500,'高唐县',3,1,371526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371581,371500,'临清市',3,1,371581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371600,370000,'滨州市',2,0,371600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371602,371600,'滨城区',3,1,371602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371603,371600,'沾化区',3,1,371603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371621,371600,'惠民县',3,1,371621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371622,371600,'阳信县',3,1,371622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371623,371600,'无棣县',3,1,371623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371625,371600,'博兴县',3,1,371625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371681,371600,'邹平市',3,1,371681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371700,370000,'菏泽市',2,0,371700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371702,371700,'牡丹区',3,1,371702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371703,371700,'定陶区',3,1,371703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371721,371700,'曹县',3,1,371721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371722,371700,'单县',3,1,371722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371723,371700,'成武县',3,1,371723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371724,371700,'巨野县',3,1,371724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371725,371700,'郓城县',3,1,371725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371726,371700,'鄄城县',3,1,371726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (371728,371700,'东明县',3,1,371728,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410000,0,'河南省',1,0,410000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410100,410000,'郑州市',2,0,410100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410102,410100,'中原区',3,1,410102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410103,410100,'二七区',3,1,410103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410104,410100,'管城回族区',3,1,410104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410105,410100,'金水区',3,1,410105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410106,410100,'上街区',3,1,410106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410108,410100,'惠济区',3,1,410108,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410122,410100,'中牟县',3,1,410122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410181,410100,'巩义市',3,1,410181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410182,410100,'荥阳市',3,1,410182,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410183,410100,'新密市',3,1,410183,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410184,410100,'新郑市',3,1,410184,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410185,410100,'登封市',3,1,410185,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410190,410100,'高新技术开发区',3,1,410190,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410191,410100,'经济技术开发区',3,1,410191,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410200,410000,'开封市',2,0,410200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410202,410200,'龙亭区',3,1,410202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410203,410200,'顺河回族区',3,1,410203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410204,410200,'鼓楼区',3,1,410204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410205,410200,'禹王台区',3,1,410205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410212,410200,'祥符区',3,1,410212,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410221,410200,'杞县',3,1,410221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410222,410200,'通许县',3,1,410222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410223,410200,'尉氏县',3,1,410223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410225,410200,'兰考县',3,1,410225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410300,410000,'洛阳市',2,0,410300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410302,410300,'老城区',3,1,410302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410303,410300,'西工区',3,1,410303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410304,410300,'瀍河回族区',3,1,410304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410305,410300,'涧西区',3,1,410305,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410306,410300,'吉利区',3,1,410306,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410311,410300,'洛龙区',3,1,410311,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410322,410300,'孟津县',3,1,410322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410323,410300,'新安县',3,1,410323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410324,410300,'栾川县',3,1,410324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410325,410300,'嵩县',3,1,410325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410326,410300,'汝阳县',3,1,410326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410327,410300,'宜阳县',3,1,410327,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410328,410300,'洛宁县',3,1,410328,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410329,410300,'伊川县',3,1,410329,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410381,410300,'偃师市',3,1,410381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410400,410000,'平顶山市',2,0,410400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410402,410400,'新华区',3,1,410402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410403,410400,'卫东区',3,1,410403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410404,410400,'石龙区',3,1,410404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410411,410400,'湛河区',3,1,410411,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410421,410400,'宝丰县',3,1,410421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410422,410400,'叶县',3,1,410422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410423,410400,'鲁山县',3,1,410423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410425,410400,'郏县',3,1,410425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410481,410400,'舞钢市',3,1,410481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410482,410400,'汝州市',3,1,410482,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410500,410000,'安阳市',2,0,410500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410502,410500,'文峰区',3,1,410502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410503,410500,'北关区',3,1,410503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410505,410500,'殷都区',3,1,410505,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410506,410500,'龙安区',3,1,410506,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410522,410500,'安阳县',3,1,410522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410523,410500,'汤阴县',3,1,410523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410526,410500,'滑县',3,1,410526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410527,410500,'内黄县',3,1,410527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410581,410500,'林州市',3,1,410581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410590,410500,'开发区',3,1,410590,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410600,410000,'鹤壁市',2,0,410600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410602,410600,'鹤山区',3,1,410602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410603,410600,'山城区',3,1,410603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410611,410600,'淇滨区',3,1,410611,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410621,410600,'浚县',3,1,410621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410622,410600,'淇县',3,1,410622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410700,410000,'新乡市',2,0,410700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410702,410700,'红旗区',3,1,410702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410703,410700,'卫滨区',3,1,410703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410704,410700,'凤泉区',3,1,410704,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410711,410700,'牧野区',3,1,410711,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410721,410700,'新乡县',3,1,410721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410724,410700,'获嘉县',3,1,410724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410725,410700,'原阳县',3,1,410725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410726,410700,'延津县',3,1,410726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410727,410700,'封丘县',3,1,410727,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410728,410700,'长垣县',3,1,410728,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410781,410700,'卫辉市',3,1,410781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410782,410700,'辉县市',3,1,410782,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410800,410000,'焦作市',2,0,410800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410802,410800,'解放区',3,1,410802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410803,410800,'中站区',3,1,410803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410804,410800,'马村区',3,1,410804,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410811,410800,'山阳区',3,1,410811,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410821,410800,'修武县',3,1,410821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410822,410800,'博爱县',3,1,410822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410823,410800,'武陟县',3,1,410823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410825,410800,'温县',3,1,410825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410882,410800,'沁阳市',3,1,410882,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410883,410800,'孟州市',3,1,410883,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410900,410000,'濮阳市',2,0,410900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410902,410900,'华龙区',3,1,410902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410922,410900,'清丰县',3,1,410922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410923,410900,'南乐县',3,1,410923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410926,410900,'范县',3,1,410926,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410927,410900,'台前县',3,1,410927,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (410928,410900,'濮阳县',3,1,410928,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411000,410000,'许昌市',2,0,411000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411002,411000,'魏都区',3,1,411002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411003,411000,'建安区',3,1,411003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411024,411000,'鄢陵县',3,1,411024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411025,411000,'襄城县',3,1,411025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411081,411000,'禹州市',3,1,411081,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411082,411000,'长葛市',3,1,411082,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411100,410000,'漯河市',2,0,411100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411102,411100,'源汇区',3,1,411102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411103,411100,'郾城区',3,1,411103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411104,411100,'召陵区',3,1,411104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411121,411100,'舞阳县',3,1,411121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411122,411100,'临颍县',3,1,411122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411200,410000,'三门峡市',2,0,411200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411202,411200,'湖滨区',3,1,411202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411203,411200,'陕州区',3,1,411203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411221,411200,'渑池县',3,1,411221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411224,411200,'卢氏县',3,1,411224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411281,411200,'义马市',3,1,411281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411282,411200,'灵宝市',3,1,411282,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411300,410000,'南阳市',2,0,411300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411302,411300,'宛城区',3,1,411302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411303,411300,'卧龙区',3,1,411303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411321,411300,'南召县',3,1,411321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411322,411300,'方城县',3,1,411322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411323,411300,'西峡县',3,1,411323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411324,411300,'镇平县',3,1,411324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411325,411300,'内乡县',3,1,411325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411326,411300,'淅川县',3,1,411326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411327,411300,'社旗县',3,1,411327,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411328,411300,'唐河县',3,1,411328,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411329,411300,'新野县',3,1,411329,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411330,411300,'桐柏县',3,1,411330,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411381,411300,'邓州市',3,1,411381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411400,410000,'商丘市',2,0,411400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411402,411400,'梁园区',3,1,411402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411403,411400,'睢阳区',3,1,411403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411421,411400,'民权县',3,1,411421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411422,411400,'睢县',3,1,411422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411423,411400,'宁陵县',3,1,411423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411424,411400,'柘城县',3,1,411424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411425,411400,'虞城县',3,1,411425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411426,411400,'夏邑县',3,1,411426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411481,411400,'永城市',3,1,411481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411500,410000,'信阳市',2,0,411500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411502,411500,'浉河区',3,1,411502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411503,411500,'平桥区',3,1,411503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411521,411500,'罗山县',3,1,411521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411522,411500,'光山县',3,1,411522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411523,411500,'新县',3,1,411523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411524,411500,'商城县',3,1,411524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411525,411500,'固始县',3,1,411525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411526,411500,'潢川县',3,1,411526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411527,411500,'淮滨县',3,1,411527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411528,411500,'息县',3,1,411528,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411600,410000,'周口市',2,0,411600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411602,411600,'川汇区',3,1,411602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411621,411600,'扶沟县',3,1,411621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411622,411600,'西华县',3,1,411622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411623,411600,'商水县',3,1,411623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411624,411600,'沈丘县',3,1,411624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411625,411600,'郸城县',3,1,411625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411626,411600,'淮阳县',3,1,411626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411627,411600,'太康县',3,1,411627,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411628,411600,'鹿邑县',3,1,411628,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411681,411600,'项城市',3,1,411681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411690,411600,'经济开发区',3,1,411690,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411700,410000,'驻马店市',2,0,411700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411702,411700,'驿城区',3,1,411702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411721,411700,'西平县',3,1,411721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411722,411700,'上蔡县',3,1,411722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411723,411700,'平舆县',3,1,411723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411724,411700,'正阳县',3,1,411724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411725,411700,'确山县',3,1,411725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411726,411700,'泌阳县',3,1,411726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411727,411700,'汝南县',3,1,411727,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411728,411700,'遂平县',3,1,411728,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (411729,411700,'新蔡县',3,1,411729,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (419000,410000,'省直辖县',2,0,419000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (419001,419000,'济源市',3,1,419001,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420000,0,'湖北省',1,0,420000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420100,420000,'武汉市',2,0,420100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420102,420100,'江岸区',3,1,420102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420103,420100,'江汉区',3,1,420103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420104,420100,'硚口区',3,1,420104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420105,420100,'汉阳区',3,1,420105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420106,420100,'武昌区',3,1,420106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420107,420100,'青山区',3,1,420107,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420111,420100,'洪山区',3,1,420111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420112,420100,'东西湖区',3,1,420112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420113,420100,'汉南区',3,1,420113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420114,420100,'蔡甸区',3,1,420114,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420115,420100,'江夏区',3,1,420115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420116,420100,'黄陂区',3,1,420116,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420117,420100,'新洲区',3,1,420117,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420200,420000,'黄石市',2,0,420200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420202,420200,'黄石港区',3,1,420202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420203,420200,'西塞山区',3,1,420203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420204,420200,'下陆区',3,1,420204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420205,420200,'铁山区',3,1,420205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420222,420200,'阳新县',3,1,420222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420281,420200,'大冶市',3,1,420281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420300,420000,'十堰市',2,0,420300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420302,420300,'茅箭区',3,1,420302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420303,420300,'张湾区',3,1,420303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420304,420300,'郧阳区',3,1,420304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420322,420300,'郧西县',3,1,420322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420323,420300,'竹山县',3,1,420323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420324,420300,'竹溪县',3,1,420324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420325,420300,'房县',3,1,420325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420381,420300,'丹江口市',3,1,420381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420500,420000,'宜昌市',2,0,420500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420502,420500,'西陵区',3,1,420502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420503,420500,'伍家岗区',3,1,420503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420504,420500,'点军区',3,1,420504,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420505,420500,'猇亭区',3,1,420505,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420506,420500,'夷陵区',3,1,420506,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420525,420500,'远安县',3,1,420525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420526,420500,'兴山县',3,1,420526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420527,420500,'秭归县',3,1,420527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420528,420500,'长阳土家族自治县',3,1,420528,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420529,420500,'五峰土家族自治县',3,1,420529,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420581,420500,'宜都市',3,1,420581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420582,420500,'当阳市',3,1,420582,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420583,420500,'枝江市',3,1,420583,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420590,420500,'经济开发区',3,1,420590,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420600,420000,'襄阳市',2,0,420600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420602,420600,'襄城区',3,1,420602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420606,420600,'樊城区',3,1,420606,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420607,420600,'襄州区',3,1,420607,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420624,420600,'南漳县',3,1,420624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420625,420600,'谷城县',3,1,420625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420626,420600,'保康县',3,1,420626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420682,420600,'老河口市',3,1,420682,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420683,420600,'枣阳市',3,1,420683,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420684,420600,'宜城市',3,1,420684,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420700,420000,'鄂州市',2,0,420700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420702,420700,'梁子湖区',3,1,420702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420703,420700,'华容区',3,1,420703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420704,420700,'鄂城区',3,1,420704,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420800,420000,'荆门市',2,0,420800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420802,420800,'东宝区',3,1,420802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420804,420800,'掇刀区',3,1,420804,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420822,420800,'沙洋县',3,1,420822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420881,420800,'钟祥市',3,1,420881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420882,420800,'京山市',3,1,420882,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420900,420000,'孝感市',2,0,420900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420902,420900,'孝南区',3,1,420902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420921,420900,'孝昌县',3,1,420921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420922,420900,'大悟县',3,1,420922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420923,420900,'云梦县',3,1,420923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420981,420900,'应城市',3,1,420981,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420982,420900,'安陆市',3,1,420982,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (420984,420900,'汉川市',3,1,420984,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421000,420000,'荆州市',2,0,421000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421002,421000,'沙市区',3,1,421002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421003,421000,'荆州区',3,1,421003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421022,421000,'公安县',3,1,421022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421023,421000,'监利县',3,1,421023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421024,421000,'江陵县',3,1,421024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421081,421000,'石首市',3,1,421081,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421083,421000,'洪湖市',3,1,421083,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421087,421000,'松滋市',3,1,421087,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421100,420000,'黄冈市',2,0,421100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421102,421100,'黄州区',3,1,421102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421121,421100,'团风县',3,1,421121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421122,421100,'红安县',3,1,421122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421123,421100,'罗田县',3,1,421123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421124,421100,'英山县',3,1,421124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421125,421100,'浠水县',3,1,421125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421126,421100,'蕲春县',3,1,421126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421127,421100,'黄梅县',3,1,421127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421181,421100,'麻城市',3,1,421181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421182,421100,'武穴市',3,1,421182,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421200,420000,'咸宁市',2,0,421200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421202,421200,'咸安区',3,1,421202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421221,421200,'嘉鱼县',3,1,421221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421222,421200,'通城县',3,1,421222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421223,421200,'崇阳县',3,1,421223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421224,421200,'通山县',3,1,421224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421281,421200,'赤壁市',3,1,421281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421300,420000,'随州市',2,0,421300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421303,421300,'曾都区',3,1,421303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421321,421300,'随县',3,1,421321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (421381,421300,'广水市',3,1,421381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (422800,420000,'恩施土家族苗族自治州',2,0,422800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (422801,422800,'恩施市',3,1,422801,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (422802,422800,'利川市',3,1,422802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (422822,422800,'建始县',3,1,422822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (422823,422800,'巴东县',3,1,422823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (422825,422800,'宣恩县',3,1,422825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (422826,422800,'咸丰县',3,1,422826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (422827,422800,'来凤县',3,1,422827,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (422828,422800,'鹤峰县',3,1,422828,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (429000,420000,'省直辖县',2,0,429000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (429004,429000,'仙桃市',3,1,429004,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (429005,429000,'潜江市',3,1,429005,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (429006,429000,'天门市',3,1,429006,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (429021,429000,'神农架林区',3,1,429021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430000,0,'湖南省',1,0,430000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430100,430000,'长沙市',2,0,430100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430102,430100,'芙蓉区',3,1,430102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430103,430100,'天心区',3,1,430103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430104,430100,'岳麓区',3,1,430104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430105,430100,'开福区',3,1,430105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430111,430100,'雨花区',3,1,430111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430112,430100,'望城区',3,1,430112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430121,430100,'长沙县',3,1,430121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430181,430100,'浏阳市',3,1,430181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430182,430100,'宁乡市',3,1,430182,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430200,430000,'株洲市',2,0,430200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430202,430200,'荷塘区',3,1,430202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430203,430200,'芦淞区',3,1,430203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430204,430200,'石峰区',3,1,430204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430211,430200,'天元区',3,1,430211,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430212,430200,'渌口区',3,1,430212,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430223,430200,'攸县',3,1,430223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430224,430200,'茶陵县',3,1,430224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430225,430200,'炎陵县',3,1,430225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430281,430200,'醴陵市',3,1,430281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430300,430000,'湘潭市',2,0,430300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430302,430300,'雨湖区',3,1,430302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430304,430300,'岳塘区',3,1,430304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430321,430300,'湘潭县',3,1,430321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430381,430300,'湘乡市',3,1,430381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430382,430300,'韶山市',3,1,430382,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430400,430000,'衡阳市',2,0,430400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430405,430400,'珠晖区',3,1,430405,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430406,430400,'雁峰区',3,1,430406,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430407,430400,'石鼓区',3,1,430407,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430408,430400,'蒸湘区',3,1,430408,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430412,430400,'南岳区',3,1,430412,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430421,430400,'衡阳县',3,1,430421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430422,430400,'衡南县',3,1,430422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430423,430400,'衡山县',3,1,430423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430424,430400,'衡东县',3,1,430424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430426,430400,'祁东县',3,1,430426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430481,430400,'耒阳市',3,1,430481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430482,430400,'常宁市',3,1,430482,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430500,430000,'邵阳市',2,0,430500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430502,430500,'双清区',3,1,430502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430503,430500,'大祥区',3,1,430503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430511,430500,'北塔区',3,1,430511,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430521,430500,'邵东县',3,1,430521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430522,430500,'新邵县',3,1,430522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430523,430500,'邵阳县',3,1,430523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430524,430500,'隆回县',3,1,430524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430525,430500,'洞口县',3,1,430525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430527,430500,'绥宁县',3,1,430527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430528,430500,'新宁县',3,1,430528,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430529,430500,'城步苗族自治县',3,1,430529,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430581,430500,'武冈市',3,1,430581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430600,430000,'岳阳市',2,0,430600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430602,430600,'岳阳楼区',3,1,430602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430603,430600,'云溪区',3,1,430603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430611,430600,'君山区',3,1,430611,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430621,430600,'岳阳县',3,1,430621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430623,430600,'华容县',3,1,430623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430624,430600,'湘阴县',3,1,430624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430626,430600,'平江县',3,1,430626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430681,430600,'汨罗市',3,1,430681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430682,430600,'临湘市',3,1,430682,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430700,430000,'常德市',2,0,430700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430702,430700,'武陵区',3,1,430702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430703,430700,'鼎城区',3,1,430703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430721,430700,'安乡县',3,1,430721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430722,430700,'汉寿县',3,1,430722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430723,430700,'澧县',3,1,430723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430724,430700,'临澧县',3,1,430724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430725,430700,'桃源县',3,1,430725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430726,430700,'石门县',3,1,430726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430781,430700,'津市市',3,1,430781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430800,430000,'张家界市',2,0,430800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430802,430800,'永定区',3,1,430802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430811,430800,'武陵源区',3,1,430811,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430821,430800,'慈利县',3,1,430821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430822,430800,'桑植县',3,1,430822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430900,430000,'益阳市',2,0,430900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430902,430900,'资阳区',3,1,430902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430903,430900,'赫山区',3,1,430903,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430921,430900,'南县',3,1,430921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430922,430900,'桃江县',3,1,430922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430923,430900,'安化县',3,1,430923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (430981,430900,'沅江市',3,1,430981,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431000,430000,'郴州市',2,0,431000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431002,431000,'北湖区',3,1,431002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431003,431000,'苏仙区',3,1,431003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431021,431000,'桂阳县',3,1,431021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431022,431000,'宜章县',3,1,431022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431023,431000,'永兴县',3,1,431023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431024,431000,'嘉禾县',3,1,431024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431025,431000,'临武县',3,1,431025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431026,431000,'汝城县',3,1,431026,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431027,431000,'桂东县',3,1,431027,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431028,431000,'安仁县',3,1,431028,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431081,431000,'资兴市',3,1,431081,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431100,430000,'永州市',2,0,431100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431102,431100,'零陵区',3,1,431102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431103,431100,'冷水滩区',3,1,431103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431121,431100,'祁阳县',3,1,431121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431122,431100,'东安县',3,1,431122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431123,431100,'双牌县',3,1,431123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431124,431100,'道县',3,1,431124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431125,431100,'江永县',3,1,431125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431126,431100,'宁远县',3,1,431126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431127,431100,'蓝山县',3,1,431127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431128,431100,'新田县',3,1,431128,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431129,431100,'江华瑶族自治县',3,1,431129,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431200,430000,'怀化市',2,0,431200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431202,431200,'鹤城区',3,1,431202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431221,431200,'中方县',3,1,431221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431222,431200,'沅陵县',3,1,431222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431223,431200,'辰溪县',3,1,431223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431224,431200,'溆浦县',3,1,431224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431225,431200,'会同县',3,1,431225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431226,431200,'麻阳苗族自治县',3,1,431226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431227,431200,'新晃侗族自治县',3,1,431227,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431228,431200,'芷江侗族自治县',3,1,431228,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431229,431200,'靖州苗族侗族自治县',3,1,431229,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431230,431200,'通道侗族自治县',3,1,431230,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431281,431200,'洪江市',3,1,431281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431300,430000,'娄底市',2,0,431300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431302,431300,'娄星区',3,1,431302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431321,431300,'双峰县',3,1,431321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431322,431300,'新化县',3,1,431322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431381,431300,'冷水江市',3,1,431381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (431382,431300,'涟源市',3,1,431382,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (433100,430000,'湘西土家族苗族自治州',2,0,433100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (433101,433100,'吉首市',3,1,433101,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (433122,433100,'泸溪县',3,1,433122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (433123,433100,'凤凰县',3,1,433123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (433124,433100,'花垣县',3,1,433124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (433125,433100,'保靖县',3,1,433125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (433126,433100,'古丈县',3,1,433126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (433127,433100,'永顺县',3,1,433127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (433130,433100,'龙山县',3,1,433130,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440000,0,'广东省',1,0,440000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440100,440000,'广州市',2,0,440100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440103,440100,'荔湾区',3,1,440103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440104,440100,'越秀区',3,1,440104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440105,440100,'海珠区',3,1,440105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440106,440100,'天河区',3,1,440106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440111,440100,'白云区',3,1,440111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440112,440100,'黄埔区',3,1,440112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440113,440100,'番禺区',3,1,440113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440114,440100,'花都区',3,1,440114,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440115,440100,'南沙区',3,1,440115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440117,440100,'从化区',3,1,440117,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440118,440100,'增城区',3,1,440118,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440200,440000,'韶关市',2,0,440200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440203,440200,'武江区',3,1,440203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440204,440200,'浈江区',3,1,440204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440205,440200,'曲江区',3,1,440205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440222,440200,'始兴县',3,1,440222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440224,440200,'仁化县',3,1,440224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440229,440200,'翁源县',3,1,440229,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440232,440200,'乳源瑶族自治县',3,1,440232,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440233,440200,'新丰县',3,1,440233,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440281,440200,'乐昌市',3,1,440281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440282,440200,'南雄市',3,1,440282,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440300,440000,'深圳市',2,0,440300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440303,440300,'罗湖区',3,1,440303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440304,440300,'福田区',3,1,440304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440305,440300,'南山区',3,1,440305,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440306,440300,'宝安区',3,1,440306,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440307,440300,'龙岗区',3,1,440307,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440308,440300,'盐田区',3,1,440308,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440309,440300,'龙华区',3,1,440309,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440310,440300,'坪山区',3,1,440310,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440311,440300,'光明区',3,1,440311,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440400,440000,'珠海市',2,0,440400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440402,440400,'香洲区',3,1,440402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440403,440400,'斗门区',3,1,440403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440404,440400,'金湾区',3,1,440404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440500,440000,'汕头市',2,0,440500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440507,440500,'龙湖区',3,1,440507,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440511,440500,'金平区',3,1,440511,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440512,440500,'濠江区',3,1,440512,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440513,440500,'潮阳区',3,1,440513,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440514,440500,'潮南区',3,1,440514,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440515,440500,'澄海区',3,1,440515,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440523,440500,'南澳县',3,1,440523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440600,440000,'佛山市',2,0,440600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440604,440600,'禅城区',3,1,440604,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440605,440600,'南海区',3,1,440605,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440606,440600,'顺德区',3,1,440606,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440607,440600,'三水区',3,1,440607,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440608,440600,'高明区',3,1,440608,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440700,440000,'江门市',2,0,440700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440703,440700,'蓬江区',3,1,440703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440704,440700,'江海区',3,1,440704,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440705,440700,'新会区',3,1,440705,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440781,440700,'台山市',3,1,440781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440783,440700,'开平市',3,1,440783,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440784,440700,'鹤山市',3,1,440784,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440785,440700,'恩平市',3,1,440785,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440800,440000,'湛江市',2,0,440800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440802,440800,'赤坎区',3,1,440802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440803,440800,'霞山区',3,1,440803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440804,440800,'坡头区',3,1,440804,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440811,440800,'麻章区',3,1,440811,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440823,440800,'遂溪县',3,1,440823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440825,440800,'徐闻县',3,1,440825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440881,440800,'廉江市',3,1,440881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440882,440800,'雷州市',3,1,440882,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440883,440800,'吴川市',3,1,440883,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440890,440800,'经济技术开发区',3,1,440890,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440900,440000,'茂名市',2,0,440900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440902,440900,'茂南区',3,1,440902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440904,440900,'电白区',3,1,440904,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440981,440900,'高州市',3,1,440981,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440982,440900,'化州市',3,1,440982,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (440983,440900,'信宜市',3,1,440983,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441200,440000,'肇庆市',2,0,441200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441202,441200,'端州区',3,1,441202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441203,441200,'鼎湖区',3,1,441203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441204,441200,'高要区',3,1,441204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441223,441200,'广宁县',3,1,441223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441224,441200,'怀集县',3,1,441224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441225,441200,'封开县',3,1,441225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441226,441200,'德庆县',3,1,441226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441284,441200,'四会市',3,1,441284,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441300,440000,'惠州市',2,0,441300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441302,441300,'惠城区',3,1,441302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441303,441300,'惠阳区',3,1,441303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441322,441300,'博罗县',3,1,441322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441323,441300,'惠东县',3,1,441323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441324,441300,'龙门县',3,1,441324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441400,440000,'梅州市',2,0,441400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441402,441400,'梅江区',3,1,441402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441403,441400,'梅县区',3,1,441403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441422,441400,'大埔县',3,1,441422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441423,441400,'丰顺县',3,1,441423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441424,441400,'五华县',3,1,441424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441426,441400,'平远县',3,1,441426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441427,441400,'蕉岭县',3,1,441427,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441481,441400,'兴宁市',3,1,441481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441500,440000,'汕尾市',2,0,441500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441502,441500,'城区',3,1,441502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441521,441500,'海丰县',3,1,441521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441523,441500,'陆河县',3,1,441523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441581,441500,'陆丰市',3,1,441581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441600,440000,'河源市',2,0,441600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441602,441600,'源城区',3,1,441602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441621,441600,'紫金县',3,1,441621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441622,441600,'龙川县',3,1,441622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441623,441600,'连平县',3,1,441623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441624,441600,'和平县',3,1,441624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441625,441600,'东源县',3,1,441625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441700,440000,'阳江市',2,0,441700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441702,441700,'江城区',3,1,441702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441704,441700,'阳东区',3,1,441704,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441721,441700,'阳西县',3,1,441721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441781,441700,'阳春市',3,1,441781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441800,440000,'清远市',2,0,441800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441802,441800,'清城区',3,1,441802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441803,441800,'清新区',3,1,441803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441821,441800,'佛冈县',3,1,441821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441823,441800,'阳山县',3,1,441823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441825,441800,'连山壮族瑶族自治县',3,1,441825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441826,441800,'连南瑶族自治县',3,1,441826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441881,441800,'英德市',3,1,441881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441882,441800,'连州市',3,1,441882,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441900,440000,'东莞市',2,0,441900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441901,441900,'中堂镇',3,1,441901,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441903,441900,'南城街道办事处',3,1,441903,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441904,441900,'长安镇',3,1,441904,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441905,441900,'东坑镇',3,1,441905,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441906,441900,'樟木头镇',3,1,441906,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441907,441900,'莞城街道办事处',3,1,441907,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441908,441900,'石龙镇',3,1,441908,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441909,441900,'桥头镇',3,1,441909,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441910,441900,'万江街道办事处',3,1,441910,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441911,441900,'麻涌镇',3,1,441911,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441912,441900,'虎门镇',3,1,441912,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441913,441900,'谢岗镇',3,1,441913,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441914,441900,'石碣镇',3,1,441914,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441915,441900,'茶山镇',3,1,441915,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441916,441900,'东城街道办事处',3,1,441916,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441917,441900,'洪梅镇',3,1,441917,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441918,441900,'道滘镇',3,1,441918,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441919,441900,'高埗镇',3,1,441919,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441920,441900,'企石镇',3,1,441920,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441921,441900,'凤岗镇',3,1,441921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441922,441900,'大岭山镇',3,1,441922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441923,441900,'松山湖管委会',3,1,441923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441924,441900,'清溪镇',3,1,441924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441925,441900,'望牛墩镇',3,1,441925,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441926,441900,'厚街镇',3,1,441926,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441927,441900,'常平镇',3,1,441927,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441928,441900,'寮步镇',3,1,441928,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441929,441900,'石排镇',3,1,441929,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441930,441900,'横沥镇',3,1,441930,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441931,441900,'塘厦镇',3,1,441931,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441932,441900,'黄江镇',3,1,441932,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441933,441900,'大朗镇',3,1,441933,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441934,441900,'东莞港',3,1,441934,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441935,441900,'东莞生态园',3,1,441935,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (441990,441900,'沙田镇',3,1,441990,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442000,440000,'中山市',2,0,442000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442001,442000,'南头镇',3,1,442001,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442002,442000,'神湾镇',3,1,442002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442003,442000,'东凤镇',3,1,442003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442004,442000,'五桂山街道办事处',3,1,442004,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442005,442000,'黄圃镇',3,1,442005,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442006,442000,'小榄镇',3,1,442006,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442007,442000,'石岐区街道办事处',3,1,442007,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442008,442000,'横栏镇',3,1,442008,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442009,442000,'三角镇',3,1,442009,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442010,442000,'三乡镇',3,1,442010,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442011,442000,'港口镇',3,1,442011,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442012,442000,'沙溪镇',3,1,442012,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442013,442000,'板芙镇',3,1,442013,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442015,442000,'东升镇',3,1,442015,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442016,442000,'阜沙镇',3,1,442016,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442017,442000,'民众镇',3,1,442017,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442018,442000,'东区街道办事处',3,1,442018,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442019,442000,'火炬开发区街道办事处',3,1,442019,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442020,442000,'西区街道办事处',3,1,442020,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442021,442000,'南区街道办事处',3,1,442021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442022,442000,'古镇镇',3,1,442022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442023,442000,'坦洲镇',3,1,442023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442024,442000,'大涌镇',3,1,442024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (442025,442000,'南朗镇',3,1,442025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445100,440000,'潮州市',2,0,445100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445102,445100,'湘桥区',3,1,445102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445103,445100,'潮安区',3,1,445103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445122,445100,'饶平县',3,1,445122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445200,440000,'揭阳市',2,0,445200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445202,445200,'榕城区',3,1,445202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445203,445200,'揭东区',3,1,445203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445222,445200,'揭西县',3,1,445222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445224,445200,'惠来县',3,1,445224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445281,445200,'普宁市',3,1,445281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445300,440000,'云浮市',2,0,445300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445302,445300,'云城区',3,1,445302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445303,445300,'云安区',3,1,445303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445321,445300,'新兴县',3,1,445321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445322,445300,'郁南县',3,1,445322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (445381,445300,'罗定市',3,1,445381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450000,0,'广西壮族自治区',1,0,450000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450100,450000,'南宁市',2,0,450100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450102,450100,'兴宁区',3,1,450102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450103,450100,'青秀区',3,1,450103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450105,450100,'江南区',3,1,450105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450107,450100,'西乡塘区',3,1,450107,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450108,450100,'良庆区',3,1,450108,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450109,450100,'邕宁区',3,1,450109,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450110,450100,'武鸣区',3,1,450110,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450123,450100,'隆安县',3,1,450123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450124,450100,'马山县',3,1,450124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450125,450100,'上林县',3,1,450125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450126,450100,'宾阳县',3,1,450126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450127,450100,'横县',3,1,450127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450200,450000,'柳州市',2,0,450200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450202,450200,'城中区',3,1,450202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450203,450200,'鱼峰区',3,1,450203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450204,450200,'柳南区',3,1,450204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450205,450200,'柳北区',3,1,450205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450206,450200,'柳江区',3,1,450206,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450222,450200,'柳城县',3,1,450222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450223,450200,'鹿寨县',3,1,450223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450224,450200,'融安县',3,1,450224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450225,450200,'融水苗族自治县',3,1,450225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450226,450200,'三江侗族自治县',3,1,450226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450300,450000,'桂林市',2,0,450300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450302,450300,'秀峰区',3,1,450302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450303,450300,'叠彩区',3,1,450303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450304,450300,'象山区',3,1,450304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450305,450300,'七星区',3,1,450305,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450311,450300,'雁山区',3,1,450311,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450312,450300,'临桂区',3,1,450312,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450321,450300,'阳朔县',3,1,450321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450323,450300,'灵川县',3,1,450323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450324,450300,'全州县',3,1,450324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450325,450300,'兴安县',3,1,450325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450326,450300,'永福县',3,1,450326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450327,450300,'灌阳县',3,1,450327,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450328,450300,'龙胜各族自治县',3,1,450328,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450329,450300,'资源县',3,1,450329,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450330,450300,'平乐县',3,1,450330,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450332,450300,'恭城瑶族自治县',3,1,450332,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450381,450300,'荔浦市',3,1,450381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450400,450000,'梧州市',2,0,450400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450403,450400,'万秀区',3,1,450403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450405,450400,'长洲区',3,1,450405,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450406,450400,'龙圩区',3,1,450406,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450421,450400,'苍梧县',3,1,450421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450422,450400,'藤县',3,1,450422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450423,450400,'蒙山县',3,1,450423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450481,450400,'岑溪市',3,1,450481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450500,450000,'北海市',2,0,450500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450502,450500,'海城区',3,1,450502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450503,450500,'银海区',3,1,450503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450512,450500,'铁山港区',3,1,450512,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450521,450500,'合浦县',3,1,450521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450600,450000,'防城港市',2,0,450600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450602,450600,'港口区',3,1,450602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450603,450600,'防城区',3,1,450603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450621,450600,'上思县',3,1,450621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450681,450600,'东兴市',3,1,450681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450700,450000,'钦州市',2,0,450700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450702,450700,'钦南区',3,1,450702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450703,450700,'钦北区',3,1,450703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450721,450700,'灵山县',3,1,450721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450722,450700,'浦北县',3,1,450722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450800,450000,'贵港市',2,0,450800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450802,450800,'港北区',3,1,450802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450803,450800,'港南区',3,1,450803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450804,450800,'覃塘区',3,1,450804,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450821,450800,'平南县',3,1,450821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450881,450800,'桂平市',3,1,450881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450900,450000,'玉林市',2,0,450900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450902,450900,'玉州区',3,1,450902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450903,450900,'福绵区',3,1,450903,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450921,450900,'容县',3,1,450921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450922,450900,'陆川县',3,1,450922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450923,450900,'博白县',3,1,450923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450924,450900,'兴业县',3,1,450924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (450981,450900,'北流市',3,1,450981,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451000,450000,'百色市',2,0,451000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451002,451000,'右江区',3,1,451002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451021,451000,'田阳县',3,1,451021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451022,451000,'田东县',3,1,451022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451023,451000,'平果县',3,1,451023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451024,451000,'德保县',3,1,451024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451026,451000,'那坡县',3,1,451026,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451027,451000,'凌云县',3,1,451027,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451028,451000,'乐业县',3,1,451028,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451029,451000,'田林县',3,1,451029,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451030,451000,'西林县',3,1,451030,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451031,451000,'隆林各族自治县',3,1,451031,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451081,451000,'靖西市',3,1,451081,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451100,450000,'贺州市',2,0,451100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451102,451100,'八步区',3,1,451102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451103,451100,'平桂区',3,1,451103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451121,451100,'昭平县',3,1,451121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451122,451100,'钟山县',3,1,451122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451123,451100,'富川瑶族自治县',3,1,451123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451200,450000,'河池市',2,0,451200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451202,451200,'金城江区',3,1,451202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451203,451200,'宜州区',3,1,451203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451221,451200,'南丹县',3,1,451221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451222,451200,'天峨县',3,1,451222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451223,451200,'凤山县',3,1,451223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451224,451200,'东兰县',3,1,451224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451225,451200,'罗城仫佬族自治县',3,1,451225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451226,451200,'环江毛南族自治县',3,1,451226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451227,451200,'巴马瑶族自治县',3,1,451227,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451228,451200,'都安瑶族自治县',3,1,451228,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451229,451200,'大化瑶族自治县',3,1,451229,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451300,450000,'来宾市',2,0,451300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451302,451300,'兴宾区',3,1,451302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451321,451300,'忻城县',3,1,451321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451322,451300,'象州县',3,1,451322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451323,451300,'武宣县',3,1,451323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451324,451300,'金秀瑶族自治县',3,1,451324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451381,451300,'合山市',3,1,451381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451400,450000,'崇左市',2,0,451400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451402,451400,'江州区',3,1,451402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451421,451400,'扶绥县',3,1,451421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451422,451400,'宁明县',3,1,451422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451423,451400,'龙州县',3,1,451423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451424,451400,'大新县',3,1,451424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451425,451400,'天等县',3,1,451425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (451481,451400,'凭祥市',3,1,451481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460000,0,'海南省',1,0,460000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460100,460000,'海口市',2,0,460100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460105,460100,'秀英区',3,1,460105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460106,460100,'龙华区',3,1,460106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460107,460100,'琼山区',3,1,460107,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460108,460100,'美兰区',3,1,460108,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460200,460000,'三亚市',2,0,460200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460202,460200,'海棠区',3,1,460202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460203,460200,'吉阳区',3,1,460203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460204,460200,'天涯区',3,1,460204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460205,460200,'崖州区',3,1,460205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460300,460000,'三沙市',2,0,460300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460321,460300,'西沙群岛',3,1,460321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460322,460300,'南沙群岛',3,1,460322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460323,460300,'中沙群岛的岛礁及其海域',3,1,460323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460400,460000,'儋州市',2,0,460400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460401,460400,'那大镇',3,1,460401,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460402,460400,'和庆镇',3,1,460402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460403,460400,'南丰镇',3,1,460403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460404,460400,'大成镇',3,1,460404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460405,460400,'雅星镇',3,1,460405,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460406,460400,'兰洋镇',3,1,460406,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460407,460400,'光村镇',3,1,460407,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460408,460400,'木棠镇',3,1,460408,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460409,460400,'海头镇',3,1,460409,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460410,460400,'峨蔓镇',3,1,460410,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460411,460400,'王五镇',3,1,460411,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460412,460400,'白马井镇',3,1,460412,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460413,460400,'中和镇',3,1,460413,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460414,460400,'排浦镇',3,1,460414,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460415,460400,'东成镇',3,1,460415,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460416,460400,'新州镇',3,1,460416,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460417,460400,'洋浦经济开发区',3,1,460417,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (460418,460400,'华南热作学院',3,1,460418,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469000,460000,'省直辖县',2,0,469000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469001,469000,'五指山市',3,1,469001,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469002,469000,'琼海市',3,1,469002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469005,469000,'文昌市',3,1,469005,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469006,469000,'万宁市',3,1,469006,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469007,469000,'东方市',3,1,469007,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469021,469000,'定安县',3,1,469021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469022,469000,'屯昌县',3,1,469022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469023,469000,'澄迈县',3,1,469023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469024,469000,'临高县',3,1,469024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469025,469000,'白沙黎族自治县',3,1,469025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469026,469000,'昌江黎族自治县',3,1,469026,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469027,469000,'乐东黎族自治县',3,1,469027,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469028,469000,'陵水黎族自治县',3,1,469028,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469029,469000,'保亭黎族苗族自治县',3,1,469029,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (469030,469000,'琼中黎族苗族自治县',3,1,469030,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500000,0,'重庆市',1,0,500000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500100,500000,'重庆市',2,0,500100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500101,500100,'万州区',3,1,500101,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500102,500100,'涪陵区',3,1,500102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500103,500100,'渝中区',3,1,500103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500104,500100,'大渡口区',3,1,500104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500105,500100,'江北区',3,1,500105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500106,500100,'沙坪坝区',3,1,500106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500107,500100,'九龙坡区',3,1,500107,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500108,500100,'南岸区',3,1,500108,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500109,500100,'北碚区',3,1,500109,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500110,500100,'綦江区',3,1,500110,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500111,500100,'大足区',3,1,500111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500112,500100,'渝北区',3,1,500112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500113,500100,'巴南区',3,1,500113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500114,500100,'黔江区',3,1,500114,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500115,500100,'长寿区',3,1,500115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500116,500100,'江津区',3,1,500116,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500117,500100,'合川区',3,1,500117,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500118,500100,'永川区',3,1,500118,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500119,500100,'南川区',3,1,500119,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500120,500100,'璧山区',3,1,500120,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500151,500100,'铜梁区',3,1,500151,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500152,500100,'潼南区',3,1,500152,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500153,500100,'荣昌区',3,1,500153,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500154,500100,'开州区',3,1,500154,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500155,500100,'梁平区',3,1,500155,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500156,500100,'武隆区',3,1,500156,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500200,500000,'县',2,0,500200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500229,500200,'城口县',3,1,500229,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500230,500200,'丰都县',3,1,500230,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500231,500200,'垫江县',3,1,500231,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500233,500200,'忠县',3,1,500233,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500235,500200,'云阳县',3,1,500235,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500236,500200,'奉节县',3,1,500236,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500237,500200,'巫山县',3,1,500237,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500238,500200,'巫溪县',3,1,500238,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500240,500200,'石柱土家族自治县',3,1,500240,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500241,500200,'秀山土家族苗族自治县',3,1,500241,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500242,500200,'酉阳土家族苗族自治县',3,1,500242,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (500243,500200,'彭水苗族土家族自治县',3,1,500243,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510000,0,'四川省',1,0,510000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510100,510000,'成都市',2,0,510100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510104,510100,'锦江区',3,1,510104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510105,510100,'青羊区',3,1,510105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510106,510100,'金牛区',3,1,510106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510107,510100,'武侯区',3,1,510107,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510108,510100,'成华区',3,1,510108,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510112,510100,'龙泉驿区',3,1,510112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510113,510100,'青白江区',3,1,510113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510114,510100,'新都区',3,1,510114,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510115,510100,'温江区',3,1,510115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510116,510100,'双流区',3,1,510116,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510117,510100,'郫都区',3,1,510117,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510121,510100,'金堂县',3,1,510121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510129,510100,'大邑县',3,1,510129,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510131,510100,'蒲江县',3,1,510131,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510132,510100,'新津县',3,1,510132,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510181,510100,'都江堰市',3,1,510181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510182,510100,'彭州市',3,1,510182,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510183,510100,'邛崃市',3,1,510183,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510184,510100,'崇州市',3,1,510184,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510185,510100,'简阳市',3,1,510185,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510191,510100,'高新区',3,1,510191,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510300,510000,'自贡市',2,0,510300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510302,510300,'自流井区',3,1,510302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510303,510300,'贡井区',3,1,510303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510304,510300,'大安区',3,1,510304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510311,510300,'沿滩区',3,1,510311,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510321,510300,'荣县',3,1,510321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510322,510300,'富顺县',3,1,510322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510400,510000,'攀枝花市',2,0,510400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510402,510400,'东区',3,1,510402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510403,510400,'西区',3,1,510403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510411,510400,'仁和区',3,1,510411,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510421,510400,'米易县',3,1,510421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510422,510400,'盐边县',3,1,510422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510500,510000,'泸州市',2,0,510500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510502,510500,'江阳区',3,1,510502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510503,510500,'纳溪区',3,1,510503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510504,510500,'龙马潭区',3,1,510504,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510521,510500,'泸县',3,1,510521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510522,510500,'合江县',3,1,510522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510524,510500,'叙永县',3,1,510524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510525,510500,'古蔺县',3,1,510525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510600,510000,'德阳市',2,0,510600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510603,510600,'旌阳区',3,1,510603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510604,510600,'罗江区',3,1,510604,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510623,510600,'中江县',3,1,510623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510681,510600,'广汉市',3,1,510681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510682,510600,'什邡市',3,1,510682,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510683,510600,'绵竹市',3,1,510683,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510700,510000,'绵阳市',2,0,510700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510703,510700,'涪城区',3,1,510703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510704,510700,'游仙区',3,1,510704,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510705,510700,'安州区',3,1,510705,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510722,510700,'三台县',3,1,510722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510723,510700,'盐亭县',3,1,510723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510725,510700,'梓潼县',3,1,510725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510726,510700,'北川羌族自治县',3,1,510726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510727,510700,'平武县',3,1,510727,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510781,510700,'江油市',3,1,510781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510791,510700,'高新区',3,1,510791,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510800,510000,'广元市',2,0,510800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510802,510800,'利州区',3,1,510802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510811,510800,'昭化区',3,1,510811,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510812,510800,'朝天区',3,1,510812,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510821,510800,'旺苍县',3,1,510821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510822,510800,'青川县',3,1,510822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510823,510800,'剑阁县',3,1,510823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510824,510800,'苍溪县',3,1,510824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510900,510000,'遂宁市',2,0,510900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510903,510900,'船山区',3,1,510903,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510904,510900,'安居区',3,1,510904,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510921,510900,'蓬溪县',3,1,510921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510922,510900,'射洪县',3,1,510922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (510923,510900,'大英县',3,1,510923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511000,510000,'内江市',2,0,511000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511002,511000,'市中区',3,1,511002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511011,511000,'东兴区',3,1,511011,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511024,511000,'威远县',3,1,511024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511025,511000,'资中县',3,1,511025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511083,511000,'隆昌市',3,1,511083,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511100,510000,'乐山市',2,0,511100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511102,511100,'市中区',3,1,511102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511111,511100,'沙湾区',3,1,511111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511112,511100,'五通桥区',3,1,511112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511113,511100,'金口河区',3,1,511113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511123,511100,'犍为县',3,1,511123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511124,511100,'井研县',3,1,511124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511126,511100,'夹江县',3,1,511126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511129,511100,'沐川县',3,1,511129,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511132,511100,'峨边彝族自治县',3,1,511132,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511133,511100,'马边彝族自治县',3,1,511133,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511181,511100,'峨眉山市',3,1,511181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511300,510000,'南充市',2,0,511300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511302,511300,'顺庆区',3,1,511302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511303,511300,'高坪区',3,1,511303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511304,511300,'嘉陵区',3,1,511304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511321,511300,'南部县',3,1,511321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511322,511300,'营山县',3,1,511322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511323,511300,'蓬安县',3,1,511323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511324,511300,'仪陇县',3,1,511324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511325,511300,'西充县',3,1,511325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511381,511300,'阆中市',3,1,511381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511400,510000,'眉山市',2,0,511400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511402,511400,'东坡区',3,1,511402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511403,511400,'彭山区',3,1,511403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511421,511400,'仁寿县',3,1,511421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511423,511400,'洪雅县',3,1,511423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511424,511400,'丹棱县',3,1,511424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511425,511400,'青神县',3,1,511425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511500,510000,'宜宾市',2,0,511500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511502,511500,'翠屏区',3,1,511502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511503,511500,'南溪区',3,1,511503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511504,511500,'叙州区',3,1,511504,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511523,511500,'江安县',3,1,511523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511524,511500,'长宁县',3,1,511524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511525,511500,'高县',3,1,511525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511526,511500,'珙县',3,1,511526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511527,511500,'筠连县',3,1,511527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511528,511500,'兴文县',3,1,511528,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511529,511500,'屏山县',3,1,511529,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511600,510000,'广安市',2,0,511600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511602,511600,'广安区',3,1,511602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511603,511600,'前锋区',3,1,511603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511621,511600,'岳池县',3,1,511621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511622,511600,'武胜县',3,1,511622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511623,511600,'邻水县',3,1,511623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511681,511600,'华蓥市',3,1,511681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511700,510000,'达州市',2,0,511700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511702,511700,'通川区',3,1,511702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511703,511700,'达川区',3,1,511703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511722,511700,'宣汉县',3,1,511722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511723,511700,'开江县',3,1,511723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511724,511700,'大竹县',3,1,511724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511725,511700,'渠县',3,1,511725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511781,511700,'万源市',3,1,511781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511800,510000,'雅安市',2,0,511800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511802,511800,'雨城区',3,1,511802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511803,511800,'名山区',3,1,511803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511822,511800,'荥经县',3,1,511822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511823,511800,'汉源县',3,1,511823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511824,511800,'石棉县',3,1,511824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511825,511800,'天全县',3,1,511825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511826,511800,'芦山县',3,1,511826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511827,511800,'宝兴县',3,1,511827,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511900,510000,'巴中市',2,0,511900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511902,511900,'巴州区',3,1,511902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511903,511900,'恩阳区',3,1,511903,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511921,511900,'通江县',3,1,511921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511922,511900,'南江县',3,1,511922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (511923,511900,'平昌县',3,1,511923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (512000,510000,'资阳市',2,0,512000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (512002,512000,'雁江区',3,1,512002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (512021,512000,'安岳县',3,1,512021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (512022,512000,'乐至县',3,1,512022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513200,510000,'阿坝藏族羌族自治州',2,0,513200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513201,513200,'马尔康市',3,1,513201,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513221,513200,'汶川县',3,1,513221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513222,513200,'理县',3,1,513222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513223,513200,'茂县',3,1,513223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513224,513200,'松潘县',3,1,513224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513225,513200,'九寨沟县',3,1,513225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513226,513200,'金川县',3,1,513226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513227,513200,'小金县',3,1,513227,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513228,513200,'黑水县',3,1,513228,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513230,513200,'壤塘县',3,1,513230,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513231,513200,'阿坝县',3,1,513231,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513232,513200,'若尔盖县',3,1,513232,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513233,513200,'红原县',3,1,513233,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513300,510000,'甘孜藏族自治州',2,0,513300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513301,513300,'康定市',3,1,513301,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513322,513300,'泸定县',3,1,513322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513323,513300,'丹巴县',3,1,513323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513324,513300,'九龙县',3,1,513324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513325,513300,'雅江县',3,1,513325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513326,513300,'道孚县',3,1,513326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513327,513300,'炉霍县',3,1,513327,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513328,513300,'甘孜县',3,1,513328,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513329,513300,'新龙县',3,1,513329,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513330,513300,'德格县',3,1,513330,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513331,513300,'白玉县',3,1,513331,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513332,513300,'石渠县',3,1,513332,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513333,513300,'色达县',3,1,513333,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513334,513300,'理塘县',3,1,513334,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513335,513300,'巴塘县',3,1,513335,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513336,513300,'乡城县',3,1,513336,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513337,513300,'稻城县',3,1,513337,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513338,513300,'得荣县',3,1,513338,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513400,510000,'凉山彝族自治州',2,0,513400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513401,513400,'西昌市',3,1,513401,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513422,513400,'木里藏族自治县',3,1,513422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513423,513400,'盐源县',3,1,513423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513424,513400,'德昌县',3,1,513424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513425,513400,'会理县',3,1,513425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513426,513400,'会东县',3,1,513426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513427,513400,'宁南县',3,1,513427,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513428,513400,'普格县',3,1,513428,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513429,513400,'布拖县',3,1,513429,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513430,513400,'金阳县',3,1,513430,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513431,513400,'昭觉县',3,1,513431,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513432,513400,'喜德县',3,1,513432,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513433,513400,'冕宁县',3,1,513433,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513434,513400,'越西县',3,1,513434,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513435,513400,'甘洛县',3,1,513435,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513436,513400,'美姑县',3,1,513436,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (513437,513400,'雷波县',3,1,513437,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520000,0,'贵州省',1,0,520000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520100,520000,'贵阳市',2,0,520100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520102,520100,'南明区',3,1,520102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520103,520100,'云岩区',3,1,520103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520111,520100,'花溪区',3,1,520111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520112,520100,'乌当区',3,1,520112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520113,520100,'白云区',3,1,520113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520115,520100,'观山湖区',3,1,520115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520121,520100,'开阳县',3,1,520121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520122,520100,'息烽县',3,1,520122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520123,520100,'修文县',3,1,520123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520181,520100,'清镇市',3,1,520181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520200,520000,'六盘水市',2,0,520200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520201,520200,'钟山区',3,1,520201,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520203,520200,'六枝特区',3,1,520203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520221,520200,'水城县',3,1,520221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520281,520200,'盘州市',3,1,520281,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520300,520000,'遵义市',2,0,520300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520302,520300,'红花岗区',3,1,520302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520303,520300,'汇川区',3,1,520303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520304,520300,'播州区',3,1,520304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520322,520300,'桐梓县',3,1,520322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520323,520300,'绥阳县',3,1,520323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520324,520300,'正安县',3,1,520324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520325,520300,'道真仡佬族苗族自治县',3,1,520325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520326,520300,'务川仡佬族苗族自治县',3,1,520326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520327,520300,'凤冈县',3,1,520327,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520328,520300,'湄潭县',3,1,520328,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520329,520300,'余庆县',3,1,520329,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520330,520300,'习水县',3,1,520330,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520381,520300,'赤水市',3,1,520381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520382,520300,'仁怀市',3,1,520382,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520400,520000,'安顺市',2,0,520400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520402,520400,'西秀区',3,1,520402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520403,520400,'平坝区',3,1,520403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520422,520400,'普定县',3,1,520422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520423,520400,'镇宁布依族苗族自治县',3,1,520423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520424,520400,'关岭布依族苗族自治县',3,1,520424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520425,520400,'紫云苗族布依族自治县',3,1,520425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520500,520000,'毕节市',2,0,520500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520502,520500,'七星关区',3,1,520502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520521,520500,'大方县',3,1,520521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520522,520500,'黔西县',3,1,520522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520523,520500,'金沙县',3,1,520523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520524,520500,'织金县',3,1,520524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520525,520500,'纳雍县',3,1,520525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520526,520500,'威宁彝族回族苗族自治县',3,1,520526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520527,520500,'赫章县',3,1,520527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520600,520000,'铜仁市',2,0,520600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520602,520600,'碧江区',3,1,520602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520603,520600,'万山区',3,1,520603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520621,520600,'江口县',3,1,520621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520622,520600,'玉屏侗族自治县',3,1,520622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520623,520600,'石阡县',3,1,520623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520624,520600,'思南县',3,1,520624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520625,520600,'印江土家族苗族自治县',3,1,520625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520626,520600,'德江县',3,1,520626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520627,520600,'沿河土家族自治县',3,1,520627,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (520628,520600,'松桃苗族自治县',3,1,520628,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522300,520000,'黔西南布依族苗族自治州',2,0,522300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522301,522300,'兴义市',3,1,522301,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522302,522300,'兴仁市',3,1,522302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522323,522300,'普安县',3,1,522323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522324,522300,'晴隆县',3,1,522324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522325,522300,'贞丰县',3,1,522325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522326,522300,'望谟县',3,1,522326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522327,522300,'册亨县',3,1,522327,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522328,522300,'安龙县',3,1,522328,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522600,520000,'黔东南苗族侗族自治州',2,0,522600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522601,522600,'凯里市',3,1,522601,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522622,522600,'黄平县',3,1,522622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522623,522600,'施秉县',3,1,522623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522624,522600,'三穗县',3,1,522624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522625,522600,'镇远县',3,1,522625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522626,522600,'岑巩县',3,1,522626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522627,522600,'天柱县',3,1,522627,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522628,522600,'锦屏县',3,1,522628,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522629,522600,'剑河县',3,1,522629,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522630,522600,'台江县',3,1,522630,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522631,522600,'黎平县',3,1,522631,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522632,522600,'榕江县',3,1,522632,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522633,522600,'从江县',3,1,522633,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522634,522600,'雷山县',3,1,522634,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522635,522600,'麻江县',3,1,522635,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522636,522600,'丹寨县',3,1,522636,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522700,520000,'黔南布依族苗族自治州',2,0,522700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522701,522700,'都匀市',3,1,522701,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522702,522700,'福泉市',3,1,522702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522722,522700,'荔波县',3,1,522722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522723,522700,'贵定县',3,1,522723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522725,522700,'瓮安县',3,1,522725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522726,522700,'独山县',3,1,522726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522727,522700,'平塘县',3,1,522727,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522728,522700,'罗甸县',3,1,522728,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522729,522700,'长顺县',3,1,522729,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522730,522700,'龙里县',3,1,522730,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522731,522700,'惠水县',3,1,522731,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (522732,522700,'三都水族自治县',3,1,522732,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530000,0,'云南省',1,0,530000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530100,530000,'昆明市',2,0,530100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530102,530100,'五华区',3,1,530102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530103,530100,'盘龙区',3,1,530103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530111,530100,'官渡区',3,1,530111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530112,530100,'西山区',3,1,530112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530113,530100,'东川区',3,1,530113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530114,530100,'呈贡区',3,1,530114,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530115,530100,'晋宁区',3,1,530115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530124,530100,'富民县',3,1,530124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530125,530100,'宜良县',3,1,530125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530126,530100,'石林彝族自治县',3,1,530126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530127,530100,'嵩明县',3,1,530127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530128,530100,'禄劝彝族苗族自治县',3,1,530128,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530129,530100,'寻甸回族彝族自治县',3,1,530129,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530181,530100,'安宁市',3,1,530181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530300,530000,'曲靖市',2,0,530300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530302,530300,'麒麟区',3,1,530302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530303,530300,'沾益区',3,1,530303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530304,530300,'马龙区',3,1,530304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530322,530300,'陆良县',3,1,530322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530323,530300,'师宗县',3,1,530323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530324,530300,'罗平县',3,1,530324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530325,530300,'富源县',3,1,530325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530326,530300,'会泽县',3,1,530326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530381,530300,'宣威市',3,1,530381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530400,530000,'玉溪市',2,0,530400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530402,530400,'红塔区',3,1,530402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530403,530400,'江川区',3,1,530403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530422,530400,'澄江县',3,1,530422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530423,530400,'通海县',3,1,530423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530424,530400,'华宁县',3,1,530424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530425,530400,'易门县',3,1,530425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530426,530400,'峨山彝族自治县',3,1,530426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530427,530400,'新平彝族傣族自治县',3,1,530427,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530428,530400,'元江哈尼族彝族傣族自治县',3,1,530428,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530500,530000,'保山市',2,0,530500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530502,530500,'隆阳区',3,1,530502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530521,530500,'施甸县',3,1,530521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530523,530500,'龙陵县',3,1,530523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530524,530500,'昌宁县',3,1,530524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530581,530500,'腾冲市',3,1,530581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530600,530000,'昭通市',2,0,530600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530602,530600,'昭阳区',3,1,530602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530621,530600,'鲁甸县',3,1,530621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530622,530600,'巧家县',3,1,530622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530623,530600,'盐津县',3,1,530623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530624,530600,'大关县',3,1,530624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530625,530600,'永善县',3,1,530625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530626,530600,'绥江县',3,1,530626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530627,530600,'镇雄县',3,1,530627,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530628,530600,'彝良县',3,1,530628,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530629,530600,'威信县',3,1,530629,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530681,530600,'水富市',3,1,530681,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530700,530000,'丽江市',2,0,530700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530702,530700,'古城区',3,1,530702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530721,530700,'玉龙纳西族自治县',3,1,530721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530722,530700,'永胜县',3,1,530722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530723,530700,'华坪县',3,1,530723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530724,530700,'宁蒗彝族自治县',3,1,530724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530800,530000,'普洱市',2,0,530800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530802,530800,'思茅区',3,1,530802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530821,530800,'宁洱哈尼族彝族自治县',3,1,530821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530822,530800,'墨江哈尼族自治县',3,1,530822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530823,530800,'景东彝族自治县',3,1,530823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530824,530800,'景谷傣族彝族自治县',3,1,530824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530825,530800,'镇沅彝族哈尼族拉祜族自治县',3,1,530825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530826,530800,'江城哈尼族彝族自治县',3,1,530826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530827,530800,'孟连傣族拉祜族佤族自治县',3,1,530827,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530828,530800,'澜沧拉祜族自治县',3,1,530828,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530829,530800,'西盟佤族自治县',3,1,530829,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530900,530000,'临沧市',2,0,530900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530902,530900,'临翔区',3,1,530902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530921,530900,'凤庆县',3,1,530921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530922,530900,'云县',3,1,530922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530923,530900,'永德县',3,1,530923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530924,530900,'镇康县',3,1,530924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530925,530900,'双江拉祜族佤族布朗族傣族自治县',3,1,530925,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530926,530900,'耿马傣族佤族自治县',3,1,530926,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (530927,530900,'沧源佤族自治县',3,1,530927,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532300,530000,'楚雄彝族自治州',2,0,532300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532301,532300,'楚雄市',3,1,532301,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532322,532300,'双柏县',3,1,532322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532323,532300,'牟定县',3,1,532323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532324,532300,'南华县',3,1,532324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532325,532300,'姚安县',3,1,532325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532326,532300,'大姚县',3,1,532326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532327,532300,'永仁县',3,1,532327,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532328,532300,'元谋县',3,1,532328,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532329,532300,'武定县',3,1,532329,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532331,532300,'禄丰县',3,1,532331,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532500,530000,'红河哈尼族彝族自治州',2,0,532500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532501,532500,'个旧市',3,1,532501,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532502,532500,'开远市',3,1,532502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532503,532500,'蒙自市',3,1,532503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532504,532500,'弥勒市',3,1,532504,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532523,532500,'屏边苗族自治县',3,1,532523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532524,532500,'建水县',3,1,532524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532525,532500,'石屏县',3,1,532525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532527,532500,'泸西县',3,1,532527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532528,532500,'元阳县',3,1,532528,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532529,532500,'红河县',3,1,532529,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532530,532500,'金平苗族瑶族傣族自治县',3,1,532530,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532531,532500,'绿春县',3,1,532531,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532532,532500,'河口瑶族自治县',3,1,532532,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532600,530000,'文山壮族苗族自治州',2,0,532600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532601,532600,'文山市',3,1,532601,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532622,532600,'砚山县',3,1,532622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532623,532600,'西畴县',3,1,532623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532624,532600,'麻栗坡县',3,1,532624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532625,532600,'马关县',3,1,532625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532626,532600,'丘北县',3,1,532626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532627,532600,'广南县',3,1,532627,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532628,532600,'富宁县',3,1,532628,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532800,530000,'西双版纳傣族自治州',2,0,532800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532801,532800,'景洪市',3,1,532801,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532822,532800,'勐海县',3,1,532822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532823,532800,'勐腊县',3,1,532823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532900,530000,'大理白族自治州',2,0,532900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532901,532900,'大理市',3,1,532901,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532922,532900,'漾濞彝族自治县',3,1,532922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532923,532900,'祥云县',3,1,532923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532924,532900,'宾川县',3,1,532924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532925,532900,'弥渡县',3,1,532925,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532926,532900,'南涧彝族自治县',3,1,532926,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532927,532900,'巍山彝族回族自治县',3,1,532927,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532928,532900,'永平县',3,1,532928,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532929,532900,'云龙县',3,1,532929,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532930,532900,'洱源县',3,1,532930,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532931,532900,'剑川县',3,1,532931,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (532932,532900,'鹤庆县',3,1,532932,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533100,530000,'德宏傣族景颇族自治州',2,0,533100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533102,533100,'瑞丽市',3,1,533102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533103,533100,'芒市',3,1,533103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533122,533100,'梁河县',3,1,533122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533123,533100,'盈江县',3,1,533123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533124,533100,'陇川县',3,1,533124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533300,530000,'怒江傈僳族自治州',2,0,533300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533301,533300,'泸水市',3,1,533301,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533323,533300,'福贡县',3,1,533323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533324,533300,'贡山独龙族怒族自治县',3,1,533324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533325,533300,'兰坪白族普米族自治县',3,1,533325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533400,530000,'迪庆藏族自治州',2,0,533400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533401,533400,'香格里拉市',3,1,533401,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533422,533400,'德钦县',3,1,533422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (533423,533400,'维西傈僳族自治县',3,1,533423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540000,0,'西藏自治区',1,0,540000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540100,540000,'拉萨市',2,0,540100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540102,540100,'城关区',3,1,540102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540103,540100,'堆龙德庆区',3,1,540103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540104,540100,'达孜区',3,1,540104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540121,540100,'林周县',3,1,540121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540122,540100,'当雄县',3,1,540122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540123,540100,'尼木县',3,1,540123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540124,540100,'曲水县',3,1,540124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540127,540100,'墨竹工卡县',3,1,540127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540200,540000,'日喀则市',2,0,540200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540202,540200,'桑珠孜区',3,1,540202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540221,540200,'南木林县',3,1,540221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540222,540200,'江孜县',3,1,540222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540223,540200,'定日县',3,1,540223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540224,540200,'萨迦县',3,1,540224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540225,540200,'拉孜县',3,1,540225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540226,540200,'昂仁县',3,1,540226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540227,540200,'谢通门县',3,1,540227,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540228,540200,'白朗县',3,1,540228,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540229,540200,'仁布县',3,1,540229,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540230,540200,'康马县',3,1,540230,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540231,540200,'定结县',3,1,540231,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540232,540200,'仲巴县',3,1,540232,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540233,540200,'亚东县',3,1,540233,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540234,540200,'吉隆县',3,1,540234,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540235,540200,'聂拉木县',3,1,540235,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540236,540200,'萨嘎县',3,1,540236,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540237,540200,'岗巴县',3,1,540237,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540300,540000,'昌都市',2,0,540300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540302,540300,'卡若区',3,1,540302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540321,540300,'江达县',3,1,540321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540322,540300,'贡觉县',3,1,540322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540323,540300,'类乌齐县',3,1,540323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540324,540300,'丁青县',3,1,540324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540325,540300,'察雅县',3,1,540325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540326,540300,'八宿县',3,1,540326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540327,540300,'左贡县',3,1,540327,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540328,540300,'芒康县',3,1,540328,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540329,540300,'洛隆县',3,1,540329,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540330,540300,'边坝县',3,1,540330,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540400,540000,'林芝市',2,0,540400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540402,540400,'巴宜区',3,1,540402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540421,540400,'工布江达县',3,1,540421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540422,540400,'米林县',3,1,540422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540423,540400,'墨脱县',3,1,540423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540424,540400,'波密县',3,1,540424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540425,540400,'察隅县',3,1,540425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540426,540400,'朗县',3,1,540426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540500,540000,'山南市',2,0,540500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540502,540500,'乃东区',3,1,540502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540521,540500,'扎囊县',3,1,540521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540522,540500,'贡嘎县',3,1,540522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540523,540500,'桑日县',3,1,540523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540524,540500,'琼结县',3,1,540524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540525,540500,'曲松县',3,1,540525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540526,540500,'措美县',3,1,540526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540527,540500,'洛扎县',3,1,540527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540528,540500,'加查县',3,1,540528,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540529,540500,'隆子县',3,1,540529,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540530,540500,'错那县',3,1,540530,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540531,540500,'浪卡子县',3,1,540531,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540600,540000,'那曲市',2,0,540600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540602,540600,'色尼区',3,1,540602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540621,540600,'嘉黎县',3,1,540621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540622,540600,'比如县',3,1,540622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540623,540600,'聂荣县',3,1,540623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540624,540600,'安多县',3,1,540624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540625,540600,'申扎县',3,1,540625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540626,540600,'索县',3,1,540626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540627,540600,'班戈县',3,1,540627,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540628,540600,'巴青县',3,1,540628,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540629,540600,'尼玛县',3,1,540629,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (540630,540600,'双湖县',3,1,540630,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (542500,540000,'阿里地区',2,0,542500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (542521,542500,'普兰县',3,1,542521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (542522,542500,'札达县',3,1,542522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (542523,542500,'噶尔县',3,1,542523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (542524,542500,'日土县',3,1,542524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (542525,542500,'革吉县',3,1,542525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (542526,542500,'改则县',3,1,542526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (542527,542500,'措勤县',3,1,542527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610000,0,'陕西省',1,0,610000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610100,610000,'西安市',2,0,610100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610102,610100,'新城区',3,1,610102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610103,610100,'碑林区',3,1,610103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610104,610100,'莲湖区',3,1,610104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610111,610100,'灞桥区',3,1,610111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610112,610100,'未央区',3,1,610112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610113,610100,'雁塔区',3,1,610113,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610114,610100,'阎良区',3,1,610114,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610115,610100,'临潼区',3,1,610115,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610116,610100,'长安区',3,1,610116,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610117,610100,'高陵区',3,1,610117,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610118,610100,'鄠邑区',3,1,610118,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610122,610100,'蓝田县',3,1,610122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610124,610100,'周至县',3,1,610124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610200,610000,'铜川市',2,0,610200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610202,610200,'王益区',3,1,610202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610203,610200,'印台区',3,1,610203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610204,610200,'耀州区',3,1,610204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610222,610200,'宜君县',3,1,610222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610300,610000,'宝鸡市',2,0,610300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610302,610300,'渭滨区',3,1,610302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610303,610300,'金台区',3,1,610303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610304,610300,'陈仓区',3,1,610304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610322,610300,'凤翔县',3,1,610322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610323,610300,'岐山县',3,1,610323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610324,610300,'扶风县',3,1,610324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610326,610300,'眉县',3,1,610326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610327,610300,'陇县',3,1,610327,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610328,610300,'千阳县',3,1,610328,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610329,610300,'麟游县',3,1,610329,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610330,610300,'凤县',3,1,610330,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610331,610300,'太白县',3,1,610331,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610400,610000,'咸阳市',2,0,610400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610402,610400,'秦都区',3,1,610402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610403,610400,'杨陵区',3,1,610403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610404,610400,'渭城区',3,1,610404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610422,610400,'三原县',3,1,610422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610423,610400,'泾阳县',3,1,610423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610424,610400,'乾县',3,1,610424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610425,610400,'礼泉县',3,1,610425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610426,610400,'永寿县',3,1,610426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610428,610400,'长武县',3,1,610428,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610429,610400,'旬邑县',3,1,610429,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610430,610400,'淳化县',3,1,610430,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610431,610400,'武功县',3,1,610431,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610481,610400,'兴平市',3,1,610481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610482,610400,'彬州市',3,1,610482,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610500,610000,'渭南市',2,0,610500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610502,610500,'临渭区',3,1,610502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610503,610500,'华州区',3,1,610503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610522,610500,'潼关县',3,1,610522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610523,610500,'大荔县',3,1,610523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610524,610500,'合阳县',3,1,610524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610525,610500,'澄城县',3,1,610525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610526,610500,'蒲城县',3,1,610526,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610527,610500,'白水县',3,1,610527,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610528,610500,'富平县',3,1,610528,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610581,610500,'韩城市',3,1,610581,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610582,610500,'华阴市',3,1,610582,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610600,610000,'延安市',2,0,610600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610602,610600,'宝塔区',3,1,610602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610603,610600,'安塞区',3,1,610603,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610621,610600,'延长县',3,1,610621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610622,610600,'延川县',3,1,610622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610623,610600,'子长县',3,1,610623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610625,610600,'志丹县',3,1,610625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610626,610600,'吴起县',3,1,610626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610627,610600,'甘泉县',3,1,610627,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610628,610600,'富县',3,1,610628,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610629,610600,'洛川县',3,1,610629,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610630,610600,'宜川县',3,1,610630,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610631,610600,'黄龙县',3,1,610631,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610632,610600,'黄陵县',3,1,610632,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610700,610000,'汉中市',2,0,610700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610702,610700,'汉台区',3,1,610702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610703,610700,'南郑区',3,1,610703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610722,610700,'城固县',3,1,610722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610723,610700,'洋县',3,1,610723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610724,610700,'西乡县',3,1,610724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610725,610700,'勉县',3,1,610725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610726,610700,'宁强县',3,1,610726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610727,610700,'略阳县',3,1,610727,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610728,610700,'镇巴县',3,1,610728,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610729,610700,'留坝县',3,1,610729,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610730,610700,'佛坪县',3,1,610730,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610800,610000,'榆林市',2,0,610800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610802,610800,'榆阳区',3,1,610802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610803,610800,'横山区',3,1,610803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610822,610800,'府谷县',3,1,610822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610824,610800,'靖边县',3,1,610824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610825,610800,'定边县',3,1,610825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610826,610800,'绥德县',3,1,610826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610827,610800,'米脂县',3,1,610827,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610828,610800,'佳县',3,1,610828,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610829,610800,'吴堡县',3,1,610829,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610830,610800,'清涧县',3,1,610830,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610831,610800,'子洲县',3,1,610831,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610881,610800,'神木市',3,1,610881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610900,610000,'安康市',2,0,610900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610902,610900,'汉滨区',3,1,610902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610921,610900,'汉阴县',3,1,610921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610922,610900,'石泉县',3,1,610922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610923,610900,'宁陕县',3,1,610923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610924,610900,'紫阳县',3,1,610924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610925,610900,'岚皋县',3,1,610925,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610926,610900,'平利县',3,1,610926,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610927,610900,'镇坪县',3,1,610927,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610928,610900,'旬阳县',3,1,610928,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (610929,610900,'白河县',3,1,610929,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (611000,610000,'商洛市',2,0,611000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (611002,611000,'商州区',3,1,611002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (611021,611000,'洛南县',3,1,611021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (611022,611000,'丹凤县',3,1,611022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (611023,611000,'商南县',3,1,611023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (611024,611000,'山阳县',3,1,611024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (611025,611000,'镇安县',3,1,611025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (611026,611000,'柞水县',3,1,611026,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620000,0,'甘肃省',1,0,620000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620100,620000,'兰州市',2,0,620100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620102,620100,'城关区',3,1,620102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620103,620100,'七里河区',3,1,620103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620104,620100,'西固区',3,1,620104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620105,620100,'安宁区',3,1,620105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620111,620100,'红古区',3,1,620111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620121,620100,'永登县',3,1,620121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620122,620100,'皋兰县',3,1,620122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620123,620100,'榆中县',3,1,620123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620200,620000,'嘉峪关市',2,0,620200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620201,620200,'市辖区',3,1,620201,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620290,620200,'雄关区',3,1,620290,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620291,620200,'长城区',3,1,620291,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620292,620200,'镜铁区',3,1,620292,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620293,620200,'新城镇',3,1,620293,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620294,620200,'峪泉镇',3,1,620294,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620295,620200,'文殊镇',3,1,620295,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620300,620000,'金昌市',2,0,620300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620302,620300,'金川区',3,1,620302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620321,620300,'永昌县',3,1,620321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620400,620000,'白银市',2,0,620400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620402,620400,'白银区',3,1,620402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620403,620400,'平川区',3,1,620403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620421,620400,'靖远县',3,1,620421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620422,620400,'会宁县',3,1,620422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620423,620400,'景泰县',3,1,620423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620500,620000,'天水市',2,0,620500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620502,620500,'秦州区',3,1,620502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620503,620500,'麦积区',3,1,620503,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620521,620500,'清水县',3,1,620521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620522,620500,'秦安县',3,1,620522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620523,620500,'甘谷县',3,1,620523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620524,620500,'武山县',3,1,620524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620525,620500,'张家川回族自治县',3,1,620525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620600,620000,'武威市',2,0,620600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620602,620600,'凉州区',3,1,620602,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620621,620600,'民勤县',3,1,620621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620622,620600,'古浪县',3,1,620622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620623,620600,'天祝藏族自治县',3,1,620623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620700,620000,'张掖市',2,0,620700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620702,620700,'甘州区',3,1,620702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620721,620700,'肃南裕固族自治县',3,1,620721,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620722,620700,'民乐县',3,1,620722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620723,620700,'临泽县',3,1,620723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620724,620700,'高台县',3,1,620724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620725,620700,'山丹县',3,1,620725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620800,620000,'平凉市',2,0,620800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620802,620800,'崆峒区',3,1,620802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620821,620800,'泾川县',3,1,620821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620822,620800,'灵台县',3,1,620822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620823,620800,'崇信县',3,1,620823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620825,620800,'庄浪县',3,1,620825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620826,620800,'静宁县',3,1,620826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620881,620800,'华亭市',3,1,620881,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620900,620000,'酒泉市',2,0,620900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620902,620900,'肃州区',3,1,620902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620921,620900,'金塔县',3,1,620921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620922,620900,'瓜州县',3,1,620922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620923,620900,'肃北蒙古族自治县',3,1,620923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620924,620900,'阿克塞哈萨克族自治县',3,1,620924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620981,620900,'玉门市',3,1,620981,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (620982,620900,'敦煌市',3,1,620982,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621000,620000,'庆阳市',2,0,621000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621002,621000,'西峰区',3,1,621002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621021,621000,'庆城县',3,1,621021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621022,621000,'环县',3,1,621022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621023,621000,'华池县',3,1,621023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621024,621000,'合水县',3,1,621024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621025,621000,'正宁县',3,1,621025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621026,621000,'宁县',3,1,621026,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621027,621000,'镇原县',3,1,621027,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621100,620000,'定西市',2,0,621100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621102,621100,'安定区',3,1,621102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621121,621100,'通渭县',3,1,621121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621122,621100,'陇西县',3,1,621122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621123,621100,'渭源县',3,1,621123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621124,621100,'临洮县',3,1,621124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621125,621100,'漳县',3,1,621125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621126,621100,'岷县',3,1,621126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621200,620000,'陇南市',2,0,621200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621202,621200,'武都区',3,1,621202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621221,621200,'成县',3,1,621221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621222,621200,'文县',3,1,621222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621223,621200,'宕昌县',3,1,621223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621224,621200,'康县',3,1,621224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621225,621200,'西和县',3,1,621225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621226,621200,'礼县',3,1,621226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621227,621200,'徽县',3,1,621227,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (621228,621200,'两当县',3,1,621228,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (622900,620000,'临夏回族自治州',2,0,622900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (622901,622900,'临夏市',3,1,622901,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (622921,622900,'临夏县',3,1,622921,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (622922,622900,'康乐县',3,1,622922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (622923,622900,'永靖县',3,1,622923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (622924,622900,'广河县',3,1,622924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (622925,622900,'和政县',3,1,622925,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (622926,622900,'东乡族自治县',3,1,622926,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (622927,622900,'积石山保安族东乡族撒拉族自治县',3,1,622927,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (623000,620000,'甘南藏族自治州',2,0,623000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (623001,623000,'合作市',3,1,623001,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (623021,623000,'临潭县',3,1,623021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (623022,623000,'卓尼县',3,1,623022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (623023,623000,'舟曲县',3,1,623023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (623024,623000,'迭部县',3,1,623024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (623025,623000,'玛曲县',3,1,623025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (623026,623000,'碌曲县',3,1,623026,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (623027,623000,'夏河县',3,1,623027,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630000,0,'青海省',1,0,630000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630100,630000,'西宁市',2,0,630100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630102,630100,'城东区',3,1,630102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630103,630100,'城中区',3,1,630103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630104,630100,'城西区',3,1,630104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630105,630100,'城北区',3,1,630105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630121,630100,'大通回族土族自治县',3,1,630121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630122,630100,'湟中县',3,1,630122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630123,630100,'湟源县',3,1,630123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630200,630000,'海东市',2,0,630200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630202,630200,'乐都区',3,1,630202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630203,630200,'平安区',3,1,630203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630222,630200,'民和回族土族自治县',3,1,630222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630223,630200,'互助土族自治县',3,1,630223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630224,630200,'化隆回族自治县',3,1,630224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (630225,630200,'循化撒拉族自治县',3,1,630225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632200,630000,'海北藏族自治州',2,0,632200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632221,632200,'门源回族自治县',3,1,632221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632222,632200,'祁连县',3,1,632222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632223,632200,'海晏县',3,1,632223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632224,632200,'刚察县',3,1,632224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632300,630000,'黄南藏族自治州',2,0,632300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632321,632300,'同仁县',3,1,632321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632322,632300,'尖扎县',3,1,632322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632323,632300,'泽库县',3,1,632323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632324,632300,'河南蒙古族自治县',3,1,632324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632500,630000,'海南藏族自治州',2,0,632500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632521,632500,'共和县',3,1,632521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632522,632500,'同德县',3,1,632522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632523,632500,'贵德县',3,1,632523,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632524,632500,'兴海县',3,1,632524,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632525,632500,'贵南县',3,1,632525,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632600,630000,'果洛藏族自治州',2,0,632600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632621,632600,'玛沁县',3,1,632621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632622,632600,'班玛县',3,1,632622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632623,632600,'甘德县',3,1,632623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632624,632600,'达日县',3,1,632624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632625,632600,'久治县',3,1,632625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632626,632600,'玛多县',3,1,632626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632700,630000,'玉树藏族自治州',2,0,632700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632701,632700,'玉树市',3,1,632701,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632722,632700,'杂多县',3,1,632722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632723,632700,'称多县',3,1,632723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632724,632700,'治多县',3,1,632724,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632725,632700,'囊谦县',3,1,632725,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632726,632700,'曲麻莱县',3,1,632726,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632800,630000,'海西蒙古族藏族自治州',2,0,632800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632801,632800,'格尔木市',3,1,632801,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632802,632800,'德令哈市',3,1,632802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632803,632800,'茫崖市',3,1,632803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632821,632800,'乌兰县',3,1,632821,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632822,632800,'都兰县',3,1,632822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (632823,632800,'天峻县',3,1,632823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640000,0,'宁夏回族自治区',1,0,640000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640100,640000,'银川市',2,0,640100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640104,640100,'兴庆区',3,1,640104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640105,640100,'西夏区',3,1,640105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640106,640100,'金凤区',3,1,640106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640121,640100,'永宁县',3,1,640121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640122,640100,'贺兰县',3,1,640122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640181,640100,'灵武市',3,1,640181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640200,640000,'石嘴山市',2,0,640200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640202,640200,'大武口区',3,1,640202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640205,640200,'惠农区',3,1,640205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640221,640200,'平罗县',3,1,640221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640300,640000,'吴忠市',2,0,640300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640302,640300,'利通区',3,1,640302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640303,640300,'红寺堡区',3,1,640303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640323,640300,'盐池县',3,1,640323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640324,640300,'同心县',3,1,640324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640381,640300,'青铜峡市',3,1,640381,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640400,640000,'固原市',2,0,640400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640402,640400,'原州区',3,1,640402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640422,640400,'西吉县',3,1,640422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640423,640400,'隆德县',3,1,640423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640424,640400,'泾源县',3,1,640424,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640425,640400,'彭阳县',3,1,640425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640500,640000,'中卫市',2,0,640500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640502,640500,'沙坡头区',3,1,640502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640521,640500,'中宁县',3,1,640521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (640522,640500,'海原县',3,1,640522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650000,0,'新疆维吾尔自治区',1,0,650000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650100,650000,'乌鲁木齐市',2,0,650100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650102,650100,'天山区',3,1,650102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650103,650100,'沙依巴克区',3,1,650103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650104,650100,'新市区',3,1,650104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650105,650100,'水磨沟区',3,1,650105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650106,650100,'头屯河区',3,1,650106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650107,650100,'达坂城区',3,1,650107,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650109,650100,'米东区',3,1,650109,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650121,650100,'乌鲁木齐县',3,1,650121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650200,650000,'克拉玛依市',2,0,650200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650202,650200,'独山子区',3,1,650202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650203,650200,'克拉玛依区',3,1,650203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650204,650200,'白碱滩区',3,1,650204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650205,650200,'乌尔禾区',3,1,650205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650400,650000,'吐鲁番市',2,0,650400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650402,650400,'高昌区',3,1,650402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650421,650400,'鄯善县',3,1,650421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650422,650400,'托克逊县',3,1,650422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650500,650000,'哈密市',2,0,650500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650502,650500,'伊州区',3,1,650502,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650521,650500,'巴里坤哈萨克自治县',3,1,650521,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (650522,650500,'伊吾县',3,1,650522,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652300,650000,'昌吉回族自治州',2,0,652300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652301,652300,'昌吉市',3,1,652301,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652302,652300,'阜康市',3,1,652302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652323,652300,'呼图壁县',3,1,652323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652324,652300,'玛纳斯县',3,1,652324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652325,652300,'奇台县',3,1,652325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652327,652300,'吉木萨尔县',3,1,652327,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652328,652300,'木垒哈萨克自治县',3,1,652328,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652700,650000,'博尔塔拉蒙古自治州',2,0,652700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652701,652700,'博乐市',3,1,652701,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652702,652700,'阿拉山口市',3,1,652702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652722,652700,'精河县',3,1,652722,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652723,652700,'温泉县',3,1,652723,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652800,650000,'巴音郭楞蒙古自治州',2,0,652800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652801,652800,'库尔勒市',3,1,652801,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652822,652800,'轮台县',3,1,652822,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652823,652800,'尉犁县',3,1,652823,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652824,652800,'若羌县',3,1,652824,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652825,652800,'且末县',3,1,652825,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652826,652800,'焉耆回族自治县',3,1,652826,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652827,652800,'和静县',3,1,652827,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652828,652800,'和硕县',3,1,652828,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652829,652800,'博湖县',3,1,652829,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652900,650000,'阿克苏地区',2,0,652900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652901,652900,'阿克苏市',3,1,652901,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652922,652900,'温宿县',3,1,652922,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652923,652900,'库车县',3,1,652923,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652924,652900,'沙雅县',3,1,652924,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652925,652900,'新和县',3,1,652925,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652926,652900,'拜城县',3,1,652926,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652927,652900,'乌什县',3,1,652927,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652928,652900,'阿瓦提县',3,1,652928,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (652929,652900,'柯坪县',3,1,652929,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653000,650000,'克孜勒苏柯尔克孜自治州',2,0,653000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653001,653000,'阿图什市',3,1,653001,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653022,653000,'阿克陶县',3,1,653022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653023,653000,'阿合奇县',3,1,653023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653024,653000,'乌恰县',3,1,653024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653100,650000,'喀什地区',2,0,653100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653101,653100,'喀什市',3,1,653101,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653121,653100,'疏附县',3,1,653121,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653122,653100,'疏勒县',3,1,653122,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653123,653100,'英吉沙县',3,1,653123,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653124,653100,'泽普县',3,1,653124,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653125,653100,'莎车县',3,1,653125,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653126,653100,'叶城县',3,1,653126,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653127,653100,'麦盖提县',3,1,653127,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653128,653100,'岳普湖县',3,1,653128,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653129,653100,'伽师县',3,1,653129,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653130,653100,'巴楚县',3,1,653130,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653131,653100,'塔什库尔干塔吉克自治县',3,1,653131,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653200,650000,'和田地区',2,0,653200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653201,653200,'和田市',3,1,653201,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653221,653200,'和田县',3,1,653221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653222,653200,'墨玉县',3,1,653222,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653223,653200,'皮山县',3,1,653223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653224,653200,'洛浦县',3,1,653224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653225,653200,'策勒县',3,1,653225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653226,653200,'于田县',3,1,653226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (653227,653200,'民丰县',3,1,653227,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654000,650000,'伊犁哈萨克自治州',2,0,654000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654002,654000,'伊宁市',3,1,654002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654003,654000,'奎屯市',3,1,654003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654004,654000,'霍尔果斯市',3,1,654004,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654021,654000,'伊宁县',3,1,654021,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654022,654000,'察布查尔锡伯自治县',3,1,654022,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654023,654000,'霍城县',3,1,654023,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654024,654000,'巩留县',3,1,654024,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654025,654000,'新源县',3,1,654025,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654026,654000,'昭苏县',3,1,654026,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654027,654000,'特克斯县',3,1,654027,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654028,654000,'尼勒克县',3,1,654028,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654200,650000,'塔城地区',2,0,654200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654201,654200,'塔城市',3,1,654201,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654202,654200,'乌苏市',3,1,654202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654221,654200,'额敏县',3,1,654221,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654223,654200,'沙湾县',3,1,654223,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654224,654200,'托里县',3,1,654224,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654225,654200,'裕民县',3,1,654225,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654226,654200,'和布克赛尔蒙古自治县',3,1,654226,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654300,650000,'阿勒泰地区',2,0,654300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654301,654300,'阿勒泰市',3,1,654301,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654321,654300,'布尔津县',3,1,654321,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654322,654300,'富蕴县',3,1,654322,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654323,654300,'福海县',3,1,654323,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654324,654300,'哈巴河县',3,1,654324,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654325,654300,'青河县',3,1,654325,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (654326,654300,'吉木乃县',3,1,654326,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (659000,650000,'自治区直辖县级行政区划',2,0,659000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (659001,659000,'石河子市',3,1,659001,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (659002,659000,'阿拉尔市',3,1,659002,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (659003,659000,'图木舒克市',3,1,659003,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (659004,659000,'五家渠市',3,1,659004,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (659005,659000,'北屯市',3,1,659005,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (659006,659000,'铁门关市',3,1,659006,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (659007,659000,'双河市',3,1,659007,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (659008,659000,'可克达拉市',3,1,659008,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (659009,659000,'昆玉市',3,1,659009,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710000,0,'台湾省',1,0,710000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710100,710000,'台北市',2,0,710100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710101,710100,'中正区',3,1,710101,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710102,710100,'大同区',3,1,710102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710103,710100,'中山区',3,1,710103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710104,710100,'松山区',3,1,710104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710105,710100,'大安区',3,1,710105,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710106,710100,'万华区',3,1,710106,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710107,710100,'信义区',3,1,710107,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710108,710100,'士林区',3,1,710108,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710109,710100,'北投区',3,1,710109,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710110,710100,'内湖区',3,1,710110,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710111,710100,'南港区',3,1,710111,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710112,710100,'文山区',3,1,710112,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710199,710100,'其它区',3,1,710199,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710200,710000,'高雄市',2,0,710200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710201,710200,'新兴区',3,1,710201,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710202,710200,'前金区',3,1,710202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710203,710200,'芩雅区',3,1,710203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710204,710200,'盐埕区',3,1,710204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710205,710200,'鼓山区',3,1,710205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710206,710200,'旗津区',3,1,710206,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710207,710200,'前镇区',3,1,710207,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710208,710200,'三民区',3,1,710208,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710209,710200,'左营区',3,1,710209,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710210,710200,'楠梓区',3,1,710210,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710211,710200,'小港区',3,1,710211,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710241,710200,'苓雅区',3,1,710241,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710242,710200,'仁武区',3,1,710242,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710243,710200,'大社区',3,1,710243,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710244,710200,'冈山区',3,1,710244,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710245,710200,'路竹区',3,1,710245,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710246,710200,'阿莲区',3,1,710246,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710247,710200,'田寮区',3,1,710247,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710248,710200,'燕巢区',3,1,710248,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710249,710200,'桥头区',3,1,710249,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710250,710200,'梓官区',3,1,710250,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710251,710200,'弥陀区',3,1,710251,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710252,710200,'永安区',3,1,710252,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710253,710200,'湖内区',3,1,710253,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710254,710200,'凤山区',3,1,710254,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710255,710200,'大寮区',3,1,710255,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710256,710200,'林园区',3,1,710256,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710257,710200,'鸟松区',3,1,710257,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710258,710200,'大树区',3,1,710258,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710259,710200,'旗山区',3,1,710259,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710260,710200,'美浓区',3,1,710260,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710261,710200,'六龟区',3,1,710261,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710262,710200,'内门区',3,1,710262,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710263,710200,'杉林区',3,1,710263,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710264,710200,'甲仙区',3,1,710264,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710265,710200,'桃源区',3,1,710265,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710266,710200,'那玛夏区',3,1,710266,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710267,710200,'茂林区',3,1,710267,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710268,710200,'茄萣区',3,1,710268,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710299,710200,'其它区',3,1,710299,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710300,710000,'台南市',2,0,710300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710301,710300,'中西区',3,1,710301,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710302,710300,'东区',3,1,710302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710303,710300,'南区',3,1,710303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710304,710300,'北区',3,1,710304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710305,710300,'安平区',3,1,710305,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710306,710300,'安南区',3,1,710306,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710339,710300,'永康区',3,1,710339,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710340,710300,'归仁区',3,1,710340,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710341,710300,'新化区',3,1,710341,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710342,710300,'左镇区',3,1,710342,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710343,710300,'玉井区',3,1,710343,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710344,710300,'楠西区',3,1,710344,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710345,710300,'南化区',3,1,710345,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710346,710300,'仁德区',3,1,710346,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710347,710300,'关庙区',3,1,710347,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710348,710300,'龙崎区',3,1,710348,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710349,710300,'官田区',3,1,710349,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710350,710300,'麻豆区',3,1,710350,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710351,710300,'佳里区',3,1,710351,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710352,710300,'西港区',3,1,710352,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710353,710300,'七股区',3,1,710353,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710354,710300,'将军区',3,1,710354,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710355,710300,'学甲区',3,1,710355,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710356,710300,'北门区',3,1,710356,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710357,710300,'新营区',3,1,710357,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710358,710300,'后壁区',3,1,710358,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710359,710300,'白河区',3,1,710359,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710360,710300,'东山区',3,1,710360,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710361,710300,'六甲区',3,1,710361,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710362,710300,'下营区',3,1,710362,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710363,710300,'柳营区',3,1,710363,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710364,710300,'盐水区',3,1,710364,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710365,710300,'善化区',3,1,710365,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710366,710300,'大内区',3,1,710366,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710367,710300,'山上区',3,1,710367,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710368,710300,'新市区',3,1,710368,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710369,710300,'安定区',3,1,710369,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710399,710300,'其它区',3,1,710399,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710400,710000,'台中市',2,0,710400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710401,710400,'中区',3,1,710401,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710402,710400,'东区',3,1,710402,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710403,710400,'南区',3,1,710403,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710404,710400,'西区',3,1,710404,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710405,710400,'北区',3,1,710405,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710406,710400,'北屯区',3,1,710406,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710407,710400,'西屯区',3,1,710407,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710408,710400,'南屯区',3,1,710408,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710431,710400,'太平区',3,1,710431,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710432,710400,'大里区',3,1,710432,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710433,710400,'雾峰区',3,1,710433,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710434,710400,'乌日区',3,1,710434,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710435,710400,'丰原区',3,1,710435,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710436,710400,'后里区',3,1,710436,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710437,710400,'石冈区',3,1,710437,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710438,710400,'东势区',3,1,710438,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710439,710400,'和平区',3,1,710439,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710440,710400,'新社区',3,1,710440,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710441,710400,'潭子区',3,1,710441,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710442,710400,'大雅区',3,1,710442,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710443,710400,'神冈区',3,1,710443,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710444,710400,'大肚区',3,1,710444,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710445,710400,'沙鹿区',3,1,710445,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710446,710400,'龙井区',3,1,710446,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710447,710400,'梧栖区',3,1,710447,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710448,710400,'清水区',3,1,710448,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710449,710400,'大甲区',3,1,710449,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710450,710400,'外埔区',3,1,710450,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710451,710400,'大安区',3,1,710451,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710499,710400,'其它区',3,1,710499,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710500,710000,'金门县',2,0,710500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710507,710500,'金沙镇',3,1,710507,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710508,710500,'金湖镇',3,1,710508,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710509,710500,'金宁乡',3,1,710509,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710510,710500,'金城镇',3,1,710510,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710511,710500,'烈屿乡',3,1,710511,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710512,710500,'乌坵乡',3,1,710512,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710600,710000,'南投县',2,0,710600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710614,710600,'南投市',3,1,710614,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710615,710600,'中寮乡',3,1,710615,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710616,710600,'草屯镇',3,1,710616,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710617,710600,'国姓乡',3,1,710617,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710618,710600,'埔里镇',3,1,710618,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710619,710600,'仁爱乡',3,1,710619,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710620,710600,'名间乡',3,1,710620,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710621,710600,'集集镇',3,1,710621,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710622,710600,'水里乡',3,1,710622,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710623,710600,'鱼池乡',3,1,710623,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710624,710600,'信义乡',3,1,710624,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710625,710600,'竹山镇',3,1,710625,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710626,710600,'鹿谷乡',3,1,710626,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710700,710000,'基隆市',2,0,710700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710701,710700,'仁爱区',3,1,710701,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710702,710700,'信义区',3,1,710702,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710703,710700,'中正区',3,1,710703,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710704,710700,'中山区',3,1,710704,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710705,710700,'安乐区',3,1,710705,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710706,710700,'暖暖区',3,1,710706,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710707,710700,'七堵区',3,1,710707,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710799,710700,'其它区',3,1,710799,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710800,710000,'新竹市',2,0,710800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710801,710800,'东区',3,1,710801,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710802,710800,'北区',3,1,710802,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710803,710800,'香山区',3,1,710803,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710899,710800,'其它区',3,1,710899,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710900,710000,'嘉义市',2,0,710900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710901,710900,'东区',3,1,710901,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710902,710900,'西区',3,1,710902,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (710999,710900,'其它区',3,1,710999,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711100,710000,'新北市',2,0,711100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711130,711100,'万里区',3,1,711130,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711132,711100,'板桥区',3,1,711132,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711133,711100,'汐止区',3,1,711133,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711134,711100,'深坑区',3,1,711134,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711135,711100,'石碇区',3,1,711135,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711136,711100,'瑞芳区',3,1,711136,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711137,711100,'平溪区',3,1,711137,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711138,711100,'双溪区',3,1,711138,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711139,711100,'贡寮区',3,1,711139,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711140,711100,'新店区',3,1,711140,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711141,711100,'坪林区',3,1,711141,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711142,711100,'乌来区',3,1,711142,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711143,711100,'永和区',3,1,711143,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711144,711100,'中和区',3,1,711144,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711145,711100,'土城区',3,1,711145,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711146,711100,'三峡区',3,1,711146,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711147,711100,'树林区',3,1,711147,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711148,711100,'莺歌区',3,1,711148,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711149,711100,'三重区',3,1,711149,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711150,711100,'新庄区',3,1,711150,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711151,711100,'泰山区',3,1,711151,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711152,711100,'林口区',3,1,711152,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711153,711100,'芦洲区',3,1,711153,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711154,711100,'五股区',3,1,711154,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711155,711100,'八里区',3,1,711155,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711156,711100,'淡水区',3,1,711156,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711157,711100,'三芝区',3,1,711157,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711158,711100,'石门区',3,1,711158,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711200,710000,'宜兰县',2,0,711200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711287,711200,'宜兰市',3,1,711287,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711288,711200,'头城镇',3,1,711288,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711289,711200,'礁溪乡',3,1,711289,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711290,711200,'壮围乡',3,1,711290,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711291,711200,'员山乡',3,1,711291,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711292,711200,'罗东镇',3,1,711292,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711293,711200,'三星乡',3,1,711293,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711294,711200,'大同乡',3,1,711294,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711295,711200,'五结乡',3,1,711295,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711296,711200,'冬山乡',3,1,711296,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711297,711200,'苏澳镇',3,1,711297,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711298,711200,'南澳乡',3,1,711298,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711299,711200,'钓鱼台',3,1,711299,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711300,710000,'新竹县',2,0,711300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711387,711300,'竹北市',3,1,711387,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711388,711300,'湖口乡',3,1,711388,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711389,711300,'新丰乡',3,1,711389,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711390,711300,'新埔镇',3,1,711390,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711391,711300,'关西镇',3,1,711391,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711392,711300,'芎林乡',3,1,711392,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711393,711300,'宝山乡',3,1,711393,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711394,711300,'竹东镇',3,1,711394,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711395,711300,'五峰乡',3,1,711395,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711396,711300,'横山乡',3,1,711396,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711397,711300,'尖石乡',3,1,711397,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711398,711300,'北埔乡',3,1,711398,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711399,711300,'峨眉乡',3,1,711399,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711400,710000,'桃园县',2,0,711400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711414,711400,'中坜区',3,1,711414,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711415,711400,'平镇区',3,1,711415,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711417,711400,'杨梅区',3,1,711417,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711418,711400,'新屋区',3,1,711418,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711419,711400,'观音区',3,1,711419,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711420,711400,'桃园区',3,1,711420,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711421,711400,'龟山区',3,1,711421,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711422,711400,'八德区',3,1,711422,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711423,711400,'大溪区',3,1,711423,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711425,711400,'大园区',3,1,711425,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711426,711400,'芦竹区',3,1,711426,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711487,711400,'中坜市',3,1,711487,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711488,711400,'平镇市',3,1,711488,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711489,711400,'龙潭乡',3,1,711489,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711490,711400,'杨梅市',3,1,711490,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711491,711400,'新屋乡',3,1,711491,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711492,711400,'观音乡',3,1,711492,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711493,711400,'桃园市',3,1,711493,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711494,711400,'龟山乡',3,1,711494,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711495,711400,'八德市',3,1,711495,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711496,711400,'大溪镇',3,1,711496,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711497,711400,'复兴乡',3,1,711497,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711498,711400,'大园乡',3,1,711498,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711499,711400,'芦竹乡',3,1,711499,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711500,710000,'苗栗县',2,0,711500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711520,711500,'头份市',3,1,711520,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711582,711500,'竹南镇',3,1,711582,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711583,711500,'头份镇',3,1,711583,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711584,711500,'三湾乡',3,1,711584,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711585,711500,'南庄乡',3,1,711585,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711586,711500,'狮潭乡',3,1,711586,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711587,711500,'后龙镇',3,1,711587,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711588,711500,'通霄镇',3,1,711588,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711589,711500,'苑里镇',3,1,711589,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711590,711500,'苗栗市',3,1,711590,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711591,711500,'造桥乡',3,1,711591,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711592,711500,'头屋乡',3,1,711592,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711593,711500,'公馆乡',3,1,711593,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711594,711500,'大湖乡',3,1,711594,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711595,711500,'泰安乡',3,1,711595,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711596,711500,'铜锣乡',3,1,711596,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711597,711500,'三义乡',3,1,711597,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711598,711500,'西湖乡',3,1,711598,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711599,711500,'卓兰镇',3,1,711599,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711700,710000,'彰化县',2,0,711700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711736,711700,'员林市',3,1,711736,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711774,711700,'彰化市',3,1,711774,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711775,711700,'芬园乡',3,1,711775,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711776,711700,'花坛乡',3,1,711776,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711777,711700,'秀水乡',3,1,711777,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711778,711700,'鹿港镇',3,1,711778,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711779,711700,'福兴乡',3,1,711779,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711780,711700,'线西乡',3,1,711780,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711781,711700,'和美镇',3,1,711781,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711782,711700,'伸港乡',3,1,711782,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711783,711700,'员林镇',3,1,711783,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711784,711700,'社头乡',3,1,711784,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711785,711700,'永靖乡',3,1,711785,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711786,711700,'埔心乡',3,1,711786,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711787,711700,'溪湖镇',3,1,711787,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711788,711700,'大村乡',3,1,711788,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711789,711700,'埔盐乡',3,1,711789,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711790,711700,'田中镇',3,1,711790,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711791,711700,'北斗镇',3,1,711791,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711792,711700,'田尾乡',3,1,711792,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711793,711700,'埤头乡',3,1,711793,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711794,711700,'溪州乡',3,1,711794,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711795,711700,'竹塘乡',3,1,711795,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711796,711700,'二林镇',3,1,711796,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711797,711700,'大城乡',3,1,711797,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711798,711700,'芳苑乡',3,1,711798,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711799,711700,'二水乡',3,1,711799,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711900,710000,'嘉义县',2,0,711900,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711982,711900,'番路乡',3,1,711982,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711983,711900,'梅山乡',3,1,711983,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711984,711900,'竹崎乡',3,1,711984,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711985,711900,'阿里山乡',3,1,711985,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711986,711900,'中埔乡',3,1,711986,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711987,711900,'大埔乡',3,1,711987,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711988,711900,'水上乡',3,1,711988,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711989,711900,'鹿草乡',3,1,711989,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711990,711900,'太保市',3,1,711990,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711991,711900,'朴子市',3,1,711991,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711992,711900,'东石乡',3,1,711992,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711993,711900,'六脚乡',3,1,711993,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711994,711900,'新港乡',3,1,711994,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711995,711900,'民雄乡',3,1,711995,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711996,711900,'大林镇',3,1,711996,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711997,711900,'溪口乡',3,1,711997,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711998,711900,'义竹乡',3,1,711998,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (711999,711900,'布袋镇',3,1,711999,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712100,710000,'云林县',2,0,712100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712180,712100,'斗南镇',3,1,712180,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712181,712100,'大埤乡',3,1,712181,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712182,712100,'虎尾镇',3,1,712182,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712183,712100,'土库镇',3,1,712183,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712184,712100,'褒忠乡',3,1,712184,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712185,712100,'东势乡',3,1,712185,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712186,712100,'台西乡',3,1,712186,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712187,712100,'仑背乡',3,1,712187,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712188,712100,'麦寮乡',3,1,712188,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712189,712100,'斗六市',3,1,712189,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712190,712100,'林内乡',3,1,712190,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712191,712100,'古坑乡',3,1,712191,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712192,712100,'莿桐乡',3,1,712192,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712193,712100,'西螺镇',3,1,712193,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712194,712100,'二仑乡',3,1,712194,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712195,712100,'北港镇',3,1,712195,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712196,712100,'水林乡',3,1,712196,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712197,712100,'口湖乡',3,1,712197,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712198,712100,'四湖乡',3,1,712198,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712199,712100,'元长乡',3,1,712199,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712400,710000,'屏东县',2,0,712400,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712451,712400,'崁顶乡',3,1,712451,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712467,712400,'屏东市',3,1,712467,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712468,712400,'三地门乡',3,1,712468,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712469,712400,'雾台乡',3,1,712469,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712470,712400,'玛家乡',3,1,712470,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712471,712400,'九如乡',3,1,712471,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712472,712400,'里港乡',3,1,712472,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712473,712400,'高树乡',3,1,712473,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712474,712400,'盐埔乡',3,1,712474,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712475,712400,'长治乡',3,1,712475,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712476,712400,'麟洛乡',3,1,712476,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712477,712400,'竹田乡',3,1,712477,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712478,712400,'内埔乡',3,1,712478,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712479,712400,'万丹乡',3,1,712479,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712480,712400,'潮州镇',3,1,712480,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712481,712400,'泰武乡',3,1,712481,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712482,712400,'来义乡',3,1,712482,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712483,712400,'万峦乡',3,1,712483,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712484,712400,'莰顶乡',3,1,712484,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712485,712400,'新埤乡',3,1,712485,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712486,712400,'南州乡',3,1,712486,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712487,712400,'林边乡',3,1,712487,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712488,712400,'东港镇',3,1,712488,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712489,712400,'琉球乡',3,1,712489,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712490,712400,'佳冬乡',3,1,712490,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712491,712400,'新园乡',3,1,712491,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712492,712400,'枋寮乡',3,1,712492,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712493,712400,'枋山乡',3,1,712493,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712494,712400,'春日乡',3,1,712494,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712495,712400,'狮子乡',3,1,712495,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712496,712400,'车城乡',3,1,712496,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712497,712400,'牡丹乡',3,1,712497,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712498,712400,'恒春镇',3,1,712498,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712499,712400,'满州乡',3,1,712499,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712500,710000,'台东县',2,0,712500,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712584,712500,'台东市',3,1,712584,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712585,712500,'绿岛乡',3,1,712585,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712586,712500,'兰屿乡',3,1,712586,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712587,712500,'延平乡',3,1,712587,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712588,712500,'卑南乡',3,1,712588,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712589,712500,'鹿野乡',3,1,712589,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712590,712500,'关山镇',3,1,712590,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712591,712500,'海端乡',3,1,712591,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712592,712500,'池上乡',3,1,712592,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712593,712500,'东河乡',3,1,712593,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712594,712500,'成功镇',3,1,712594,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712595,712500,'长滨乡',3,1,712595,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712596,712500,'金峰乡',3,1,712596,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712597,712500,'大武乡',3,1,712597,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712598,712500,'达仁乡',3,1,712598,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712599,712500,'太麻里乡',3,1,712599,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712600,710000,'花莲县',2,0,712600,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712686,712600,'花莲市',3,1,712686,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712687,712600,'新城乡',3,1,712687,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712688,712600,'太鲁阁',3,1,712688,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712689,712600,'秀林乡',3,1,712689,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712690,712600,'吉安乡',3,1,712690,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712691,712600,'寿丰乡',3,1,712691,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712692,712600,'凤林镇',3,1,712692,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712693,712600,'光复乡',3,1,712693,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712694,712600,'丰滨乡',3,1,712694,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712695,712600,'瑞穗乡',3,1,712695,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712696,712600,'万荣乡',3,1,712696,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712697,712600,'玉里镇',3,1,712697,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712698,712600,'卓溪乡',3,1,712698,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712699,712600,'富里乡',3,1,712699,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712700,710000,'澎湖县',2,0,712700,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712794,712700,'马公市',3,1,712794,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712795,712700,'西屿乡',3,1,712795,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712796,712700,'望安乡',3,1,712796,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712797,712700,'七美乡',3,1,712797,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712798,712700,'白沙乡',3,1,712798,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712799,712700,'湖西乡',3,1,712799,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712800,710000,'连江县',2,0,712800,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712896,712800,'南竿乡',3,1,712896,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712897,712800,'北竿乡',3,1,712897,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712898,712800,'东引乡',3,1,712898,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (712899,712800,'莒光乡',3,1,712899,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810000,0,'香港特别行政区',1,0,810000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810100,810000,'香港岛',2,0,810100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810101,810100,'中西区',3,1,810101,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810102,810100,'湾仔区',3,1,810102,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810103,810100,'东区',3,1,810103,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810104,810100,'南区',3,1,810104,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810200,810000,'九龙',2,0,810200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810201,810200,'九龙城区',3,1,810201,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810202,810200,'油尖旺区',3,1,810202,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810203,810200,'深水埗区',3,1,810203,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810204,810200,'黄大仙区',3,1,810204,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810205,810200,'观塘区',3,1,810205,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810300,810000,'新界',2,0,810300,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810301,810300,'北区',3,1,810301,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810302,810300,'大埔区',3,1,810302,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810303,810300,'沙田区',3,1,810303,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810304,810300,'西贡区',3,1,810304,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810305,810300,'元朗区',3,1,810305,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810306,810300,'屯门区',3,1,810306,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810307,810300,'荃湾区',3,1,810307,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810308,810300,'葵青区',3,1,810308,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (810309,810300,'离岛区',3,1,810309,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (820000,0,'澳门特别行政区',1,0,820000,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (820100,820000,'澳门半岛',2,0,820100,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (820101,820100,'澳门半岛',3,1,820101,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (820200,820000,'离岛',2,0,820200,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
INSERT INTO `system_region` VALUES (820201,820200,'离岛',3,1,820201,1683566875800000001,'2023-05-09 07:16:27',1683566875800000001,'2023-05-09 07:16:27');
/*!40000 ALTER TABLE `system_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role`
--

DROP TABLE IF EXISTS `system_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_role` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `comment` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `sub_system_id` bigint(20) DEFAULT NULL COMMENT '租户编码',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_dept_id` (`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role`
--

LOCK TABLES `system_role` WRITE;
/*!40000 ALTER TABLE `system_role` DISABLE KEYS */;
INSERT INTO `system_role` VALUES (1125415693534105602,'默认租户角色','',NULL,NULL,1683566875800000001,'2019-10-21 15:59:50',NULL,NULL);
INSERT INTO `system_role` VALUES (1656101940255309825,'用户管理员','',NULL,1001,1683566875800000001,'2023-05-10 09:00:46',1683566875800000001,'2023-05-10 09:03:02');
INSERT INTO `system_role` VALUES (1656105587387187201,'BISTU二手店管理员','',NULL,1001,1683566875800000001,'2023-05-10 09:15:15',1683566875800000001,'2023-05-14 22:49:21');
INSERT INTO `system_role` VALUES (1657760099982118914,'课本专卖店管理员','',NULL,1001,1683566875800000001,'2023-05-14 22:49:42',1683566875800000001,'2023-05-14 22:49:42');
INSERT INTO `system_role` VALUES (1683560532692553730,'系统管理员','',NULL,1001,1683566875800000001,'2023-04-24 09:27:46',NULL,NULL);
/*!40000 ALTER TABLE `system_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role_data_scope`
--

DROP TABLE IF EXISTS `system_role_data_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_role_data_scope` (
  `update_date` datetime DEFAULT NULL,
  `updater_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL COMMENT 'id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`,`updater_id`) USING BTREE,
  KEY `idx_role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色数据权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role_data_scope`
--

LOCK TABLES `system_role_data_scope` WRITE;
/*!40000 ALTER TABLE `system_role_data_scope` DISABLE KEYS */;
INSERT INTO `system_role_data_scope` VALUES ('2023-05-10 09:03:02',1683566875800000001,1656102511968305154,1656101940255309825,1683560269189599233,1683566875800000001,'2023-05-10 09:03:02');
INSERT INTO `system_role_data_scope` VALUES ('2023-05-10 09:03:02',1683566875800000001,1656102511976693762,1656101940255309825,1650384491958087682,1683566875800000001,'2023-05-10 09:03:02');
INSERT INTO `system_role_data_scope` VALUES ('2023-05-14 22:49:21',1683566875800000001,1657760014258933761,1656105587387187201,1656105426841812994,1683566875800000001,'2023-05-14 22:49:21');
INSERT INTO `system_role_data_scope` VALUES ('2023-05-14 22:49:42',1683566875800000001,1657760100003090434,1657760099982118914,1657759458853392386,1683566875800000001,'2023-05-14 22:49:42');
INSERT INTO `system_role_data_scope` VALUES (NULL,0,1683560547511029761,1683560532692553730,1683560269189599233,1683566875800000001,'2023-04-24 09:27:50');
/*!40000 ALTER TABLE `system_role_data_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role_menu`
--

DROP TABLE IF EXISTS `system_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_role_menu` (
  `update_date` datetime DEFAULT NULL,
  `updater_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL COMMENT 'id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_role_id` (`role_id`) USING BTREE,
  KEY `idx_menu_id` (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role_menu`
--

LOCK TABLES `system_role_menu` WRITE;
/*!40000 ALTER TABLE `system_role_menu` DISABLE KEYS */;
INSERT INTO `system_role_menu` VALUES ('2023-05-10 09:03:02',1683566875800000001,1656102511930556418,1656101940255309825,1683566875800000002,1683566875800000001,'2023-05-10 09:03:02');
INSERT INTO `system_role_menu` VALUES ('2023-05-10 09:03:02',1683566875800000001,1656102511943139329,1656101940255309825,1683566875800000055,1683566875800000001,'2023-05-10 09:03:02');
INSERT INTO `system_role_menu` VALUES ('2023-05-10 09:03:02',1683566875800000001,1656102511943139330,1656101940255309825,1683566875800000056,1683566875800000001,'2023-05-10 09:03:02');
INSERT INTO `system_role_menu` VALUES ('2023-05-10 09:03:02',1683566875800000001,1656102511951527937,1656101940255309825,1683566875800000003,1683566875800000001,'2023-05-10 09:03:02');
INSERT INTO `system_role_menu` VALUES ('2023-05-10 09:03:02',1683566875800000001,1656102511955722242,1656101940255309825,1683566875800000004,1683566875800000001,'2023-05-10 09:03:02');
INSERT INTO `system_role_menu` VALUES ('2023-05-10 09:03:02',1683566875800000001,1656102511959916546,1656101940255309825,1683566875800000005,1683566875800000001,'2023-05-10 09:03:02');
INSERT INTO `system_role_menu` VALUES ('2023-05-10 09:03:02',1683566875800000001,1656102511964110849,1656101940255309825,1683566875800000006,1683566875800000001,'2023-05-10 09:03:02');
INSERT INTO `system_role_menu` VALUES ('2023-05-14 22:49:21',1683566875800000001,1657760014237962242,1656105587387187201,1656103021190365186,1683566875800000001,'2023-05-14 22:49:21');
INSERT INTO `system_role_menu` VALUES ('2023-05-14 22:49:21',1683566875800000001,1657760014242156546,1656105587387187201,1656103641142050818,1683566875800000001,'2023-05-14 22:49:21');
INSERT INTO `system_role_menu` VALUES ('2023-05-14 22:49:21',1683566875800000001,1657760014242156547,1656105587387187201,1656103879089111042,1683566875800000001,'2023-05-14 22:49:21');
INSERT INTO `system_role_menu` VALUES ('2023-05-14 22:49:21',1683566875800000001,1657760014250545154,1656105587387187201,1656104065328791553,1683566875800000001,'2023-05-14 22:49:21');
INSERT INTO `system_role_menu` VALUES ('2023-05-14 22:49:42',1683566875800000001,1657760099990507522,1657760099982118914,1656103021190365186,1683566875800000001,'2023-05-14 22:49:42');
INSERT INTO `system_role_menu` VALUES ('2023-05-14 22:49:42',1683566875800000001,1657760099994701826,1657760099982118914,1656103641142050818,1683566875800000001,'2023-05-14 22:49:42');
INSERT INTO `system_role_menu` VALUES ('2023-05-14 22:49:42',1683566875800000001,1657760099998896129,1657760099982118914,1656103879089111042,1683566875800000001,'2023-05-14 22:49:42');
INSERT INTO `system_role_menu` VALUES ('2023-05-14 22:49:42',1683566875800000001,1657760099998896130,1657760099982118914,1656104065328791553,1683566875800000001,'2023-05-14 22:49:42');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560533640466434,1683560532692553730,1683566875800000002,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560533875347458,1683560532692553730,1683566875800000055,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560534047313921,1683560532692553730,1683566875800000056,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560534324137986,1683560532692553730,1683566875800000003,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560534546436097,1683560532692553730,1683566875800000004,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560534777122817,1683560532692553730,1683566875800000005,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560535041363969,1683560532692553730,1683566875800000006,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560535301410818,1683560532692553730,1683566875800000012,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560535536291841,1683560532692553730,1683566875800000014,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560535762784258,1683560532692553730,1683566875800000015,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560535997665282,1683560532692553730,1683566875800000016,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560536232546306,1683560532692553730,1683566875800000017,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560536459038722,1683560532692553730,1683566875800000007,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560536698114050,1683560532692553730,1683566875800000008,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560536932995073,1683560532692553730,1683566875800000009,1683566875800000001,'2023-04-24 09:27:47');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560537167876098,1683560532692553730,1683566875800000010,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560537411145729,1683560532692553730,1683566875800000011,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560537641832449,1683560532692553730,1683566875800000035,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560537876713473,1683560532692553730,1683566875800000025,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560538111594498,1683560532692553730,1683566875800000026,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560538338086913,1683560532692553730,1683566875800000027,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560538577162242,1683560532692553730,1683566875800000028,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560538812043266,1683560532692553730,1683566875800000029,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560539042729986,1683560532692553730,1683566875800000040,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560539277611009,1683560532692553730,1683566875800000059,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560539516686338,1683560532692553730,1683566875800000057,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560539747373057,1683560532692553730,1683566875800000060,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560539978059777,1683560532692553730,1683566875800000061,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560540204552194,1683560532692553730,1683566875800000058,1683566875800000001,'2023-04-24 09:27:48');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560541618032641,1683560532692553730,1683566875800000030,1683566875800000001,'2023-04-24 09:27:49');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560541857107969,1683560532692553730,1683566875800000031,1683566875800000001,'2023-04-24 09:27:49');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560542087794689,1683560532692553730,1683566875800000032,1683566875800000001,'2023-04-24 09:27:49');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560542318481409,1683560532692553730,1683566875800000033,1683566875800000001,'2023-04-24 09:27:49');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560542553362433,1683560532692553730,1683566875800000034,1683566875800000001,'2023-04-24 09:27:49');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560542788243458,1683560532692553730,1683566875800000036,1683566875800000001,'2023-04-24 09:27:49');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560543023124481,1683560532692553730,1683566875800000037,1683566875800000001,'2023-04-24 09:27:49');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560543253811202,1683560532692553730,1683566875800000038,1683566875800000001,'2023-04-24 09:27:49');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560543492886530,1683560532692553730,1683566875800000039,1683566875800000001,'2023-04-24 09:27:49');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560543945871362,1683560532692553730,1113375699198033921,1683566875800000001,'2023-04-24 09:27:49');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560544176558082,1683560532692553730,1113378406403162113,1683566875800000001,'2023-04-24 09:27:49');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560544407244801,1683560532692553730,1114779542196600833,1683566875800000001,'2023-04-24 09:27:49');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560545594232834,1683560532692553730,1683566875800000046,1683566875800000001,'2023-04-24 09:27:50');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560545820725250,1683560532692553730,1683566875800000048,1683566875800000001,'2023-04-24 09:27:50');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560546055606273,1683560532692553730,1683566875800000049,1683566875800000001,'2023-04-24 09:27:50');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560546290487298,1683560532692553730,1683566875800000050,1683566875800000001,'2023-04-24 09:27:50');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560546521174018,1683560532692553730,1683566875800000053,1683566875800000001,'2023-04-24 09:27:50');
INSERT INTO `system_role_menu` VALUES (NULL,NULL,1683560546747666434,1683560532692553730,1683566875800000051,1683566875800000001,'2023-04-24 09:27:50');
/*!40000 ALTER TABLE `system_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role_user`
--

DROP TABLE IF EXISTS `system_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_role_user` (
  `updater_id` bigint(20) NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `id` bigint(20) NOT NULL COMMENT 'id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`,`updater_id`) USING BTREE,
  KEY `idx_role_id` (`role_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色用户关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role_user`
--

LOCK TABLES `system_role_user` WRITE;
/*!40000 ALTER TABLE `system_role_user` DISABLE KEYS */;
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 09:01:37',1656102156459098113,1656101940255309825,1683566875800000001,1683566875800000001,'2023-05-10 09:01:37');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 09:16:08',1656105809299423233,1656105587387187201,1683566875800000001,1683566875800000001,'2023-05-10 09:16:08');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 09:52:24',1656114935735803905,1656105587387187201,1683566875800000001,1683566875800000001,'2023-05-10 09:52:24');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 09:52:53',1656115056988938242,1656105587387187201,1683566875800000001,1683566875800000001,'2023-05-10 09:52:53');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 10:10:27',1656119479622459393,1656105587387187201,1683566875800000001,1683566875800000001,'2023-05-10 10:10:27');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 10:13:02',1656120127411740674,1656105587387187201,1683566875800000001,1683566875800000001,'2023-05-10 10:13:02');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 10:13:13',1656120172626337794,1656105587387187201,1683566875800000001,1683566875800000001,'2023-05-10 10:13:13');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 10:13:36',1656120272031342594,1656105587387187201,1683566875800000001,1683566875800000001,'2023-05-10 10:13:36');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 10:15:23',1656120720024952833,1656105587387187201,1683566875800000001,1683566875800000001,'2023-05-10 10:15:23');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 10:16:31',1656121004608479234,1656105587387187201,1683566875800000001,1683566875800000001,'2023-05-10 10:16:31');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 10:16:52',1656121091048890370,1656105587387187201,1683566875800000001,1683566875800000001,'2023-05-10 10:16:52');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 10:18:28',1656121495740506113,1656105587387187201,1683566875800000001,1683566875800000001,'2023-05-10 10:18:28');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-10 10:22:32',1656122519343620097,1656105587387187201,1683566875800000001,1683566875800000001,'2023-05-10 10:22:32');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-14 16:51:29',1657669954557706241,1656105587387187201,1656105809286840321,1683566875800000001,'2023-05-14 16:51:29');
INSERT INTO `system_role_user` VALUES (1683566875800000001,'2023-05-14 22:50:00',1657760178000367617,1657760099982118914,1657759744837816322,1683566875800000001,'2023-05-14 22:50:00');
INSERT INTO `system_role_user` VALUES (0,NULL,1683561204938821634,1683560532692553730,1683566875800000001,1683566875800000001,'2023-04-24 09:30:27');
/*!40000 ALTER TABLE `system_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_user` (
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 后端 1前端',
  `id` varchar(20) NOT NULL COMMENT 'id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `real_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `head_url` varchar(200) DEFAULT NULL COMMENT '头像',
  `gender` tinyint(3) unsigned DEFAULT NULL COMMENT '性别   0：男   1：女    2：保密',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `super_admin` tinyint(3) unsigned DEFAULT NULL COMMENT '超级管理员   0：否   1：是',
  `super_sub_system` tinyint(3) unsigned DEFAULT NULL COMMENT '租户管理员   0：否   1：是',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：停用   1：正常',
  `sub_system_id` bigint(20) DEFAULT 1001 COMMENT '租户编码',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_username` (`username`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user`
--

LOCK TABLES `system_user` WRITE;
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
INSERT INTO `system_user` VALUES (0,'1656102156412960769','useradmin','$2a$10$m8SqxhBX7oiLnyjrml99A.EhMY9ZVWQlJD2gNjqK.L2COY/AFkKFy','用户管理员',NULL,0,'user@sdev.com','18800001111',1650384491958087682,0,0,1,1001,1683566875800000001,'2023-05-10 09:01:37',1683566875800000001,'2023-05-10 09:01:37');
INSERT INTO `system_user` VALUES (0,'1656105809286840321','bistu_admin','$2a$10$PE3scpEhuqf5HQ3hDimUi.VkMqazpvkEH6p6LO5T9q6PdTqQNoQpu','BISTU二手店管理员',NULL,0,'bistu_admin@sdev.com','18800001111',1656105426841812994,0,0,1,1001,1683566875800000001,'2023-05-10 09:16:08',1683566875800000001,'2023-05-14 16:51:29');
INSERT INTO `system_user` VALUES (0,'1657759744837816322','book_admin','$2a$10$eVmeltGHKoid/SLk1b12le31M1fZM1XAHJ3pNBiJ1xd2bvQnkoShW','课本专卖店',NULL,0,'book@sdev.com','18800001111',1657759458853392386,0,0,1,1001,1683566875800000001,'2023-05-14 22:48:17',1683566875800000001,'2023-05-14 22:50:00');
INSERT INTO `system_user` VALUES (0,'1683561204460670978','tccadmin','$2a$10$0/cngqjuf59zc3ikH4J0jew58CU9nZvoaLOI.o68d/WtNXQnfSkVe','tccadmin',NULL,0,'tccadmin@timbercld.com','13869542135',1683560269189599233,0,0,1,1001,1683566875800000001,'2023-04-24 09:30:27',NULL,NULL);
INSERT INTO `system_user` VALUES (0,'1683566875800000001','admin','$2a$10$012Kx2ba5jzqr9gLlG4MX.bnQJTD9UWqF57XDo2N3.fPtLne02u/m','系统超级管理员',NULL,0,'admin@timbercld.com','13612345678',NULL,1,1,1,1001,1683566875800000001,'2019-10-21 15:59:47',1683566875800000001,'2019-10-21 15:59:47');
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-15  0:25:14
