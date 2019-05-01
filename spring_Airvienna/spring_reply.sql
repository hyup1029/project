create table spring_reply (
  cno number not null primary key,
  ano number not null,
  content varchar2(500) not null,
  regdate Date default sysdate); 


create sequence rep_seq;

drop sequence rep_seq;

drop table spring_reply;

select * from spring_reply;