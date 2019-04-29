create table project_accommodation(
	bno number(10,0) constraint pk_accommodation primary key, 
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
alter table project_accommodation modify wifi char(1) default '0';
alter table project_accommodation RENAME COLUMN bno to ano;

alter table project_accommodation add bno number(10);
alter table project_accommodation add region nvarchar2(100);

create table accommodation_attach(
	uuid varchar2(100) constraint ad_attach primary key,
	uploadPath varchar2(200) not null,
	pictureName varchar2(100) not null,
	ano number(10,0)
);

insert into PROJECT_ACCOMMODATION(ANO,HOMENAME,MAXPERSON,username,BIRFCONTENT,CONTENT,PRICE,BEDCOUNT,CHECKIN,
CHECKOUT,REPLYCNT,BNO,REGION) values(seq_accommodation.nextVal,'수원수원',5,'ddd','날짜 저장','아늑하고 편한한 집입니다',20000,2,sysdate,sysdate+3,0,1,'수원 안강읍');
alter table accommodation_attach add constraint fk_accommodation
foreign key(ano) references project_accommodation(ano);

select * from project_accommodation;