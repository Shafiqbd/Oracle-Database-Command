																	/********* ***********************/
																	/********* DDL (Play With Filed/Attribute/Column********/
																	/********* ***********************/


/********** Show All Table ************/

select * from tab;

/********** Create Table ************/
CREATE TABLE cars(
md_num number(3),
md_name	varchar(10),
style	varchar(10),
year	number(3)
);

/********** Show one Table ************/
desc cars;
/********** Add single column: ************/

ALTER TABLE TABLE_NAME
ADD COLUMN_NAME COLUMN_DEFINITION;

add a column on specs table.
ALTER TABLE specs
ADD tyre	VARCHAR(10);

/********** Add multiple columns: ************/

ALTER TABLE TABLE_NAME
ADD (	COLUMN_NAME1  COLUMN_DEFINITION1,
COLUMN_NAME2  COLUMN_DEFINITION 2,
…………………………………………………….,
COLUMN_NAMEn  COLUMN_DEFINITIONn);

add multiple columns on cars table.
ALTER TABLE cars
ADD (	company	VARCHAR(10),
Supplier	VARCHAR(10));

/********** Modify a column:************/

ALTER TABLE TABLE_NAME
MODIFY COLUMN_NAME COLUMN_DEFINITION;

ALTER TABLE specs
MODIFY tyre	number(3);


/**********Modify multiple columns:************/

ALTER TABLE TABLE_NAME
MODIFY (	COLUMN_NAME1 COLUMN_DEFINITION1, COLUMN_NAME2 COLUMN_DEFINITION 2,
…………………………………………………….,
COLUMN_NAMEn  COLUMN_DEFINITIONn);

ALTER TABLE cars
MODIFY (	company	VARCHAR(20),
Supplier	VARCHAR(20));

/**********Drop a column:************/

ALTER TABLE TABLE_NAME
DROP COLUMN COLUMN_NAME;

ALTER TABLE specs
DROP COLUMN tyre;

/**********Drop Multiple columns:************/

ALTER TABLE TABLE_NAME
DROP (COLUMN1, COLUMN2, ……. , COLUMNn);

ALTER TABLE cars
DROP (company, supplier); 

/**********Rename a column:************/

ALTER TABLE TABLE_NAME
RENAME COLUMN old_name to new_name;

ALTER TABLE cars
RENAME COLUMN style to shape;
										/**********You cannot rename multiple columns in a single command. ************/
 




/********* ***********************/
/********* For drop table*********/
/********* ***********************/
drop table dependent;
drop table employee;
drop table department;

/********* ***********************/
/********* For create table*********/
/********* ***********************/

CREATE TABLE DEPARTMENT
  (DNAME          VARCHAR2(15),
   DNUMBER        NUMBER(2) NOT NULL,
   MGRSSN         NUMBER(12),
   MGRSTARTDATE   DATE,
   PRIMARY KEY (dnumber)
);


CREATE TABLE employee
  (FNAME           VARCHAR2(15),
   MINIT           VARCHAR2(2),
   LNAME           VARCHAR2(15),
   SSN             NUMBER(12) NOT NULL,
   BDATE           DATE,
   ADDRESS         VARCHAR2(35),
   SEX             VARCHAR2(1),
   SALARY          NUMBER(7) NOT NULL,
   SUPERSSN        NUMBER(12),
   DNO             NUMBER(2) NOT NULL,
   PRIMARY KEY (ssn),
   FOREIGN KEY (dno) REFERENCES department (dnumber) /****** FOREIGN KEY declare***/
);

CREATE TABLE DEPENDENT 
(ESSN                   NUMBER(12),
 DEPENDENT_NAME         VARCHAR2(15),
 SEX                    VARCHAR2(1),
 BDATE                  DATE,
 RELATIONSHIP           VARCHAR2(12),
 PRIMARY KEY (essn, dependent_name),
 FOREIGN KEY (essn) REFERENCES employee (ssn)
);

/********* ***********************/
/********* For Insert value *********/
/********* ***********************/

INSERT INTO DEPARTMENT VALUES ('RESEARCH',       5, 333445555, '22-MAY-1978') ;
INSERT INTO DEPARTMENT VALUES ('ADMINISTRATION', 4, 987654321, '01-JAN-1985') ;
INSERT INTO DEPARTMENT VALUES ('HEADQUARTERS',   1, 888665555, '19-JUN-1971') ;

