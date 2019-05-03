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
DROP TABLE project_accommodation CASCADE CONSTRAINTS;

create sequence seq_accommodation;
drop sequence seq_accommodation;

alter table project_accommodation add constraint fk_useracomo
foreign key(bno) references airuser(bno);

create table accommodation_attach(
	uuid varchar2(100) constraint ad_attach primary key,
	uploadPath varchar2(200) not null,
	fileName varchar2(100) not null,
	ano number(10,0)
);
DROP TABLE accommodation_attach CASCADE CONSTRAINTS;

alter table accommodation_attach add constraint fk_accommodation
foreign key(ano) references project_accommodation(ano);

select * from accommodation_attach;

select * from project_accommodation;
