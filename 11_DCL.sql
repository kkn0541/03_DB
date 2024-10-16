/*
 *
 * DCL (Data Control Language) : 데이터를 다루기 위한 권한을 다루는 언어
 *
 * - 계정에 DB, DB객체에 대한 접근 권한을
 *   부여(GRANT)하고 회수(REVOKE)하는 언어
 *
 * * 권한의 종류
 *
 * 1) 시스템 권한 : DB접속, 객체 생성 권한
 *    
 *    CREATE SESSION   : 데이터베이스 접속 권한
 *    CREATE TABLE     : 테이블 생성 권한
 *    CREATE VIEW      : 뷰 생성 권한
 *    CREATE SEQUENCE  : 시퀀스 생성권한
 *    CREATE PROCEDURE : 함수(프로시져) 생성 권한
 *    CREATE USER    : 사용자(계정) 생성 권한
 *    
 *    DROP USER      : 사용자(계정) 삭제 권한
 *
 * 2) 객체 권한 : 특정 객체를 조작할 수 있는 권한
 *
 *    권한 종류       설정 객체
 *
 *    SELECT           TABLE, VIEW, SEQUENCE
 *    INSERT           TABLE, VIEW
 *    UPDATE            TABLE, VIEW
 *    DELETE            TABLE, VIEW
 *    ALTER             TABLE, SEQUENCE
 *    REFERENCES        TABLE
 *    INDEX             TABLE
 *    EXECUTE           PROCEDURE
 *
 * */




/*
 * USER - 계정 (사용자)
 *
 * * 관리자 계정 : 데이터베이스의 생성과 관리를 담당하는 계정.
 *          모든 권한과 책임을 가지는 계정.
 *          ex) sys(최고관리자), system(sys에서 권한 몇개가 제외된 관리자)
 *
