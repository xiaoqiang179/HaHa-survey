# VOTE SYS

```sql
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
```


每个题都有ID，为UUID每个题组都有ID，为UUID，通过两个映射表链接，但是映射表无复合主键。
其主键是自己生成的UUID

审核中：0
审核失败：2
审核成功：1


加密用的类：```DigestUtils```



BUG：
1 不能防止一人同时做一套题做两遍！！