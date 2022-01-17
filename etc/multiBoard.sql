create database multiBoard;
use multiBoard;

drop table m_board;

# 게시판 테이블
CREATE TABLE m_board (
	bno INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    writer VARCHAR(20) NOT NULL,
    regDate DATETIME NOT NULL DEFAULT now(), -- 작성 날짜
    viewsCnt INT NOT NULL DEFAULT 0 -- 조회수
);

INSERT INTO m_board(title, content, writer) VALUES ('테스트 제목1', '테스트 내용1', '작가1');
INSERT INTO m_board(title, content, writer) VALUES ('테스트 제목2', '테스트 내용2', '작가2');
INSERT INTO m_board(title, content, writer) VALUES ('테스트 제목3', '테스트 내용3', '작가3');

SELECT * FROM m_board ORDER BY bno desc;
SELECT * FROM m_board;

DELETE FROM m_board WHERE bno = 509;

-- 재귀 복사
insert into m_board(title, content, writer) (select title, content, writer from m_board);
 
-- 행 확인
select count(*) from m_board;

-- rownum 방식
select * from 
        (select @rownum := @rownum + 1 as rn, bno, title, writer, regDate, viewsCnt
        from m_board, (select @rownum := 0)  as rowcolumn order by bno desc) as rownum_table  
where rn > 10 and rn <=20;
-- where rn between 10 and 20;

-- limit 방식
select bno, title, writer, regDate, viewsCnt  
from m_board order by bno desc 
limit 100, 10; -- 101부터 110 (역순)