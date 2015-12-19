drop table if exists usr;

create table usr (
  usr_id int not null auto_increment,
  nick_name varchar(32) not null,
  email varchar(128) not null,
  passwd_hash varchar(102) not null,
  fst_name varchar(64),
  lst_name varchar(32),
  phone varchar(16),
  sex varchar(1),
  primary key (usr_id),
  unique key x_email (email)
) ENGINE=INNODB;