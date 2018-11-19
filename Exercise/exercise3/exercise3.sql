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



-- 7.统计“CS”系学生的人数
-- 8.统计各系学生的人数，结果按升序排列
-- 9.按系统计各系学生的平均年龄，结果按降序排列
-- 10.查询每门课程的课程名
-- 11.查询无先修课的课程的课程名和学时数
-- 12.统计无先修课的课程的学时总数
-- 13.统计每位学生选修课程的门数、学分及其平均成绩
-- 14.统计选修每门课程的学生人数及各门课程的平均成绩
-- 15.找出平均成绩在85分以上的学生，结果按系分组，并按平均成绩的升序排列
-- 16.查询选修了“1”或“2”号课程的学生学号和姓名
-- 17.查询选修了“1”和“2”号课程的学生学号和姓名
-- 18.查询选修了课程名为“数据库系统”且成绩在60分以下的学生的学号、姓名和成绩
-- 19.查询每位学生选修了课程的学生信息（显示：学号，姓名，课程号，课程名，成绩）
-- 20.查询没有选修课程的学生的基本信息
-- 21.查询选修了3门以上课程的学生学号
-- 22.查询选修课程成绩至少有一门在80分以上的学生学号
-- 23.查询选修课程成绩均在80分以上的学生学号
-- 24.查询选修课程平均成绩在80分以上的学生学号
select * from S;
select * from C;
select * from SC;