-- 게시글
CREATE TABLE pd (
	pNo NUMBER NOT NULL,
	cCode VARCHAR2(30) NOT NULL,
	sellerNo NUMBER NOT NULL,
	pTitle VARCHAR2(100) NOT NULL,
	price NUMBER NOT NULL,
	detail CLOB NOT NULL,
	fileName VARCHAR2(150) NULL,
	fileSize NUMBER NULL,
	originalFilename VARCHAR2(150) NULL,
	readcount NUMBER NULL,
	regdate DATE default sysdate,
    saleflag char default 'N'
);

create sequence pd_seq
increment by 1
start with 1
nocache;

insert into pd

-- 게시글
ALTER TABLE pd
	ADD CONSTRAINT PK_pd -- 게시글 기본키
	PRIMARY KEY (
	pNo -- 게시글번호
	);

-- Q&A
CREATE TABLE qna (
	qNo NUMBER NOT NULL,
	mNo NUMBER NOT NULL,
	qTitle VARCHAR(100) NOT NULL,
	regdate DATE default sysdate,
	content CLOB NOT NULL,
	groupNo NUMBER NULL,
	step NUMBER NULL
);

create sequence qna_seq
increment by 1
start with 1
nocache;


-- Q&A
ALTER TABLE qna
	ADD CONSTRAINT PK_qna -- 1:1게시판
	PRIMARY KEY (
	qNo -- 게시글 번호
	);

-- 댓글
CREATE TABLE reply (
	rNo NUMBER NOT NULL,
	mNo NUMBER NOT NULL,
    mNick VARCHAR2(100) NOT NULL,
	pNo NUMBER NOT NULL,
	rContent VARCHAR2(300) NOT NULL,
	regdate DATE default sysdate
);

create sequence reply_seq
increment by 1
start with 1
nocache;

-- 댓글
ALTER TABLE reply
	ADD CONSTRAINT PK_reply -- 댓글 기본키
	PRIMARY KEY (
	rNo -- 댓글번호
	);

-- 카테고리
CREATE TABLE category (
	cCode VARCHAR2(30) NOT NULL,
	cName VARCHAR2(20) NOT NULL,
	cNoRef VARCHAR2(30) NULL,
    primary key(cCode),
    foreign key(cNoRef) references category(cCode)
);

create sequence category_seq
increment by 1
start with 1
nocache;

--카테고리 사전에 넣기
insert into category (cName, cCode) values ('전자기기','100');
insert into category (cName, cCode, cNoRef) values ('컴퓨터/노트북','101','100');
insert into category (cName, cCode, cNoRef) values ('TV','102','100');
insert into category (cName, cCode, cNoRef) values ('오디오/이어폰','103','100');

insert into category (cName, cCode) values ('생활용품','200');
insert into category (cName, cCode, cNoRef) values ('욕실용품','201','200');
insert into category (cName, cCode, cNoRef) values ('주방용품','202','200');

insert into category (cName, cCode) values ('운동기구','300');
insert into category (cName, cCode, cNoRef) values ('런닝머신','301','300');
insert into category (cName, cCode, cNoRef) values ('자전거','302','300');
insert into category (cName, cCode, cNoRef) values ('아령','303','300');

insert into category (cName, cCode) values ('뷰티/미용','400');
insert into category (cName, cCode, cNoRef) values ('화장품','401','400');
insert into category (cName, cCode, cNoRef) values ('헤어제품','402','400');

insert into category (cName, cCode) values ('의류','500');
insert into category (cName, cCode, cNoRef) values ('아우터','501','500');
insert into category (cName, cCode, cNoRef) values ('신발','502','500');
insert into category (cName, cCode, cNoRef) values ('하의','503','500');

insert into category (cName, cCode) values ('도서','600');
insert into category (cName, cCode, cNoRef) values ('소설','601','600');
insert into category (cName, cCode, cNoRef) values ('수필','602','600');
insert into category (cName, cCode, cNoRef) values ('만화책','603','600');

insert into category (cName, cCode) values ('가방','700');
insert into category (cName, cCode, cNoRef) values ('핸드백','701','700');
insert into category (cName, cCode, cNoRef) values ('미니백','702','700');
insert into category (cName, cCode, cNoRef) values ('에코백','703','700');

select level, cName, cCode, cNoRef from category
    start with cNoRef is null connect by prior cCode = cNoRef;

-- 카테고리
ALTER TABLE category
	ADD CONSTRAINT PK_category -- 카테고리 기본키
	PRIMARY KEY (
	cCode -- 카테고리코드
	);

-- 관리자
CREATE TABLE admin (
	aId VARCHAR2(100) NOT NULL,
	aPwd VARCHAR2(100) NOT NULL
);

-- 관리자
ALTER TABLE admin
	ADD CONSTRAINT PK_admin -- 관리자 기본키
	PRIMARY KEY (
	aId -- 아이디
	);

-- 공지사항
CREATE TABLE notice (
	nNo NUMBER NOT NULL,
	aId VARCHAR2(100) NOT NULL,
	nTitle VARCHAR2(100) NOT NULL,
	regdate DATE default sysdate,
	readcount NUMBER NULL,
	content CLOB NOT NULL,
	fileName VARCHAR2(100) NULL,
	fileSize NUMBER NULL,
	downCount NUMBER NULL,
	originalFileName VARCHAR2(100) NULL
);

create sequence notice_seq
increment by 1
start with 1
nocache;


