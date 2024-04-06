select * from customer;

truncate table customer;

insert into customer (id,name,age) values (1,'Akshat',23);

insert into customer (id,name,age) values (2,'Bhavy',25);

Alter table customer Alter age set check (age>18);

update  customer set age=24 where name='AKSHAT';

Alter table customer Add check (age >18);

insert into customer (id,name,age) values (3,'Akshay',19);

select name , age from customer where id=1;

select * from customer order by Age desc;

select id,name,age from customer where name like 'a%'; 

select id,name,age from customer where name like '%t'; 

select id,name,age from customer where name like 'a____%t';

select id,name,age from customer where id IN(1,3);

select id,name,age from customer where id Between 1 and 3;

select avg(age) from customer ;

SELECT
    CASE
        WHEN age > 18 THEN 'Age is above 18'
        WHEN age = 18 THEN 'Age is 18'
        ELSE 'Age is below 18'
    END AS age_category
FROM 
    customer;



create procedure SelectAllUser as select id,name,age from customer go;

exec SelectAllUser;

