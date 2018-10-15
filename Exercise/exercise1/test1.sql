use [11603990329_��ǿ]


-- ����ѧ����ϵ��S
create table dbo.S
(
	Sno nchar(11) not NULL PRIMARY KEY,
	Sname char(10) not NULL,
	Ssex char(2) NULL,
	Sage int NULL,
	sdept char(50) NULL
);

-- �����γ̹�ϵ��C
create table dbo.C
(
	Cno nchar(10) not NULL PRIMARY KEY,
	Cname char(50) not NULL,
	Cpno nchar(50) NULL,
	ccredit int not NULL
);

-- �����γ̹�ϵ��SC
create table dbo.SC
(
	Sno nchar(11),
	Cno nchar(10),
	grade int NULL,
	PRIMARY KEY (Sno, Cno),
	FOREIGN KEY (Sno) REFERENCES S (Sno),
	FOREIGN KEY (Cno) REFERENCES C (Cno)
);

-- �ڱ�S�����ӡ��������ڡ�������
alter table S add birthday date NULL;

-- ɾ����S�ġ����䡱 ������
alter table S drop column Sage;

-- �ڱ�S�ϣ�����Sno�� �����е�Ψһֵ��ʽ��������
CREATE UNIQUE INDEX Stusno ON S(Sno);

-- �ڱ�SC�ϣ�����grade�� �����еĶ�ֵ��ʽ��������
CREATE INDEX SCgrade ON SC(grade);

-- ɾ��SC��
drop table SC;