-- 공지사항
ALTER TABLE notice
	ADD CONSTRAINT PK_notice -- 공지사항 기본키
	PRIMARY KEY (
	nNo -- 게시글번호
	);

CREATE TABLE member (
	mNo NUMBER NOT NULL,
	mId VARCHAR2(100) NOT NULL,
    mPwd	 VARCHAR2(100) NOT NULL,
    mName VARCHAR2(100) NOT NULL,
    mNick VARCHAR2(100) NOT NULL,
	mHp VARCHAR2(200) NOT NULL,	
    mZip VARCHAR2(20) NOT NULL,
	mAdd1 VARCHAR2(200) NOT NULL,
	mAdd2 VARCHAR2(200) NULL,
	mPwdHint VARCHAR2(200) NOT NULL,
	mPwdAns VARCHAR2(200) NOT NULL,
    regdate DATE default sysdate
);

--drop table member;

-- 회원 pk
ALTER TABLE member
ADD CONSTRAINT PK_member -- 회원 기본키
PRIMARY KEY (
mNo -- 회원번호
);
-- 회원 seq    
create sequence member_seq
increment by 1
start with 1
nocache;

insert into member(mNo, mId, mPwd, mName, mNic, mHp, mZip, mAdd1, mAdd2, mPwdHint, mPwdAns)
values (member_seq.nextval, 'hong', '123','홍길동', '1', '010-100-2000','00000','주소1','주소2','질문1','답변1') ;

select * from  member;

--우편번호 테이블
CREATE TABLE zipcode (
	zipcode VARCHAR2(20) NOT NULL,
	sido VARCHAR2(100) NOT NULL,
	gugun VARCHAR2(100) NOT NULL,
	dong VARCHAR2(100) NOT NULL,
	startBunji VARCHAR2(100) NOT NULL,
	endBunji VARCHAR2(100) NULL,
    seq NUMBER NOT NULL
);

--drop table zipcode;

-- 우편번호pk
ALTER TABLE zipcode
ADD CONSTRAINT PK_zipcode -- 우편번호 기본키
PRIMARY KEY (
seq -- 일련번호
);

-- 판매
CREATE TABLE sales (
	sNo NUMBER NOT NULL,
	dNo NUMBER NOT NULL,
	salesdate DATE default sysdate
);

create sequence sales_seq
increment by 1
start with 1
nocache;

-- 판매
ALTER TABLE sales
	ADD CONSTRAINT PK_sales -- 판매 기본키
	PRIMARY KEY (
	sNo -- 판매번호
	);

-- 거래
CREATE TABLE deal (
	dNo NUMBER NOT NULL,
	pNo NUMBER NOT NULL,
	buyerNo NUMBER NOT NULL,
	dealdate DATE default sysdate
);
create sequence deal_seq
increment by 1
start with 1
nocache;

-- 거래
ALTER TABLE deal
	ADD CONSTRAINT PK_deal -- 거래 기본키
	PRIMARY KEY (
	dNo -- 거래번호
	);

-- 게시글
ALTER TABLE pd
	ADD CONSTRAINT FK_category_TO_pd -- 카테고리 -> 게시글
	FOREIGN KEY (
	cCode -- 카테고리코드
	)
	REFERENCES category ( -- 카테고리
	cCode -- 카테고리코드
	);

-- 게시글
ALTER TABLE pd
	ADD CONSTRAINT FK_member_TO_pd -- 회원 -> 게시글
	FOREIGN KEY (
	sellerNo -- 판매자회원번호
	)
	REFERENCES member ( -- 회원
	mNo -- 회원번호
	);

-- Q&A
ALTER TABLE qna
	ADD CONSTRAINT FK_member_TO_qna -- 회원 -> Q&A
	FOREIGN KEY (
	mNo -- 회원번호
	)
	REFERENCES member ( -- 회원
	mNo -- 회원번호
	);

-- 댓글
ALTER TABLE reply
	ADD CONSTRAINT FK_pd_TO_reply -- 게시글 -> 댓글
	FOREIGN KEY (
	pNo -- 게시글번호
	)
	REFERENCES pd ( -- 게시글
	pNo -- 게시글번호
	);

-- 댓글
ALTER TABLE reply
	ADD CONSTRAINT FK_member_TO_reply -- 회원 -> 댓글
	FOREIGN KEY (
	mNo -- 회원번호
	)
	REFERENCES member ( -- 회원
	mNo -- 회원번호
	);

-- 공지사항
ALTER TABLE notice
	ADD CONSTRAINT FK_admin_TO_notice -- 관리자 -> 공지사항
	FOREIGN KEY (
	aId -- 관리자아이디
	)
	REFERENCES admin ( -- 관리자
	aId -- 아이디
	);

-- 판매
ALTER TABLE sales
	ADD CONSTRAINT FK_deal_TO_sales -- 거래 -> 판매
	FOREIGN KEY (
	dNo -- 거래번호
	)
	REFERENCES deal ( -- 거래
	dNo -- 거래번호
	);

-- 거래
ALTER TABLE deal
	ADD CONSTRAINT FK_member_TO_deal -- 회원 -> 거래
	FOREIGN KEY (
	buyerNo -- 구매자번호
	)
	REFERENCES member ( -- 회원
	mNo -- 회원번호
	);

-- 거래
ALTER TABLE deal
	ADD CONSTRAINT FK_pd_TO_deal -- 게시글 -> 거래
	FOREIGN KEY (
	pNo -- 게시글번호
	)
	REFERENCES pd ( -- 게시글
	pNo -- 게시글번호
	);