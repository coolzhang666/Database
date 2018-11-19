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

-- ���ϵѧ����ƽ���ɼ������ѽ��д�����ݿ�
select S.Sdept, S.Sno, AVG(Grade)
from SC, S
Group By S.Sdept, S.Sno;

-- �� "CS" ϵȫ��ѧ���ĳɼ���Ϊ0
update SC
set Grade = 0
where Sno in
(select Sno
from S
where Sdept = 'CS')

-- ɾ����CS��ϵȫ��ѧ����ѡ�μ�¼
delete
from SC
where Sno in
(select Sno
from S
where Sdept = 'CS')

-- ɾ��ѧ��Ϊ��S1���������Ϣ
delete
from SC
where Sno = '201215121';

delete
from S
where Sno = '201215121';

-- ��ѧ��Ϊ��S1����ѧ����ѧ���޸�Ϊ��S001��
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