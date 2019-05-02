create table jjimlist(
	bno number(10)not null,
	ano number(10,0)constraint pk_jjimlist primary key,
	homename nvarchar2(200) not null,
	jjimselect char(1) default '0'
); <!-- 찜 디비 가격추가 -->

alter table jjimlist add constraint fk_jjimlist
foreign key(bno) references airuser(bno);
alter table jjimlist add constraint fk_jjimlist_home
foreign key(ano) references project_accommodation(ano);


alter table jjimlist add price number(15,0)not null;

delete from JJIMLIST;
select * from JJIMLIST;

drop table JJIMLIST;