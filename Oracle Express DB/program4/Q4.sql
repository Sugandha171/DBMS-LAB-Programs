/* 4. Calculate the FinalIA (Average of best two test marks) and update the corresponding table for all students. */

CREATE OR REPLACE PROCEDURE AVGMARKS
IS
CURSOR C_IAMARKS IS
SELECT 	GREATEST(TEST1,TEST2) AS A,
		GREATEST(TEST1,TEST3) AS B,
		GREATEST(TEST3,TEST2) AS C
FROM IAMARKS
WHERE FINALIA = 0 FOR UPDATE;
 
 C_A NUMBER;
 C_B NUMBER;
 C_C NUMBER;
 C_SUM NUMBER;
 C_AVG NUMBER;

BEGIN
 OPEN C_IAMARKS;
 LOOP
 FETCH C_IAMARKS INTO C_A, C_B, C_C;
 EXIT WHEN C_IAMARKS%NOTFOUND;
 --DBMS_OUTPUT.PUT_LINE(C_A || ' ' || C_B || ' ' || C_C);
 IF (C_A != C_B) THEN
C_SUM:=C_A+C_B;
 ELSE
C_SUM:=C_A+C_C;
 END IF;

 C_AVG:=C_SUM/2;
 --DBMS_OUTPUT.PUT_LINE('SUM = '||C_SUM);
 --DBMS_OUTPUT.PUT_LINE('AVERAGE = '||C_AVG);
 UPDATE IAMARKS SET FINALIA=C_AVG WHERE CURRENT OF C_IAMARKS;

 END LOOP;
 CLOSE C_IAMARKS;
END;
/

/*Note: Before execution of PL/SQL procedure, IAMARKS table contents are:*/ 
SELECT * FROM IAMARKS;

/* To run procedure, type the same
BEGIN
AVGMARKS();
END;
/
*/

/* After executing the procedure, run this:
SELECT * FROM IAMARKS;
*/