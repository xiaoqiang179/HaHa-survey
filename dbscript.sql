create database VOTESYS;

use VOTESYS;

create table user(
	id int not null primary key auto_increment,
	name varchar(255) not null unique,
    tel varchar(255) not null unique,
    email varchar(255) not null unique,
    gender varchar(10),
    password varchar(255),
    iconfilename varchar(255)
);

select * from user;

create table company(
	id int not null primary key auto_increment,
	name varchar(255) not null unique,
    tel varchar(255) not null unique,
    email varchar(255) not null unique,
    gender varchar(10),
    password varchar(255),
    iconfilename varchar(255),
    companyname varchar(255),
    companytype varchar(255),
    companydesp varchar(255)
);

select * from company;


create table admin(
	id varchar(255) primary key,
    password varchar(255)
);

select * from admin;

create table singleQuestion(
	id varchar(255) primary key,
    text varchar(255),
    texta varchar(255),
    textb varchar(255),
    textc varchar(255),
    textd varchar(255)
);

create table subjectiveQuestion(
	id varchar(255) primary key,
    text varchar(255)
);

create table batch(
	id varchar(255) primary key,
    belong int
);


create table singleQuestionResult(
	id varchar(255) primary key,
    userid int,
    result int
);

create table subjectiveQuestionResult(
	id varchar(255) primary key,
    userid varchar(255),
    text varchar(255)
);


create table batchToQuestion(
	id varchar(255) primary key,
    batchid varchar(255),
    qustid varchar(255),
    type int
);

create table questionToResult(
	id varchar(255) primary key,
    qustid varchar(255),
    resultid varchar(255),
    type int
);


select * from batchToQuestion a,singleQuestion b,singleQuestionResult c,questionToResult d 
where b.id=a.qustid and c.id=d.resultid and a.qustid=d.resultid and a.batchid='1' and c.userid='1'


create table dorecord(
	id varchar(255) primary key,
    userid int,
    batchid varchar(255)
);










































