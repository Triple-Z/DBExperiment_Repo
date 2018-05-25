# Database Experiment 5
# 库函数,授权控制
# Date: 2018-05-25
# Author: TripleZ <me@triplez.cn>

# 5-1
# 计算每个学生有成绩的课程门数、平均成绩。
select Sno, count(Cno), avg(Grade)
from SC
where Grade is not null
group by Sno;

# 5-2
# 使用 GRANT 语句,把对基本表 S、SC、C 的使用权限授给其它用户。
create user 'test_db_course_user'@'localhost' identified by 'password';

# grant all privileges
# on table S, SC, C
# to test_db_course_user;
# Due to the MySQL syntax restriction, they should be granted one by one.
grant all privileges on table S to 'test_db_course_user'@'localhost' identified by 'password';
grant all privileges on table C to 'test_db_course_user'@'localhost' identified by 'password';
grant all privileges on table SC to 'test_db_course_user'@'localhost' identified by 'password';

# 5-3
# 实验完成后,撤消建立的基本表和视图。
drop view S_Boys;

drop table SC, S, C;

drop procedure add_student_female;
drop procedure add_student_male;

