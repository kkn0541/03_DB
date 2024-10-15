-- 한줄 주석 
/*
 * 범위주석 
 * 
 * */

--새로운 사용자 계정 생성 (sys :  최고 관리자 계정 )
-- 아래 4줄 다 실행해야함 
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
-- 11G 이전문법 사용 허용 
--선택한 sql 수행 : 구문에 커서 두고 ctrl + enter
-- 전체 sql 수행 :ctrl + a 하고  alt + x
-- sql (structured query language , 구조적 질의 언어 ) :
-- 데이터 베이스 와의 상호작용을 하기 위해 사용하는 표준 언어 
-- 데이터의 조회 , 삽입 , 수정 , 삭제 등 



CREATE USER workbook IDENTIFIED BY workbook;
-- 계정 생성 구문 (kh_kkn : id/ kh1234 :Password)


GRANT RESOURCE, CONNECT TO workbook;
-- 사용자 계정 권한 부여 설정 
-- RESOURCE : 테이블이나 인덱스 같은 DB 객체를 생성할 권한 
-- CONNECT : DB 에 연결ㄷ하고 로그인 할수 있는 권한 



ALTER USER workbook DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;
-- 객체가 생성될 수 있는 공간 할당량 무제한 지정 