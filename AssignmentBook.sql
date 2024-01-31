create database AssignmentBook;
use AssignmentBook;
create table author
(author_id int not null primary key,
author_name varchar(100) not null,
author_phno varchar(15) not null unique,
author_email varchar(100) not null unique,
author_addr varchar(300) not null,
author_city varchar(30) not null,
constraint uc_name_address_city unique (author_name, author_addr, author_city)
);

create table book
(book_id int not null primary key,
book_name varchar(100) not null,
author_id int not null,
price float not null,
constraint fkauthor_id foreign key (author_id) references author(author_id),
check (price>0)
);

create table awardsmaster
(awardtype_id int not null primary key,
award_name varchar(100) not null unique,
award_price float not null
check(award_price>0)
);

create table award
(award_id int not null primary key,
awardtype_id int not null,
author_id int not null,
book_id int not null,
year varchar(30) not null,
constraint fkauthor_idd foreign key (author_id) references author(author_id),
constraint fkbook_id foreign key (book_id) references book(book_id),
constraint fkawardtype_id foreign key (awardtype_id) references awardsmaster(awardtype_id)
);

insert into author values
(1,"Shivaji sawant", "8967567889","sawant2345@gmail.com","gmroad", "pune"),
(2,"Ranjit desai", "7867667889","ranjit2785@gmail.com","tmroad", "Mumbai"),
(3,"Vishwas patil", "6767597879","Vishwas2345@gmail.com","lgroad", "Goa"),
(4,"Milind bokil", "8867567879","milind345@gmail.com","gsroad", "pune");

insert into book values
(1,"Murutunjai",1,345.3),
(2,"Swami",2,445.3),
(3,"Panipat",3,845.3),
(4,"Shala",4,765.3);

insert into awardsmaster values
(101, "Sahitya Akademi Yuva Puraskar", 23999),
(102, "Sahitya Akademi Award", 45999);

insert into award values
(1,101,1,1,"2022"),
(2,102,2,2,"2023"),
(3,101,3,3,"2023"),
(4,102,4,4,"2023");

