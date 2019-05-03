create table jjimlist(
	jno number(10,0)constraint pk_jjimlist primary key,
	bno number(10)not null,
	ano number(10,0)not null,
	homename nvarchar2(200) not null,
	jjimselect char(1) default '0',
	price number(15,0)not null
); <!-- 찜 디비 가격추가 -->
DROP TABLE jjimlist CASCADE CONSTRAINTS;
drop sequence seq_jjim;
create sequence seq_jjim;


alter table jjimlist add constraint fk_jjimlist
foreign key(bno) references airuser(bno);

alter table jjimlist add constraint fk_jjimlist_home
foreign key(ano) references project_accommodation(ano);


delete from JJIMLIST;
select * from JJIMLIST;

drop table JJIMLIST;

