# Database Experiment 4
# 视图的操作
# Date: 2018-05-25
# Author: TripleZ <me@triplez.cn>

# 4-1
# 建立男学生的视图,属性包括学号、姓名、选修课程名和成绩。
create view S_Boys
as
select S.Sno, S.Sname, C.Cname, SC.Grade
from S, C, SC
where S.Ssex='男'
  and S.Sno=SC.Sno
  and C.Cno=SC.Cno;


# 4-2
# 在男学生视图中查询平均成绩大于 80 分的学生学号与姓名。
select Sno, Sname
from S_Boys
group by Sno
having avg(Grade) > 80;
