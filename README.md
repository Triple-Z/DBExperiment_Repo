# Database Experiment

数据库原理实验 NUAA Spring 2018

## Table of Contents

<!-- TOC -->

- [Database Experiment](#database-experiment)
    - [Table of Contents](#table-of-contents)
    - [Experiment 1](#experiment-1)
    - [Experiment 2](#experiment-2)
    - [Experiment 3](#experiment-3)
    - [Experiment 4](#experiment-4)
    - [Experiment 5](#experiment-5)
    - [Experiment 6](#experiment-6)
    - [Copyright](#copyright)

<!-- /TOC -->

## Experiment 1

实验一: SQL 定义功能、数据插入

1. 建立教学数据库的三个基本表:
    ```
    S(Sno,Sname,Ssex,Sage,Sdept) 学生(学号,姓名,性别,年龄,系)
    SC(Sno,Cno,Grade) 选课(学号,课程号,成绩)
    C(Cno,Cname,Cpno,Ccredit) 课程(课程号,课程名,先行课,学分)
    ```
2. DROP TABLE、ALTER TABLE、CREATE INDEX、DROP INDEX 及 INSERT 语句输入数据。

[SQL Answer File (Exp 1&2)](/exp_1_2.sql)

## Experiment 2

实验二: 数据查询

1. 查询选修 1 号课程的学生学号与姓名。
2. 查询选修课程名为数据结构的学生学号与姓名。
3. 查询不选 1 号课程的学生学号与姓名。
4. 查询学习全部课程学生姓名。
5. 查询所有学生除了选修 1 号课程外所有成绩均及格的学生的学号和平均成绩,其结果按平均成绩的降序排列。
6. 查询选修数据库原理成绩第 2 名的学生姓名。
7. 查询所有 3 个学分课程中有 3 门以上(含 3 门)课程获 80 分以上(含 80 分)的学生的姓名。
8. 查询选课门数唯一的学生的学号。
9. SELECT 语句中各种查询条件的实验。

[SQL Answer File (Exp 1&2)](/exp_1_2.sql)

## Experiment 3

实验三: 数据修改、删除

1. 把 1 号课程的非空成绩提高 10%。
2. 在 SC 表中删除课程名为数据结构的成绩的元组。
3. 在 S 和 SC 表中删除学号为 95002 的所有数据。

[SQL Answer File (Exp 3)](/exp_3.sql)

## Experiment 4

实验四: 视图的操作

1. 建立男学生的视图,属性包括学号、姓名、选修课程名和成绩。
2. 在男学生视图中查询平均成绩大于 80 分的学生学号与姓名。

[SQL Answer File (Exp 4)](/exp_4.sql)

## Experiment 5

实验五: 库函数,授权控制

1. 计算每个学生有成绩的课程门数、平均成绩。
2. 使用 GRANT 语句,把对基本表 S、SC、C 的使用权限授给其它用户。
3. 实验完成后,撤消建立的基本表和视图。

[SQL Answer File (Exp 5)](/exp_5.sql)

## Experiment 6

实验六: 综合实验:实现一个小型管理信息系统

熟练掌握 Visual C++、C#、Qt、Java、PHP 或 Python 等访问数据库的方法, 设计和实现学生通讯录或学生选课或类似的一个小型管理信息系统。要求具有数据的增加、删除、修改和查询的基本功能,并尽可能提供较多的查询功能,用户界面要友好。可选内容:数据库中存放 100 万条记录,测试访问时间;如效率较低,提供优化方案。


> 开发技术栈：后端 Golang； 前端 Vue.js
> 
> 架构设计：一主二从的分离架构。

项目仓库：

前端：[IMDB-Frontend](https://github.com/Triple-Z/IMDB-Frontend)

后端：[IMDB-Backend](https://github.com/Triple-Z/IMDB-Backend)


## Copyright

Copyright &copy; 2018 Zhenzhen Zhao
