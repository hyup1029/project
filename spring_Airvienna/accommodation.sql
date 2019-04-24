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

alter table project_accommodation RENAME COLUMN bno to ano;

alter table project_accommodation add bno number(10);
alter table project_accommodation add region nvarchar2(100);

