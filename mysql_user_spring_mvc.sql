use db_spring_mvc;
drop table members_table;
create table members_table(
id bigint auto_increment,
memberId varchar(30) unique,
memberPassword varchar(30) not null,
memberName varchar(20) not null,	
memberDept varchar(20) not null,
memberPosition varchar(20) not null,
memberJoinDate datetime not null,
memberIdNum varchar(20) not null,
memberBirthDay date not null,
memberAddress varchar(20) not null,
memberEmail varchar(30) not null,
memberMobile varchar(20) not null,
memberProfileName varchar(50) not null,
salary int not null,
educationLv varchar(30) not null,
career varchar(50) not null,
certificate varchar(100),
countAttendance int default 0,
countAbsenceDate int default 0,
countLate int default 0,
countEarly int default 0,
totalHoliday int default 0,
usedHoliday int default 0,
restHoliday int default 0,
constraint pk_members_table_id primary key (id)
);
insert into members_table (id, memberId, memberPassword, memberName, memberDept, memberPosition, memberJoinDate, memberIdNum, memberBirthDay, memberAddress, memberEmail, memberMobile, memberProfileName, salary, educationLv, career, certificate)
        values (1,'admin', '1111', '김형수', '임원', '임원', '1984-06-22', '8406221', '19840622', '송림로194', 'admin@aaa.com', '01025324122', 'son', 100000000, '고졸', '국제무역, 총무', '운전면허증');
select * from members_table;
SELECT * FROM members_table WHERE  DATE_FORMAT(memberJoinDate,'%Y-%m') = DATE_FORMAT(now(),'%Y-%m');
UPDATE members_table SET memberJoinDate='2021-06-09 14:14:05' where id = 08;
ALTER TABLE members_table ADD salary int AFTER memberPosition;
ALTER TABLE members_table ADD educationLv int AFTER memberBirthDay;
ALTER TABLE members_table ADD certificate varchar(50) AFTER educationLv;
ALTER TABLE members_table ADD career varchar(50) AFTER educationLv;
ALTER TABLE members_table MODIFY COLUMN salary int NOT NULL;
ALTER TABLE members_table MODIFY educationLv varchar(30);
ALTER TABLE members_table MODIFY COLUMN educationLv varchar(30) NOT NULL;
ALTER TABLE members_table MODIFY COLUMN career varchar(50) NOT NULL;
ALTER TABLE members_table MODIFY certificate varchar(50);
update members_table set memberEmail="admin@abc.com" where id=1;
update members_table set salary=0 where id=1;
update members_table set educationLv=0 where id=1;
update members_table set career="경력없음" where id=1;
update members_table set educationLv="대졸" where id=1;

drop table requestBoard_table;
create table requestBoard_table(
id bigint auto_increment,
writerId varchar(30) not null,
dept varchar(20) not null,
position varchar(20) not null,
title varchar(50) not null,
contents varchar(500) not null,
createdDate dateTime not null,
hits int default 0,
fileName varchar(50),
constraint pk_requestBoard_table_id primary key(id),
constraint fk_requestBoard_table_memberId foreign key(writerId) references members_table(memberId) on delete cascade
);
select * from requestBoard_table;


drop table comments_table;
create table comments_table(
id bigint auto_increment,
boardId bigint not null,
writerId varchar(30) not null,
commentContents varchar(50) not null,
createdDate dateTime not null,
constraint pk_comments_table_id primary key(id),
constraint fk_comments_table_boardId foreign key (boardId) references requestBoard_table(id) on delete cascade,
constraint fk_comments_table_writerId foreign key(writerId) references requestBoard_table(writerId) on delete cascade
);
select * from comments_table;
drop table reserve_table;
create table reserve_table(
 id bigint auto_increment,
memberId varchar(30) not null,
memberName varchar(20) not null,
memberDept varchar(20) not null,
memberPosition varchar(20) not null,
contents varchar(100) not null,
reservationDate dateTime not null,
createdDate dateTime not null,
constraint pk_reserve_table_id primary key(id),
constraint fk_reserve_table_memberId foreign key(memberId) references members_table(memberId) on delete cascade
);
select * from reserve_table;
drop table holiday_table;
create table holiday_table(
id bigint auto_increment,
numId bigint,
memberName varchar(20) not null,
memberDept varchar(20) not null,
memberPosition varchar(20) not null,
selectContents varchar(30) not null,
totalVacation int not null,
usedVacations int not null,
restVacations int not null,
constraint pk_holiday_table_id primary key (id),
constraint fk_holiday_table_numId foreign key(numId) references members_table(id) on delete cascade
); 
select * from holiday_table;
drop table attendance_table;
create table attendance_table(
id bigint auto_increment,
numId bigint,
memberName varchar(30) not null,
memberDept varchar(20) not null,
memberPosition varchar(20) not null,
memberJoinDate datetime not null,
attendanceDate varchar(20) not null,
closingDate varchar(20),
absenceDate varchar(20),
lateDate varchar(20),
earlyDate varchar(20),
constraint pk_attendance_table primary key (id),
constraint fk_attendance_table foreign key (numId) references members_table (id) on delete cascade
);
select * from attendance_table;
select count(attendanceDate) from attendance_table;
select attendanceDate from attendance_table where numId=1 and str_to_date(attendanceDate, '%Y-%m-%d') = current_date;
select * from attendance_table where numId=1 and str_to_date(attendanceDate, '%Y-%m-%d') = current_date;
delete from attendance_table where id=2;
select * from attendance_table where numId=1 and str_to_date(attendanceDate, '%Y-%m-%d') = current_date;
update attendance_table set attendanceDate = '2022-06-13 08:55:00' where id = 1;
update attendance_table set closingDate = null where id = 3;

drop table reservation_table;
create table reservation_table(
    id bigint auto_increment,
    reserveDate date,
    dT1 varchar(20) default '예약가능',
    dT2 varchar(20) default '예약가능',
    dT3 varchar(20) default '예약가능',
    dT4 varchar(20) default '예약가능',
    dT5 varchar(20) default '예약가능',
    dT6 varchar(20) default '예약가능',
	primary key(id)
);
select * from reservation_table;






