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