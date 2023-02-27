USE essentialmode;
CREATE TABLE vip ( 
Name VARCHAR(30) NOT null,
Label VARCHAR(255) NOT NULL,
Primary key (Name)
);

select * from vip;
INSERT INTO vip (Name,Label) VALUES('rank1','Iron');
INSERT INTO vip (Name,Label) VALUES('rank2','Gold');
INSERT INTO vip (Name,Label) VALUES('rank3','Diamond');

CREATE TABLE vip_users (
	id int(11) NOT NULL AUTO_INCREMENT,
	Name varchar(60) NOT NULL,
	Owner varchar(60) NOT NULL,
	PRIMARY KEY (id)
);