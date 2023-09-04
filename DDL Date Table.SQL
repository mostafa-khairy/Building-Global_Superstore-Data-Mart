
CREATE TABLE Dim_date (
    date_key           NUMBER,
    full_date          DATE,
    day_of_week        VARCHAR2(20),
    day_of_month       NUMBER,
    day_name           VARCHAR2(20),
    month              NUMBER,
    month_name         VARCHAR2(20),
    quarter            NUMBER,
    quarter_name       VARCHAR2(20),
    year               NUMBER,
    is_weekend         VARCHAR2(10),
    is_holiday         VARCHAR2(10)
);










DECLARE
    CurrentTimestamp TIMESTAMP := TO_TIMESTAMP('2000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS');
    EndTimestamp TIMESTAMP := TO_TIMESTAMP('2030-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS');
BEGIN
    WHILE CurrentTimestamp < EndTimestamp
    LOOP
        INSERT INTO date_dimension (
            date_key,
            full_date,
            day_of_week,
            day_of_month,
            day_name,
            month,
            month_name,
            quarter,
            quarter_name,
            year,
            is_weekend,
            is_holiday
        ) 
        VALUES (
            TO_CHAR(CurrentTimestamp, 'YYYYMMDD'),
            CurrentTimestamp,
            TO_CHAR(CurrentTimestamp, 'DAY'),
            TO_NUMBER(TO_CHAR(CurrentTimestamp, 'DD')),
            TO_CHAR(CurrentTimestamp, 'FMDAY'),
            TO_NUMBER(TO_CHAR(CurrentTimestamp, 'MM')),
            TO_CHAR(CurrentTimestamp, 'MONTH'),
            TO_NUMBER(TO_CHAR(CurrentTimestamp, 'Q')),
            TO_CHAR(CurrentTimestamp, 'Q'),
            TO_NUMBER(TO_CHAR(CurrentTimestamp, 'YYYY')),
            CASE WHEN TO_CHAR(CurrentTimestamp, 'D') IN (6, 7) THEN 'Y' ELSE 'N' END,
            CASE WHEN CurrentTimestamp = TO_TIMESTAMP('2000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') THEN 'Y' ELSE 'N' END
        );

        CurrentTimestamp := CurrentTimestamp + INTERVAL '1' DAY;
    END LOOP;
END;
/