
  CREATE TABLE "ORCLDB"."ETL_AUDIT" 
   (	"RUN_ID" NUMBER, 
	"START_TIME" TIMESTAMP (6), 
	"NUMBER_OF_RECORDS" NUMBER, 
	"STATUS" VARCHAR2(50 BYTE), 
	"END_TIME" TIMESTAMP (6), 
	"FOLDER_NAME" VARCHAR2(50 BYTE), 
	"WORK_FLOW_NAME" VARCHAR2(50 BYTE)
   )

 ALTER TABLE ETL_AUDIT ADD CONSTRAINT "PK" PRIMARY KEY ("RUN_ID")



