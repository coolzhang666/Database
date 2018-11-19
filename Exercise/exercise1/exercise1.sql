use [11603990329_章强]


-- 创建学生关系表S
create table dbo.S
(
	Sno nchar(11) not NULL PRIMARY KEY,
	Sname nchar(10) not NULL,
	Ssex char(2) NULL,
	Sage int NULL,
	Sdept char(50) NULL
);

-- 创建课程关系表C
create table dbo.C
(
	Cno nchar(10) not NULL PRIMARY KEY,
	Cname nchar(50) not NULL,
	Cpno nchar(10) NULL,
	Ccredit int not NULL
	FOREIGN KEY (Cpno) REFERENCES C (Cno)
);

-- 创建课程关系表SC
create table dbo.SC
(
	Sno nchar(11),
	Cno nchar(10),
	Grade int NULL,
	PRIMARY KEY (Sno, Cno),
	FOREIGN KEY (Sno) REFERENCES S (Sno),
	FOREIGN KEY (Cno) REFERENCES C (Cno)
);

-- 在表S上增加“出生日期”属性列
alter table S add birthday date NULL;

-- 删除表S的“年龄” 属性列
alter table S drop column Sage;

-- 在表S上，按“Sno” 属性列的唯一值方式建立索引
CREATE UNIQUE INDEX Stusno ON S(Sno);

-- 在表SC上，按“grade” 属性列的多值方式建立索引
CREATE INDEX SCgrade ON SC(Grade);

-- 删除SC表
drop table SC;