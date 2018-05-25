# Database Experiment 1 & 2
# SQL 定义功能、数据插入 & 数据查询
# Date: 2018-05-19
# Author: TripleZ <me@triplez.cn>


create table S (
  Sno char(9) primary key,
  Sname char(20) not null,
  Ssex char(2),
  Sage smallint,
  Sdept char(20)
);

create table C (
  Cno char(4) PRIMARY KEY,
  Cname char(40) not null,
  Cpno char(4),
  Ccredit SMALLINT,
  FOREIGN KEY (Cpno) REFERENCES C(Cno)
);

CREATE TABLE SC (
  Sno CHAR(9),
  Cno CHAR(4),
  Grade SMALLINT,
  PRIMARY KEY (Sno, Cno),
  FOREIGN KEY (Sno) REFERENCES S(Sno),
  FOREIGN KEY (Cno) REFERENCES C(Cno)
);

drop PROCEDURE if EXISTS add_student_male;
DELIMITER //
  CREATE PROCEDURE add_student_male()
  BEGIN
    declare num INT;
    SET num = 0;
    while(num < 100) do
      insert into S values (concat('1600401', num), concat('student', num), '男', 20, '测试部门');
      set num = num + 1;
    end while;

  END //
DELIMITER ;

call add_student_male();


select * from S;

DROP PROCEDURE IF EXISTS add_student_female;
DELIMITER //
  CREATE PROCEDURE add_student_female()
    BEGIN
      DECLARE num INT;
      SET num = 0;
      WHILE (num<100) DO
        INSERT INTO S VALUES (concat('1600402', num), concat('student', num), '女', 20, '测试部门');
        SET num = num + 1;
      END WHILE;
    END //
DELIMITER ;

CALL add_student_female();

SELECT * from S;

insert into C(Cno, Cname, Ccredit) values ('1', '数据库', 4);
insert into C(Cno, Cname, Ccredit) values ('2', '数学', 2);
insert into C(Cno, Cname, Ccredit) values ('3', '信息系统', 4);
insert into C(Cno, Cname, Ccredit) values ('4', '操作系统', 3);
insert into C(Cno, Cname, Ccredit) values ('5', '数据结构', 4);
insert into C(Cno, Cname, Ccredit) values ('6', '数据处理', 2);
insert into C(Cno, Cname, Ccredit) values ('7', 'C语言', 4);

update C set Cpno='5' where Cno='1';
update C set Cpno='1' where Cno='3';
update C set Cpno='6' where Cno='4';
update C set Cpno='7' where Cno='5';
update C set Cpno='6' where Cno='7';

insert into S values ('201215121', '李勇', '男', 20, 'CS');
insert into S values ('201215122', '刘晨', '女', 19, 'CS');
insert into S values ('201215123', '王敏', '女', 18, 'MA');
insert into S values ('201215125', '张立', '男', 19, 'IS');

create unique index Stusno on S(Sno);
create unique index Coucno on C(Cno);
create unique index SCno on SC(Sno ASC, Cno DESC );

select * from S;

drop index Stusno on S;

select * from S;

insert into SC values ('201215121', '1', 92);
insert into SC values ('201215121', '2', 85);
insert into SC values ('201215121', '3', 88);
insert into SC values ('201215122', '2', 90);
insert into SC values ('201215122', '3', 80);

# 2-1
select S.Sno, S.Sname from S, SC where SC.Cno='1' AND S.Sno=SC.Sno;
# 2-2
select S.Sno, S.Sname from S, C, SC where C.Cname='数据结构' AND S.Sno=SC.Sno AND SC.Cno=C.Cno;
# 2-3
select S.Sno, S.Sname from S where not exists(select * from SC where Sno=S.Sno and Cno='1');
# 2-4
select Sname from S
where not exists(
  select * from C
  where not exists(
    select * from SC
    where Sno=S.Sno and Cno=C.Cno
  )
);

# 2-5
# 查询所有学生除了选修 1 号课程外所有成绩均及格的学生的学号和平均成绩,其结果按平均成绩的降序排列
select SCX.Sno, avg(SCX.Grade)
from SC SCX
where 59 < all(
  select SCY.Grade
  from SC SCY
  where SCY.Sno=SCX.Sno
    and SCY.Cno!='1'
) and SCX.Cno != '1'
group by SCX.Sno
order by avg(SCX.Grade) desc;

# 2-6
# 查询选修数据库原理成绩第 2 名的学生姓名。
select S.Sname
from SC, C, S
where C.Cname='数据库原理'
  and SC.Sno=S.Sno
  and SC.Cno=C.Cno
group by SC.Sno
order by SC.Grade desc
limit 1, 1;

# 2-7
# 查询所有 3 个学分课程中有 3 门以上(含 3 门)课程获 80 分以上(含 80 分)的学生的姓名。
select Sname
from S
where Sno in(
  select Sno
  from SC, C
  where C.Cno=SC.Cno
    and C.Ccredit=3
    and SC.Grade >= 80
  group by Sno
  having count(Grade) >= 3
);

# 2-8
# 查询选课门数唯一的学生的学号。
select Sno, count(Cno)
from SC
group by Sno;

select distinct SC.Sno
from SC, (select Sno, count(Cno) Count_CNO from SC group by Sno) as Count_SC
where not exists(
    select * from (select Sno, count(Cno) Count_CNO from SC group by Sno) as Count_SC_2
    where SC.Sno != Count_SC_2.Sno
      and Count_SC.Count_CNO=Count_SC_2.Count_CNO
  )
  and SC.Sno=Count_SC.Sno;


