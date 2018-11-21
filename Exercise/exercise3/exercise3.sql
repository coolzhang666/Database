use [11603990329_��ǿ];

-- 1.��ѯѧ���Ļ�����Ϣ
select * from S;


-- 2.��ѯ��CS��ϵѧ���Ļ�����Ϣ
select *
from S
where Sdept = 'CS';


-- 3.��ѯ��CS��ϵѧ�����䲻��19��21֮���ѧ����ѧ�š�����
select Sno, Sname
from S
where Sdept = 'CS' and Sage not between 19 and 21;


-- 4.�ҳ��������

select Sno, Sname, Sage
from S
where Sage = (
				select MAX(Sage)
				from S
			 )


-- 5.�ҳ���CS��ϵ��������ѧ������ʾ��ѧ�š�����
select Sno, Sname
from S
where Sdept = 'CS' and Sage = (
								select MAX(Sage)
								from S
								where Sdept = 'CS'
							  )


-- 6.�ҳ���ϵ��������ѧ������ʾ��ѧ�š�����
select Sno, Sname
from S x
where Sage = (
				select MAX(Sage)
				from S y
				where y.Sdept = x.Sdept
			 )


-- 7.ͳ�ơ�CS��ϵѧ��������
select Sdept, count(*) ����
from S
where Sdept = 'CS'
group by Sdept;


-- 8.ͳ�Ƹ�ϵѧ�����������������������
select Sdept, count(Sdept) ����
from S
group by Sdept
order by count(Sdept) ASC


-- 9.��ϵͳ�Ƹ�ϵѧ����ƽ�����䣬�������������
select Sdept, avg(Sage)
from S
group by Sdept
order by avg(Sage) DESC


-- 10.��ѯÿ�ſγ̵Ŀγ���
select Cname
from C


-- 11.��ѯ�����޿εĿγ̵Ŀγ�����ѧ����
select Cname, Ccredit
from C
where Cpno is null


-- 12.ͳ�������޿εĿγ̵�ѧ������
select sum(Ccredit) �����޿γ�ѧ������
from C
where Cpno is null


-- 13.ͳ��ÿλѧ��ѡ�޿γ̵�������ѧ�ּ���ƽ���ɼ�
select Sno, count(C.Cno) ѡ�޿γ�����, sum(C.Ccredit) ѡ��ѧ����, avg(SC.Grade) ѡ��ƽ���ɼ�
from SC, C
where SC.Cno = C.Cno
group by Sno


-- 14.ͳ��ѡ��ÿ�ſγ̵�ѧ�����������ſγ̵�ƽ���ɼ�
select Cno, count(Sno) ѡ������, avg(SC.Grade) ƽ���ɼ�
from SC
group by Cno


-- 15.�ҳ�ƽ���ɼ���85�����ϵ�ѧ���������ϵ���飬����ƽ���ɼ�����������
select Sdept, SC.Sno, avg(Grade) ƽ���ɼ�
from S, SC
where SC.Sno = S.Sno
group by Sdept, SC.Sno having avg(Grade) >= 85
order by avg(Grade) ASC



-- 16.��ѯѡ���ˡ�1����2���ſγ̵�ѧ��ѧ�ź�����
select Sno, Sname
from S
where Sno in (
				select Sno
				from SC
				where Cno = '1' or Cno = '2'
			 )


-- 17.��ѯѡ���ˡ�1���͡�2���ſγ̵�ѧ��ѧ�ź�����
select Sno, Sname
from S
where Sno in (
				select X.Sno
				from SC X, SC Y
				where X.Cno = '1' and Y.Cno = '2' and X.Sno = Y.Sno
			 )


-- 18.��ѯѡ���˿γ���Ϊ�����ݿ�ϵͳ���ҳɼ���60�����µ�ѧ����ѧ�š������ͳɼ�
select SC.Sno, Sname, Grade
from S, SC
where SC.Sno = S.Sno and Grade < 60 and Cno in (
												select Cno
												from C
												where Cname = '���ݿ�'
											   )
update SC
set Grade = 92
where Sno = '201215121' and Cno = '1'


-- 19.��ѯÿλѧ��ѡ���˿γ̵�ѧ����Ϣ����ʾ��ѧ�ţ��������γ̺ţ��γ������ɼ���
select SC.Sno, Sname, C.Cno, Cname, Grade
from S, C, SC
where SC.Sno = S.Sno and SC.Cno = C.Cno


-- 20.��ѯû��ѡ�޿γ̵�ѧ���Ļ�����Ϣ
select *
from S
where Sno not in (
					select Sno
					from SC
				 )

delete from SC
where Sno = '201215125'


-- 21.��ѯѡ����3�����Ͽγ̵�ѧ��ѧ��
select Sno
from SC
group by Sno
having count(Cno) >= 3


-- 22.��ѯѡ�޿γ̳ɼ�������һ����80�����ϵ�ѧ��ѧ��
select distinct Sno
from SC
where Grade > 80


-- 23.��ѯѡ�޿γ̳ɼ�����80�����ϵ�ѧ��ѧ��
select Sno
from SC
group by Sno
having min(Grade) > 80


-- 24.��ѯѡ�޿γ�ƽ���ɼ���80�����ϵ�ѧ��ѧ��
select Sno
from SC
group by Sno
having avg(Grade) > 80


select * from S;
select * from C;
select * from SC;