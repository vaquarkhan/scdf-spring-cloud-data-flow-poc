--------------------------------------------------------
--  File created - pondělí-listopadu-25-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BATCH_JOB_EXECUTION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCDF"."BATCH_JOB_EXECUTION_SEQ"  MINVALUE 0 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 0 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence BATCH_JOB_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCDF"."BATCH_JOB_SEQ"  MINVALUE 0 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 0 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence BATCH_STEP_EXECUTION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCDF"."BATCH_STEP_EXECUTION_SEQ"  MINVALUE 0 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 0 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HIBERNATE_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "SCDF"."HIBERNATE_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence TASK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCDF"."TASK_SEQ"  MINVALUE 0 MAXVALUE 9223372036854775807 INCREMENT BY 1 START WITH 0 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table APP_REGISTRATION
--------------------------------------------------------

  CREATE TABLE "SCDF"."APP_REGISTRATION" 
   (	"ID" NUMBER(19,0), 
	"OBJECT_VERSION" NUMBER(19,0), 
	"DEFAULT_VERSION" NUMBER(1,0), 
	"METADATA_URI" CLOB, 
	"NAME" VARCHAR2(255 CHAR), 
	"TYPE" NUMBER(10,0), 
	"URI" CLOB, 
	"VERSION" VARCHAR2(255 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("METADATA_URI") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) 
 LOB ("URI") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table AUDIT_RECORDS
--------------------------------------------------------

  CREATE TABLE "SCDF"."AUDIT_RECORDS" 
   (	"ID" NUMBER(19,0), 
	"AUDIT_ACTION" NUMBER(19,0), 
	"AUDIT_DATA" LONG, 
	"AUDIT_OPERATION" NUMBER(19,0), 
	"CORRELATION_ID" VARCHAR2(255 CHAR), 
	"CREATED_BY" VARCHAR2(255 CHAR), 
	"CREATED_ON" TIMESTAMP (6)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BATCH_JOB_EXECUTION
--------------------------------------------------------

  CREATE TABLE "SCDF"."BATCH_JOB_EXECUTION" 
   (	"JOB_EXECUTION_ID" NUMBER(19,0), 
	"VERSION" NUMBER(19,0), 
	"JOB_INSTANCE_ID" NUMBER(19,0), 
	"CREATE_TIME" TIMESTAMP (6), 
	"START_TIME" TIMESTAMP (6) DEFAULT NULL, 
	"END_TIME" TIMESTAMP (6) DEFAULT NULL, 
	"STATUS" VARCHAR2(10 CHAR), 
	"EXIT_CODE" VARCHAR2(2500 CHAR), 
	"EXIT_MESSAGE" VARCHAR2(2500 CHAR), 
	"LAST_UPDATED" TIMESTAMP (6), 
	"JOB_CONFIGURATION_LOCATION" VARCHAR2(2500 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BATCH_JOB_EXECUTION_CONTEXT
--------------------------------------------------------

  CREATE TABLE "SCDF"."BATCH_JOB_EXECUTION_CONTEXT" 
   (	"JOB_EXECUTION_ID" NUMBER(19,0), 
	"SHORT_CONTEXT" VARCHAR2(2500 CHAR), 
	"SERIALIZED_CONTEXT" CLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("SERIALIZED_CONTEXT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table BATCH_JOB_EXECUTION_PARAMS
--------------------------------------------------------

  CREATE TABLE "SCDF"."BATCH_JOB_EXECUTION_PARAMS" 
   (	"JOB_EXECUTION_ID" NUMBER(19,0), 
	"TYPE_CD" VARCHAR2(6 CHAR), 
	"KEY_NAME" VARCHAR2(100 CHAR), 
	"STRING_VAL" VARCHAR2(250 CHAR), 
	"DATE_VAL" TIMESTAMP (6) DEFAULT NULL, 
	"LONG_VAL" NUMBER(19,0), 
	"DOUBLE_VAL" NUMBER, 
	"IDENTIFYING" CHAR(1 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BATCH_JOB_INSTANCE
--------------------------------------------------------

  CREATE TABLE "SCDF"."BATCH_JOB_INSTANCE" 
   (	"JOB_INSTANCE_ID" NUMBER(19,0), 
	"VERSION" NUMBER(19,0), 
	"JOB_NAME" VARCHAR2(100 CHAR), 
	"JOB_KEY" VARCHAR2(32 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BATCH_STEP_EXECUTION
--------------------------------------------------------

  CREATE TABLE "SCDF"."BATCH_STEP_EXECUTION" 
   (	"STEP_EXECUTION_ID" NUMBER(19,0), 
	"VERSION" NUMBER(19,0), 
	"STEP_NAME" VARCHAR2(100 CHAR), 
	"JOB_EXECUTION_ID" NUMBER(19,0), 
	"START_TIME" TIMESTAMP (6), 
	"END_TIME" TIMESTAMP (6) DEFAULT NULL, 
	"STATUS" VARCHAR2(10 CHAR), 
	"COMMIT_COUNT" NUMBER(19,0), 
	"READ_COUNT" NUMBER(19,0), 
	"FILTER_COUNT" NUMBER(19,0), 
	"WRITE_COUNT" NUMBER(19,0), 
	"READ_SKIP_COUNT" NUMBER(19,0), 
	"WRITE_SKIP_COUNT" NUMBER(19,0), 
	"PROCESS_SKIP_COUNT" NUMBER(19,0), 
	"ROLLBACK_COUNT" NUMBER(19,0), 
	"EXIT_CODE" VARCHAR2(2500 CHAR), 
	"EXIT_MESSAGE" VARCHAR2(2500 CHAR), 
	"LAST_UPDATED" TIMESTAMP (6)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BATCH_STEP_EXECUTION_CONTEXT
--------------------------------------------------------

  CREATE TABLE "SCDF"."BATCH_STEP_EXECUTION_CONTEXT" 
   (	"STEP_EXECUTION_ID" NUMBER(19,0), 
	"SHORT_CONTEXT" VARCHAR2(2500 CHAR), 
	"SERIALIZED_CONTEXT" CLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("SERIALIZED_CONTEXT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table flyway_schema_history_dataflow
--------------------------------------------------------

  CREATE TABLE "SCDF"."flyway_schema_history_dataflow" 
   (	"installed_rank" NUMBER(*,0), 
	"version" VARCHAR2(50 BYTE), 
	"description" VARCHAR2(200 BYTE), 
	"type" VARCHAR2(20 BYTE), 
	"script" VARCHAR2(1000 BYTE), 
	"checksum" NUMBER(*,0), 
	"installed_by" VARCHAR2(100 BYTE), 
	"installed_on" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP, 
	"execution_time" NUMBER(*,0), 
	"success" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table STREAM_DEFINITIONS
--------------------------------------------------------

  CREATE TABLE "SCDF"."STREAM_DEFINITIONS" 
   (	"DEFINITION_NAME" VARCHAR2(255 CHAR), 
	"DEFINITION" CLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("DEFINITION") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table TASK_DEFINITIONS
--------------------------------------------------------

  CREATE TABLE "SCDF"."TASK_DEFINITIONS" 
   (	"DEFINITION_NAME" VARCHAR2(255 CHAR), 
	"DEFINITION" CLOB
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("DEFINITION") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table TASK_DEPLOYMENT
--------------------------------------------------------

  CREATE TABLE "SCDF"."TASK_DEPLOYMENT" 
   (	"ID" NUMBER(19,0), 
	"OBJECT_VERSION" NUMBER(19,0), 
	"TASK_DEPLOYMENT_ID" VARCHAR2(255 CHAR), 
	"TASK_DEFINITION_NAME" VARCHAR2(255 CHAR), 
	"PLATFORM_NAME" VARCHAR2(255 CHAR), 
	"CREATED_ON" TIMESTAMP (6)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TASK_EXECUTION
--------------------------------------------------------

  CREATE TABLE "SCDF"."TASK_EXECUTION" 
   (	"TASK_EXECUTION_ID" NUMBER, 
	"START_TIME" TIMESTAMP (6) DEFAULT NULL, 
	"END_TIME" TIMESTAMP (6) DEFAULT NULL, 
	"TASK_NAME" VARCHAR2(100 BYTE), 
	"EXIT_CODE" NUMBER(*,0), 
	"EXIT_MESSAGE" VARCHAR2(2500 BYTE), 
	"ERROR_MESSAGE" VARCHAR2(2500 BYTE), 
	"LAST_UPDATED" TIMESTAMP (6), 
	"EXTERNAL_EXECUTION_ID" VARCHAR2(255 BYTE), 
	"PARENT_EXECUTION_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TASK_EXECUTION_PARAMS
--------------------------------------------------------

  CREATE TABLE "SCDF"."TASK_EXECUTION_PARAMS" 
   (	"TASK_EXECUTION_ID" NUMBER, 
	"TASK_PARAM" VARCHAR2(2500 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TASK_LOCK
--------------------------------------------------------

  CREATE TABLE "SCDF"."TASK_LOCK" 
   (	"LOCK_KEY" CHAR(36 BYTE), 
	"REGION" VARCHAR2(100 BYTE), 
	"CLIENT_ID" CHAR(36 BYTE), 
	"CREATED_DATE" TIMESTAMP (6)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TASK_TASK_BATCH
--------------------------------------------------------

  CREATE TABLE "SCDF"."TASK_TASK_BATCH" 
   (	"TASK_EXECUTION_ID" NUMBER, 
	"JOB_EXECUTION_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into SCDF.APP_REGISTRATION
SET DEFINE OFF;
REM INSERTING into SCDF.AUDIT_RECORDS
SET DEFINE OFF;
REM INSERTING into SCDF.BATCH_JOB_EXECUTION
SET DEFINE OFF;
REM INSERTING into SCDF.BATCH_JOB_EXECUTION_CONTEXT
SET DEFINE OFF;
REM INSERTING into SCDF.BATCH_JOB_EXECUTION_PARAMS
SET DEFINE OFF;
REM INSERTING into SCDF.BATCH_JOB_INSTANCE
SET DEFINE OFF;
REM INSERTING into SCDF.BATCH_STEP_EXECUTION
SET DEFINE OFF;
REM INSERTING into SCDF.BATCH_STEP_EXECUTION_CONTEXT
SET DEFINE OFF;
REM INSERTING into SCDF."flyway_schema_history_dataflow"
SET DEFINE OFF;
Insert into SCDF."flyway_schema_history_dataflow" ("installed_rank","version","description","type","script","checksum","installed_by","installed_on","execution_time","success") values ('1','1','Initial Setup','JDBC','org.springframework.cloud.dataflow.server.db.migration.oracle.V1__Initial_Setup',null,'SCDF',to_timestamp('25.11.19 20:40:58,783000000','DD.MM.RR HH24:MI:SSXFF'),'255','1');
Insert into SCDF."flyway_schema_history_dataflow" ("installed_rank","version","description","type","script","checksum","installed_by","installed_on","execution_time","success") values ('2',null,'Hibernate Sequence','JDBC','org.springframework.cloud.dataflow.server.db.migration.oracle.R__Hibernate_Sequence',null,'SCDF',to_timestamp('25.11.19 20:40:58,804000000','DD.MM.RR HH24:MI:SSXFF'),'5','1');
REM INSERTING into SCDF.STREAM_DEFINITIONS
SET DEFINE OFF;
REM INSERTING into SCDF.TASK_DEFINITIONS
SET DEFINE OFF;
REM INSERTING into SCDF.TASK_DEPLOYMENT
SET DEFINE OFF;
REM INSERTING into SCDF.TASK_EXECUTION
SET DEFINE OFF;
REM INSERTING into SCDF.TASK_EXECUTION_PARAMS
SET DEFINE OFF;
REM INSERTING into SCDF.TASK_LOCK
SET DEFINE OFF;
REM INSERTING into SCDF.TASK_TASK_BATCH
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index flyway_schema_history_dataflow_pk
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."flyway_schema_history_dataflow_pk" ON "SCDF"."flyway_schema_history_dataflow" ("installed_rank") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index flyway_schema_history_dataflow_s_idx
--------------------------------------------------------

  CREATE INDEX "SCDF"."flyway_schema_history_dataflow_s_idx" ON "SCDF"."flyway_schema_history_dataflow" ("success") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JOB_INST_UN
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."JOB_INST_UN" ON "SCDF"."BATCH_JOB_INSTANCE" ("JOB_NAME", "JOB_KEY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOCK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."LOCK_PK" ON "SCDF"."TASK_LOCK" ("LOCK_KEY", "REGION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007424
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_C007424" ON "SCDF"."APP_REGISTRATION" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007429
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_C007429" ON "SCDF"."TASK_DEPLOYMENT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007431
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_C007431" ON "SCDF"."AUDIT_RECORDS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007433
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_C007433" ON "SCDF"."STREAM_DEFINITIONS" ("DEFINITION_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007435
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_C007435" ON "SCDF"."TASK_DEFINITIONS" ("DEFINITION_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007437
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_C007437" ON "SCDF"."TASK_EXECUTION" ("TASK_EXECUTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007450
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_C007450" ON "SCDF"."BATCH_JOB_INSTANCE" ("JOB_INSTANCE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007455
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_C007455" ON "SCDF"."BATCH_JOB_EXECUTION" ("JOB_EXECUTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007467
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_C007467" ON "SCDF"."BATCH_STEP_EXECUTION" ("STEP_EXECUTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007471
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_C007471" ON "SCDF"."BATCH_STEP_EXECUTION_CONTEXT" ("STEP_EXECUTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007475
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_C007475" ON "SCDF"."BATCH_JOB_EXECUTION_CONTEXT" ("JOB_EXECUTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000073463C00004$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_IL0000073463C00004$$" ON "SCDF"."APP_REGISTRATION" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000073463C00007$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_IL0000073463C00007$$" ON "SCDF"."APP_REGISTRATION" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000073473C00002$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_IL0000073473C00002$$" ON "SCDF"."STREAM_DEFINITIONS" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000073477C00002$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_IL0000073477C00002$$" ON "SCDF"."TASK_DEFINITIONS" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000073496C00003$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_IL0000073496C00003$$" ON "SCDF"."BATCH_STEP_EXECUTION_CONTEXT" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000073500C00003$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCDF"."SYS_IL0000073500C00003$$" ON "SCDF"."BATCH_JOB_EXECUTION_CONTEXT" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  Constraints for Table APP_REGISTRATION
--------------------------------------------------------

  ALTER TABLE "SCDF"."APP_REGISTRATION" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."APP_REGISTRATION" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table AUDIT_RECORDS
--------------------------------------------------------

  ALTER TABLE "SCDF"."AUDIT_RECORDS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."AUDIT_RECORDS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BATCH_JOB_EXECUTION
--------------------------------------------------------

  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION" MODIFY ("JOB_EXECUTION_ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION" MODIFY ("JOB_INSTANCE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION" MODIFY ("CREATE_TIME" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION" ADD PRIMARY KEY ("JOB_EXECUTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BATCH_JOB_EXECUTION_CONTEXT
--------------------------------------------------------

  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION_CONTEXT" MODIFY ("JOB_EXECUTION_ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION_CONTEXT" MODIFY ("SHORT_CONTEXT" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION_CONTEXT" ADD PRIMARY KEY ("JOB_EXECUTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BATCH_JOB_EXECUTION_PARAMS
--------------------------------------------------------

  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION_PARAMS" MODIFY ("JOB_EXECUTION_ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION_PARAMS" MODIFY ("TYPE_CD" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION_PARAMS" MODIFY ("KEY_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION_PARAMS" MODIFY ("IDENTIFYING" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BATCH_JOB_INSTANCE
--------------------------------------------------------

  ALTER TABLE "SCDF"."BATCH_JOB_INSTANCE" MODIFY ("JOB_INSTANCE_ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_JOB_INSTANCE" MODIFY ("JOB_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_JOB_INSTANCE" MODIFY ("JOB_KEY" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_JOB_INSTANCE" ADD PRIMARY KEY ("JOB_INSTANCE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SCDF"."BATCH_JOB_INSTANCE" ADD CONSTRAINT "JOB_INST_UN" UNIQUE ("JOB_NAME", "JOB_KEY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BATCH_STEP_EXECUTION
--------------------------------------------------------

  ALTER TABLE "SCDF"."BATCH_STEP_EXECUTION" MODIFY ("STEP_EXECUTION_ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_STEP_EXECUTION" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_STEP_EXECUTION" MODIFY ("STEP_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_STEP_EXECUTION" MODIFY ("JOB_EXECUTION_ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_STEP_EXECUTION" MODIFY ("START_TIME" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_STEP_EXECUTION" ADD PRIMARY KEY ("STEP_EXECUTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BATCH_STEP_EXECUTION_CONTEXT
--------------------------------------------------------

  ALTER TABLE "SCDF"."BATCH_STEP_EXECUTION_CONTEXT" MODIFY ("STEP_EXECUTION_ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_STEP_EXECUTION_CONTEXT" MODIFY ("SHORT_CONTEXT" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."BATCH_STEP_EXECUTION_CONTEXT" ADD PRIMARY KEY ("STEP_EXECUTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table flyway_schema_history_dataflow
--------------------------------------------------------

  ALTER TABLE "SCDF"."flyway_schema_history_dataflow" MODIFY ("installed_rank" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."flyway_schema_history_dataflow" MODIFY ("description" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."flyway_schema_history_dataflow" MODIFY ("type" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."flyway_schema_history_dataflow" MODIFY ("script" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."flyway_schema_history_dataflow" MODIFY ("installed_by" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."flyway_schema_history_dataflow" MODIFY ("installed_on" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."flyway_schema_history_dataflow" MODIFY ("execution_time" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."flyway_schema_history_dataflow" MODIFY ("success" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."flyway_schema_history_dataflow" ADD CONSTRAINT "flyway_schema_history_dataflow_pk" PRIMARY KEY ("installed_rank")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STREAM_DEFINITIONS
--------------------------------------------------------

  ALTER TABLE "SCDF"."STREAM_DEFINITIONS" MODIFY ("DEFINITION_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."STREAM_DEFINITIONS" ADD PRIMARY KEY ("DEFINITION_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TASK_DEFINITIONS
--------------------------------------------------------

  ALTER TABLE "SCDF"."TASK_DEFINITIONS" MODIFY ("DEFINITION_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."TASK_DEFINITIONS" ADD PRIMARY KEY ("DEFINITION_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TASK_DEPLOYMENT
--------------------------------------------------------

  ALTER TABLE "SCDF"."TASK_DEPLOYMENT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."TASK_DEPLOYMENT" MODIFY ("TASK_DEPLOYMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."TASK_DEPLOYMENT" MODIFY ("TASK_DEFINITION_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."TASK_DEPLOYMENT" MODIFY ("PLATFORM_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."TASK_DEPLOYMENT" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TASK_EXECUTION
--------------------------------------------------------

  ALTER TABLE "SCDF"."TASK_EXECUTION" MODIFY ("TASK_EXECUTION_ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."TASK_EXECUTION" ADD PRIMARY KEY ("TASK_EXECUTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TASK_EXECUTION_PARAMS
--------------------------------------------------------

  ALTER TABLE "SCDF"."TASK_EXECUTION_PARAMS" MODIFY ("TASK_EXECUTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TASK_LOCK
--------------------------------------------------------

  ALTER TABLE "SCDF"."TASK_LOCK" MODIFY ("LOCK_KEY" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."TASK_LOCK" MODIFY ("REGION" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."TASK_LOCK" MODIFY ("CREATED_DATE" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."TASK_LOCK" ADD CONSTRAINT "LOCK_PK" PRIMARY KEY ("LOCK_KEY", "REGION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TASK_TASK_BATCH
--------------------------------------------------------

  ALTER TABLE "SCDF"."TASK_TASK_BATCH" MODIFY ("TASK_EXECUTION_ID" NOT NULL ENABLE);
  ALTER TABLE "SCDF"."TASK_TASK_BATCH" MODIFY ("JOB_EXECUTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BATCH_JOB_EXECUTION
--------------------------------------------------------

  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION" ADD CONSTRAINT "JOB_INST_EXEC_FK" FOREIGN KEY ("JOB_INSTANCE_ID")
	  REFERENCES "SCDF"."BATCH_JOB_INSTANCE" ("JOB_INSTANCE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BATCH_JOB_EXECUTION_CONTEXT
--------------------------------------------------------

  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION_CONTEXT" ADD CONSTRAINT "JOB_EXEC_CTX_FK" FOREIGN KEY ("JOB_EXECUTION_ID")
	  REFERENCES "SCDF"."BATCH_JOB_EXECUTION" ("JOB_EXECUTION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BATCH_JOB_EXECUTION_PARAMS
--------------------------------------------------------

  ALTER TABLE "SCDF"."BATCH_JOB_EXECUTION_PARAMS" ADD CONSTRAINT "JOB_EXEC_PARAMS_FK" FOREIGN KEY ("JOB_EXECUTION_ID")
	  REFERENCES "SCDF"."BATCH_JOB_EXECUTION" ("JOB_EXECUTION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BATCH_STEP_EXECUTION
--------------------------------------------------------

  ALTER TABLE "SCDF"."BATCH_STEP_EXECUTION" ADD CONSTRAINT "JOB_EXEC_STEP_FK" FOREIGN KEY ("JOB_EXECUTION_ID")
	  REFERENCES "SCDF"."BATCH_JOB_EXECUTION" ("JOB_EXECUTION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BATCH_STEP_EXECUTION_CONTEXT
--------------------------------------------------------

  ALTER TABLE "SCDF"."BATCH_STEP_EXECUTION_CONTEXT" ADD CONSTRAINT "STEP_EXEC_CTX_FK" FOREIGN KEY ("STEP_EXECUTION_ID")
	  REFERENCES "SCDF"."BATCH_STEP_EXECUTION" ("STEP_EXECUTION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TASK_EXECUTION_PARAMS
--------------------------------------------------------

  ALTER TABLE "SCDF"."TASK_EXECUTION_PARAMS" ADD CONSTRAINT "TASK_EXEC_PARAMS_FK" FOREIGN KEY ("TASK_EXECUTION_ID")
	  REFERENCES "SCDF"."TASK_EXECUTION" ("TASK_EXECUTION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TASK_TASK_BATCH
--------------------------------------------------------

  ALTER TABLE "SCDF"."TASK_TASK_BATCH" ADD CONSTRAINT "TASK_EXEC_BATCH_FK" FOREIGN KEY ("TASK_EXECUTION_ID")
	  REFERENCES "SCDF"."TASK_EXECUTION" ("TASK_EXECUTION_ID") ENABLE;

