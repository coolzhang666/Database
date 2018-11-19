use [11603990329_��ǿ];

-- ���S�в�������
insert into S(Sno, Sname, Ssex, Sage, Sdept) values('201215121', '����', '��', 20, 'CS');
insert into S(Sno, Sname, Ssex, Sage, Sdept) values('201215122', '����', 'Ů', 19, 'CS');
insert into S(Sno, Sname, Ssex, Sage, Sdept) values('201215123', '����', 'Ů', 18, 'MA');
insert into S(Sno, Sname, Ssex, Sage, Sdept) values('201215125', '����', '��', 19, 'IS');

-- ���C�в�������
insert into C(Cno, Cname, Cpno, Ccredit) values('2', '��ѧ', NULL, 2);
insert into C(Cno, Cname, Cpno, Ccredit) values('6', '���ݴ���', NULL, 2);
insert into C(Cno, Cname, Cpno, Ccredit) values('4', '����ϵͳ', '6', 3);
insert into C(Cno, Cname, Cpno, Ccredit) values('7', 'PASCAL����', '6', 4);
insert into C(Cno, Cname, Cpno, Ccredit) values('5', '���ݽṹ', '7', 4);
insert into C(Cno, Cname, Cpno, Ccredit) values('1', '���ݿ�', '5', 4);
insert into C(Cno, Cname, Cpno, Ccredit) values('3', '��Ϣϵͳ', '1', 4);

-- ���SC�в�������
insert into SC(Sno, Cno, Grade) values('201215121', '1', 92);
insert into SC(Sno, Cno, Grade) values('201215121', '2', 85);
insert into SC(Sno, Cno, Grade) values('201215121', '3', 88);
insert into SC(Sno, Cno, Grade) values('201215122', '2', 90);
insert into SC(Sno, Cno, Grade) values('201215122', '3', 80);
insert into SC(Sno, Cno, Grade) values('201215123', '7', 95);
insert into SC(Sno, Cno, Grade) values('201215125', '4', 100);

-- ɾ��ѧ��Ϊ 201215125 ��ѧ����¼
delete from S where Sno = '201215125';

-- ɾ��ѧ��Ϊ 201215121 ��ѧ����¼
delete from S where Sno = '201215121';  -- ��ͻ Ӧ��ɾ�� SC ���� Sno Ϊ201215121������
delete from SC where Sno = '201215121';

-- ɾ��S��C��SC�������е�����
delete from SC;
delete from S;
delete from C;

if(exists(select Sno from S where Sno = '95001'))
	if(exists(select Cno from C where Cno = 'c123'))
		insert into SC(Sno, Cno) values('95001', 'c123');

-- 6.���ϵѧ����ƽ���ɼ������ѽ��д�����ݿ�
create table demo(
	Sdept char(50) not null,
	score int not null,
);

insert into demo(Sdept, score)
select Sdept, AVG(Grade)
from S, SC
where S.Sno = SC.Sno
group by Sdept;

select * from demo;

-- 7.�� "CS" ϵȫ��ѧ���ĳɼ���Ϊ0
update SC
set Grade = 0
where Sno in
(select Sno
from S
where Sdept = 'CS')


-- 8.ɾ����CS��ϵȫ��ѧ����ѡ�μ�¼
delete
from SC
where Sno in
(select Sno
from S
where Sdept = 'CS')


-- 9.ɾ��ѧ��Ϊ��S1���������Ϣ
delete
from SC
where Sno = '201215121';

delete
from S
where Sno = '201215121';


-- 10.��ѧ��Ϊ��S1����ѧ����ѧ���޸�Ϊ��S001��
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


-- 11.��ƽ���ɼ�����80�ֵ���ͬѧ��ѧ�ź�ƽ���ɼ�������һ����
create table a_grade(
	Sno nchar(11) not NULL,
	average_grade int,
);

insert into a_grade(Sno, average_grade)
select Sno, AVG(Grade)
from SC
where Sno in (select Sno
			from S
			where Ssex = '��')
group by Sno having AVG(Grade) > 80;


-- 12.��ѡ���˿γ���Ϊ�����ݽṹ����ѧ���ĳɼ����10%
update SC
set Grade = Grade * 1.1
where Cno = (
				select Cno
				from C
				where Cname = '���ݽṹ'
			)


-- 13.��ѡ���ˡ�C2���ſγ̣��ҳɼ����ڸ��ſγ̵�ƽ���ɼ��ĳɼ����5%
update SC
set Grade = Grade * 1.05
where Cno = '2' and Grade < (
								select AVG(Grade)
								from SC
								where Cno = 2
							)


-- 14.��ѡ���ˡ�C2���ſγ̣��ҳɼ����ڸ��ſγ̵�ƽ���ɼ���ѧ���ɼ�ɾ����
update SC
set Grade = null
where Cno = 2 and Grade < (
							select AVG(Grade)
							from SC
							where Cno = 2
						  );


select * from S;
select * from C;
select * from SC;