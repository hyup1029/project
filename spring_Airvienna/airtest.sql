create table airuser(
    bno number(10) primary key,
    email varchar2(50) not null,
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
DROP TABLE airuser CASCADE CONSTRAINTS;

create sequence seq_bno;
drop sequence seq_bno;


select * from airuser;

drop table airuser;
drop sequence seq_bno;

