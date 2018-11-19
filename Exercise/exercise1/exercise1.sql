use [11603990329_��ǿ]


-- ����ѧ����ϵ��S
create table dbo.S
(
	Sno nchar(11) not NULL PRIMARY KEY,
	Sname nchar(10) not NULL,
	Ssex char(2) NULL,
	Sage int NULL,
	Sdept char(50) NULL
);

-- �����γ̹�ϵ��C
create table dbo.C
(
	Cno nchar(10) not NULL PRIMARY KEY,
	Cname nchar(50) not NULL,
	Cpno nchar(10) NULL,
	Ccredit int not NULL
	FOREIGN KEY (Cpno) REFERENCES C (Cno)
);

-- �����γ̹�ϵ��SC
create table dbo.SC
(
	Sno nchar(11),
	Cno nchar(10),
	Grade int NULL,
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
CREATE INDEX SCgrade ON SC(Grade);

-- ɾ��SC��
drop table SC;
drop table S;
drop table C;