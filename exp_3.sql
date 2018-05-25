# Database Experiment 3
# 数据修改、删除
# Date: 2018-05-25
# Author: TripleZ <me@triplez.cn>


# 3-1
# 把 1 号课程的非空成绩提高 10%。
update SC
set Grade = Grade * 1.1
where Grade is not null
  and Cno='1';
# How to restrict the grade below 100?
create trigger SC_Grade_below_100
after update of Grade on SC
referencing
  new row as New
for each row
begin
  if (New.Grade > 100)
    then New.Grade := 100;
  end if;
end;

# 3-2
# 在 SC 表中删除课程名为数据结构的成绩的元组。
delete
from SC
where Cno in (
    select Cno
    from C
    where Cname='数据结构'
);

# 3-3
# 在 S 和 SC 表中删除学号为 95002 的所有数据。
delete
from SC
where Sno='95002';

delete
from S
where Sno='95002';

