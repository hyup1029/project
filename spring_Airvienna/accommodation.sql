create table project_accommodation(
	ano number(10,0) constraint pk_accommodation primary key,
	bno number(10) not null,
	homename nvarchar2(200) not null,
	region nvarchar2(100) not null,
	region2 nvarchar2(100),
	region3 nvarchar2(100),
	region4 nvarchar2(100),
	region5 nvarchar2(100),
	maxperson number(5,0)not null,
	birfcontent nvarchar2(200) not null,
	content nvarchar2(1000) not null,
	price number(15,0)not null,
	bedcount number(2,0)not null,
	breakfast char(1)default '0',
	parkingarea char(1)default '0',
	wifi char(1)default '0',
	registDate date default sysdate,
	checkin date,
	checkout date,
	ReplyCnt number(3,0)not null
);


create sequence seq_accommodation;


create table accommodation_attach(
	uuid varchar2(100) constraint ad_attach primary key,
	uploadPath varchar2(200) not null,
	fileName varchar2(100) not null,
	ano number(10,0)
);

alter table accommodation_attach add constraint fk_accommodation
foreign key(ano) references project_accommodation(ano);

select * from accommodation_attach;

select * from project_accommodation;

drop table project_accommodation cascade constraints;

drop sequence seq_accommodation;

drop table accommodation_attach;

<-- 예약자 -->
create table reserve (
	ano number(10, 0) primary key,
	bno number (10, 0) not null,
	people number not null,
	result number not null,
	checkin Date,
	checkout Date
);

drop table reserve;