INSERT INTO EMPLOYEE VALUES
(123456789,'JOHN','B','SMITH','09-JAN-1955','731 FONDREN, HOUSTON, TX', 'M',30000,333445555,5) ;
INSERT INTO EMPLOYEE VALUES
(333445555,'FRANKLIN','T','WONG','08-DEC-1945','638 VOSS,HOUSTON TX', 'M',40000,888665555,5) ;
INSERT INTO EMPLOYEE VALUES
(999887777,'ALICIA','J','ZELAYA','19-JUL-1958','3321 CASTLE, SPRING, TX', 'F',25000,987654321,4) ;
INSERT INTO EMPLOYEE VALUES
(987654321,'JENNIFER','S','WALLACE','20-JUN-1931','291 BERRY, BELLAIRE, TX', 'F',43000,888665555,4) ;
INSERT INTO EMPLOYEE VALUES
(666884444,'RAMESH','K','NARAYAN','15-SEP-1952','975 FIRE OAK, HUMBLE, TX', 'M',38000,333445555,5) ;
INSERT INTO EMPLOYEE VALUES
(453453453,'JOYCE','A','ENGLISH','31-JUL-1962','5631 RICE, HOUSTON, TX', 'F',25000,333445555,5);
INSERT INTO EMPLOYEE VALUES
(987987987,'AHMAD','V','JABBAR','29-MAR-1959','980 DALLAS, HOUSTON, TX', 'M',25000,987654321,4) ;
INSERT INTO EMPLOYEE VALUES 
(888665555,'JAMES','E','BORG','10-NOV-1927', '450 STONE, HOUSTON, TX', 'M',55000,NULL,1) ;

INSERT INTO DEPENDENT VALUES (333445555,'ALICE','F','05-APR-1976','DAUGHTER') ;
INSERT INTO DEPENDENT VALUES (333445555,'THEODORE','M','25-OCT-1973','SON')  ;
INSERT INTO DEPENDENT VALUES (333445555,'JOY','F','03-MAY-1948','SPOUSE');
INSERT INTO DEPENDENT VALUES (123456789,'MICHAEL','M','01-JAN-1978','SON');
INSERT INTO DEPENDENT VALUES (123456789,'ALICE','F','31-DEC-1978','DAUGHTER');
INSERT INTO DEPENDENT VALUES (123456789,'ELIZABETH','F','05-MAY-1957','SPOUSE');
INSERT INTO DEPENDENT VALUES (987654321,'ABNER','M','26-FEB-1932','SPOUSE');


/********* ***********************/
/********* Select data *********/
/********* ***********************/

SELECT * FROM department;
SELECT fname, lname, dno FROM employee;

/********* ***********************/
/********* Declare foreign key as a on delete casecade 
			as a result all row will be delete*********/
/********* ***********************/


