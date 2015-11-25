DROP TABLE if EXISTS passwd_reset;

CREATE TABLE passwd_reset (
  uuid VARCHAR (40) NOT NULL,
  email VARCHAR(128) NOT NULL,
  ts TIMESTAMP NOT NULL,
  PRIMARY KEY (uuid),
  FOREIGN KEY (email) 
        REFERENCES usr(email)
        ON DELETE CASCADE
) ENGINE=INNODB;