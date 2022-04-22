SELECT USER
  FROM DUAL;
--==>> SCOTT


--�� ���� ���̺� ����
DROP TABLE TBL_BOARD PURGE;
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.



--�� TBL_BOARD ���̺� ����(�Խ��� ���� ���̺� ����)
CREATE TABLE TBL_BOARD
( NUM           NUMBER(9)                       NOT NULL        -- �Խù� ��ȣ
, NAME          VARCHAR2(30)                    NOT NULL        -- �Խù� �ۼ���
, PWD           VARCHAR2(20)                    NOT NULL        -- �Խù� ��ȣ
, EMAIL         VARCHAR2(50)                                    -- �ۼ��� �̸���
, SUBJECT       VARCHAR2(100)                   NOT NULL        -- �Խù� ����
, CONTENT       VARCHAR2(4000)                  NOT NULL        -- �Խù� ����
, IPADDR        VARCHAR2(20)                                    -- ������ Ŭ���̾�Ʈ
, HITCOUNT      NUMBER          DEFAULT 0       NOT NULL        -- �Խù� ��ȸ��
, CREATED       DATE            DEFAULT SYSDATE NOT NULL        -- �Խù� �ۼ���
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)                      -- �Խù� ��ȣ�� PK ���� ���� ����
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.


--�� �Խù� ��ȣ�� �ִ밪�� ���� ������ ����
SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD;
--==>> 
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
;

--�� �Խù� �ۼ� ������ ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '������', '1234', 'ljy@test.com', '�ۼ��׽�Ʈ', '�Խù������ۼ�', '211.238.142.160', 0, SYSDATE);
-->>
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1, '������', '1234', 'ljy@test.com', '�ۼ��׽�Ʈ', '�Խù������ۼ�', '211.238.142.160', 0, SYSDATE)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� DB ���ڵ��� ������ �������� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
-->
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
--==>> 0

--                  1       10
--�� Ư�� ������(���۹�ȣ-����ȣ) �Խù� ����� �о���� ������ ����
--   ��ȣ, �ۼ���, ����, ��ȸ��, �ۼ���

SELECT *
  FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM>=1 AND RNUM<=10;
--> �� �� ����
SELECT * FROM ( SELECT ROWNUM RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC ) DATA ) WHERE RNUM>=1 AND RNUM<=10
;

--�� Ư�� �Խù� ��ȸ�� ���� ��ȸ Ƚ�� ���� ������ ����
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1     -- HITCOUNT += 1 -- HITCOUNT++
WHERE NUM=1;
-->
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM=1
;
-- (���ſ��� ���� ����ε� F5���ص� ��ȸ���� �ö󰡼� ������) �α�ȭ~!!!(�α� ������� ����� ���)


--�� Ư�� �Խù��� ������ �о���� ������ ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT
     , TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=3;
--> �� �� ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=3
;


--�� Ư�� �Խù��� �����ϴ� ������ ����
DELETE
  FROM TBL_BOARD
WHERE NUM=12;
--> ���� ����
DELETE FROM TBL_BOARD WHERE NUM=12
;


--�� Ư�� �Խù��� �����ϴ� ������ ����
--   (�Խù� �󼼺��� ������ �� Article.jsp �������� ó��)
--   �ۼ���, �н�����, �̸���, ����, ����
UPDATE TBL_BOARD
SET NAME ='��μ�', PWD='1234', EMAIL='kms@test.com', SUBJECT='��������', CONTENT='��������'
WHERE NUM=5;
--==>>
UPDATE TBL_BOARD SET NAME ='��μ�', PWD='1234', EMAIL='kms@test.com', SUBJECT='��������', CONTENT='��������' WHERE NUM=5
;

--(������ �غ��� ���� ������ �Խù��� 50��)
--�� Ư�� �Խù�(50)�� ���� ��ȣ �о���� ������ ����
SELECT MIN(NUM)
FROM
(
    SELECT *
    FROM TBL_BOARD
    WHERE NUM > 50 
);
-- �̷� ������� �ϴ°Ű� NVL �߰��ϰ� �������� �� �ʿ䰡 ����



--�� Ư�� �Խù�(50)�� ���� ��ȣ �о���� ������ ����


