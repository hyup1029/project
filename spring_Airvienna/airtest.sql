create table airuser(
    bno number(10),
    email varchar2(50) primary key,
    password varchar2(20) not null,
    username nvarchar2(10) not null,
    address varchar2(100) not null,
    tel nvarchar2(20) not null,
	birth date,
	uuid varchar2(100),
	uploadPath varchar2(200),
	fileName varchar2(100),
	fileType char(1) default 'I'
);

create sequence seq_bno;

drop sequence seq_bno;

select * from airuser;
delete from airuser;
drop table airuser;

ALTER TABLE airuser DROP PRIMARY KEY;
alter table airuser modify bno number(10) constraint user_pk primary key;
 
