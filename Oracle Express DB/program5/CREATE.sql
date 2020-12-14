CREATE TABLE DEPARTMENT
(DNO VARCHAR2 (10) PRIMARY KEY,
DNAME VARCHAR2 (20),
MGRSTARTDATE DATE);

CREATE TABLE EMPLOYEE
(SSN VARCHAR2 (10) PRIMARY KEY,
SUPERSSN VARCHAR2 (10),
DNO VARCHAR2 (10),
FNAME VARCHAR2 (8),
LNAME VARCHAR2 (8),
ADDRESS VARCHAR2 (10),
SEX CHAR (1),
SALARY NUMBER(10, 2),
FOREIGN KEY (SUPERSSN) REFERENCES EMPLOYEE (SSN),
FOREIGN KEY (DNO) REFERENCES DEPARTMENT (DNO));

/* NOTE: Once DEPARTMENT and EMPLOYEE tables are created we must alter department
table to add foreign constraint MGRSSN using sql command */

ALTER TABLE DEPARTMENT
ADD MGRSSN VARCHAR2 (10) REFERENCES EMPLOYEE (SSN);

CREATE TABLE DLOCATION
(DNO VARCHAR2 (10),
DLOC VARCHAR2 (10),
PRIMARY KEY (DNO, DLOC),
FOREIGN KEY (DNO) REFERENCES DEPARTMENT (DNO));

CREATE TABLE PROJECT
(PNO INTEGER PRIMARY KEY,
DNO VARCHAR2 (10),
PNAME VARCHAR2 (20),
PLOCATION VARCHAR2 (20),
FOREIGN KEY (DNO) REFERENCES DEPARTMENT (DNO));

CREATE TABLE WORKS_ON
(HOURS NUMBER (2),
SSN VARCHAR2 (10),
PNO INTEGER,
PRIMARY KEY (SSN, PNO),
FOREIGN KEY (SSN) REFERENCES EMPLOYEE (SSN),
FOREIGN KEY (PNO) REFERENCES PROJECT (PNO)
);