CREATE TABLE employee
  (FNAME           VARCHAR2(15),
   MINIT           VARCHAR2(2),
   LNAME           VARCHAR2(15),
   SSN             NUMBER(12) NOT NULL,
   BDATE           DATE,
   ADDRESS         VARCHAR2(35),
   SEX             VARCHAR2(1),
   SALARY          NUMBER(7) NOT NULL,
   SUPERSSN        NUMBER(12),
   DNO             NUMBER(2) ,
   PRIMARY KEY (ssn),
   FOREIGN KEY (dno) REFERENCES department (dnumber) ON DELETE CASCADE
   /********* ***********************/
/********* Declare foreign key as a on delete set null 
			as a result all row value will be null*********/
/********* ***********************/
   CREATE TABLE employee
  (FNAME           VARCHAR2(15),
   MINIT           VARCHAR2(2),
   LNAME           VARCHAR2(15),
   SSN             NUMBER(12) NOT NULL,
   BDATE           DATE,
   ADDRESS         VARCHAR2(35),
   SEX             VARCHAR2(1),
   SALARY          NUMBER(7) NOT NULL,
   SUPERSSN        NUMBER(12),
   DNO             NUMBER(2) ,
   PRIMARY KEY (ssn),
   FOREIGN KEY (dno) REFERENCES department (dnumber) ON DELETE SET NULL
) ;
/********* ***********************/
/********* Declare unique as a unique thats allow null one time. and default key will save time 
and add value table autometically whatever user data insert or not*********/
/********* ***********************/
DROP TABLE course_contents;
CREATE TABLE course_contents(
	course_id	varchar(10) NOT NULL,
	course_name	varchar(20) UNIQUE,
	credit		integer CHECK(credit>0 AND credit<5),
	passmark	integer DEFAULT 40,
	PRIMARY KEY(course_id)
);

INSERT INTO course_contents(course_id,course_name,credit) VALUES('CSE2101','Data Structure',3);
INSERT INTO course_contents(course_id,course_name,credit) VALUES('CSE2102','Discrete Math',3);
INSERT INTO course_contents(course_id,course_name,credit) VALUES('CSE2107','Database Systems',3);
INSERT INTO course_contents(course_id,course_name,credit) VALUES('CSE2108','Algorithm',4);

/********* ***********************/
/********* Three way to declare a key*********/
/********* ***********************/

/********* ***********************/
/********* 1.	Keys during the Creation of Table*********/
/********* ***********************/
CREATE TABLE table_name(
	column_name1	datatype 	NOT NULL,
	column_name2	datatype,
	……………………………….
	column_namen	datatype,
	PRIMARY KEY (column_name1),
FOREIGN KEY (column_name2) REFERENCES reference_table_name (column_name_in_reference_table)


/********* ***********************/
/********* 2.	Keys after the Creation of Table*********/
/********* ***********************/
ALTER TABLE table_name ADD PRIMARY KEY (column_name1);
ALTER TABLE table_name ADD FOREIGN KEY (column_name1) REFERENCES reference_table_name (column_name_in_reference_table); 

/********* ***********************/
/********* 3.	 after the Creation of Table declare as constraint*********/
/********* ***********************/
ALTER TABLE table_nameADD CONSTRAINT constraint_name
		PRIMARY KEY (column_name1,…..column_namen);

ALTER TABLE table_name ADD CONSTRAINT constraint_name
	FOREIGN KEY (column_name2) REFERENCES reference_table_name	(column_name_in_reference_table);

/********* ***********************/
/********* Drop keys*********/
/********* ***********************/
a.	DROP without naming constraint
ALTER TABLE table_name DROP UNIQUE KEY;
ALTER TABLEtable_name DROP PRIMARY KEY;
ALTER TABLEtable_name DROP FOREIGN KEY;

b.	DROP with naming constraint
ALTER TABLE table_name DROP CONSTRAINT constraint_name;

/********* ***********************/
/********* All columns and all rows*********/
/********* ***********************/
SELECT fname, minit, lname, ssn, bdate, address, salary, superssn,dno from employee;
SELECT * FROM employee;

/********* ***********************/
/********* Specific Columns, All Rows*********/
/********* ***********************/
select fname, lname, dno, salary from employee;

/********* ***********************/
/********* Use of DISTINCT show value without repeating value*********/
/********* ***********************/

SELECT DISTINCT (dno) FROM employee;

/********* ***********************/
/********* Calculated Fields by any value*********/
/********* ***********************/
SELECT (salary/5) FROM employee WHERE dno=5;

/********* ***********************/
/********* SQL aliases are used to give a table, or a column in a table, a temporary name.
Aliases are often used to make column names more readable.*********/
/********* ***********************/
SELECT (salary/5) as salary  FROM employee WHERE dno=5;

/********* ***********************/
/********* Comparison Search Condition*********/
/********* ***********************/

SELECT fname FROM employee 
WHERE dno>1;

/********* ***********************/
/********* Compound Comparison Search Condition *********/
/********* ***********************/
SELECT fname, lname
FROM employee
WHERE dno=1 OR dno=5;

/********* ***********************/
/********* Range Search Condition*********/
/********* ***********************/
SELECT fname, lname
FROM employee
WHERE salary BETWEEN 40000 AND 50000;

/********* ***********************/
/********* Set Membership (IN) Search Condition fixed value*********/
/********* ***********************/
SELECT fname, lname 
FROM employee
WHERE salary IN (30000, 40000);


/********* ***********************/
/********* Pattern Matching*********/
/********* ***********************/
select fname from employee where fname like 'A%'; /* matching First letter of a name */
select fname from employee where fname like '%N'; /* matching Lastt letter of a name */
select fname from employee where fname like '%AM%'; /* matching MId letter of a name */


/********* ***********************/
/********* Use of Order BY(Sort small to large or large to small*********/
/********* ***********************/
SELECT fname, lname, salary, dno
FROM employee
ORDER BY salary;

SELECT fname, lname, salary, dno
FROM employee
ORDER BY salary desc;


/********* ***********************/
/********* Aggreget Function(sum, count, avg, min, max)*********/
/********* ***********************/
select count(fname) from employee;

/********* ***********************/
/********* Cunt number without same number*********/
/********* ***********************/
select count (distinct(dno)) as total_number from employee;

/********* ***********************/
/********* Use of group By( use to find a cust_nbr has how many order number********/
/********* ***********************/

select cust_nbr, count(order_nbr) from cust_order group by(cust_nbr);


/********* ***********************/
/********* Use of group By with condition********/
/********* ***********************/
select cust_nbr, count(order_nbr) from  cust_order where sale_price>25 group by(cust_nbr);


/********* ***********************/
/********* Use of group By with having(Having is use to after group by condition)********/
/********* ***********************/
SELECT cust_nbr, COUNT(order_nbr) from cust_order group by(cust_nbr) having cust_nbr>250;




