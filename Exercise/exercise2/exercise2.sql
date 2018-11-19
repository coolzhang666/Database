use [11603990329_章强];

-- 向表S中插入数据
insert into S(Sno, Sname, Ssex, Sage, Sdept) values('201215121', '李勇', '男', 20, 'CS');
insert into S(Sno, Sname, Ssex, Sage, Sdept) values('201215122', '刘晨', '女', 19, 'CS');
insert into S(Sno, Sname, Ssex, Sage, Sdept) values('201215123', '王敏', '女', 18, 'MA');
insert into S(Sno, Sname, Ssex, Sage, Sdept) values('201215125', '张立', '男', 19, 'IS');

-- 向表C中插入数据
insert into C(Cno, Cname, Cpno, Ccredit) values('2', '数学', NULL, 2);
insert into C(Cno, Cname, Cpno, Ccredit) values('6', '数据处理', NULL, 2);
insert into C(Cno, Cname, Cpno, Ccredit) values('4', '操作系统', '6', 3);
insert into C(Cno, Cname, Cpno, Ccredit) values('7', 'PASCAL语言', '6', 4);
insert into C(Cno, Cname, Cpno, Ccredit) values('5', '数据结构', '7', 4);
insert into C(Cno, Cname, Cpno, Ccredit) values('1', '数据库', '5', 4);
insert into C(Cno, Cname, Cpno, Ccredit) values('3', '信息系统', '1', 4);

-- 向表SC中插入数据
insert into SC(Sno, Cno, Grade) values('201215121', '1', 92);
insert into SC(Sno, Cno, Grade) values('201215121', '2', 85);
insert into SC(Sno, Cno, Grade) values('201215121', '3', 88);
insert into SC(Sno, Cno, Grade) values('201215122', '2', 90);
insert into SC(Sno, Cno, Grade) values('201215122', '3', 80);
insert into SC(Sno, Cno, Grade) values('201215123', '7', 95);
insert into SC(Sno, Cno, Grade) values('201215125', '4', 100);

-- 删除学号为 201215125 的学生记录
delete from S where Sno = '201215125';

-- 删除学号为 201215121 的学生记录
delete from S where Sno = '201215121';  -- 冲突 应先删除 SC 表中 Sno 为201215121的内容
delete from SC where Sno = '201215121';

-- 删除S，C，SC表中所有的数据
delete from SC;
delete from S;
delete from C;

if(exists(select Sno from S where Sno = '95001'))
	if(exists(select Cno from C where Cno = 'c123'))
		insert into SC(Sno, Cno) values('95001', 'c123');

-- 求各系学生的平均成绩，并把结果写入数据库
select S.Sdept, S.Sno, AVG(Grade)
from SC, S
Group By S.Sdept, S.Sno;

-- 将 "CS" 系全体学生的成绩置为0
update SC
set Grade = 0
where Sno in
(select Sno
from S
where Sdept = 'CS')

-- 删除“CS”系全体学生的选课记录
delete
from SC
where Sno in
(select Sno
from S
where Sdept = 'CS')

-- 删除学号为“S1”的相关信息
delete
from SC
where Sno = '201215121';

delete
from S
where Sno = '201215121';

-- 将学号为“S1”的学生的学号修改为“S001”
insert into SC(Sno, Cno) values('S001', '4');

update S
set Sno = 'S001'
where Sno = '201215121';

delete
from SC
where Sno = 'S001';

update SC
set Sno = 'S001'
where Sno = '201215121';

select * from S;
select * from C;
select * from SC;