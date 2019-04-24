create table airuser(
    bno number(10),
    email varchar2(50) primary key,
    password varchar2(20) not null,
    username nvarchar2(10) not null,
    address varchar2(100) not null,
    tel nvarchar2(20) not null,
	birth date
);

create sequence seq_bno;

drop table airuser;
drop sequence seq_bno;

select * from airuser;