use [11603990329_��ǿ];


-- 1.���塰IS��ϵѧ�����������ͼV_IS ����ѯ���
create view V_IS
as
select *
from S
where Sdept = 'IS'
with check option

select * from V_IS


-- 2.��S��C��SC����ѧ����ѧ�ţ��������γ̺ţ��γ������ɼ�����Ϊ��ͼV_S_C_G����ѯ���
create view V_S_C_G
as
select SC.Sno, Sname, SC.Cno, Cname, Grade
from S, C, SC
where SC.Sno = S.Sno and SC.Cno = C.Cno
with check option

select * from V_S_C_G


-- 3.����ϵѧ��������ƽ�����䶨��Ϊ��ͼV_NUM_AVG����ѯ���
create view V_NUM_AVG(Sdept, Num, Avg_age)
as
select Sdept, count(Sdept), avg(Sage)
from S
group by Sdept

select * from V_NUM_AVG


-- 4.����һ����ӳѧ��������ݵ���ͼV_YEAR����ѯ���
create view V_YEAR(Sno, Syear)
as
select Sno, 2018-Sage
from S

select * from V_YEAR


-- 5.����λѧ��ѡ�޿γ̵�������ƽ���ɼ�����Ϊ��ͼV_AVG_S_G����ѯ���
create view V_AVG_S_G(Sno, count_c, avg_grade)
as
select Sno, count(Cno), avg(Grade)
from SC
group by Sno

select * from V_AVG_S_G


-- 6.�����ſγ̵�ѡ��������ƽ���ɼ�����Ϊ��ͼV_AVG_C_G����ѯ���
create view V_AVG_C_G(Cno, count_s, avg_grage)
as
select Cno, count(Sno), avg(Grade)
from SC
group by Cno

select * from V_AVG_C_G


-- 7.��ѯƽ���ɼ�Ϊ90�����ϵ�ѧ��ѧ�š������ͳɼ�
select Sno, Sname, Grade
from V_S_C_G
where Sno in (
				select Sno
				from V_S_C_G
				group by Sno
				having avg(Grade) >= 90
			 )


-- 8.��ѯ���γɼ�������ƽ���ɼ���ѧ��ѧ�š��������γ̺ͳɼ�
select Cno, avg(Grade) -- ����ƽ���ɼ�
from SC
group by Cno


-- 9.��ϵͳ�Ƹ�ϵƽ���ɼ���80�����ϵ��������������������
select Sdept, count(SC.Sno)
from SC, S
where SC.Sno = S.Sno
group by Sdept
having avg(Grade) > 80
order by avg(Grade) DESC



-- 10.ͨ����ͼV_IS���ֱ�ѧ��Ϊ��S1���͡�S4����ѧ����������Ϊ��S1_MMM��,��S4_MMM�� ����ѯ���
-- 11.ͨ����ͼV_IS��������һ��ѧ����¼ ('S12','YAN XI',19,'IS')������ѯ���
-- 12.ͨ����ͼV_IS��������һ��ѧ����¼ ('S13','YAN XI',19,'MA')������ѯ���
-- 13.ͨ����ͼV_IS��ɾ��ѧ��Ϊ��S12���͡�S3����ѧ����Ϣ������ѯ���
