-- �Խñ�
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

-- �Խñ�
ALTER TABLE pd
	ADD CONSTRAINT PK_pd -- �Խñ� �⺻Ű
	PRIMARY KEY (
	pNo -- �Խñ۹�ȣ
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
	ADD CONSTRAINT PK_qna -- 1:1�Խ���
	PRIMARY KEY (
	qNo -- �Խñ� ��ȣ
	);

-- ���
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

-- ���
ALTER TABLE reply
	ADD CONSTRAINT PK_reply -- ��� �⺻Ű
	PRIMARY KEY (
	rNo -- ��۹�ȣ
	);

-- ī�װ�
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

--ī�װ� ������ �ֱ�
insert into category (cName, cCode) values ('���ڱ��','100');
insert into category (cName, cCode, cNoRef) values ('��ǻ��/��Ʈ��','101','100');
insert into category (cName, cCode, cNoRef) values ('TV','102','100');
insert into category (cName, cCode, cNoRef) values ('�����/�̾���','103','100');

insert into category (cName, cCode) values ('��Ȱ��ǰ','200');
insert into category (cName, cCode, cNoRef) values ('��ǿ�ǰ','201','200');
insert into category (cName, cCode, cNoRef) values ('�ֹ��ǰ','202','200');

insert into category (cName, cCode) values ('��ⱸ','300');
insert into category (cName, cCode, cNoRef) values ('���׸ӽ�','301','300');
insert into category (cName, cCode, cNoRef) values ('������','302','300');
insert into category (cName, cCode, cNoRef) values ('�Ʒ�','303','300');

insert into category (cName, cCode) values ('��Ƽ/�̿�','400');
insert into category (cName, cCode, cNoRef) values ('ȭ��ǰ','401','400');
insert into category (cName, cCode, cNoRef) values ('�����ǰ','402','400');

insert into category (cName, cCode) values ('�Ƿ�','500');
insert into category (cName, cCode, cNoRef) values ('�ƿ���','501','500');
insert into category (cName, cCode, cNoRef) values ('�Ź�','502','500');
insert into category (cName, cCode, cNoRef) values ('����','503','500');

insert into category (cName, cCode) values ('����','600');
insert into category (cName, cCode, cNoRef) values ('�Ҽ�','601','600');
insert into category (cName, cCode, cNoRef) values ('����','602','600');
insert into category (cName, cCode, cNoRef) values ('��ȭå','603','600');

insert into category (cName, cCode) values ('����','700');
insert into category (cName, cCode, cNoRef) values ('�ڵ��','701','700');
insert into category (cName, cCode, cNoRef) values ('�̴Ϲ�','702','700');
insert into category (cName, cCode, cNoRef) values ('���ڹ�','703','700');

select level, cName, cCode, cNoRef from category
    start with cNoRef is null connect by prior cCode = cNoRef;

-- ī�װ�
ALTER TABLE category
	ADD CONSTRAINT PK_category -- ī�װ� �⺻Ű
	PRIMARY KEY (
	cCode -- ī�װ��ڵ�
	);

-- ������
CREATE TABLE admin (
	aId VARCHAR2(100) NOT NULL,
	aPwd VARCHAR2(100) NOT NULL
);

-- ������
ALTER TABLE admin
	ADD CONSTRAINT PK_admin -- ������ �⺻Ű
	PRIMARY KEY (
	aId -- ���̵�
	);

-- ��������
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


-- ��������
ALTER TABLE notice
	ADD CONSTRAINT PK_notice -- �������� �⺻Ű
	PRIMARY KEY (
	nNo -- �Խñ۹�ȣ
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

-- ȸ�� pk
ALTER TABLE member
ADD CONSTRAINT PK_member -- ȸ�� �⺻Ű
PRIMARY KEY (
mNo -- ȸ����ȣ
);
-- ȸ�� seq    
create sequence member_seq
increment by 1
start with 1
nocache;

insert into member(mNo, mId, mPwd, mName, mNic, mHp, mZip, mAdd1, mAdd2, mPwdHint, mPwdAns)
values (member_seq.nextval, 'hong', '123','ȫ�浿', '1', '010-100-2000','00000','�ּ�1','�ּ�2','����1','�亯1') ;

select * from  member;

--�����ȣ ���̺�
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

-- �����ȣpk
ALTER TABLE zipcode
ADD CONSTRAINT PK_zipcode -- �����ȣ �⺻Ű
PRIMARY KEY (
seq -- �Ϸù�ȣ
);

-- �Ǹ�
CREATE TABLE sales (
	sNo NUMBER NOT NULL,
	dNo NUMBER NOT NULL,
	salesdate DATE default sysdate
);

create sequence sales_seq
increment by 1
start with 1
nocache;

-- �Ǹ�
ALTER TABLE sales
	ADD CONSTRAINT PK_sales -- �Ǹ� �⺻Ű
	PRIMARY KEY (
	sNo -- �ǸŹ�ȣ
	);

-- �ŷ�
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

-- �ŷ�
ALTER TABLE deal
	ADD CONSTRAINT PK_deal -- �ŷ� �⺻Ű
	PRIMARY KEY (
	dNo -- �ŷ���ȣ
	);

-- �Խñ�
ALTER TABLE pd
	ADD CONSTRAINT FK_category_TO_pd -- ī�װ� -> �Խñ�
	FOREIGN KEY (
	cCode -- ī�װ��ڵ�
	)
	REFERENCES category ( -- ī�װ�
	cCode -- ī�װ��ڵ�
	);

-- �Խñ�
ALTER TABLE pd
	ADD CONSTRAINT FK_member_TO_pd -- ȸ�� -> �Խñ�
	FOREIGN KEY (
	sellerNo -- �Ǹ���ȸ����ȣ
	)
	REFERENCES member ( -- ȸ��
	mNo -- ȸ����ȣ
	);

-- Q&A
ALTER TABLE qna
	ADD CONSTRAINT FK_member_TO_qna -- ȸ�� -> Q&A
	FOREIGN KEY (
	mNo -- ȸ����ȣ
	)
	REFERENCES member ( -- ȸ��
	mNo -- ȸ����ȣ
	);

-- ���
ALTER TABLE reply
	ADD CONSTRAINT FK_pd_TO_reply -- �Խñ� -> ���
	FOREIGN KEY (
	pNo -- �Խñ۹�ȣ
	)
	REFERENCES pd ( -- �Խñ�
	pNo -- �Խñ۹�ȣ
	);

-- ���
ALTER TABLE reply
	ADD CONSTRAINT FK_member_TO_reply -- ȸ�� -> ���
	FOREIGN KEY (
	mNo -- ȸ����ȣ
	)
	REFERENCES member ( -- ȸ��
	mNo -- ȸ����ȣ
	);

-- ��������
ALTER TABLE notice
	ADD CONSTRAINT FK_admin_TO_notice -- ������ -> ��������
	FOREIGN KEY (
	aId -- �����ھ��̵�
	)
	REFERENCES admin ( -- ������
	aId -- ���̵�
	);

-- �Ǹ�
ALTER TABLE sales
	ADD CONSTRAINT FK_deal_TO_sales -- �ŷ� -> �Ǹ�
	FOREIGN KEY (
	dNo -- �ŷ���ȣ
	)
	REFERENCES deal ( -- �ŷ�
	dNo -- �ŷ���ȣ
	);

-- �ŷ�
ALTER TABLE deal
	ADD CONSTRAINT FK_member_TO_deal -- ȸ�� -> �ŷ�
	FOREIGN KEY (
	buyerNo -- �����ڹ�ȣ
	)
	REFERENCES member ( -- ȸ��
	mNo -- ȸ����ȣ
	);

-- �ŷ�
ALTER TABLE deal
	ADD CONSTRAINT FK_pd_TO_deal -- �Խñ� -> �ŷ�
	FOREIGN KEY (
	pNo -- �Խñ۹�ȣ
	)
	REFERENCES pd ( -- �Խñ�
	pNo -- �Խñ۹�ȣ
	);