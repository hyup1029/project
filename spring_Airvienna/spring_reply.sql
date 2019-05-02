create table spring_reply (
  cno number (10,0) not null primary key,
  ano number (10,0) not null,
  bno number (10),
  content varchar2(500) not null,
  regdate Date default sysdate
 ); 

alter table jjimlist add constraint fk_jjimlist
foreign key(bno) references airuser(bno);

alter table jjimlist add constraint fk_jjimlist_home
foreign key(ano) references project_accommodation(ano);
 
 create sequence rep_seq;

select * from spring_reply;

drop sequence rep_seq;

drop table spring_reply;
