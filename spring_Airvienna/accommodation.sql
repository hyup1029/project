create table project_accommodation(
	bno number(10,0) constraint pk_accommodation primary key, <!-- bno -> ano로 수정 -->
	homename nvarchar2(200) not null,
	maxperson number(5,0)not null,
	username nvarchar2(10)not null,
	birfcontent nvarchar2(200) not null,
	content nvarchar2(1000) not null,
	price number(15,0)not null,
	bedcount number(2,0)not null,
	breakfast number(1,0)not null,
	parkingarea number(1,0)not null,
	wifi number(1,0)not null,
	registDate date default sysdate,
	checkin date,
	checkout date,
	ReplyCnt number(3,0)not null
); <!-- bno 와 region 추가 -->


create sequence seq_accommodation;

alter table project_accommodation modify breakfast char(1) default '0';
alter table project_accommodation modify parkingarea char(1) default '0';
alter table project_accommodation modify wifi char(1) default; 
alter table project_accommodation RENAME COLUMN bno to ano;

alter table project_accommodation add bno number(10);
alter table project_accommodation add region nvarchar2(100);
alter table project_accommodation add region2 nvarchar2(100);
alter table project_accommodation add region3 nvarchar2(100);
alter table project_accommodation add region4 nvarchar2(100);
alter table project_accommodation add region5 nvarchar2(100);

create table accommodation_attach(
	uuid varchar2(100) constraint ad_attach primary key,
	uploadPath varchar2(200) not null,
	pictureName varchar2(100) not null,
	ano number(10,0)
);

alter table accommodation_attach add constraint fk_accommodation
foreign key(ano) references project_accommodation(ano);



select * from accommodation_attach;

select * from project_accommodation;

alter table project_accommodation drop column username;

delete from project_accommodation where ano = 42;
insert into project_accommodation (ano, homename, maxperson, username, birfcontent, content, price, bedcount, breakfast, parkingarea, wifi, checkin, checkout,ReplyCnt, region)
values (seq_accommodation.nextVal, '경주집',4,'콘냥', '좋은 집', '정말로 좋아요', 20000,4, 1, 1, 1, '2019-05-01','2019-05-31',1,'경기도 수원시 권선구 권선동 1165-14');