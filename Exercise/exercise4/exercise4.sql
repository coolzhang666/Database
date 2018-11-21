use [11603990329_章强];


-- 1.定义“IS”系学生基本情况视图V_IS 并查询结果
create view V_IS
as
select *
from S
where Sdept = 'IS'
with check option

select * from V_IS


-- 2.将S，C，SC表中学生的学号，姓名，课程号，课程名，成绩定义为视图V_S_C_G并查询结果
create view V_S_C_G
as
select SC.Sno, Sname, SC.Cno, Cname, Grade
from S, C, SC
where SC.Sno = S.Sno and SC.Cno = C.Cno
with check option

select * from V_S_C_G


-- 3.将各系学生人数，平均年龄定义为视图V_NUM_AVG并查询结果
create view V_NUM_AVG(Sdept, Num, Avg_age)
as
select Sdept, count(Sdept), avg(Sage)
from S
group by Sdept

select * from V_NUM_AVG


-- 4.定义一个反映学生出生年份的视图V_YEAR并查询结果
create view V_YEAR(Sno, Syear)
as
select Sno, 2018-Sage
from S

select * from V_YEAR


-- 5.将各位学生选修课程的门数及平均成绩定义为视图V_AVG_S_G并查询结果
create view V_AVG_S_G(Sno, count_c, avg_grade)
as
select Sno, count(Cno), avg(Grade)
from SC
group by Sno

select * from V_AVG_S_G


-- 6.将各门课程的选修人数及平均成绩定义为视图V_AVG_C_G并查询结果
create view V_AVG_C_G(Cno, count_s, avg_grage)
as
select Cno, count(Sno), avg(Grade)
from SC
group by Cno

select * from V_AVG_C_G


-- 7.查询平均成绩为90分以上的学生学号、姓名和成绩
select Sno, Sname, Grade
from V_S_C_G
where Sno in (
				select Sno
				from V_S_C_G
				group by Sno
				having avg(Grade) >= 90
			 )


-- 8.查询各课成绩均大于平均成绩的学生学号、姓名、课程和成绩
select Cno, avg(Grade) -- 各科平均成绩
from SC
group by Cno


-- 9.按系统计各系平均成绩在80分以上的人数，结果按降序排列
select Sdept, count(SC.Sno)
from SC, S
where SC.Sno = S.Sno
group by Sdept
having avg(Grade) > 80
order by avg(Grade) DESC



-- 10.通过视图V_IS，分别将学号为“S1”和“S4”的学生姓名更改为“S1_MMM”,”S4_MMM” 并查询结果
-- 11.通过视图V_IS，新增加一个学生记录 ('S12','YAN XI',19,'IS')，并查询结果
-- 12.通过视图V_IS，新增加一个学生记录 ('S13','YAN XI',19,'MA')，并查询结果
-- 13.通过视图V_IS，删除学号为“S12”和“S3”的学生信息，并查询结果
