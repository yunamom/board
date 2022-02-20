CREATE TABLE board (
    unq INT unsigned not null AUTO_INCREMENT,
    title varchar(100) not null,
    pass varchar(100) not null,
    name varchar(20),
    content text,
    hits INT unsigned default '0',
    rdate datetime,
    PRIMARY KEY(unq)
);





CREATE TABLE reboard (
	unq int unsigned not null auto_increment primary key,
	title varchar(100) not null,
	pass varchar(100) not null,
	name varchar(20),
	content text,
	hits int unsigned default 0,
	rdate datetime,
	gid int unsigned not null,
	thread varchar(50) not null
);


CREATE TABLE memberInfo (
	userid varchar(20) not null,
    pass varchar(100) not null,
    name varchar(20) not null,
    birthday date not null,
    gender char(1) not null,
    mobile varchar(20),
    zipcode varchar(6),
    addr varchar(100),
    rdate datetime
);

create table plan (
	unq int unsigned not null auto_increment,
	userid varchar(20) not null,
	pdate date not null,
	title varchar(50) not null,
	content text,
	week varchar(50) not null,
	primary key(unq)
);