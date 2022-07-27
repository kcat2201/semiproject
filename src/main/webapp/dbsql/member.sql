--ȸ�� ���̺�
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

commit;
