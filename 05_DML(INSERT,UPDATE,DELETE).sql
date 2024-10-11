--** DML(DATA MANIUPULATION LAUGUAGE) : 데이터 조작언어 **

--테이블에 값을 삽입하거나 (INSERT), 수정하거나(UPDATE ),삭제(DELETE) 하는 구문 

--주의 : 혼자서 COMMIT ,ROLLBACK을 하지말것 
-- 윈도우 > 설정  > 연결 > 연결유형 AUTO COMMIT by defalut 체크 해제 되어있는지 확인 

-- 테스트용 테이블 생성 
CREATE TABLE EMPLOYEE2 AS SELECT * FROM EMPLOYEE; --테이블 통째로 복사 
CREATE TABLE DEPARTMENT2 AS SELECT * FROM DEPARTMENT;
--DEFAULT 값은 복사 못함

SELECT * FROM EMPLOYEE2;
SELECT * FROM DEPARTMENT2;

----------------------------------------------------------------------

--1. INSERT 

--테이블에 새로운 행을 추가하는 구문 

--1) INSERT INTO 테이블명 VALUES(데이터 , 데이터 , 데이터...);
-- 테이블에 있는 컬럼값을 INSERT 할때 사용 
-- INSERT 하고자 하는 컬럼이 모든 컬럼인 경우 컬럼명 생략 가능 
-- 단, 컬럼의 순서를 지켜서 VALUEWS 값에 기입해야함 
SELECT * FROM EMPLOYEE2;

INSERT INTO EMPLOYEE2 
VALUES('900','홍길동','991215-1234567','hong_gd@or.kr','01011111111','D1',
'J7','S3',4300000,0.2,200,SYSDATE,NULL,'N');

SELECT * FROM EMPLOYEE2
WHERE EMP_ID='900';

ROLLBACK;

--2) INSERT INTO 테이블명(컬럼명1,컬럼명2,컬럼명3..)
--				 VALUES(데이터1,데이터2,데이터3)
-- 테이블에 내가 선택한 컬러메 대한 값만 INSERT 할때 사용 
-- 선택안된 컬럼은 값이 NULL로 들어감 (DEFALUT 존재 시 DEFAULT 설정한 값으로 삽입됨 )

INSERT INTO EMPLOYEE2(EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,
						JOB_CODE,SAL_LEVEL,SALARY)
VALUES('900','홍길동','991215-1234567','hong_gd@or.kr','01011111111','D1',
 'J7','S3',4300000);		


COMMIT; --홍길동 데이터 영구저장함 

ROLLBACK; --영구저장했기 때문에 롤백해도 되돌리기 안된다.  

SELECT * FROM EMPLOYEE2
WHERE EMP_ID =900;

-----------------------------------------
--INSERT 시 VALUES 대신 서브쿼리 사용 가능 
CREATE TABLE EMP_01(
	EMP_ID NUMBER,
	EMP_NAME VARCHAR2(30),
	DEPT_TITLE VARCHAR2(20)
	);

SELECT * FROM EMP_01;

SELECT EMP_ID,EMP_NAME,DEPT_TITLE
FROM EMPLOYEE2
LEFT JOIN DEPARTMENT2 ON(DEPT_CODE=DEPT_ID);

--서브쿼리(SELECT)결과를 EMP_01 테이블에 INSERT 
--> SELECT 조회 결과의 데이터 타입 , 컬럼개수가 
-- INSERT 하려는 테이블의 컬럼과 일치해야함 


INSERT INTO EMP_01(
	SELECT EMP_ID,EMP_NAME,DEPT_TITLE
	FROM EMPLOYEE2
	LEFT JOIN DEPARTMENT2 ON(DEPT_CODE=DEPT_ID)
);

--------------------------------

--2.UPDATE(내용을 바꾸던가 추가해서 최신화)
--테이블에 기록된 컬럼의 값을 수정하는 구문 

--[작성법]
/*
 * UPDATE 테이블명 SET 컬럼명 = 바꿀값 
 * [WHERE 컬럼명 비교연산자 비교값];
 * -->WHERE 조건 중요!  
 * 
 * 
 * */

--DEPARTMENT2 테이블에서 DEPT_ID가 'D9'인 부서 정보 조회 
SELECT * FROM DEPARTMENT2
WHERE DEPT_ID='D9';

--DEPARTMENT2 테이블에서 DEPT_ID가 'D9'인 부서의 
--DEPT_TITLE  전략 기획팀으로 수정 

UPDATE DEPARTMENT2 
SET DEPT_TITLE='전략기획팀'
WHERE DEPT_ID ='D9';

--EMPLOYEE2 테이블에서 BONUS 를 받지 않는 사원의 
--보너스를 0.1로 변경 

UPDATE EMPLOYEE2 
SET BONUS=0.1
--WHERE NVL(BONUS,0)=0;
WHERE BONUS IS NULL; 


SELECT * FROM EMPLOYEE2;

SELECT EMP_NAME , BONUS FROM EMPLOYEE2;

---------------------------
--* 조건 절을 설정하지 않고 UPDATE 구문 실행 시 
--모든 행의 컬럼 값이 변경 

SELECT * FROM DEPARTMENT2;

UPDATE DEPARTMENT2
SET DEPT_TITLE ='기술연구팀'
