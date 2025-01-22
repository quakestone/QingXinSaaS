/*
 Navicat Premium Data Transfer

 Source Server         : mysql-8.0.29
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:3306
 Source Schema         : ry-cloud

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 17/01/2025 11:52:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_app_appdef
-- ----------------------------
DROP TABLE IF EXISTS `act_app_appdef`;
CREATE TABLE `act_app_appdef`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VERSION_` int NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_APP_DEF_UNIQ`(`KEY_` ASC, `VERSION_` ASC, `TENANT_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_APP_DEF_DPLY`(`DEPLOYMENT_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_APP_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_appdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_app_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_app_databasechangelog`;
CREATE TABLE `act_app_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_databasechangelog
-- ----------------------------
INSERT INTO `act_app_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2025-01-13 17:19:01', 1, 'EXECUTED', '8:496fc778bdf2ab13f2e1926d0e63e0a2', 'createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...', '', NULL, '4.9.1', NULL, NULL, '6759924933');
INSERT INTO `act_app_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2025-01-13 17:19:07', 2, 'EXECUTED', '8:ccea9ebfb6c1f8367ca4dd473fcbb7db', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT', '', NULL, '4.9.1', NULL, NULL, '6759924933');
INSERT INTO `act_app_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2025-01-13 17:19:08', 3, 'EXECUTED', '8:f1f8aff320aade831944ebad24355f3d', 'createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF', '', NULL, '4.9.1', NULL, NULL, '6759924933');

-- ----------------------------
-- Table structure for act_app_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_app_databasechangeloglock`;
CREATE TABLE `act_app_databasechangeloglock`  (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_databasechangeloglock
-- ----------------------------
INSERT INTO `act_app_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_app_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_app_deployment`;
CREATE TABLE `act_app_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_app_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_app_deployment_resource`;
CREATE TABLE `act_app_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_APP_RSRC_DPL`(`DEPLOYMENT_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_APP_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_casedef
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_casedef`;
CREATE TABLE `act_cmmn_casedef`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VERSION_` int NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_CASE_DEF_UNIQ`(`KEY_` ASC, `VERSION_` ASC, `TENANT_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_CASE_DEF_DPLY`(`DEPLOYMENT_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_CASE_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_casedef
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_databasechangelog`;
CREATE TABLE `act_cmmn_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_databasechangelog
-- ----------------------------
INSERT INTO `act_cmmn_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:16:53', 1, 'EXECUTED', '8:8b4b922d90b05ff27483abefc9597aa6', 'createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:16:57', 2, 'EXECUTED', '8:65e39b3d385706bb261cbeffe7533cbe', 'addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:17:07', 3, 'EXECUTED', '8:c01f6e802b49436b4489040da3012359', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:17:10', 4, 'EXECUTED', '8:e40d29cb79345b7fb5afd38a7f0ba8fc', 'createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:18:16', 5, 'EXECUTED', '8:70349de472f87368dcdec971a10311a0', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:18:17', 6, 'EXECUTED', '8:10e82e26a7fee94c32a92099c059c18c', 'createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('7', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:18:22', 7, 'EXECUTED', '8:530bc81a1e30618ccf4a2da1f7c6c043', 'renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('8', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:18:23', 8, 'EXECUTED', '8:e8c2eb1ce28bc301efe07e0e29757781', 'addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('9', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:18:26', 9, 'EXECUTED', '8:4cb4782b9bdec5ced2a64c525aa7b3a0', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('10', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:18:31', 10, 'EXECUTED', '8:341c16be247f5d17badc9809da8691f9', 'addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_CASE_INST_REF_ID_, tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE...', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('11', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:18:33', 11, 'EXECUTED', '8:d7c4da9276bcfffbfb0ebfb25e3f7b05', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('12', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:18:35', 12, 'EXECUTED', '8:adf4ecc45f2aa9a44a5626b02e1d6f98', 'addColumn tableName=ACT_CMMN_RU_CASE_INST', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('13', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:18:36', 13, 'EXECUTED', '8:7550626f964ab5518464709408333ec1', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('14', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:18:38', 14, 'EXECUTED', '8:086b40b3a05596dcc8a8d7479922d494', 'addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('16', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:18:39', 15, 'EXECUTED', '8:a697a222ddd99dd15b36516a252f1c63', 'addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST', '', NULL, '4.9.1', NULL, NULL, '6759757378');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('17', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-01-13 17:18:41', 16, 'EXECUTED', '8:d3706c5813a9b97fd2a59d12a9523946', 'createIndex indexName=ACT_IDX_HI_CASE_INST_END, tableName=ACT_CMMN_HI_CASE_INST', '', NULL, '4.9.1', NULL, NULL, '6759757378');

-- ----------------------------
-- Table structure for act_cmmn_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_databasechangeloglock`;
CREATE TABLE `act_cmmn_databasechangeloglock`  (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_databasechangeloglock
-- ----------------------------
INSERT INTO `act_cmmn_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_cmmn_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_deployment`;
CREATE TABLE `act_cmmn_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_deployment_resource`;
CREATE TABLE `act_cmmn_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  `GENERATED_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_CMMN_RSRC_DPL`(`DEPLOYMENT_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_CMMN_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_hi_case_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_case_inst`;
CREATE TABLE `act_cmmn_hi_case_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_REACTIVATION_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_REACTIVATION_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_CASE_INST_END`(`END_TIME_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_hi_case_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_hi_mil_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_mil_inst`;
CREATE TABLE `act_cmmn_hi_mil_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_hi_mil_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_hi_plan_item_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_plan_item_inst`;
CREATE TABLE `act_cmmn_hi_plan_item_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_STAGE_` bit(1) NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) NULL DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) NULL DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `EXIT_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SHOW_IN_OVERVIEW_` bit(1) NULL DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_hi_plan_item_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_case_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_case_inst`;
CREATE TABLE `act_cmmn_ru_case_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `LOCK_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_REACTIVATION_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_REACTIVATION_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_CASE_DEF`(`CASE_DEF_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_PARENT`(`PARENT_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_REF_ID_`(`REFERENCE_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_CASE_INST_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_case_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_mil_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_mil_inst`;
CREATE TABLE `act_cmmn_ru_mil_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_MIL_CASE_DEF`(`CASE_DEF_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_MIL_CASE_INST`(`CASE_INST_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_MIL_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MIL_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_mil_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_plan_item_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_plan_item_inst`;
CREATE TABLE `act_cmmn_ru_plan_item_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_STAGE_` bit(1) NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) NULL DEFAULT NULL,
  `VAR_COUNT_` int NULL DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int NULL DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) NULL DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) NULL DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `EXIT_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_CASE_DEF`(`CASE_DEF_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_CASE_INST`(`CASE_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_STAGE_INST`(`STAGE_INST_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_plan_item_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_sentry_part_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_sentry_part_inst`;
CREATE TABLE `act_cmmn_ru_sentry_part_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ON_PART_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IF_PART_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_CASE_DEF`(`CASE_DEF_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_SENTRY_CASE_INST`(`CASE_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_SENTRY_PLAN_ITEM`(`PLAN_ITEM_INST_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_SENTRY_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SENTRY_PLAN_ITEM` FOREIGN KEY (`PLAN_ITEM_INST_ID_`) REFERENCES `act_cmmn_ru_plan_item_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_sentry_part_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_co_content_item
-- ----------------------------
DROP TABLE IF EXISTS `act_co_content_item`;
CREATE TABLE `act_co_content_item`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MIME_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FIELD_` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) NULL DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_SIZE_` bigint NULL DEFAULT 0,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `idx_contitem_taskid`(`TASK_ID_` ASC) USING BTREE,
  INDEX `idx_contitem_procid`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `idx_contitem_scope`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_content_item
-- ----------------------------

-- ----------------------------
-- Table structure for act_co_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_co_databasechangelog`;
CREATE TABLE `act_co_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_databasechangelog
-- ----------------------------
INSERT INTO `act_co_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2025-01-13 17:15:51', 1, 'EXECUTED', '8:7644d7165cfe799200a2abdd3419e8b6', 'createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '4.9.1', NULL, NULL, '6759750371');
INSERT INTO `act_co_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2025-01-13 17:15:53', 2, 'EXECUTED', '8:fe7b11ac7dbbf9c43006b23bbab60bab', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '4.9.1', NULL, NULL, '6759750371');

-- ----------------------------
-- Table structure for act_co_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_co_databasechangeloglock`;
CREATE TABLE `act_co_databasechangeloglock`  (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_databasechangeloglock
-- ----------------------------
INSERT INTO `act_co_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_dmn_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_databasechangelog`;
CREATE TABLE `act_dmn_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_databasechangelog
-- ----------------------------
INSERT INTO `act_dmn_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-01-13 17:15:02', 1, 'EXECUTED', '8:c8701f1c71018b55029f450b2e9a10a1', 'createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE', '', NULL, '4.9.1', NULL, NULL, '6759697740');
INSERT INTO `act_dmn_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-01-13 17:15:03', 2, 'EXECUTED', '8:47f94b27feb7df8a30d4e338c7bd5fb8', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '4.9.1', NULL, NULL, '6759697740');
INSERT INTO `act_dmn_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-01-13 17:15:04', 3, 'EXECUTED', '8:ac17eae89fbdccb6e08daf3c7797b579', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '4.9.1', NULL, NULL, '6759697740');
INSERT INTO `act_dmn_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-01-13 17:15:07', 4, 'EXECUTED', '8:f73aabc4529e7292c2942073d1cff6f9', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '4.9.1', NULL, NULL, '6759697740');
INSERT INTO `act_dmn_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-01-13 17:15:15', 5, 'EXECUTED', '8:3e03528582dd4eeb4eb41f9b9539140d', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '4.9.1', NULL, NULL, '6759697740');
INSERT INTO `act_dmn_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-01-13 17:15:19', 6, 'EXECUTED', '8:646c6a061e0b6e8a62e69844ff96abb0', 'createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '4.9.1', NULL, NULL, '6759697740');
INSERT INTO `act_dmn_databasechangelog` VALUES ('7', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-01-13 17:15:25', 7, 'EXECUTED', '8:215a499ff7ae77685b55355245b8b708', 'dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION', '', NULL, '4.9.1', NULL, NULL, '6759697740');
INSERT INTO `act_dmn_databasechangelog` VALUES ('8', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-01-13 17:15:26', 8, 'EXECUTED', '8:5355bee389318afed91a11702f2df032', 'addColumn tableName=ACT_DMN_DECISION', '', NULL, '4.9.1', NULL, NULL, '6759697740');
INSERT INTO `act_dmn_databasechangelog` VALUES ('9', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-01-13 17:15:27', 9, 'EXECUTED', '8:0fe82086431b1953d293f0199f805876', 'createIndex indexName=ACT_IDX_DMN_INSTANCE_ID, tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '4.9.1', NULL, NULL, '6759697740');

-- ----------------------------
-- Table structure for act_dmn_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_databasechangeloglock`;
CREATE TABLE `act_dmn_databasechangeloglock`  (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_databasechangeloglock
-- ----------------------------
INSERT INTO `act_dmn_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_dmn_decision
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_decision`;
CREATE TABLE `act_dmn_decision`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DECISION_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_DMN_DEC_UNIQ`(`KEY_` ASC, `VERSION_` ASC, `TENANT_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_decision
-- ----------------------------

-- ----------------------------
-- Table structure for act_dmn_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_deployment`;
CREATE TABLE `act_dmn_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_dmn_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_deployment_resource`;
CREATE TABLE `act_dmn_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_dmn_hi_decision_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_hi_decision_execution`;
CREATE TABLE `act_dmn_hi_decision_execution`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FAILED_` bit(1) NULL DEFAULT b'0',
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXECUTION_JSON_` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_DMN_INSTANCE_ID`(`INSTANCE_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_hi_decision_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log`  (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` longblob NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_databasechangelog`;
CREATE TABLE `act_fo_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_databasechangelog
-- ----------------------------
INSERT INTO `act_fo_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2025-01-13 17:15:36', 1, 'EXECUTED', '8:033ebf9380889aed7c453927ecc3250d', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', NULL, '4.9.1', NULL, NULL, '6759731854');
INSERT INTO `act_fo_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2025-01-13 17:15:36', 2, 'EXECUTED', '8:986365ceb40445ce3b27a8e6b40f159b', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', NULL, '4.9.1', NULL, NULL, '6759731854');
INSERT INTO `act_fo_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2025-01-13 17:15:38', 3, 'EXECUTED', '8:abf482518ceb09830ef674e52c06bf15', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '4.9.1', NULL, NULL, '6759731854');
INSERT INTO `act_fo_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2025-01-13 17:15:42', 4, 'EXECUTED', '8:2087829f22a4b2298dbf530681c74854', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE', '', NULL, '4.9.1', NULL, NULL, '6759731854');
INSERT INTO `act_fo_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2025-01-13 17:15:43', 5, 'EXECUTED', '8:b4be732b89e5ca028bdd520c6ad4d446', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '4.9.1', NULL, NULL, '6759731854');
INSERT INTO `act_fo_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2025-01-13 17:15:46', 6, 'EXECUTED', '8:384bbd364a649b67c3ca1bcb72fe537f', 'createIndex indexName=ACT_IDX_FORM_TASK, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_PROC, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_SCOPE, tableName=ACT_FO_FORM_INSTANCE', '', NULL, '4.9.1', NULL, NULL, '6759731854');

-- ----------------------------
-- Table structure for act_fo_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_databasechangeloglock`;
CREATE TABLE `act_fo_databasechangeloglock`  (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_databasechangeloglock
-- ----------------------------
INSERT INTO `act_fo_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_fo_form_definition
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_definition`;
CREATE TABLE `act_fo_form_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_FORM_DEF_UNIQ`(`KEY_` ASC, `VERSION_` ASC, `TENANT_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_definition
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_form_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_deployment`;
CREATE TABLE `act_fo_form_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_form_instance
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_instance`;
CREATE TABLE `act_fo_form_instance`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FORM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SUBMITTED_DATE_` datetime(3) NULL DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_FORM_TASK`(`TASK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_FORM_PROC`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_FORM_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_instance
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_form_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_resource`;
CREATE TABLE `act_fo_form_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  `GENERATED_` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_BYTEARR_DEPL`(`DEPLOYMENT_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------
INSERT INTO `act_ge_bytearray` VALUES ('10', 1, 'hist.detail.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000047704000000047371007E00003F4000000000000C7708000000100000000574000474797065740005726164696F74000469636F6E74000B726164696F2D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F400000000000307708000000400000001A7400046E616D6574000A726164696F36343838367400056C6162656C74000CE8AFB7E58187E7B1BBE59E8B74000A6C6162656C416C69676E74000074000C64656661756C7456616C75657074000B636F6C756D6E5769647468740005323030707874000473697A6571007E001574000C646973706C61795374796C65740006696E6C696E6574000B627574746F6E5374796C6571007E000D740006626F726465727371007E000C0074000A6C6162656C57696474687074000B6C6162656C48696464656E71007E001E74000864697361626C656471007E001E74000668696464656E71007E001E74000B6F7074696F6E4974656D737371007E0004000000037704000000037371007E00003F400000000000037708000000040000000271007E0012740006E4BA8BE5818774000576616C7565737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000178007371007E00003F400000000000037708000000040000000271007E0012740006E79785E5818771007E00277371007E00280000000278007371007E00003F400000000000037708000000040000000271007E0012740006E5B9B4E5818771007E00277371007E002800000003780078740008726571756972656471007E000D74000C726571756972656448696E7471007E001574000A76616C69646174696F6E71007E001574000E76616C69646174696F6E48696E7471007E001574000B637573746F6D436C6173737371007E0004000000007704000000007874000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096F6E4372656174656471007E00157400096F6E4D6F756E74656471007E00157400086F6E4368616E676571007E001574000A6F6E56616C696461746571007E00157800740002696474000A726164696F363438383678007371007E00003F4000000000000C7708000000100000000571007E000774000A646174652D72616E676571007E0009740010646174652D72616E67652D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000002071007E001074000E6461746572616E6765353939343571007E001274000CE8AFB7E58187E697A5E69C9F71007E001471007E001571007E00077400096461746572616E676571007E0016707400107374617274506C616365686F6C64657271007E001574000E656E64506C616365686F6C64657271007E001571007E0017740005323030707871007E001971007E001571007E001F71007E001571007E002071007E001E740008726561646F6E6C7971007E001E71007E002171007E001E71007E002271007E001E740009636C65617261626C6571007E000D7400086564697461626C6571007E001E740006666F726D617474000A797979792D4D4D2D646474000B76616C7565466F726D617474000A797979792D4D4D2D646471007E003171007E000D71007E003271007E001571007E003371007E001571007E003471007E001571007E003571007E001571007E00377071007E00387400047265617271007E003A7071007E003B71007E001571007E003C71007E001571007E003D71007E00157400076F6E466F63757371007E00157400066F6E426C757271007E001571007E003E71007E0015780071007E003F74000E6461746572616E6765353939343578007371007E00003F4000000000000C7708000000100000000571007E0007740005696E70757471007E000974000A746578742D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000002971007E001074000364617971007E001274000CE8AFB7E58187E5A4A9E695B071007E001471007E001571007E00077400047465787471007E001671007E001574000B706C616365686F6C64657271007E001571007E0017740005323030707871007E001971007E001571007E001F7071007E002071007E001E71007E004B71007E000D71007E002171007E000D71007E002271007E000D71007E004C71007E000D74000C73686F7750617373776F726471007E001E71007E003171007E001E71007E003271007E001571007E003371007E001571007E003471007E001571007E00357371007E0004000000007704000000007871007E00377071007E00387400047265617271007E003A707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E001E74000A70726566697849636F6E71007E001574000A73756666697849636F6E71007E001574000C617070656E64427574746F6E71007E001E740014617070656E64427574746F6E44697361626C656471007E001E74000A627574746F6E49636F6E74000E656C2D69636F6E2D73656172636871007E003B71007E001571007E003C71007E00157400076F6E496E70757471007E001571007E003D71007E001571007E005371007E001571007E005471007E001571007E003E71007E00157400136F6E417070656E64427574746F6E436C69636B71007E001574000B70726570656E645465787471007E001574000A617070656E645465787471007E0015780071007E003F74000A696E707574373334323478007371007E00003F4000000000000C7708000000100000000571007E0007740008746578746172656171007E000974000E74657874617265612D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000001F71007E001074000D7465787461726561363937313271007E001274000CE8AFB7E58187E5A487E6B3A871007E001471007E0015740004726F777371007E003071007E001671007E001571007E005D71007E001571007E0017740005323030707871007E001971007E001571007E001F7071007E002071007E001E71007E004B71007E001E71007E002171007E001E71007E002271007E001E71007E003171007E000D71007E003271007E001571007E003371007E001571007E003471007E001571007E003571007E001571007E00377071007E00387400047265617271007E003A7071007E00627071007E00637071007E006471007E001E71007E003B71007E001571007E003C71007E001571007E006B71007E001571007E003D71007E001571007E005371007E001571007E005471007E001571007E003E71007E0015780071007E003F74000D7465787461726561363937313278007874000A666F726D436F6E6669677371007E00003F400000000000187708000000200000000F7400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E001F7371007E00280000005074000D6C6162656C506F736974696F6E7400046C65667471007E001971007E001571007E00147400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001571007E003571007E001574000966756E6374696F6E7371007E001574000A6C61796F757454797065740002504374000D6F6E466F726D4372656174656471007E001574000D6F6E466F726D4D6F756E74656471007E00157400106F6E466F726D446174614368616E676571007E001574000E6F6E466F726D56616C696461746571007E001578007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('16', 1, 'hist.var-daterange59945', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30312D303174000A323032352D30312D303278, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('17', 1, 'hist.detail.var-daterange59945', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30312D303174000A323032352D30312D303278, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('2', 1, 'flow_74orozzh.bpmn', '1', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726270347262657622206E616D653D22666C6F775F37346F726F7A7A68223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C6F7574676F696E673E466C6F775F316A3273306D643C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3179766338633622206E616D653D2231223E0A2020202020203C696E636F6D696E673E466C6F775F316A3273306D643C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F307939376763363C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F316A3273306D642220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3179766338633622202F3E0A202020203C757365725461736B2069643D2241637469766974795F316F6670777A3822206E616D653D22322220666C6F7761626C653A61737369676E65653D22312220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F307939376763363C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F3070786F3732703C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F307939376763362220736F757263655265663D2241637469766974795F3179766338633622207461726765745265663D2241637469766974795F316F6670777A3822202F3E0A202020203C656E644576656E742069643D224576656E745F30783074726A61223E0A2020202020203C696E636F6D696E673E466C6F775F3070786F3732703C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F3070786F3732702220736F757263655265663D2241637469766974795F316F6670777A3822207461726765745265663D224576656E745F30783074726A6122202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F7262703472626576223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D223234302220793D22323030222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223234322220793D22323337222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F317976633863365F6469222062706D6E456C656D656E743D2241637469766974795F31797663386336223E0A20202020202020203C6F6D6764633A426F756E647320783D223332302220793D22313735222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F316F6670777A385F6469222062706D6E456C656D656E743D2241637469766974795F316F6670777A38223E0A20202020202020203C6F6D6764633A426F756E647320783D223437302220793D22313735222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F30783074726A615F6469222062706D6E456C656D656E743D224576656E745F30783074726A61223E0A20202020202020203C6F6D6764633A426F756E647320783D223632322220793D22313937222077696474683D22333622206865696768743D22333622202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F316A3273306D645F6469222062706D6E456C656D656E743D22466C6F775F316A3273306D64223E0A20202020202020203C64693A776179706F696E7420783D223237302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223332302220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F307939376763365F6469222062706D6E456C656D656E743D22466C6F775F30793937676336223E0A20202020202020203C64693A776179706F696E7420783D223432302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223437302220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F3070786F3732705F6469222062706D6E456C656D656E743D22466C6F775F3070786F373270223E0A20202020202020203C64693A776179706F696E7420783D223537302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223632322220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('3', 1, 'flow_74orozzh.flow_rbp4rbev.png', '1', 0x89504E470D0A1A0A0000000D494844520000029C0000010908060000003908F7C800000DE44944415478DAEDDDDF6F95F51D07702EBCF042132F7631132F966CC9FC0376B18BC578B10B2F4CE605A5D01668AAE94127883F88042510340182860B962C449246D3B91982C23A26D0C2CA8F5232904081C06060050EAD75048DAEA5803C7BBE273DECA1505A38EDF9F19CD72BF944691934DDDBE7FBEEF7F9356D1A00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FC5F14450F9D3B776EE38103077EDCB97367D4DEDE6E8A3C1D1D1DD19E3D7BFE134F835C19B90220754229D8BB776F343030100D0F0F9B12CD37DF7C13EDDEBDFBBBB8244C972B235700A44AD881520ACAA61C0CB7B7B79F942B235700A44A38DD69512E9F898BC175B932720540AA846BBD2CC865550C22B9327205405516CE1FBEED8BCE1D6C894E74ACC84DF8F7F0318BB9622057720500051783EFAF64A3E3DB974647B72EBA6DC2C7C2E72CE88A815CC9150014540C2E9CF8EB1DA5203F174FB459D01503B9922B0028AC189CFCC7EA318B41F89C055D31902BB90280828AC1F1F6E5631683F0390BBA6220577205008A81622057720500E55B0CC2DDC3631583F0390BBA622057720500051583335D7F18B31884CF59D01503B9922B0028A8185CCEF644C7772CBBF3B467FCB1F0390BBA622057720500051583305F1EFAE88E62103E6631570CE44AAE00A0F06270F56A7466FF1FEF3CED197F2C7CCE82AE18C8955C01C0031783F0C697D35DEBC6BCD62E7CCE5B611403B9922B00B8FF6270F56AD4776657746CDB92314B417EC2EF09BFD7AE94622057720500132A06E3ED3ED995520CE44AAE00A0A0623091DDA77BED4A59E01503B9922B00B8673178D052901F0BBC622057720500F72C064631902BB94A93C6C6C6C766CE9C393D9E75F174C7D3174F9498F0EBEEDADADA0F66CD9AD510CF4FAC0E008A8162205746E11C575C209F8D8B645B5C206F8C2A98E34EFCBF698FE7B9A79F7EFA212B058062A018C89551386F1317C65FC565F1C0FD96CC31E660FC673D63B500500C1403B9320AE7B4B01B1997C39577DBD17CF3CD37A38D1B37465D5D5DD1F9F3E7A3A1A1A128B876ED5AEED7070E1C883EFDF4D368E9D2A56315CF758D8D8D0F5B358031C5C794877B7A7A321F7EF8E1EE55AB567DB760C182EBF181237710696868B8F9E28B2F0EBFF5D65BE756AF5EDD1ACF2F154EA318C8955C5596FAFAFA2746EF6ACE9E3D3B6A696989FAFAFAA2FBD1DBDB1B6DD8B021CAAF13893916FE1EAB2A7047D1DCB469D347EFBCF3CEF5850B1746EBD7AFCFFD149BCD666FFD741BFE393030107DF1C517515C48A3575E79E5E6ABAFBEDADBDCDCFC82C2691403B992ABF21717CD27EBEAEA2E25CBE1CA952B73C7F6425CBE7C395AB162C5E8D279219E9F5961819CB85836BDFBEEBB57172D5A942B93376EDC98F041E6C89123D1E2C58B6F64329993353535BF50388D6220577255BE3B9BC9B21976353B3B3BEFEB983F9EBD7BF7E6FE5CA51348EE6A3EB465CB965DF3E6CD8BDADADA0A3AE86CDBB62D6A6A6A1A4CF36EA762A018C8955C55AA916B366F9D468FCB6774EAD4A9682A84B363A34EB11FABA9A979C4AA0B555A36E39F6CFF397FFEFCE8F4E9D393729009D7F2C4E575F085175EF8BDC2691403B992ABF2116E104AEE6C4E55D94C96CE506A9337125979A10A859DCD50360BBD6E67B4F0E73537377F1F1E08AC701AC540AEE4AAF4461E7D74EB6EF4701ABD18C2E9F551CFEBF4C824A826E19ACD701A7DB27636EFB6D33967CE9C2BE1E27485D3280672255725DFDD3C90BC416832AFD91CCFA81B890E7A383C548970377A7C00180ED76C4EA5AD5BB70ED6D7D7772B9C4631902BB92A9D913708DD3A953ED967B52672F77AF27ACEF046222B315481CF3EFBEC4FE16EF4F000DFA9F6D24B2FF5A7E9D4BA62A018C8955C559AF0BACA7CD90BCFD92C85D6D6D6DB5E836925862AD8DD0CCFD90C8F3E2A86A3478F0EA769975331500CE44AAE2A496363E363C96B37EFF7A1EE93796D7FF206A2F86BFA891519522CBC4128DC2854CCEB779A9A9AFACBFD196CE127EE787EA318280672652AA5704E245FF1B1777AF27595A5947C0D661A6F2A0512C2EB2AC32BC88A69EDDAB547E203CC1BE5FC7D499EEAA9ADADFDB562A018C8955C95BB89E42B3C8A28FFFBC2BBD14B29BC7B3DFFB5C45FEF07566448B1F06EF4F06CB462DABF7F7F6FB886A8120EDC89F9FC6E3B078A81622057725549F98A3FD69DFF7C575757490B67587B125F6BB71519526CC18205D78B7D0D4F7F7FFF4078B559851DB86FED1C240FE08A81622057725549F98A7FDD97FFF8F9F3E74B5A38B3D96CF2EBECB322438A8547530C0D0D15F52013FEBEF8E032548907EEE4CE413865A51828067225579594AFE4AF8BF164927B097F7FF2EBB122438A85FFC84B610207C68A18C5A0BC46AE8C5C4D7CCA81C2095562EEDCB9378BBDC3393838D85FC13B9C07C34393F36FC6500CEC44C9955C5552BE921F2FF6B1DF0E2754B1F9F3E70F17FB1ACE4B972EFDAB02AFE1BCAD10E4A5A9181C3A74281CF0A39E9E1EC540AE0A9AB367CF464F3DF5542E4F61C2FBB315CEF2C857F21ACEF0CA61D7700245B174E9D233C5BE4B7DFBF6ED7FAFA0BBD4BBC36BD7C67AD76F5A0AE7A38F3E7AAB1C28067255E8841CCD983123B783D6D0D0205765942F77A90325B166CD9A0DC57E0EE7B265CBB656C07338EFBAF394D6C2192693C9E48AC1850B171403B92AB870861211FEFDE38F3F5638CB285FC9E7707EF2C9279EC30914C7DB6FBFFDF3975F7EF9C722BE6968A8AEAEEE6CB9BF6968A2D25438E7CD9BA770CAD594964FB92A8B52EA4D434069BCF6DA6BFF2ED6BBD4B76FDFDE1A1F5CF6A6E57BA7702A067235F66CDAB4293A7EFCB89B86CA4878977A7C0CBE9E2F7AE17ADB52BD4BBDAEAEEEA677A9431579FEF9E76B5E7FFDF5EB45D8E5BC121F600EA7E9275985533190ABB17736D3F2DF479A0AE7C82E675BBEE8AD5FBFBE2485B3B5B5F5B607D35B89A14A6432999EB6B6B6293DC084EB45C3EEE678D7AF2906A5993973E6E44AC2A953A71403B92A68923FB4841B87DE7BEF3D85B38C84EB3CF3656FF6ECD9B9DDC662BA7CF972141EC997289CCF5985A14A846B2A9B9A9A064F9F3E3D2507989E9E9E2DE1B117F181E5C9347DDFD278977A98702A543190AB079DC71F7FFCB63C4D73D350391EF36FDDADBE62C58AA888D7F1E7FEBEE4A39BD2B409014C404343437D2693F9EF64FFB47BF1E2C57D7575755FA5F1A2700FE8560CE44AAE2AD18C19337E9B7C666767676751CA667826EBA8F7BC3F63F5852A545F5FDFD4DCDCFCFD64ED74869DCD50366B6B6B17A7F1FBA518280672255715BCCBB9265FFCE2637FAE0C4EF573371B1A1A6E260AE73AAB2E54B1B81CCE8C0F0ADF6DDEBCF987024EB35C79FFFDF75B46DE6AD198D6EF9562A018C8955C55AA91575D76274BE7543D0C3E94CDB973E7FE98289BC76A6A6A1EB1E242950BD774D6D5D5EDCC6432FD870F1F1EBC9FE76CEED8B1E3CF71613D186E104ADB359B8A816220577295B2B35A4FC4C7EA33C9D2194EAF4FE6359D61E774D4CEE685B43C8B1998BCE2393D14CFC6C6C68155AB569DD8B76FDF57D96CB62FDC791A0C0E0EF68777A3777474FC6DF9F2E59FC707AB73A168865DCD6AB8105C31500CE44AAED2B0C1902C9DF91B890ABD9E3FDC8D3EEA0621651318FFA7E059B3662D8C0F141BE3F9329EA19183C7D0C801243CD7ED8D6A3B9028068A815CC9558A763ABB93E5303C32A9A5A525EAEBEBBBEF87BA87E76C261F7D943F8DAE6C0228068A815C992A2D9C41382B555B5BBB765449CCCD92254B72EF5E0FD778F6F6F646D7AE5DCB95CBF0CF6C369BBB4673F3E6CDB9D75526DF2094BC41C8359B008A81622057A6CA0B67DEC82393BAEF563C1F600E7AF4118062A018C8955138EF6AE48D446DC977AF4F74C2EB2AC31B843CD41D4031500CE4CA289CE36A6C6C7C2C3C2E2F9C161FD9F9EC1B5530C3AFBBE3DFF34178C1474D4DCD4FAD0E008A8162205746E1044031300AA7FF3FE50A001403C540AEE40A001403C540AE8C5C01A01818C540AEE40A001403C540AEE40A001403A3701AB90240E1348A815CC9150028068A815C19851300C5C0289C46AE0050388D6220577205008A8162205746E1044031300AA7912B00144E0BB26220577205008A8162205746E1044031308A815CC9150028068A815CC9150014D3CE9D3B2DC8E533437131B82E5746AE0048953D7BF6F40D0C0C5894CB60B2D9EC5FE2627052AE8C5C01902ABB76EDFA5D6767E7B75F7FFDF5A0C5B9743B50A1147474747C15CF74B932720540EAC48BD1B3EDEDED07C369B770AD9729FA84EFFBC9B49502B9922B00000000000000000000000000000000000000000000009854FF0323A872C8088AF94B0000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('31', 1, 'hist.detail.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000047704000000047371007E00003F4000000000000C7708000000100000000574000474797065740005726164696F74000469636F6E74000B726164696F2D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F400000000000307708000000400000001A7400046E616D6574000A726164696F36343838367400056C6162656C74000CE8AFB7E58187E7B1BBE59E8B74000A6C6162656C416C69676E74000074000C64656661756C7456616C75657074000B636F6C756D6E5769647468740005323030707874000473697A6571007E001574000C646973706C61795374796C65740006696E6C696E6574000B627574746F6E5374796C6571007E000D740006626F726465727371007E000C0074000A6C6162656C57696474687074000B6C6162656C48696464656E71007E001E74000864697361626C656471007E001E74000668696464656E71007E001E74000B6F7074696F6E4974656D737371007E0004000000037704000000037371007E00003F400000000000037708000000040000000271007E0012740006E4BA8BE5818774000576616C7565737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000178007371007E00003F400000000000037708000000040000000271007E0012740006E79785E5818771007E00277371007E00280000000278007371007E00003F400000000000037708000000040000000271007E0012740006E5B9B4E5818771007E00277371007E002800000003780078740008726571756972656471007E000D74000C726571756972656448696E7471007E001574000A76616C69646174696F6E71007E001574000E76616C69646174696F6E48696E7471007E001574000B637573746F6D436C6173737371007E0004000000007704000000007874000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096F6E4372656174656471007E00157400096F6E4D6F756E74656471007E00157400086F6E4368616E676571007E001574000A6F6E56616C696461746571007E00157800740002696474000A726164696F363438383678007371007E00003F4000000000000C7708000000100000000571007E000774000A646174652D72616E676571007E0009740010646174652D72616E67652D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000002071007E001074000E6461746572616E6765353939343571007E001274000CE8AFB7E58187E697A5E69C9F71007E001471007E001571007E00077400096461746572616E676571007E0016707400107374617274506C616365686F6C64657271007E001574000E656E64506C616365686F6C64657271007E001571007E0017740005323030707871007E001971007E001571007E001F71007E001571007E002071007E001E740008726561646F6E6C7971007E001E71007E002171007E001E71007E002271007E001E740009636C65617261626C6571007E000D7400086564697461626C6571007E001E740006666F726D617474000A797979792D4D4D2D646474000B76616C7565466F726D617474000A797979792D4D4D2D646471007E003171007E000D71007E003271007E001571007E003371007E001571007E003471007E001571007E003571007E001571007E00377071007E00387400047265617271007E003A7071007E003B71007E001571007E003C71007E001571007E003D71007E00157400076F6E466F63757371007E00157400066F6E426C757271007E001571007E003E71007E0015780071007E003F74000E6461746572616E6765353939343578007371007E00003F4000000000000C7708000000100000000571007E0007740005696E70757471007E000974000A746578742D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000002971007E001074000364617971007E001274000CE8AFB7E58187E5A4A9E695B071007E001471007E001571007E00077400047465787471007E001671007E001574000B706C616365686F6C64657271007E001571007E0017740005323030707871007E001971007E001571007E001F7071007E002071007E001E71007E004B71007E000D71007E002171007E000D71007E002271007E000D71007E004C71007E000D74000C73686F7750617373776F726471007E001E71007E003171007E001E71007E003271007E001571007E003371007E001571007E003471007E001571007E00357371007E0004000000007704000000007871007E00377071007E00387400047265617271007E003A707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E001E74000A70726566697849636F6E71007E001574000A73756666697849636F6E71007E001574000C617070656E64427574746F6E71007E001E740014617070656E64427574746F6E44697361626C656471007E001E74000A627574746F6E49636F6E74000E656C2D69636F6E2D73656172636871007E003B71007E001571007E003C71007E00157400076F6E496E70757471007E001571007E003D71007E001571007E005371007E001571007E005471007E001571007E003E71007E00157400136F6E417070656E64427574746F6E436C69636B71007E001574000B70726570656E645465787471007E001574000A617070656E645465787471007E0015780071007E003F74000A696E707574373334323478007371007E00003F4000000000000C7708000000100000000571007E0007740008746578746172656171007E000974000E74657874617265612D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000001F71007E001074000D7465787461726561363937313271007E001274000CE8AFB7E58187E5A487E6B3A871007E001471007E0015740004726F777371007E003071007E001671007E001571007E005D71007E001571007E0017740005323030707871007E001971007E001571007E001F7071007E002071007E001E71007E004B71007E001E71007E002171007E001E71007E002271007E001E71007E003171007E000D71007E003271007E001571007E003371007E001571007E003471007E001571007E003571007E001571007E00377071007E00387400047265617271007E003A7071007E00627071007E00637071007E006471007E001E71007E003B71007E001571007E003C71007E001571007E006B71007E001571007E003D71007E001571007E005371007E001571007E005471007E001571007E003E71007E0015780071007E003F74000D7465787461726561363937313278007874000A666F726D436F6E6669677371007E00003F400000000000187708000000200000000F7400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E001F7371007E00280000005074000D6C6162656C506F736974696F6E7400046C65667471007E001971007E001571007E00147400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001571007E003571007E001574000966756E6374696F6E7371007E001574000A6C61796F757454797065740002504374000D6F6E466F726D4372656174656471007E001574000D6F6E466F726D4D6F756E74656471007E00157400106F6E466F726D446174614368616E676571007E001574000E6F6E466F726D56616C696461746571007E001578007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('34', 1, 'hist.detail.var-daterange59945', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30312D303174000A323032352D30312D303278, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('50', 2, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000047704000000047371007E00003F4000000000000C7708000000100000000574000474797065740005726164696F74000469636F6E74000B726164696F2D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000018770800000020000000167400046E616D6574000A726164696F36343838367400056C6162656C74000CE8AFB7E58187E7B1BBE59E8B74000A6C6162656C416C69676E74000074000B636F6C756D6E5769647468740005323030707874000473697A6571007E001574000C646973706C61795374796C65740006696E6C696E6574000B627574746F6E5374796C6571007E000D740006626F726465727371007E000C0074000B6C6162656C48696464656E71007E001D74000864697361626C656471007E000D74000668696464656E71007E001D74000B6F7074696F6E4974656D737371007E0004000000037704000000037371007E00003F400000000000037708000000040000000271007E0012740006E4BA8BE5818774000576616C7565737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000178007371007E00003F400000000000037708000000040000000271007E0012740006E79785E5818771007E00257371007E00260000000278007371007E00003F400000000000037708000000040000000271007E0012740006E5B9B4E5818771007E00257371007E002600000003780078740008726571756972656471007E000D74000C726571756972656448696E7471007E001574000A76616C69646174696F6E71007E001574000E76616C69646174696F6E48696E7471007E001574000B637573746F6D436C6173737371007E000400000000770400000000787400116C6162656C49636F6E506F736974696F6E740004726561727400096F6E4372656174656471007E00157400096F6E4D6F756E74656471007E00157400086F6E4368616E676571007E001574000A6F6E56616C696461746571007E00157800740002696474000A726164696F363438383678007371007E00003F4000000000000C7708000000100000000571007E000774000A646174652D72616E676571007E0009740010646174652D72616E67652D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000001D71007E001074000E6461746572616E6765353939343571007E001274000CE8AFB7E58187E697A5E69C9F71007E001471007E001571007E00077400096461746572616E67657400107374617274506C616365686F6C64657271007E001574000E656E64506C616365686F6C64657271007E001571007E0016740005323030707871007E001871007E001574000A6C6162656C576964746871007E001571007E001E71007E001D740008726561646F6E6C7971007E001D71007E001F71007E000D71007E002071007E001D740009636C65617261626C6571007E000D7400086564697461626C6571007E001D740006666F726D617474000A797979792D4D4D2D646474000B76616C7565466F726D617474000A797979792D4D4D2D646471007E002F71007E000D71007E003071007E001571007E003171007E001571007E003271007E001571007E003371007E001571007E00357400047265617271007E003771007E001571007E003871007E001571007E003971007E00157400076F6E466F63757371007E00157400066F6E426C757271007E001571007E003A71007E0015780071007E003B74000E6461746572616E6765353939343578007371007E00003F4000000000000C7708000000100000000571007E0007740005696E70757471007E000974000A746578742D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000002471007E001074000364617971007E001274000CE8AFB7E58187E5A4A9E695B071007E001471007E001571007E00077400047465787474000C64656661756C7456616C756571007E001574000B706C616365686F6C64657271007E001571007E0016740005323030707871007E001871007E001571007E001E71007E001D71007E004871007E000D71007E001F71007E000D71007E002071007E000D71007E004971007E000D74000C73686F7750617373776F726471007E001D71007E002F71007E001D71007E003071007E001571007E003171007E001571007E003271007E001571007E00337371007E0004000000007704000000007871007E00357400047265617274000D73686F77576F72644C696D697471007E001D74000A70726566697849636F6E71007E001574000A73756666697849636F6E71007E001574000C617070656E64427574746F6E71007E001D740014617070656E64427574746F6E44697361626C656471007E001D74000A627574746F6E49636F6E74000E656C2D69636F6E2D73656172636871007E003771007E001571007E003871007E00157400076F6E496E70757471007E001571007E003971007E001571007E005071007E001571007E005171007E001571007E003A71007E00157400136F6E417070656E64427574746F6E436C69636B71007E001574000B70726570656E645465787471007E001574000A617070656E645465787471007E0015780071007E003B74000A696E707574373334323478007371007E00003F4000000000000C7708000000100000000571007E0007740008746578746172656171007E000974000E74657874617265612D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000001A71007E001074000D7465787461726561363937313271007E001274000CE8AFB7E58187E5A487E6B3A871007E001471007E0015740004726F777371007E002E71007E005A71007E001571007E005B71007E001571007E0016740005323030707871007E001871007E001571007E001E71007E001D71007E004871007E001D71007E001F71007E000D71007E002071007E001D71007E002F71007E000D71007E003071007E001571007E003171007E001571007E003271007E001571007E003371007E001571007E00357400047265617271007E006071007E001D71007E003771007E001571007E003871007E001571007E006771007E001571007E003971007E001571007E005071007E001571007E005171007E001571007E003A71007E0015780071007E003B74000D7465787461726561363937313278007874000A666F726D436F6E6669677371007E00003F400000000000187708000000200000000F7400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00477371007E00260000005074000D6C6162656C506F736974696F6E7400046C65667471007E001871007E001571007E00147400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001571007E003371007E001574000966756E6374696F6E7371007E001574000A6C61796F757454797065740002504374000D6F6E466F726D4372656174656471007E001574000D6F6E466F726D4D6F756E74656471007E00157400106F6E466F726D446174614368616E676571007E001574000E6F6E466F726D56616C696461746571007E001578007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('51', 1, 'hist.detail.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000047704000000047371007E00003F4000000000000C7708000000100000000574000474797065740005726164696F74000469636F6E74000B726164696F2D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F400000000000307708000000400000001A7400046E616D6574000A726164696F36343838367400056C6162656C74000CE8AFB7E58187E7B1BBE59E8B74000A6C6162656C416C69676E74000074000C64656661756C7456616C75657074000B636F6C756D6E5769647468740005323030707874000473697A6571007E001574000C646973706C61795374796C65740006696E6C696E6574000B627574746F6E5374796C6571007E000D740006626F726465727371007E000C0074000A6C6162656C57696474687074000B6C6162656C48696464656E71007E001E74000864697361626C656471007E001E74000668696464656E71007E001E74000B6F7074696F6E4974656D737371007E0004000000037704000000037371007E00003F400000000000037708000000040000000271007E0012740006E4BA8BE5818774000576616C7565737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000178007371007E00003F400000000000037708000000040000000271007E0012740006E79785E5818771007E00277371007E00280000000278007371007E00003F400000000000037708000000040000000271007E0012740006E5B9B4E5818771007E00277371007E002800000003780078740008726571756972656471007E000D74000C726571756972656448696E7471007E001574000A76616C69646174696F6E71007E001574000E76616C69646174696F6E48696E7471007E001574000B637573746F6D436C6173737371007E0004000000007704000000007874000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096F6E4372656174656471007E00157400096F6E4D6F756E74656471007E00157400086F6E4368616E676571007E001574000A6F6E56616C696461746571007E00157800740002696474000A726164696F363438383678007371007E00003F4000000000000C7708000000100000000571007E000774000A646174652D72616E676571007E0009740010646174652D72616E67652D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000002071007E001074000E6461746572616E6765353939343571007E001274000CE8AFB7E58187E697A5E69C9F71007E001471007E001571007E00077400096461746572616E676571007E0016707400107374617274506C616365686F6C64657271007E001574000E656E64506C616365686F6C64657271007E001571007E0017740005323030707871007E001971007E001571007E001F71007E001571007E002071007E001E740008726561646F6E6C7971007E001E71007E002171007E001E71007E002271007E001E740009636C65617261626C6571007E000D7400086564697461626C6571007E001E740006666F726D617474000A797979792D4D4D2D646474000B76616C7565466F726D617474000A797979792D4D4D2D646471007E003171007E000D71007E003271007E001571007E003371007E001571007E003471007E001571007E003571007E001571007E00377071007E00387400047265617271007E003A7071007E003B71007E001571007E003C71007E001571007E003D71007E00157400076F6E466F63757371007E00157400066F6E426C757271007E001571007E003E71007E0015780071007E003F74000E6461746572616E6765353939343578007371007E00003F4000000000000C7708000000100000000571007E0007740005696E70757471007E000974000A746578742D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000002971007E001074000364617971007E001274000CE8AFB7E58187E5A4A9E695B071007E001471007E001571007E00077400047465787471007E001671007E001574000B706C616365686F6C64657271007E001571007E0017740005323030707871007E001971007E001571007E001F7071007E002071007E001E71007E004B71007E000D71007E002171007E000D71007E002271007E000D71007E004C71007E000D74000C73686F7750617373776F726471007E001E71007E003171007E001E71007E003271007E001571007E003371007E001571007E003471007E001571007E00357371007E0004000000007704000000007871007E00377071007E00387400047265617271007E003A707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E001E74000A70726566697849636F6E71007E001574000A73756666697849636F6E71007E001574000C617070656E64427574746F6E71007E001E740014617070656E64427574746F6E44697361626C656471007E001E74000A627574746F6E49636F6E74000E656C2D69636F6E2D73656172636871007E003B71007E001571007E003C71007E00157400076F6E496E70757471007E001571007E003D71007E001571007E005371007E001571007E005471007E001571007E003E71007E00157400136F6E417070656E64427574746F6E436C69636B71007E001574000B70726570656E645465787471007E001574000A617070656E645465787471007E0015780071007E003F74000A696E707574373334323478007371007E00003F4000000000000C7708000000100000000571007E0007740008746578746172656171007E000974000E74657874617265612D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000001F71007E001074000D7465787461726561363937313271007E001274000CE8AFB7E58187E5A487E6B3A871007E001471007E0015740004726F777371007E003071007E001671007E001571007E005D71007E001571007E0017740005323030707871007E001971007E001571007E001F7071007E002071007E001E71007E004B71007E001E71007E002171007E001E71007E002271007E001E71007E003171007E000D71007E003271007E001571007E003371007E001571007E003471007E001571007E003571007E001571007E00377071007E00387400047265617271007E003A7071007E00627071007E00637071007E006471007E001E71007E003B71007E001571007E003C71007E001571007E006B71007E001571007E003D71007E001571007E005371007E001571007E005471007E001571007E003E71007E0015780071007E003F74000D7465787461726561363937313278007874000A666F726D436F6E6669677371007E00003F400000000000187708000000200000000F7400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E001F7371007E00280000005074000D6C6162656C506F736974696F6E7400046C65667471007E001971007E001571007E00147400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001571007E003571007E001574000966756E6374696F6E7371007E001574000A6C61796F757454797065740002504374000D6F6E466F726D4372656174656471007E001574000D6F6E466F726D4D6F756E74656471007E00157400106F6E466F726D446174614368616E676571007E001574000E6F6E466F726D56616C696461746571007E001578007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57', 1, 'hist.var-daterange59945', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30312D303174000A323032352D30312D303878, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('58', 1, 'hist.detail.var-daterange59945', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30312D303174000A323032352D30312D303878, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('72', 1, 'hist.detail.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000047704000000047371007E00003F4000000000000C7708000000100000000574000474797065740005726164696F74000469636F6E74000B726164696F2D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F400000000000307708000000400000001A7400046E616D6574000A726164696F36343838367400056C6162656C74000CE8AFB7E58187E7B1BBE59E8B74000A6C6162656C416C69676E74000074000C64656661756C7456616C75657074000B636F6C756D6E5769647468740005323030707874000473697A6571007E001574000C646973706C61795374796C65740006696E6C696E6574000B627574746F6E5374796C6571007E000D740006626F726465727371007E000C0074000A6C6162656C57696474687074000B6C6162656C48696464656E71007E001E74000864697361626C656471007E001E74000668696464656E71007E001E74000B6F7074696F6E4974656D737371007E0004000000037704000000037371007E00003F400000000000037708000000040000000271007E0012740006E4BA8BE5818774000576616C7565737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000178007371007E00003F400000000000037708000000040000000271007E0012740006E79785E5818771007E00277371007E00280000000278007371007E00003F400000000000037708000000040000000271007E0012740006E5B9B4E5818771007E00277371007E002800000003780078740008726571756972656471007E000D74000C726571756972656448696E7471007E001574000A76616C69646174696F6E71007E001574000E76616C69646174696F6E48696E7471007E001574000B637573746F6D436C6173737371007E0004000000007704000000007874000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096F6E4372656174656471007E00157400096F6E4D6F756E74656471007E00157400086F6E4368616E676571007E001574000A6F6E56616C696461746571007E00157800740002696474000A726164696F363438383678007371007E00003F4000000000000C7708000000100000000571007E000774000A646174652D72616E676571007E0009740010646174652D72616E67652D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000002071007E001074000E6461746572616E6765353939343571007E001274000CE8AFB7E58187E697A5E69C9F71007E001471007E001571007E00077400096461746572616E676571007E0016707400107374617274506C616365686F6C64657271007E001574000E656E64506C616365686F6C64657271007E001571007E0017740005323030707871007E001971007E001571007E001F71007E001571007E002071007E001E740008726561646F6E6C7971007E001E71007E002171007E001E71007E002271007E001E740009636C65617261626C6571007E000D7400086564697461626C6571007E001E740006666F726D617474000A797979792D4D4D2D646474000B76616C7565466F726D617474000A797979792D4D4D2D646471007E003171007E000D71007E003271007E001571007E003371007E001571007E003471007E001571007E003571007E001571007E00377071007E00387400047265617271007E003A7071007E003B71007E001571007E003C71007E001571007E003D71007E00157400076F6E466F63757371007E00157400066F6E426C757271007E001571007E003E71007E0015780071007E003F74000E6461746572616E6765353939343578007371007E00003F4000000000000C7708000000100000000571007E0007740005696E70757471007E000974000A746578742D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000002971007E001074000364617971007E001274000CE8AFB7E58187E5A4A9E695B071007E001471007E001571007E00077400047465787471007E001671007E001574000B706C616365686F6C64657271007E001571007E0017740005323030707871007E001971007E001571007E001F7071007E002071007E001E71007E004B71007E000D71007E002171007E000D71007E002271007E000D71007E004C71007E000D74000C73686F7750617373776F726471007E001E71007E003171007E001E71007E003271007E001571007E003371007E001571007E003471007E001571007E00357371007E0004000000007704000000007871007E00377071007E00387400047265617271007E003A707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E001E74000A70726566697849636F6E71007E001574000A73756666697849636F6E71007E001574000C617070656E64427574746F6E71007E001E740014617070656E64427574746F6E44697361626C656471007E001E74000A627574746F6E49636F6E74000E656C2D69636F6E2D73656172636871007E003B71007E001571007E003C71007E00157400076F6E496E70757471007E001571007E003D71007E001571007E005371007E001571007E005471007E001571007E003E71007E00157400136F6E417070656E64427574746F6E436C69636B71007E001574000B70726570656E645465787471007E001574000A617070656E645465787471007E0015780071007E003F74000A696E707574373334323478007371007E00003F4000000000000C7708000000100000000571007E0007740008746578746172656171007E000974000E74657874617265612D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000001F71007E001074000D7465787461726561363937313271007E001274000CE8AFB7E58187E5A487E6B3A871007E001471007E0015740004726F777371007E003071007E001671007E001571007E005D71007E001571007E0017740005323030707871007E001971007E001571007E001F7071007E002071007E001E71007E004B71007E001E71007E002171007E001E71007E002271007E001E71007E003171007E000D71007E003271007E001571007E003371007E001571007E003471007E001571007E003571007E001571007E00377071007E00387400047265617271007E003A7071007E00627071007E00637071007E006471007E001E71007E003B71007E001571007E003C71007E001571007E006B71007E001571007E003D71007E001571007E005371007E001571007E005471007E001571007E003E71007E0015780071007E003F74000D7465787461726561363937313278007874000A666F726D436F6E6669677371007E00003F400000000000187708000000200000000F7400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E001F7371007E00280000005074000D6C6162656C506F736974696F6E7400046C65667471007E001971007E001571007E00147400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001571007E003571007E001574000966756E6374696F6E7371007E001574000A6C61796F757454797065740002504374000D6F6E466F726D4372656174656471007E001574000D6F6E466F726D4D6F756E74656471007E00157400106F6E466F726D446174614368616E676571007E001574000E6F6E466F726D56616C696461746571007E001578007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('75', 1, 'hist.detail.var-daterange59945', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30312D303174000A323032352D30312D303878, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('87', 1, 'hist.detail.var-daterange59945', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30312D303174000A323032352D30312D303878, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('9', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000047704000000047371007E00003F4000000000000C7708000000100000000574000474797065740005726164696F74000469636F6E74000B726164696F2D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F400000000000307708000000400000001A7400046E616D6574000A726164696F36343838367400056C6162656C74000CE8AFB7E58187E7B1BBE59E8B74000A6C6162656C416C69676E74000074000C64656661756C7456616C75657074000B636F6C756D6E5769647468740005323030707874000473697A6571007E001574000C646973706C61795374796C65740006696E6C696E6574000B627574746F6E5374796C6571007E000D740006626F726465727371007E000C0074000A6C6162656C57696474687074000B6C6162656C48696464656E71007E001E74000864697361626C656471007E001E74000668696464656E71007E001E74000B6F7074696F6E4974656D737371007E0004000000037704000000037371007E00003F400000000000037708000000040000000271007E0012740006E4BA8BE5818774000576616C7565737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000178007371007E00003F400000000000037708000000040000000271007E0012740006E79785E5818771007E00277371007E00280000000278007371007E00003F400000000000037708000000040000000271007E0012740006E5B9B4E5818771007E00277371007E002800000003780078740008726571756972656471007E000D74000C726571756972656448696E7471007E001574000A76616C69646174696F6E71007E001574000E76616C69646174696F6E48696E7471007E001574000B637573746F6D436C6173737371007E0004000000007704000000007874000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096F6E4372656174656471007E00157400096F6E4D6F756E74656471007E00157400086F6E4368616E676571007E001574000A6F6E56616C696461746571007E00157800740002696474000A726164696F363438383678007371007E00003F4000000000000C7708000000100000000571007E000774000A646174652D72616E676571007E0009740010646174652D72616E67652D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000002071007E001074000E6461746572616E6765353939343571007E001274000CE8AFB7E58187E697A5E69C9F71007E001471007E001571007E00077400096461746572616E676571007E0016707400107374617274506C616365686F6C64657271007E001574000E656E64506C616365686F6C64657271007E001571007E0017740005323030707871007E001971007E001571007E001F71007E001571007E002071007E001E740008726561646F6E6C7971007E001E71007E002171007E001E71007E002271007E001E740009636C65617261626C6571007E000D7400086564697461626C6571007E001E740006666F726D617474000A797979792D4D4D2D646474000B76616C7565466F726D617474000A797979792D4D4D2D646471007E003171007E000D71007E003271007E001571007E003371007E001571007E003471007E001571007E003571007E001571007E00377071007E00387400047265617271007E003A7071007E003B71007E001571007E003C71007E001571007E003D71007E00157400076F6E466F63757371007E00157400066F6E426C757271007E001571007E003E71007E0015780071007E003F74000E6461746572616E6765353939343578007371007E00003F4000000000000C7708000000100000000571007E0007740005696E70757471007E000974000A746578742D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000002971007E001074000364617971007E001274000CE8AFB7E58187E5A4A9E695B071007E001471007E001571007E00077400047465787471007E001671007E001574000B706C616365686F6C64657271007E001571007E0017740005323030707871007E001971007E001571007E001F7071007E002071007E001E71007E004B71007E000D71007E002171007E000D71007E002271007E000D71007E004C71007E000D74000C73686F7750617373776F726471007E001E71007E003171007E001E71007E003271007E001571007E003371007E001571007E003471007E001571007E00357371007E0004000000007704000000007871007E00377071007E00387400047265617271007E003A707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E001E74000A70726566697849636F6E71007E001574000A73756666697849636F6E71007E001574000C617070656E64427574746F6E71007E001E740014617070656E64427574746F6E44697361626C656471007E001E74000A627574746F6E49636F6E74000E656C2D69636F6E2D73656172636871007E003B71007E001571007E003C71007E00157400076F6E496E70757471007E001571007E003D71007E001571007E005371007E001571007E005471007E001571007E003E71007E00157400136F6E417070656E64427574746F6E436C69636B71007E001574000B70726570656E645465787471007E001574000A617070656E645465787471007E0015780071007E003F74000A696E707574373334323478007371007E00003F4000000000000C7708000000100000000571007E0007740008746578746172656171007E000974000E74657874617265612D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000001F71007E001074000D7465787461726561363937313271007E001274000CE8AFB7E58187E5A487E6B3A871007E001471007E0015740004726F777371007E003071007E001671007E001571007E005D71007E001571007E0017740005323030707871007E001971007E001571007E001F7071007E002071007E001E71007E004B71007E001E71007E002171007E001E71007E002271007E001E71007E003171007E000D71007E003271007E001571007E003371007E001571007E003471007E001571007E003571007E001571007E00377071007E00387400047265617271007E003A7071007E00627071007E00637071007E006471007E001E71007E003B71007E001571007E003C71007E001571007E006B71007E001571007E003D71007E001571007E005371007E001571007E005471007E001571007E003E71007E0015780071007E003F74000D7465787461726561363937313278007874000A666F726D436F6E6669677371007E00003F400000000000187708000000200000000F7400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E001F7371007E00280000005074000D6C6162656C506F736974696F6E7400046C65667471007E001971007E001571007E00147400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001571007E003571007E001574000966756E6374696F6E7371007E001574000A6C61796F757454797065740002504374000D6F6E466F726D4372656174656471007E001574000D6F6E466F726D4D6F756E74656471007E00157400106F6E466F726D446174614368616E676571007E001574000E6F6E466F726D56616C696461746571007E001578007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('91', 1, 'hist.detail.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000047704000000047371007E00003F4000000000000C7708000000100000000574000474797065740005726164696F74000469636F6E74000B726164696F2D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000018770800000020000000167400046E616D6574000A726164696F36343838367400056C6162656C74000CE8AFB7E58187E7B1BBE59E8B74000A6C6162656C416C69676E74000074000B636F6C756D6E5769647468740005323030707874000473697A6571007E001574000C646973706C61795374796C65740006696E6C696E6574000B627574746F6E5374796C6571007E000D740006626F726465727371007E000C0074000B6C6162656C48696464656E71007E001D74000864697361626C656471007E000D74000668696464656E71007E001D74000B6F7074696F6E4974656D737371007E0004000000037704000000037371007E00003F400000000000037708000000040000000271007E0012740006E4BA8BE5818774000576616C7565737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000178007371007E00003F400000000000037708000000040000000271007E0012740006E79785E5818771007E00257371007E00260000000278007371007E00003F400000000000037708000000040000000271007E0012740006E5B9B4E5818771007E00257371007E002600000003780078740008726571756972656471007E000D74000C726571756972656448696E7471007E001574000A76616C69646174696F6E71007E001574000E76616C69646174696F6E48696E7471007E001574000B637573746F6D436C6173737371007E000400000000770400000000787400116C6162656C49636F6E506F736974696F6E740004726561727400096F6E4372656174656471007E00157400096F6E4D6F756E74656471007E00157400086F6E4368616E676571007E001574000A6F6E56616C696461746571007E00157800740002696474000A726164696F363438383678007371007E00003F4000000000000C7708000000100000000571007E000774000A646174652D72616E676571007E0009740010646174652D72616E67652D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000001D71007E001074000E6461746572616E6765353939343571007E001274000CE8AFB7E58187E697A5E69C9F71007E001471007E001571007E00077400096461746572616E67657400107374617274506C616365686F6C64657271007E001574000E656E64506C616365686F6C64657271007E001571007E0016740005323030707871007E001871007E001574000A6C6162656C576964746871007E001571007E001E71007E001D740008726561646F6E6C7971007E001D71007E001F71007E000D71007E002071007E001D740009636C65617261626C6571007E000D7400086564697461626C6571007E001D740006666F726D617474000A797979792D4D4D2D646474000B76616C7565466F726D617474000A797979792D4D4D2D646471007E002F71007E000D71007E003071007E001571007E003171007E001571007E003271007E001571007E003371007E001571007E00357400047265617271007E003771007E001571007E003871007E001571007E003971007E00157400076F6E466F63757371007E00157400066F6E426C757271007E001571007E003A71007E0015780071007E003B74000E6461746572616E6765353939343578007371007E00003F4000000000000C7708000000100000000571007E0007740005696E70757471007E000974000A746578742D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000002471007E001074000364617971007E001274000CE8AFB7E58187E5A4A9E695B071007E001471007E001571007E00077400047465787474000C64656661756C7456616C756571007E001574000B706C616365686F6C64657271007E001571007E0016740005323030707871007E001871007E001571007E001E71007E001D71007E004871007E000D71007E001F71007E000D71007E002071007E000D71007E004971007E000D74000C73686F7750617373776F726471007E001D71007E002F71007E001D71007E003071007E001571007E003171007E001571007E003271007E001571007E00337371007E0004000000007704000000007871007E00357400047265617274000D73686F77576F72644C696D697471007E001D74000A70726566697849636F6E71007E001574000A73756666697849636F6E71007E001574000C617070656E64427574746F6E71007E001D740014617070656E64427574746F6E44697361626C656471007E001D74000A627574746F6E49636F6E74000E656C2D69636F6E2D73656172636871007E003771007E001571007E003871007E00157400076F6E496E70757471007E001571007E003971007E001571007E005071007E001571007E005171007E001571007E003A71007E00157400136F6E417070656E64427574746F6E436C69636B71007E001574000B70726570656E645465787471007E001574000A617070656E645465787471007E0015780071007E003B74000A696E707574373334323478007371007E00003F4000000000000C7708000000100000000571007E0007740008746578746172656171007E000974000E74657874617265612D6669656C6471007E000B71007E000D71007E000E7371007E00003F400000000000307708000000400000001A71007E001074000D7465787461726561363937313271007E001274000CE8AFB7E58187E5A487E6B3A871007E001471007E0015740004726F777371007E002E71007E005A71007E001571007E005B71007E001571007E0016740005323030707871007E001871007E001571007E001E71007E001D71007E004871007E001D71007E001F71007E000D71007E002071007E001D71007E002F71007E000D71007E003071007E001571007E003171007E001571007E003271007E001571007E003371007E001571007E00357400047265617271007E006071007E001D71007E003771007E001571007E003871007E001571007E006771007E001571007E003971007E001571007E005071007E001571007E005171007E001571007E003A71007E0015780071007E003B74000D7465787461726561363937313278007874000A666F726D436F6E6669677371007E00003F400000000000187708000000200000000F7400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00477371007E00260000005074000D6C6162656C506F736974696F6E7400046C65667471007E001871007E001571007E00147400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001571007E003371007E001574000966756E6374696F6E7371007E001574000A6C61796F757454797065740002504374000D6F6E466F726D4372656174656471007E001574000D6F6E466F726D4D6F756E74656471007E00157400106F6E466F726D446174614368616E676571007E001574000E6F6E466F726D56616C696461746571007E001578007800, NULL);

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('batch.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('cfg.task-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('common.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('entitylink.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('eventsubscription.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('identitylink.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('job.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('next.dbid', '2501', 2);
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.8.0.0)', 1);
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('task.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('variable.schema.version', '6.8.0.0', 1);

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `TRANSACTION_ORDER_` int NULL DEFAULT NULL,
  `DURATION_` bigint NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_START`(`START_TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_END`(`END_TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_PROCINST`(`PROC_INST_ID_` ASC, `ACT_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_EXEC`(`EXECUTION_ID_` ASC, `ACT_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------
INSERT INTO `act_hi_actinst` VALUES ('26', 1, 'flow_rbp4rbev:1:4', '5', '25', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-01-13 17:21:03.503', '2025-01-13 17:21:03.511', 1, 8, NULL, '1');
INSERT INTO `act_hi_actinst` VALUES ('27', 1, 'flow_rbp4rbev:1:4', '5', '25', 'Flow_1j2s0md', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-01-13 17:21:03.515', '2025-01-13 17:21:03.515', 2, 0, NULL, '1');
INSERT INTO `act_hi_actinst` VALUES ('28', 2, 'flow_rbp4rbev:1:4', '5', '25', 'Activity_1yvc8c6', '29', NULL, '1', 'userTask', NULL, '2025-01-13 17:21:03.515', '2025-01-13 17:21:04.723', 3, 1208, NULL, '1');
INSERT INTO `act_hi_actinst` VALUES ('40', 1, 'flow_rbp4rbev:1:4', '5', '25', 'Flow_0y97gc6', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-01-13 17:21:04.725', '2025-01-13 17:21:04.725', 1, 0, NULL, '1');
INSERT INTO `act_hi_actinst` VALUES ('41', 2, 'flow_rbp4rbev:1:4', '5', '25', 'Activity_1ofpwz8', '42', NULL, '2', 'userTask', '1', '2025-01-13 17:21:04.727', '2025-01-13 17:21:17.923', 2, 13196, 'Change activity to Event_0x0trja', '1');
INSERT INTO `act_hi_actinst` VALUES ('45', 1, 'flow_rbp4rbev:1:4', '5', '44', 'Event_0x0trja', NULL, NULL, NULL, 'endEvent', NULL, '2025-01-13 17:21:17.930', '2025-01-13 17:21:17.931', 1, 1, NULL, '1');
INSERT INTO `act_hi_actinst` VALUES ('67', 1, 'flow_rbp4rbev:1:4', '46', '66', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-01-13 17:21:43.411', '2025-01-13 17:21:43.411', 1, 0, NULL, '1');
INSERT INTO `act_hi_actinst` VALUES ('68', 1, 'flow_rbp4rbev:1:4', '46', '66', 'Flow_1j2s0md', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-01-13 17:21:43.411', '2025-01-13 17:21:43.411', 2, 0, NULL, '1');
INSERT INTO `act_hi_actinst` VALUES ('69', 2, 'flow_rbp4rbev:1:4', '46', '66', 'Activity_1yvc8c6', '70', NULL, '1', 'userTask', NULL, '2025-01-13 17:21:43.411', '2025-01-13 17:21:44.167', 3, 756, NULL, '1');
INSERT INTO `act_hi_actinst` VALUES ('81', 1, 'flow_rbp4rbev:1:4', '46', '66', 'Flow_0y97gc6', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-01-13 17:21:44.168', '2025-01-13 17:21:44.168', 1, 0, NULL, '1');
INSERT INTO `act_hi_actinst` VALUES ('82', 2, 'flow_rbp4rbev:1:4', '46', '66', 'Activity_1ofpwz8', '83', NULL, '2', 'userTask', '1', '2025-01-13 17:21:44.169', '2025-01-13 17:21:50.855', 2, 6686, NULL, '1');
INSERT INTO `act_hi_actinst` VALUES ('93', 1, 'flow_rbp4rbev:1:4', '46', '66', 'Flow_0pxo72p', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-01-13 17:21:50.856', '2025-01-13 17:21:50.856', 1, 0, NULL, '1');
INSERT INTO `act_hi_actinst` VALUES ('94', 1, 'flow_rbp4rbev:1:4', '46', '66', 'Event_0x0trja', NULL, NULL, NULL, 'endEvent', NULL, '2025-01-13 17:21:50.857', '2025-01-13 17:21:50.858', 2, 1, NULL, '1');

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `FULL_MSG_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------
INSERT INTO `act_hi_comment` VALUES ('30', '1', '2025-01-13 17:21:04.212', '1', '29', '5', 'AddComment', '若依发起流程申请', 0xE88BA5E4BE9DE58F91E8B5B7E6B581E7A88BE794B3E8AFB7);
INSERT INTO `act_hi_comment` VALUES ('71', '1', '2025-01-13 17:21:44.035', '1', '70', '46', 'AddComment', '若依发起流程申请', 0xE88BA5E4BE9DE58F91E8B5B7E6B581E7A88BE794B3E8AFB7);
INSERT INTO `act_hi_comment` VALUES ('85', '1', '2025-01-13 17:21:49.752', NULL, '83', '46', 'AddComment', '1', 0x31);

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_PROC_INST`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_ACT_INST`(`ACT_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TIME`(`TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_NAME`(`NAME_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TASK_ID`(`TASK_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------
INSERT INTO `act_hi_detail` VALUES ('11', 'VariableUpdate', '5', '5', NULL, NULL, 'formJson', 'serializable', 0, '2025-01-13 17:21:03.453', '10', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_detail` VALUES ('13', 'VariableUpdate', '5', '5', NULL, NULL, 'radio64886', 'integer', 0, '2025-01-13 17:21:03.454', NULL, NULL, 1, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('18', 'VariableUpdate', '5', '5', NULL, NULL, 'daterange59945', 'serializable', 0, '2025-01-13 17:21:03.454', '17', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_detail` VALUES ('20', 'VariableUpdate', '5', '5', NULL, NULL, 'day', 'string', 0, '2025-01-13 17:21:03.454', NULL, NULL, NULL, '', NULL);
INSERT INTO `act_hi_detail` VALUES ('22', 'VariableUpdate', '5', '5', NULL, NULL, 'textarea69712', 'string', 0, '2025-01-13 17:21:03.454', NULL, NULL, NULL, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('24', 'VariableUpdate', '5', '5', NULL, NULL, 'INITIATOR', 'long', 0, '2025-01-13 17:21:03.454', NULL, NULL, 1, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('32', 'VariableUpdate', '5', '5', NULL, '28', 'formJson', 'serializable', 1, '2025-01-13 17:21:04.702', '31', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_detail` VALUES ('33', 'VariableUpdate', '5', '5', NULL, '28', 'radio64886', 'integer', 1, '2025-01-13 17:21:04.705', NULL, NULL, 1, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('35', 'VariableUpdate', '5', '5', NULL, '28', 'daterange59945', 'serializable', 1, '2025-01-13 17:21:04.708', '34', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_detail` VALUES ('36', 'VariableUpdate', '5', '5', NULL, '28', 'day', 'string', 1, '2025-01-13 17:21:04.711', NULL, NULL, NULL, '', NULL);
INSERT INTO `act_hi_detail` VALUES ('37', 'VariableUpdate', '5', '5', NULL, '28', 'textarea69712', 'string', 1, '2025-01-13 17:21:04.713', NULL, NULL, NULL, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('38', 'VariableUpdate', '5', '5', NULL, '28', 'INITIATOR', 'long', 1, '2025-01-13 17:21:04.715', NULL, NULL, 1, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('52', 'VariableUpdate', '46', '46', NULL, NULL, 'formJson', 'serializable', 0, '2025-01-13 17:21:43.410', '51', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_detail` VALUES ('54', 'VariableUpdate', '46', '46', NULL, NULL, 'radio64886', 'integer', 0, '2025-01-13 17:21:43.410', NULL, NULL, 1, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('59', 'VariableUpdate', '46', '46', NULL, NULL, 'daterange59945', 'serializable', 0, '2025-01-13 17:21:43.410', '58', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_detail` VALUES ('61', 'VariableUpdate', '46', '46', NULL, NULL, 'day', 'string', 0, '2025-01-13 17:21:43.410', NULL, NULL, NULL, '', NULL);
INSERT INTO `act_hi_detail` VALUES ('63', 'VariableUpdate', '46', '46', NULL, NULL, 'textarea69712', 'string', 0, '2025-01-13 17:21:43.410', NULL, NULL, NULL, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('65', 'VariableUpdate', '46', '46', NULL, NULL, 'INITIATOR', 'long', 0, '2025-01-13 17:21:43.411', NULL, NULL, 1, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('73', 'VariableUpdate', '46', '46', NULL, '69', 'formJson', 'serializable', 1, '2025-01-13 17:21:44.152', '72', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_detail` VALUES ('74', 'VariableUpdate', '46', '46', NULL, '69', 'radio64886', 'integer', 1, '2025-01-13 17:21:44.155', NULL, NULL, 1, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('76', 'VariableUpdate', '46', '46', NULL, '69', 'daterange59945', 'serializable', 1, '2025-01-13 17:21:44.157', '75', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_detail` VALUES ('77', 'VariableUpdate', '46', '46', NULL, '69', 'day', 'string', 1, '2025-01-13 17:21:44.159', NULL, NULL, NULL, '', NULL);
INSERT INTO `act_hi_detail` VALUES ('78', 'VariableUpdate', '46', '46', NULL, '69', 'textarea69712', 'string', 1, '2025-01-13 17:21:44.162', NULL, NULL, NULL, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('79', 'VariableUpdate', '46', '46', NULL, '69', 'INITIATOR', 'long', 1, '2025-01-13 17:21:44.163', NULL, NULL, 1, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('86', 'VariableUpdate', '46', '46', NULL, '82', 'radio64886', 'integer', 1, '2025-01-13 17:21:50.838', NULL, NULL, 1, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('88', 'VariableUpdate', '46', '46', NULL, '82', 'daterange59945', 'serializable', 1, '2025-01-13 17:21:50.842', '87', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_detail` VALUES ('89', 'VariableUpdate', '46', '46', NULL, '82', 'day', 'string', 1, '2025-01-13 17:21:50.845', NULL, NULL, NULL, '', NULL);
INSERT INTO `act_hi_detail` VALUES ('90', 'VariableUpdate', '46', '46', NULL, '82', 'textarea69712', 'string', 1, '2025-01-13 17:21:50.846', NULL, NULL, NULL, '1', NULL);
INSERT INTO `act_hi_detail` VALUES ('92', 'VariableUpdate', '46', '46', NULL, '82', 'formJson', 'serializable', 1, '2025-01-13 17:21:50.850', '91', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_hi_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_entitylink`;
CREATE TABLE `act_hi_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_REF_SCOPE`(`REF_SCOPE_ID_` ASC, `REF_SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE`(`ROOT_SCOPE_ID_` ASC, `ROOT_SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_entitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_USER`(`USER_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_TASK`(`TASK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST`(`PROC_INST_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------
INSERT INTO `act_hi_identitylink` VALUES ('39', NULL, 'participant', '1', NULL, '2025-01-13 17:21:04.716', '5', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('43', NULL, 'assignee', '1', '42', '2025-01-13 17:21:04.728', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('47', NULL, 'starter', '1', NULL, '2025-01-13 17:21:43.409', '46', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('6', NULL, 'starter', '1', NULL, '2025-01-13 17:21:03.438', '5', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('80', NULL, 'participant', '1', NULL, '2025-01-13 17:21:44.164', '46', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('84', NULL, 'assignee', '1', '83', '2025-01-13 17:21:44.170', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `PROC_INST_ID_`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_INST_END`(`END_TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_I_BUSKEY`(`BUSINESS_KEY_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_SUPER_PROCINST`(`SUPER_PROCESS_INSTANCE_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------
INSERT INTO `act_hi_procinst` VALUES ('46', 2, '46', NULL, 'flow_rbp4rbev:1:4', '2025-01-13 17:21:43.409', '2025-01-13 17:21:50.869', 7460, '1', 'start_event', 'Event_0x0trja', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('5', 2, '5', NULL, 'flow_rbp4rbev:1:4', '2025-01-13 17:21:03.434', '2025-01-13 17:21:17.952', 14518, '1', 'start_event', 'Event_0x0trja', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_INST_PROCINST`(`PROC_INST_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------
INSERT INTO `act_hi_taskinst` VALUES ('29', 2, 'flow_rbp4rbev:1:4', NULL, 'Activity_1yvc8c6', '5', '25', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '2025-01-13 17:21:03.515', NULL, '2025-01-13 17:21:04.718', 1203, NULL, 50, NULL, NULL, NULL, '1', '2025-01-13 17:21:04.718');
INSERT INTO `act_hi_taskinst` VALUES ('42', 2, 'flow_rbp4rbev:1:4', NULL, 'Activity_1ofpwz8', '5', '25', NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '1', '2025-01-13 17:21:04.727', NULL, '2025-01-13 17:21:17.925', 13198, 'Change activity to Event_0x0trja', 50, NULL, NULL, NULL, '1', '2025-01-13 17:21:17.925');
INSERT INTO `act_hi_taskinst` VALUES ('70', 2, 'flow_rbp4rbev:1:4', NULL, 'Activity_1yvc8c6', '46', '66', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '2025-01-13 17:21:43.411', NULL, '2025-01-13 17:21:44.165', 754, NULL, 50, NULL, NULL, NULL, '1', '2025-01-13 17:21:44.165');
INSERT INTO `act_hi_taskinst` VALUES ('83', 2, 'flow_rbp4rbev:1:4', NULL, 'Activity_1ofpwz8', '46', '66', NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '1', '2025-01-13 17:21:44.169', NULL, '2025-01-13 17:21:50.852', 6683, NULL, 50, NULL, NULL, NULL, '1', '2025-01-13 17:21:50.852');

-- ----------------------------
-- Table structure for act_hi_tsk_log
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_tsk_log`;
CREATE TABLE `act_hi_tsk_log`  (
  `ID_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_tsk_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE`(`NAME_` ASC, `VAR_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_PROC_INST`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_TASK_ID`(`TASK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_EXE`(`EXECUTION_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------
INSERT INTO `act_hi_varinst` VALUES ('12', 1, '5', '5', NULL, 'radio64886', 'integer', NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '2025-01-13 17:21:03.454', '2025-01-13 17:21:04.705');
INSERT INTO `act_hi_varinst` VALUES ('15', 1, '5', '5', NULL, 'daterange59945', 'serializable', NULL, NULL, NULL, '16', NULL, NULL, NULL, NULL, '2025-01-13 17:21:03.454', '2025-01-13 17:21:04.708');
INSERT INTO `act_hi_varinst` VALUES ('19', 1, '5', '5', NULL, 'day', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2025-01-13 17:21:03.454', '2025-01-13 17:21:04.711');
INSERT INTO `act_hi_varinst` VALUES ('21', 1, '5', '5', NULL, 'textarea69712', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2025-01-13 17:21:03.454', '2025-01-13 17:21:04.713');
INSERT INTO `act_hi_varinst` VALUES ('23', 1, '5', '5', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '2025-01-13 17:21:03.454', '2025-01-13 17:21:04.715');
INSERT INTO `act_hi_varinst` VALUES ('49', 2, '46', '46', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '50', NULL, NULL, NULL, NULL, '2025-01-13 17:21:43.410', '2025-01-13 17:21:50.850');
INSERT INTO `act_hi_varinst` VALUES ('53', 2, '46', '46', NULL, 'radio64886', 'integer', NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '2025-01-13 17:21:43.410', '2025-01-13 17:21:50.838');
INSERT INTO `act_hi_varinst` VALUES ('56', 2, '46', '46', NULL, 'daterange59945', 'serializable', NULL, NULL, NULL, '57', NULL, NULL, NULL, NULL, '2025-01-13 17:21:43.410', '2025-01-13 17:21:50.842');
INSERT INTO `act_hi_varinst` VALUES ('60', 2, '46', '46', NULL, 'day', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2025-01-13 17:21:43.410', '2025-01-13 17:21:50.845');
INSERT INTO `act_hi_varinst` VALUES ('62', 2, '46', '46', NULL, 'textarea69712', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2025-01-13 17:21:43.410', '2025-01-13 17:21:50.846');
INSERT INTO `act_hi_varinst` VALUES ('64', 1, '46', '46', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '2025-01-13 17:21:43.411', '2025-01-13 17:21:44.163');
INSERT INTO `act_hi_varinst` VALUES ('8', 1, '5', '5', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '9', NULL, NULL, NULL, NULL, '2025-01-13 17:21:03.453', '2025-01-13 17:21:04.702');

-- ----------------------------
-- Table structure for act_id_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_id_bytearray`;
CREATE TABLE `act_id_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PASSWORD_` longblob NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership`  (
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
  INDEX `ACT_FK_MEMB_GROUP`(`GROUP_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv`;
CREATE TABLE `act_id_priv`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PRIV_NAME`(`NAME_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_priv
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv_mapping
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv_mapping`;
CREATE TABLE `act_id_priv_mapping`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_PRIV_MAPPING`(`PRIV_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_PRIV_USER`(`USER_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_PRIV_GROUP`(`GROUP_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_priv_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_property
-- ----------------------------
DROP TABLE IF EXISTS `act_id_property`;
CREATE TABLE `act_id_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_property
-- ----------------------------
INSERT INTO `act_id_property` VALUES ('schema.version', '6.8.0.0', 1);

-- ----------------------------
-- Table structure for act_id_token
-- ----------------------------
DROP TABLE IF EXISTS `act_id_token`;
CREATE TABLE `act_id_token`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NULL DEFAULT NULL,
  `IP_ADDRESS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_AGENT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_token
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_INFO_PROCDEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_INFO_JSON_BA`(`INFO_JSON_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------
INSERT INTO `act_re_deployment` VALUES ('1', 'flow_74orozzh', NULL, NULL, '1', '2025-01-13 17:20:36.860', NULL, NULL, '1', NULL);

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE`(`EDITOR_SOURCE_VALUE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE_EXTRA`(`EDITOR_SOURCE_EXTRA_VALUE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_MODEL_DEPLOYMENT`(`DEPLOYMENT_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_VERSION_` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PROCDEF`(`KEY_` ASC, `VERSION_` ASC, `DERIVED_VERSION_` ASC, `TENANT_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------
INSERT INTO `act_re_procdef` VALUES ('flow_rbp4rbev:1:4', 2, NULL, 'flow_74orozzh', 'flow_rbp4rbev', 1, '1', 'flow_74orozzh.bpmn', 'flow_74orozzh.flow_rbp4rbev.png', NULL, 0, 1, 1, '1', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for act_ru_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_actinst`;
CREATE TABLE `act_ru_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint NULL DEFAULT NULL,
  `TRANSACTION_ORDER_` int NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_START`(`START_TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_END`(`END_TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC_ACT`(`PROC_INST_ID_` ASC, `ACT_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC_ACT`(`EXECUTION_ID_` ASC, `ACT_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_TASK`(`TASK_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID`(`CORRELATION_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_DJOB_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_EXECUTION`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROC_DEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_entitylink`;
CREATE TABLE `act_ru_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_REF_SCOPE`(`REF_SCOPE_ID_` ASC, `REF_SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_ROOT_SCOPE`(`ROOT_SCOPE_ID_` ASC, `ROOT_SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC, `LINK_TYPE_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_entitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_`(`CONFIGURATION_` ASC) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_SCOPEREF_`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_EVENT_EXEC`(`EXECUTION_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_ACTIVE_` tinyint NULL DEFAULT NULL,
  `IS_CONCURRENT_` tinyint NULL DEFAULT NULL,
  `IS_SCOPE_` tinyint NULL DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint NULL DEFAULT NULL,
  `IS_MI_ROOT_` tinyint NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int NULL DEFAULT NULL,
  `CACHED_ENT_STATE_` int NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint NULL DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int NULL DEFAULT NULL,
  `TASK_COUNT_` int NULL DEFAULT NULL,
  `JOB_COUNT_` int NULL DEFAULT NULL,
  `TIMER_JOB_COUNT_` int NULL DEFAULT NULL,
  `SUSP_JOB_COUNT_` int NULL DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int NULL DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int NULL DEFAULT NULL,
  `VAR_COUNT_` int NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_BUSKEY`(`BUSINESS_KEY_` ASC) USING BTREE,
  INDEX `ACT_IDC_EXEC_ROOT`(`ROOT_PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_EXEC_REF_ID_`(`REFERENCE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_EXE_PROCINST`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_EXE_PARENT`(`PARENT_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_EXE_SUPER`(`SUPER_EXEC_` ASC) USING BTREE,
  INDEX `ACT_FK_EXE_PROCDEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_external_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_external_job`;
CREATE TABLE `act_ru_external_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID`(`CORRELATION_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_EJOB_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_EJOB_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_EJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_external_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_history_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_history_job`;
CREATE TABLE `act_ru_history_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_history_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_USER`(`USER_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_GROUP`(`GROUP_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_ATHRZ_PROCEDEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_TSKASS_TASK`(`TASK_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_IDL_PROCINST`(`PROC_INST_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_JOB_CORRELATION_ID`(`CORRELATION_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_JOB_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_JOB_EXECUTION`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_JOB_PROC_DEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID`(`CORRELATION_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_SJOB_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_EXECUTION`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROC_DEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint NULL DEFAULT NULL,
  `VAR_COUNT_` int NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int NULL DEFAULT NULL,
  `SUB_TASK_COUNT_` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TASK_CREATE`(`CREATE_TIME_` ASC) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_TASK_EXE`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_TASK_PROCINST`(`PROC_INST_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_TASK_PROCDEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CORRELATION_ID`(`CORRELATION_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_DUEDATE`(`DUEDATE_` ASC) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_TJOB_SUB_SCOPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_EXECUTION`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROC_DEF`(`PROC_DEF_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_` ASC, `SCOPE_TYPE_` ASC) USING BTREE,
  INDEX `ACT_FK_VAR_BYTEARRAY`(`BYTEARRAY_ID_` ASC) USING BTREE,
  INDEX `ACT_IDX_VARIABLE_TASK_ID`(`TASK_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_VAR_EXE`(`EXECUTION_ID_` ASC) USING BTREE,
  INDEX `ACT_FK_VAR_PROCINST`(`PROC_INST_ID_` ASC) USING BTREE,
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for bpm_oa_leave
-- ----------------------------
DROP TABLE IF EXISTS `bpm_oa_leave`;
CREATE TABLE `bpm_oa_leave`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '请假表单主键',
  `user_id` bigint NOT NULL COMMENT '申请人的用户编号',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请假类型',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请假原因',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `day` tinyint NOT NULL COMMENT '请假天数',
  `result` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请假结果',
  `process_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程实例的编号',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'oa 请假申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bpm_oa_leave
-- ----------------------------

-- ----------------------------
-- Table structure for flw_channel_definition
-- ----------------------------
DROP TABLE IF EXISTS `flw_channel_definition`;
CREATE TABLE `flw_channel_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IMPLEMENTATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_CHANNEL_DEF_UNIQ`(`KEY_` ASC, `VERSION_` ASC, `TENANT_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_channel_definition
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ev_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `flw_ev_databasechangelog`;
CREATE TABLE `flw_ev_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ev_databasechangelog
-- ----------------------------
INSERT INTO `flw_ev_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2025-01-13 17:14:37', 1, 'EXECUTED', '8:1b0c48c9cf7945be799d868a2626d687', 'createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...', '', NULL, '4.9.1', NULL, NULL, '6759668929');
INSERT INTO `flw_ev_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2025-01-13 17:14:38', 2, 'EXECUTED', '8:0ea825feb8e470558f0b5754352b9cda', 'addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION', '', NULL, '4.9.1', NULL, NULL, '6759668929');
INSERT INTO `flw_ev_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2025-01-13 17:14:38', 3, 'EXECUTED', '8:3c2bb293350b5cbe6504331980c9dcee', 'customChange', '', NULL, '4.9.1', NULL, NULL, '6759668929');

-- ----------------------------
-- Table structure for flw_ev_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `flw_ev_databasechangeloglock`;
CREATE TABLE `flw_ev_databasechangeloglock`  (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ev_databasechangeloglock
-- ----------------------------
INSERT INTO `flw_ev_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for flw_event_definition
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_definition`;
CREATE TABLE `flw_event_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_EVENT_DEF_UNIQ`(`KEY_` ASC, `VERSION_` ASC, `TENANT_ID_` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_definition
-- ----------------------------

-- ----------------------------
-- Table structure for flw_event_deployment
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_deployment`;
CREATE TABLE `flw_event_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for flw_event_resource
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_resource`;
CREATE TABLE `flw_event_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_resource
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ru_batch
-- ----------------------------
DROP TABLE IF EXISTS `flw_ru_batch`;
CREATE TABLE `flw_ru_batch`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) NULL DEFAULT NULL,
  `STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ru_batch
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ru_batch_part
-- ----------------------------
DROP TABLE IF EXISTS `flw_ru_batch_part`;
CREATE TABLE `flw_ru_batch_part`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `BATCH_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) NULL DEFAULT NULL,
  `STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `FLW_IDX_BATCH_PART`(`BATCH_ID_` ASC) USING BTREE,
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `flw_ru_batch` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ru_batch_part
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_tenant', '租户信息表', NULL, NULL, 'SysTenant', 'crud', 'element-ui', 'com.qingxinsaas.system', 'system', 'tenant', '租户管理', 'wwj', '0', '/', '{\"parentMenuId\":1}', 'admin', '2024-12-06 14:18:14', '', '2025-01-09 14:37:37', NULL);
INSERT INTO `gen_table` VALUES (2, 'sys_datasource', '数据源配置表', NULL, NULL, 'SysDatasource', 'crud', 'element-ui', 'com.qingxinsaas.system', 'system', 'datasource', '数据源配置', 'wwj', '0', '/', '{\"parentMenuId\":2025}', 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10', NULL);
INSERT INTO `gen_table` VALUES (3, 'sys_tenant_package', '租户套餐表', NULL, NULL, 'SysTenantPackage', 'crud', 'element-ui', 'com.qingxinsaas.system', 'system', 'package', '租户套餐', 'wwj', '0', '/', '{\"parentMenuId\":2025}', 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:52', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'tenant_id', '租户ID', 'bigint', 'Long', 'tenantId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-12-06 14:18:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (2, 1, 'tenant_name', '租户名称', 'varchar(64)', 'String', 'tenantName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-12-06 14:18:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (8, 1, 'contact_name', '联系人', 'varchar(32)', 'String', 'contactName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2024-12-06 14:18:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (10, 1, 'expire_time', '过期时间', 'datetime', 'Date', 'expireTime', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'datetime', '', 9, 'admin', '2024-12-06 14:18:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (11, 1, 'status', '租户状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'radio', 'sys_normal_disable', 10, 'admin', '2024-12-06 14:18:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (12, 1, 'del_flag', '删除标志（0存在 2删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-12-06 14:18:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (13, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-12-06 14:18:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (14, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2024-12-06 14:18:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (15, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2024-12-06 14:18:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (16, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2024-12-06 14:18:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (17, 1, 'domain_name', '租户域名', 'varchar(100)', 'String', 'domainName', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 4, '', '2025-01-03 17:20:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (18, 1, 'logo', '租户logo', 'varchar(100)', 'String', 'logo', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 5, '', '2025-01-03 17:20:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (19, 1, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'textarea', '', 17, '', '2025-01-03 17:20:14', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (21, 1, 'datasource_id', '数据源ID', 'bigint', 'Long', 'datasourceId', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 3, '', '2025-01-07 16:56:32', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (22, 1, 'contact_phone', '联系人电话', 'varchar(32)', 'String', 'contactPhone', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 7, '', '2025-01-07 16:56:32', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (23, 1, 'package_id', '租户套餐ID', 'bigint', 'Long', 'packageId', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 8, '', '2025-01-07 16:56:33', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (24, 1, 'parent_id', '父租户ID', 'bigint', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 12, '', '2025-01-07 16:56:33', '', '2025-01-09 14:37:37');
INSERT INTO `gen_table_column` VALUES (25, 2, 'datasource_id', '数据源ID', 'bigint', 'Long', 'datasourceId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10');
INSERT INTO `gen_table_column` VALUES (26, 2, 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10');
INSERT INTO `gen_table_column` VALUES (27, 2, 'url', '连接地址', 'varchar(500)', 'String', 'url', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'textarea', '', 3, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10');
INSERT INTO `gen_table_column` VALUES (28, 2, 'username', '用户名', 'varchar(50)', 'String', 'username', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10');
INSERT INTO `gen_table_column` VALUES (29, 2, 'password', '密码', 'varchar(50)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10');
INSERT INTO `gen_table_column` VALUES (30, 2, 'status', '数据源状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'radio', 'sys_normal_disable', 6, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10');
INSERT INTO `gen_table_column` VALUES (31, 2, 'del_flag', '删除标志（0存在 2删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10');
INSERT INTO `gen_table_column` VALUES (32, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10');
INSERT INTO `gen_table_column` VALUES (33, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10');
INSERT INTO `gen_table_column` VALUES (34, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10');
INSERT INTO `gen_table_column` VALUES (35, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10');
INSERT INTO `gen_table_column` VALUES (36, 2, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'textarea', '', 12, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:10');
INSERT INTO `gen_table_column` VALUES (37, 3, 'package_id', '租户套餐ID', 'bigint', 'Long', 'packageId', '1', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:52');
INSERT INTO `gen_table_column` VALUES (38, 3, 'package_name', '套餐名称', 'varchar(20)', 'String', 'packageName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:52');
INSERT INTO `gen_table_column` VALUES (39, 3, 'menu_ids', '关联菜单id', 'varchar(3000)', 'String', 'menuIds', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'textarea', '', 3, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:52');
INSERT INTO `gen_table_column` VALUES (40, 3, 'status', '套餐状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'radio', 'sys_normal_disable', 4, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:52');
INSERT INTO `gen_table_column` VALUES (41, 3, 'del_flag', '删除标志（0存在 2删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:52');
INSERT INTO `gen_table_column` VALUES (42, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:52');
INSERT INTO `gen_table_column` VALUES (43, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:52');
INSERT INTO `gen_table_column` VALUES (44, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:52');
INSERT INTO `gen_table_column` VALUES (45, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:52');
INSERT INTO `gen_table_column` VALUES (46, 3, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '0', '0', '0', NULL, 'EQ', 'textarea', '', 10, 'admin', '2025-01-08 11:18:00', '', '2025-01-08 11:22:52');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-11-22 10:10:43', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', 1);
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-11-22 10:10:43', '', NULL, '初始化密码 123456', 1);
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-11-22 10:10:43', '', NULL, '深色主题theme-dark，浅色主题theme-light', 1);
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-11-22 10:10:43', '', NULL, '是否开启注册用户功能（true开启，false关闭）', 1);
INSERT INTO `sys_config` VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-11-22 10:10:43', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）', 1);

-- ----------------------------
-- Table structure for sys_datasource
-- ----------------------------
DROP TABLE IF EXISTS `sys_datasource`;
CREATE TABLE `sys_datasource`  (
  `datasource_id` bigint NOT NULL AUTO_INCREMENT COMMENT '数据源ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接地址',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '数据源状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`datasource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_datasource
-- ----------------------------
INSERT INTO `sys_datasource` VALUES (1, '氢信', 'jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'root', 'root', '0', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_datasource` VALUES (2, '138', 'jdbc:mysql://10.10.10.138:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8', 'root', 'root', '0', '0', NULL, '2025-01-16 13:54:43', NULL, '2025-01-16 13:54:54', NULL);

-- ----------------------------
-- Table structure for sys_deploy_form
-- ----------------------------
DROP TABLE IF EXISTS `sys_deploy_form`;
CREATE TABLE `sys_deploy_form`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `form_id` bigint NULL DEFAULT NULL COMMENT '表单主键',
  `deploy_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程实例主键',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程实例关联表单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_deploy_form
-- ----------------------------
INSERT INTO `sys_deploy_form` VALUES (1, 1, '2503', 1);
INSERT INTO `sys_deploy_form` VALUES (2, 1, '2527', 1);
INSERT INTO `sys_deploy_form` VALUES (3, 2, '7501', 1);
INSERT INTO `sys_deploy_form` VALUES (4, 2, '17501', 1);
INSERT INTO `sys_deploy_form` VALUES (5, 2, '1', NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '氢信科技', 0, '氢信', '15888888888', 'qx@qq.com', '0', '0', 'admin', '2024-11-22 10:10:34', 'admin', '2025-01-14 17:50:28', 1);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '氢信基座', 1, '氢信', '15888888888', 'qx@qq.com', '0', '0', 'admin', '2024-11-22 10:10:34', 'admin', '2025-01-14 17:51:02', 1);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '氢信商城', 2, '氢信', '15888888888', 'qx@qq.com', '0', '0', 'admin', '2024-11-22 10:10:34', 'admin', '2025-01-14 17:51:25', 1);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '分店1', 1, '氢信', '15888888888', 'qx@qq.com', '0', '0', 'admin', '2024-11-22 10:10:34', 'admin', '2025-01-14 17:51:55', 1);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '分店2', 2, '氢信', '15888888888', 'qx@qq.com', '0', '0', 'admin', '2024-11-22 10:10:34', 'admin', '2025-01-14 17:52:05', 1);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '分店3', 3, '氢信', '15888888888', 'qx@qq.com', '0', '0', 'admin', '2024-11-22 10:10:34', 'admin', '2025-01-14 17:52:15', 1);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-11-22 10:10:34', '', NULL, 1);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-11-22 10:10:34', '', NULL, 1);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '分店1', 1, '氢信', '15888888888', 'qx@qq.com', '0', '0', 'admin', '2024-11-22 10:10:34', 'admin', '2025-01-14 17:52:39', 1);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '分店2', 2, '氢信', '15888888888', 'qx@qq.com', '0', '0', 'admin', '2024-11-22 10:10:34', 'admin', '2025-01-14 17:52:46', 1);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '系统指定', 'fixed', 'exp_data_type', NULL, 'default', 'N', '0', 'admin', '2024-03-12 09:04:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '动态选择', 'dynamic', 'exp_data_type', NULL, 'default', 'N', '0', 'admin', '2024-03-12 09:05:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '任务监听', '1', 'sys_listener_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:47:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 2, '执行监听', '2', 'sys_listener_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:47:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, 'JAVA类', 'classListener', 'sys_listener_value_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:48:55', 'admin', '2024-09-05 21:38:02', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, '表达式', 'expressionListener', 'sys_listener_value_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:49:05', 'admin', '2024-09-05 21:38:10', NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '代理表达式', 'delegateExpressionListener', 'sys_listener_value_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:49:16', 'admin', '2024-09-05 21:38:16', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '请假', 'leave', 'sys_process_category', NULL, 'default', 'N', '0', 'admin', '2024-03-12 09:08:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, '报销', 'expense', 'sys_process_category', NULL, 'default', 'N', '0', 'admin', '2024-03-12 09:09:02', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-11-22 10:10:42', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '表达式类型', 'exp_data_type', '0', 'admin', '2024-03-12 09:03:02', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '监听类型', 'sys_listener_type', '0', 'admin', '2022-12-18 22:03:07', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '监听值类型', 'sys_listener_value_type', '0', 'admin', '2022-12-18 22:03:39', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '监听属性', 'sys_listener_event_type', '0', 'admin', '2022-12-18 22:04:29', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '流程分类', 'sys_process_category', '0', 'admin', '2024-03-12 09:08:18', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_expression
-- ----------------------------
DROP TABLE IF EXISTS `sys_expression`;
CREATE TABLE `sys_expression`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '表单主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表达式名称',
  `expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表达式内容',
  `data_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表达式类型',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程表达式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_expression
-- ----------------------------
INSERT INTO `sys_expression` VALUES (1, '流程发起人', '${INITIATOR}', 'fixed', NULL, '2024-11-29 16:53:52', NULL, NULL, '0', NULL, 1);
INSERT INTO `sys_expression` VALUES (2, '审批流程指定接收人', '#{approval}', 'dynamic', NULL, '2024-11-29 16:54:01', NULL, NULL, '0', NULL, 1);

-- ----------------------------
-- Table structure for sys_form
-- ----------------------------
DROP TABLE IF EXISTS `sys_form`;
CREATE TABLE `sys_form`  (
  `form_id` bigint NOT NULL AUTO_INCREMENT COMMENT '表单主键',
  `form_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表单名称',
  `form_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '表单内容',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`form_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程表单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_form
-- ----------------------------
INSERT INTO `sys_form` VALUES (1, '1', '{\"widgetList\":[{\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"input68163\",\"label\":\"input\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"el-icon-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\",\"prependText\":\"\",\"appendText\":\"\"},\"id\":\"input68163\"},{\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"input102805\",\"label\":\"input\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"el-icon-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\",\"prependText\":\"\",\"appendText\":\"\"},\"id\":\"input102805\"}],\"formConfig\":{\"modelName\":\"formData\",\"refName\":\"vForm\",\"rulesName\":\"rules\",\"labelWidth\":80,\"labelPosition\":\"left\",\"size\":\"\",\"labelAlign\":\"label-left-align\",\"cssCode\":\"\",\"customClass\":\"\",\"functions\":\"\",\"layoutType\":\"PC\",\"onFormCreated\":\"\",\"onFormMounted\":\"\",\"onFormDataChange\":\"\",\"onFormValidate\":\"\"}}', NULL, '2024-11-26 13:41:10', NULL, NULL, NULL, 1);
INSERT INTO `sys_form` VALUES (2, '请假流程', '{\"widgetList\":[{\"type\":\"radio\",\"icon\":\"radio-field\",\"formItemFlag\":true,\"options\":{\"name\":\"radio64886\",\"label\":\"请假类型\",\"labelAlign\":\"\",\"defaultValue\":null,\"columnWidth\":\"200px\",\"size\":\"\",\"displayStyle\":\"inline\",\"buttonStyle\":true,\"border\":false,\"labelWidth\":null,\"labelHidden\":false,\"disabled\":false,\"hidden\":false,\"optionItems\":[{\"label\":\"事假\",\"value\":1},{\"label\":\"病假\",\"value\":2},{\"label\":\"年假\",\"value\":3}],\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"onCreated\":\"\",\"onMounted\":\"\",\"onChange\":\"\",\"onValidate\":\"\"},\"id\":\"radio64886\"},{\"type\":\"date-range\",\"icon\":\"date-range-field\",\"formItemFlag\":true,\"options\":{\"name\":\"daterange59945\",\"label\":\"请假日期\",\"labelAlign\":\"\",\"type\":\"daterange\",\"defaultValue\":null,\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":\"\",\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"editable\":false,\"format\":\"yyyy-MM-dd\",\"valueFormat\":\"yyyy-MM-dd\",\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"onCreated\":\"\",\"onMounted\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\"},\"id\":\"daterange59945\"},{\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"day\",\"label\":\"请假天数\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":true,\"disabled\":true,\"hidden\":true,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"el-icon-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\",\"prependText\":\"\",\"appendText\":\"\"},\"id\":\"input73424\"},{\"type\":\"textarea\",\"icon\":\"textarea-field\",\"formItemFlag\":true,\"options\":{\"name\":\"textarea69712\",\"label\":\"请假备注\",\"labelAlign\":\"\",\"rows\":3,\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\"},\"id\":\"textarea69712\"}],\"formConfig\":{\"modelName\":\"formData\",\"refName\":\"vForm\",\"rulesName\":\"rules\",\"labelWidth\":80,\"labelPosition\":\"left\",\"size\":\"\",\"labelAlign\":\"label-left-align\",\"cssCode\":\"\",\"customClass\":\"\",\"functions\":\"\",\"layoutType\":\"PC\",\"onFormCreated\":\"\",\"onFormMounted\":\"\",\"onFormDataChange\":\"\",\"onFormValidate\":\"\"}}', NULL, '2024-11-29 16:52:37', NULL, '2024-11-29 17:02:50', NULL, 1);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-11-22 10:10:45', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-11-22 10:10:45', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-11-22 10:10:45', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_listener
-- ----------------------------
DROP TABLE IF EXISTS `sys_listener`;
CREATE TABLE `sys_listener`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '表单主键',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监听类型',
  `event_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '事件类型',
  `value_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '值类型',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行内容',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程监听' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_listener
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`access_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-15 09:52:32', 0);
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '0', '退出成功', '2025-01-15 09:56:56', 0);
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-15 09:56:58', 0);
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '0', '退出成功', '2025-01-15 09:57:06', 0);
INSERT INTO `sys_logininfor` VALUES (5, 'ry', '127.0.0.1', '0', '登录成功', '2025-01-15 09:57:10', 0);
INSERT INTO `sys_logininfor` VALUES (6, 'ry', '127.0.0.1', '0', '退出成功', '2025-01-15 09:57:17', 0);
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-15 09:57:22', 0);
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-15 10:28:51', 0);
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '0', '退出成功', '2025-01-15 10:29:06', 0);
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-15 10:34:58', 0);
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '0', '退出成功', '2025-01-15 10:45:10', 0);
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-15 10:53:01', 0);
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '0', '退出成功', '2025-01-15 11:08:29', 0);
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-15 11:08:33', 0);
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '0', '退出成功', '2025-01-15 11:15:19', 0);
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-15 11:17:29', 0);
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-15 14:59:03', 0);
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '0', '退出成功', '2025-01-15 14:59:20', 0);
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-15 17:41:20', 0);
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '127.0.0.1', '0', '退出成功', '2025-01-15 17:41:30', 0);
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-16 11:21:06', 0);
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '0', '退出成功', '2025-01-16 13:55:32', 0);
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-16 13:57:35', 0);
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '0', '退出成功', '2025-01-16 13:58:48', 0);
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-16 13:58:53', 0);
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-16 15:17:02', 0);
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-16 16:22:59', 0);
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '0', '退出成功', '2025-01-16 16:26:10', 0);
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-16 16:26:16', 0);
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '127.0.0.1', '0', '退出成功', '2025-01-16 16:26:41', 0);
INSERT INTO `sys_logininfor` VALUES (31, 'ry', '127.0.0.1', '0', '登录成功', '2025-01-16 16:26:46', 0);
INSERT INTO `sys_logininfor` VALUES (32, 'ry', '127.0.0.1', '0', '退出成功', '2025-01-16 16:26:57', 0);
INSERT INTO `sys_logininfor` VALUES (33, 'ry', '127.0.0.1', '0', '登录成功', '2025-01-16 16:27:01', 0);
INSERT INTO `sys_logininfor` VALUES (34, 'ry', '127.0.0.1', '0', '退出成功', '2025-01-16 16:27:25', 0);
INSERT INTO `sys_logininfor` VALUES (35, 'admin', '127.0.0.1', '0', '登录成功', '2025-01-16 16:27:33', 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2045 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-11-22 10:10:37', 'admin', '2025-01-14 17:13:51', '系统管理目录', 1);
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-11-22 10:10:37', '', NULL, '系统监控目录', 1);
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-11-22 10:10:37', '', NULL, '系统工具目录', 1);
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '1', '', 'guide', 'admin', '2024-11-22 10:10:37', 'admin', '2024-11-25 17:45:27', '若依官网地址', 1);
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 2, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-11-22 10:10:37', 'admin', '2025-01-03 15:52:54', '用户管理菜单', 1);
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 3, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-11-22 10:10:37', 'admin', '2025-01-03 15:52:19', '角色管理菜单', 1);
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 4, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-11-22 10:10:37', 'admin', '2025-01-03 15:52:22', '菜单管理菜单', 1);
INSERT INTO `sys_menu` VALUES (103, '机构管理', 1, 6, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-11-22 10:10:37', 'admin', '2025-01-03 15:52:28', '机构管理菜单', 1);
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-11-22 10:10:37', '', NULL, '岗位管理菜单', 1);
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 7, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-11-22 10:10:37', 'admin', '2025-01-03 15:52:33', '字典管理菜单', 1);
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 8, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-11-22 10:10:37', 'admin', '2025-01-03 15:52:36', '参数设置菜单', 1);
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 9, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-11-22 10:10:37', 'admin', '2025-01-03 15:52:40', '通知公告菜单', 1);
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 10, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-11-22 10:10:37', 'admin', '2025-01-03 15:52:48', '日志管理菜单', 1);
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-11-22 10:10:37', '', NULL, '在线用户菜单', 1);
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-11-22 10:10:37', '', NULL, '定时任务菜单', 1);
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2024-11-22 10:10:37', '', NULL, '流量控制菜单', 1);
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2024-11-22 10:10:37', '', NULL, '服务治理菜单', 1);
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-11-22 10:10:37', '', NULL, '服务监控菜单', 1);
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-11-22 10:10:37', '', NULL, '表单构建菜单', 1);
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-11-22 10:10:37', '', NULL, '代码生成菜单', 1);
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/doc.html', '', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-11-22 10:10:37', 'admin', '2024-11-22 12:11:03', '系统接口菜单', 1);
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2024-11-22 10:10:37', '', NULL, '操作日志菜单', 1);
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2024-11-22 10:10:37', '', NULL, '登录日志菜单', 1);
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1016, '机构查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1017, '机构新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1018, '机构修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1019, '机构删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-11-22 10:10:37', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2000, '流程管理', 0, 6, 'flowable', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'cascader', 'admin', '2024-11-25 15:12:13', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2001, '流程定义', 2000, 1, 'definition', 'flowable/definition/index', NULL, '', 1, 0, 'C', '0', '0', NULL, 'job', 'admin', '2024-11-25 15:13:24', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2002, '表单配置', 2000, 2, 'form', 'flowable/task/form/index', NULL, '', 1, 1, 'C', '0', '0', 'flowable:form:list', 'form', 'admin', '2024-11-25 15:13:58', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2003, '流程表达式', 2000, 3, 'expression', 'flowable/expression/index', NULL, '', 1, 1, 'C', '0', '0', 'flowable:expression:list', 'list', 'admin', '2024-11-25 15:14:51', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2004, '流程监听', 2000, 4, 'listener', 'flowable/listener/index', NULL, '', 1, 1, 'C', '0', '0', 'flowable:listener:list', 'monitor', 'admin', '2024-11-25 15:15:29', 'admin', '2024-11-25 15:16:07', '', 1);
INSERT INTO `sys_menu` VALUES (2005, '表单配置查询', 2002, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:form:query', '#', 'admin', '2024-11-25 15:16:36', 'admin', '2024-11-25 15:18:47', '', 1);
INSERT INTO `sys_menu` VALUES (2006, '表单配置新增', 2002, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:form:add', '#', 'admin', '2024-11-25 15:18:13', 'admin', '2024-11-25 15:19:40', '', 1);
INSERT INTO `sys_menu` VALUES (2007, '表单配置修改', 2002, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:form:edit', '#', 'admin', '2024-11-25 15:18:33', 'admin', '2024-11-25 15:20:02', '', 1);
INSERT INTO `sys_menu` VALUES (2008, '表单配置删除', 2002, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:form:remove', '#', 'admin', '2024-11-25 15:20:45', 'admin', '2024-11-25 15:21:09', '', 1);
INSERT INTO `sys_menu` VALUES (2009, '流程表达式查询', 2003, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:expression:query', '#', 'admin', '2024-11-25 15:22:38', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2010, '流程表达式新增', 2003, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:expression:add', '#', 'admin', '2024-11-25 15:22:55', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2011, '流程表达式修改', 2003, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:expression:edit', '#', 'admin', '2024-11-25 15:23:12', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2012, '流程表达式删除', 2003, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:expression:remove', '#', 'admin', '2024-11-25 15:23:32', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2013, '流程表达式导出', 2003, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:expression:export', '#', 'admin', '2024-11-25 15:23:49', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2014, '流程监听查询', 2004, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:listener:query', '#', 'admin', '2024-11-25 15:24:30', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2015, '流程监听新增', 2004, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:listener:add', '#', 'admin', '2024-11-25 15:24:44', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2016, '流程监听修改', 2004, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:listener:edit', '#', 'admin', '2024-11-25 15:25:04', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2017, '流程监听删除', 2004, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:listener:remove', '#', 'admin', '2024-11-25 15:25:18', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2018, '流程监听导出', 2004, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'flowable:listener:export', '#', 'admin', '2024-11-25 15:25:34', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2019, '任务管理', 0, 7, 'task', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'dict', 'admin', '2024-11-25 15:26:32', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2020, '已发任务', 2019, 1, 'process', 'flowable/task/myProcess/index', NULL, '', 1, 1, 'C', '0', '0', NULL, 'guide', 'admin', '2024-11-25 15:27:14', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2021, '待办任务', 2019, 2, 'todo', 'flowable/task/todo/index', NULL, '', 1, 0, 'C', '0', '0', NULL, 'cascader', 'admin', '2024-11-25 15:27:43', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2022, '已办任务', 2019, 3, 'finished', 'flowable/task/finished/index', NULL, '', 1, 1, 'C', '0', '0', NULL, 'time-range', 'admin', '2024-11-25 15:28:05', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2023, '业务测试', 0, 11, 'test', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'job', 'admin', '2024-12-03 09:24:17', 'admin', '2024-12-03 09:39:01', '', 1);
INSERT INTO `sys_menu` VALUES (2024, '请假申请', 2023, 1, 'oa', 'test/oa/index', NULL, '', 1, 0, 'C', '0', '0', '', 'date', 'admin', '2024-12-03 09:25:36', 'admin', '2024-12-03 09:45:37', '', 1);
INSERT INTO `sys_menu` VALUES (2025, '租户管理', 1, 1, 'tenant', 'system/tenant/index', NULL, '', 1, 0, 'C', '0', '0', 'system:tenant:list', 'client', 'admin', '2024-12-06 14:29:30', 'admin', '2025-01-14 17:19:11', '租户管理菜单', 1);
INSERT INTO `sys_menu` VALUES (2026, '租户管理查询', 2025, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:tenant:query', '#', 'admin', '2024-12-06 14:29:31', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2027, '租户管理新增', 2025, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:tenant:add', '#', 'admin', '2024-12-06 14:29:31', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2028, '租户管理修改', 2025, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:tenant:edit', '#', 'admin', '2024-12-06 14:29:31', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2029, '租户管理删除', 2025, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:tenant:remove', '#', 'admin', '2024-12-06 14:29:31', '', NULL, '', 1);
INSERT INTO `sys_menu` VALUES (2030, '租户管理导出', 2025, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:tenant:export', '#', 'admin', '2024-12-06 14:29:31', '', NULL, '', 1);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-11-22 10:10:46', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-11-22 10:10:46', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.qingxinsaas.system.controller.SysOperlogController.clean()', 'DELETE', 1, 'admin', NULL, '/operlog/clean', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-01-14 17:55:09', 2077, 0);
INSERT INTO `sys_oper_log` VALUES (2, '登录日志', 3, 'com.qingxinsaas.system.controller.SysLogininforController.clean()', 'DELETE', 1, 'admin', NULL, '/logininfor/clean', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-01-14 17:55:15', 1679, 0);
INSERT INTO `sys_oper_log` VALUES (3, '数据源配置', 2, 'com.qingxinsaas.system.controller.SysDatasourceController.edit()', 'PUT', 1, 'admin', NULL, '/datasource', '127.0.0.1', '', '{\"datasourceId\":1,\"delFlag\":\"0\",\"name\":\"qingxinsaas\",\"params\":{},\"status\":\"0\",\"updateTime\":\"2025-01-15 09:55:43\",\"url\":\"jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"username\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-01-15 09:55:43', 75, 0);
INSERT INTO `sys_oper_log` VALUES (4, '数据源配置', 1, 'com.qingxinsaas.system.controller.SysDatasourceController.add()', 'POST', 1, 'admin', NULL, '/datasource', '127.0.0.1', '', '{\"createTime\":\"2025-01-16 13:54:43\",\"name\":\"138\",\"params\":{},\"url\":\"jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"username\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-01-16 13:54:44', 922, 0);
INSERT INTO `sys_oper_log` VALUES (5, '数据源配置', 2, 'com.qingxinsaas.system.controller.SysDatasourceController.edit()', 'PUT', 1, 'admin', NULL, '/datasource', '127.0.0.1', '', '{\"createTime\":\"2025-01-16 13:54:43\",\"datasourceId\":2,\"delFlag\":\"0\",\"name\":\"138\",\"params\":{},\"status\":\"0\",\"updateTime\":\"2025-01-16 13:54:53\",\"url\":\"jdbc:mysql://10.10.10.138:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\",\"username\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-01-16 13:54:54', 225, 0);
INSERT INTO `sys_oper_log` VALUES (6, '角色管理', 2, 'com.qingxinsaas.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-11-22 10:10:36\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,104,1020,1021,1022,1023,1024,103,1016,1017,1018,1019,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116,4,2000,2001,2002,2005,2006,2007,2008,2003,2009,2010,2011,2012,2013,2004,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-01-16 16:26:39', 399, 0);
INSERT INTO `sys_oper_log` VALUES (7, '流程监听', 5, 'com.qingxinsaas.flowable.controller.SysListenerController.export()', 'POST', 1, 'admin', NULL, '/listener/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-01-16 16:40:42', 2487, 0);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-11-22 10:10:35', '', NULL, '', 1);
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-11-22 10:10:35', '', NULL, '', 1);
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-11-22 10:10:35', '', NULL, '', 1);
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-11-22 10:10:35', '', NULL, '', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-11-22 10:10:36', '', NULL, '超级管理员', 1);
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-11-22 10:10:36', 'admin', '2025-01-16 16:26:39', '普通角色', 1);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100, 1);
INSERT INTO `sys_role_dept` VALUES (2, 101, 1);
INSERT INTO `sys_role_dept` VALUES (2, 105, 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 3, 1);
INSERT INTO `sys_role_menu` VALUES (2, 4, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100, 1);
INSERT INTO `sys_role_menu` VALUES (2, 101, 1);
INSERT INTO `sys_role_menu` VALUES (2, 102, 1);
INSERT INTO `sys_role_menu` VALUES (2, 103, 1);
INSERT INTO `sys_role_menu` VALUES (2, 104, 1);
INSERT INTO `sys_role_menu` VALUES (2, 105, 1);
INSERT INTO `sys_role_menu` VALUES (2, 106, 1);
INSERT INTO `sys_role_menu` VALUES (2, 107, 1);
INSERT INTO `sys_role_menu` VALUES (2, 108, 1);
INSERT INTO `sys_role_menu` VALUES (2, 109, 1);
INSERT INTO `sys_role_menu` VALUES (2, 110, 1);
INSERT INTO `sys_role_menu` VALUES (2, 111, 1);
INSERT INTO `sys_role_menu` VALUES (2, 112, 1);
INSERT INTO `sys_role_menu` VALUES (2, 113, 1);
INSERT INTO `sys_role_menu` VALUES (2, 114, 1);
INSERT INTO `sys_role_menu` VALUES (2, 115, 1);
INSERT INTO `sys_role_menu` VALUES (2, 116, 1);
INSERT INTO `sys_role_menu` VALUES (2, 500, 1);
INSERT INTO `sys_role_menu` VALUES (2, 501, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1000, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1001, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1002, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1003, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1004, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1005, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1006, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1007, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1008, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1009, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1010, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1011, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1012, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1013, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1014, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1015, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1016, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1017, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1018, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1019, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1020, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1021, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1022, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1023, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1024, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1025, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1026, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1027, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1028, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1029, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1030, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1031, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1032, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1033, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1034, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1035, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1036, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1037, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1038, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1039, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1040, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1041, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1042, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1043, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1044, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1045, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1046, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1047, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1048, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1049, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1050, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1051, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1052, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1053, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1054, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1055, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1056, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1057, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1058, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1059, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1060, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2000, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2001, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2002, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2003, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2004, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2005, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2006, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2007, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2008, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2009, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2010, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2011, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2012, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2013, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2014, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2015, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2016, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2017, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2018, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2019, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2020, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2021, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2022, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2023, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2024, 1);

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `tenant_id` bigint NOT NULL AUTO_INCREMENT COMMENT '租户ID',
  `tenant_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户名称',
  `datasource_id` bigint NULL DEFAULT NULL COMMENT '数据源ID',
  `domain_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户域名',
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户logo',
  `contact_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `package_id` bigint NULL DEFAULT NULL COMMENT '租户套餐ID',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父租户ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (1, '氢信', 1, 'localhost', NULL, '氢信', '12345678901', NULL, NULL, '0', '0', NULL, 'admin', '2024-12-06 10:10:10', NULL, '2025-01-16 13:55:25', NULL);
INSERT INTO `sys_tenant` VALUES (2, '138', 2, 'localhost2', NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, '2025-01-16 13:55:21', NULL, '2025-01-16 13:55:30', NULL);

-- ----------------------------
-- Table structure for sys_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_package`;
CREATE TABLE `sys_tenant_package`  (
  `package_id` bigint NOT NULL AUTO_INCREMENT COMMENT '租户套餐ID',
  `package_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `menu_ids` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联菜单id',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '套餐状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`package_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租户套餐表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant_package
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  PRIMARY KEY (`user_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-01-15 09:52:33', 'admin', '2024-11-22 10:10:35', '', '2025-01-15 09:52:32', '管理员', 1);
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-01-09 15:18:15', 'admin', '2024-11-22 10:10:35', 'admin', '2025-01-09 15:18:14', '测试员', 1);
INSERT INTO `sys_user` VALUES (3, NULL, 'test1', '测试', '00', '', '', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 2);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1, NULL);
INSERT INTO `sys_user_post` VALUES (2, 2, NULL);
INSERT INTO `sys_user_post` VALUES (2, 4, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2, 1);

SET FOREIGN_KEY_CHECKS = 1;
