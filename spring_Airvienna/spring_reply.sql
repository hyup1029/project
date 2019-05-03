create table spring_reply (
  cno number (10,0) not null primary key,
  ano number (10,0) not null,
  bno number (10),
  content varchar2(500) not null,
  regdate Date default sysdate
 ); 
DROP TABLE spring_reply CASCADE CONSTRAINTS;
 
alter table spring_reply add constraint fk_replybno
foreign key(bno) references airuser(bno);

alter table spring_reply add constraint fk_replyano
foreign key(ano) references project_accommodation(ano);
 
 create sequence rep_seq;

select * from spring_reply;

drop sequence rep_seq;

drop table spring_reply;



drop table spring_reply cascade constraints;