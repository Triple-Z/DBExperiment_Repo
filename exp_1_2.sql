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


