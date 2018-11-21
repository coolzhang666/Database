use [11603990329_章强];

-- 1.查询学生的基本信息
select * from S;


-- 2.查询“CS”系学生的基本信息
select *
from S
where Sdept = 'CS';


-- 3.查询“CS”系学生年龄不在19到21之间的学生的学号、姓名
select Sno, Sname
from S
where Sdept = 'CS' and Sage not between 19 and 21;


-- 4.找出最大年龄

select Sno, Sname, Sage
from S
where Sage = (
				select MAX(Sage)
				from S
			 )


-- 5.找出“CS”系年龄最大的学生，显示其学号、姓名
select Sno, Sname
from S
where Sdept = 'CS' and Sage = (
								select MAX(Sage)
								from S
								where Sdept = 'CS'
							  )


-- 6.找出各系年龄最大的学生，显示其学号、姓名
select Sno, Sname
from S x
where Sage = (
				select MAX(Sage)
				from S y
				where y.Sdept = x.Sdept
			 )


-- 7.统计“CS”系学生的人数
select Sdept, count(*) 人数
from S
where Sdept = 'CS'
group by Sdept;


-- 8.统计各系学生的人数，结果按升序排列
select Sdept, count(Sdept) 人数
from S
group by Sdept
order by count(Sdept) ASC


-- 9.按系统计各系学生的平均年龄，结果按降序排列
select Sdept, avg(Sage)
from S
group by Sdept
order by avg(Sage) DESC


-- 10.查询每门课程的课程名
select Cname
from C


-- 11.查询无先修课的课程的课程名和学分数
select Cname, Ccredit
from C
where Cpno is null


-- 12.统计无先修课的课程的学分总数
select sum(Ccredit) 无先修课程学分总数
from C
where Cpno is null


-- 13.统计每位学生选修课程的门数、学分及其平均成绩
select Sno, count(C.Cno) 选修课程门数, sum(C.Ccredit) 选修学分数, avg(SC.Grade) 选修平均成绩
from SC, C
where SC.Cno = C.Cno
group by Sno


-- 14.统计选修每门课程的学生人数及各门课程的平均成绩
select Cno, count(Sno) 选修人数, avg(SC.Grade) 平均成绩
from SC
group by Cno


-- 15.找出平均成绩在85分以上的学生，结果按系分组，并按平均成绩的升序排列
select Sdept, SC.Sno, avg(Grade) 平均成绩
from S, SC
where SC.Sno = S.Sno
group by Sdept, SC.Sno having avg(Grade) >= 85
order by avg(Grade) ASC



-- 16.查询选修了“1”或“2”号课程的学生学号和姓名
select Sno, Sname
from S
where Sno in (
				select Sno
				from SC
				where Cno = '1' or Cno = '2'
			 )


-- 17.查询选修了“1”和“2”号课程的学生学号和姓名
select Sno, Sname
from S
where Sno in (
				select X.Sno
				from SC X, SC Y
				where X.Cno = '1' and Y.Cno = '2' and X.Sno = Y.Sno
			 )


-- 18.查询选修了课程名为“数据库系统”且成绩在60分以下的学生的学号、姓名和成绩
select SC.Sno, Sname, Grade
from S, SC
where SC.Sno = S.Sno and Grade < 60 and Cno in (
												select Cno
												from C
												where Cname = '数据库'
											   )
update SC
set Grade = 92
where Sno = '201215121' and Cno = '1'


-- 19.查询每位学生选修了课程的学生信息（显示：学号，姓名，课程号，课程名，成绩）
select SC.Sno, Sname, C.Cno, Cname, Grade
from S, C, SC
where SC.Sno = S.Sno and SC.Cno = C.Cno


-- 20.查询没有选修课程的学生的基本信息
select *
from S
where Sno not in (
					select Sno
					from SC
				 )

delete from SC
where Sno = '201215125'


-- 21.查询选修了3门以上课程的学生学号
select Sno
from SC
group by Sno
having count(Cno) >= 3


-- 22.查询选修课程成绩至少有一门在80分以上的学生学号
select distinct Sno
from SC
where Grade > 80


-- 23.查询选修课程成绩均在80分以上的学生学号
select Sno
from SC
group by Sno
having min(Grade) > 80


-- 24.查询选修课程平均成绩在80分以上的学生学号
select Sno
from SC
group by Sno
having avg(Grade) > 80


select * from S;
select * from C;
select * from SC;