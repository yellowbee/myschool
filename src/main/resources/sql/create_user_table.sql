drop table if exists usr;

create table usr (
  usr_id int not null auto_increment,
  fst_name varchar(64) not null,
  lst_name varchar(32) not null,
  email varchar(128) not null,
  passwd_hash varchar(102) not null,
  primary key (usr_id)
);