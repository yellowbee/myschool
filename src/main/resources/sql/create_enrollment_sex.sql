drop table if exists usr;

create table enrl_undgrad_sex (
  usr_id int not null auto_increment,
  
  ft_m_dg_fst_frsh int not null,
  ft_w_dg_fst_frsh int not null,
  
  
  primary key (usr_id)
);