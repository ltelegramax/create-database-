create database konferencia;
go
use konferencia;

create table country_konferencii
(
id_country int not null,
country_name nchar(30) not null,
constraint cs_pk2 primary key (id_country),
);
--alter table country_konferencii add country_name nchar(30) not null

create table town_konferencii
(
id_town int not null,
street nchar(30) not null,
nuber_of_house int not null,
name_town nchar(30) not null unique,
id_country int not null,
constraint cs_pk primary key (id_town),
constraint cs_fk foreign key (id_country) references country_konferencii(id_country) on update cascade on delete cascade

);

create table konferencia
(
id_konferencii int not null,
lecture_hall int not null,
[date] date not null,
id_town int not null,
constraint cs_pk3 primary key (id_konferencii),
constraint cs_fk2 foreign key (id_town) references town_konferencii(id_town) on update cascade on delete cascade
);

create table place
(
id_place int not null,
place_name nchar(30) not null unique,
constraint cs_pk4 primary key (id_place)
);

create table section
(
id_section int not null,
[date] date not null,
id_place int not null,
id_konferencii int not null,
constraint cs_pk5 primary key (id_section),
constraint cs_fk3 foreign key (id_place) references place(id_place) on update cascade on delete cascade,
constraint cs_fk4 foreign key (id_konferencii) references konferencia(id_konferencii) on update cascade on delete cascade
);

create table [science degree]
(
[science degree id] int not null,
[science degree name] nchar(30) not null,
constraint cs_pk6 primary key ([science degree id]),
);

create table [people country]
(
[people country id] int not null,
[people country name] nchar(30) not null unique,
constraint cs_pk7 primary key ([people country id]),
);

create table [people town]
(
[people town id] int not null,
[people country id] int not null,
street nchar(30) not null,
nuber_of_house int not null,
name_town nchar(30) not null unique,
constraint cs_pk8 primary key ([people town id]),
constraint cs_fk5 foreign key ([people country id]) references [people country]([people country id]) on update cascade on delete cascade
);

create table people
(
[people id] int not null,
surname nchar(30) not null,
name nchar(30) not null,
patronymic nchar(30) not null,
age int not null,
DOB date not null,
[science degree id] int not null,
[people town id] int not null,
constraint cs_pk9 primary key ([people id]),

constraint cs_fk6 foreign key ([science degree id]) references [science degree]([science degree id]) on update cascade on delete cascade,
constraint cs_fk7 foreign key ([people town id]) references [people town]([people town id]) on update cascade on delete cascade
);

create table meeting
(
[meeting id] int not null,
[date] date not null,
[lecture_hall number] int not null,
id_section int not null,
[people id] int not null,
constraint cs_pk10 primary key ([meeting id]),
constraint cs_fk8 foreign key (id_section) references section(id_section) on update cascade on delete cascade,
constraint cs_fk9 foreign key ([people id]) references people([people id]) on update cascade on delete cascade
);

insert country_konferencii(id_country,[country_name])
values ('14','maxlend' )
select*
from country_konferencii

insert town_konferencii(id_town,id_country,street,nuber_of_house,name_town)
values ('13','14','loler','12','teeler' )
select*
from town_konferencii

insert konferencia(id_konferencii,date,id_town,lecture_hall)
values ('18','1312-05-12','13','16' )
select*
from konferencia

insert place(id_place,place_name)
values ('4','nikitalend' )
select*
from place

insert section(id_section,id_konferencii,id_place,date)
values ('5','18','4','1122-04-24' )
select*
from section

insert [science degree]([science degree id],[science degree name])
values ('7','jerax')
select*
from [science degree]

insert [people country]([people country id],[people country name])
values ('9','Mland')
select*
from [people country]

insert [people town]([people country id],[people town id],street,name_town,nuber_of_house)
values ('9','3','Mishastr','HPLand','12')
select*
from [people town]

insert people([people id],surname,name,patronymic,age,DOB,[science degree id],[people town id])
values ('2','Gubar','Misha','Loler','16','2000-11-27','7','3')
select*
from people


insert meeting([people id],[meeting id],date,[lecture_hall number],id_section)
values ('2','23','1999-05-15','34','5')
select*
from meeting

insert place(id_place,place_name)
values ('9','bornToDie' )
select*
from place


CREATE UNIQUE NONCLUSTERED INDEX index1
	   ON place (place_name desc) 

CREATE UNIQUE NONCLUSTERED INDEX index2
	   ON place (id_place desc) 
	   include 
CREATE UNIQUE NONCLUSTERED INDEX index3
	   ON country_konferencii (id_country asc) 

CREATE UNIQUE NONCLUSTERED INDEX index4
	   ON country_konferencii (country_name desc) 

CREATE UNIQUE NONCLUSTERED INDEX index5
	   ON konferencia (lecture_hall desc) 

CREATE UNIQUE NONCLUSTERED INDEX index6
	   ON konferencia (date asc) 

CREATE UNIQUE NONCLUSTERED INDEX index7
	   ON meeting (date asc) 

CREATE UNIQUE NONCLUSTERED INDEX index8
	   ON people (age asc) 

CREATE UNIQUE NONCLUSTERED INDEX index9
	   ON people (name desc) 

CREATE UNIQUE NONCLUSTERED INDEX index10
	   ON [people country] ([people country name] desc) 

CREATE UNIQUE NONCLUSTERED INDEX index11
	   ON [people country] ([people country id] desc) 

CREATE UNIQUE NONCLUSTERED INDEX index12
	   ON [people town] (street desc)

CREATE UNIQUE NONCLUSTERED INDEX index13
	   ON [people town] ([nuber_of_house] asc)

CREATE UNIQUE NONCLUSTERED INDEX index14
	   ON [science degree] ([science degree id] asc)

CREATE UNIQUE NONCLUSTERED INDEX index15
	   ON [science degree] ([science degree name] desc)

CREATE UNIQUE NONCLUSTERED INDEX index16
	   ON section (date desc)

CREATE UNIQUE NONCLUSTERED INDEX index17
	   ON section (id_place asc)

CREATE UNIQUE NONCLUSTERED INDEX index18
	   ON town_konferencii (street asc)

CREATE UNIQUE NONCLUSTERED INDEX index19
	   ON town_konferencii ([name_town] desc)


use konferencia
CREATE TYPE My_Type
FROM varchar(100) NOT NULL;
go

create table [max]
(
[person name] My_Type
);


use konferencia
CREATE TYPE My_Type1
FROM int NOT NULL;
go
alter table [max] add age My_Type1

use konferencia
CREATE TYPE My_Type2
FROM date NOT NULL;
go
alter table [max] add DOB My_Type2