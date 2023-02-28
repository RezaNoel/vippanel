USE essentialmode;

CREATE TABLE vip (
Order int(10) not null, 
Name VARCHAR(30) NOT null,
Label VARCHAR(255) NOT NULL,
Primary key (Order)
);

select * from vip;
INSERT INTO vip (Order,Name,Label) VALUES(1,'rank1','Iron');
INSERT INTO vip (Order,Name,Label) VALUES(2,'rank2','Gold');
INSERT INTO vip (Order,Name,Label) VALUES(3,'rank3','Diamond');

CREATE TABLE vip_users (
	id int(11) NOT NULL AUTO_INCREMENT,
	Name varchar(60) NOT NULL,
	Owner varchar(60) NOT NULL,
	PRIMARY KEY (id)
);