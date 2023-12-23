CREATE DATABASE SchoolManagementSystem;
GO
USE SchoolManagementSystem;
GO


CREATE TABLE school(
	school_id int primary key,
	school_title varchar(50) not null, 
	level_count tinyint not null, -- Số lượng lớp học
	is_active bit not null,
	created_at DATETIME default(getdate()),
	update_at datetime null
);
GO

CREATE TABLE student(
	student_id int primary key,
	student_code varchar(12) not null,
	fname nvarchar(25) not null,
	lname nvarchar(25) not null,
	gender  nvarchar(6) not null,
	dob DATE not null,
	email varchar(75) check (email LIKE '%_@__%.__%'),
	phone varchar(12) check(LEN(phone) BETWEEN 10 AND 12 AND ISNUMERIC(phone) = 1) unique,
	school_id int not null,
	stage int not null,
	section char(2) not null,
	is_active bit not null,
	join_date date not null,
	created_at datetime default(getdate()),
	update_at datetime null
);
GO

CREATE TABLE guardian(
	guardian_id int primary key,
	guardian_code varchar(12) not null,
	fname nvarchar(25) not null,
	lname nvarchar(25) not null,
	email varchar(75) check(email LIKE '%_@__%.__%'),
	phone varchar(12) check(LEN(phone) BETWEEN 10 AND 12 AND ISNUMERIC(phone) = 1) unique,
	created_at datetime default(getdate()),
	update_at datetime null
);
GO

CREATE TABLE student_guardian(
	student_guardian_id int primary key,
	student_id int not null,
	guardian_id int not null,
	relationship nvarchar(10) not null
);
GO

CREATE TABLE subjects(
	subject_id int primary key,
	title nvarchar(100) not null,
	school_id int not null,
	stage int not null,
	term int not null,
	carry_mark int not null,
	created_at datetime default(getdate()),
	update_at datetime null
);
GO

CREATE TABLE classroom(
	classroom_id int primary key,
	capacity int not null,
	room_type nvarchar(30) not null,
	class_desc nvarchar(100) not null,
	created_at datetime default(getdate()),
	update_at datetime null
);
GO

CREATE TABLE teacher(
	teacher_id int primary key,
	teacher_code varchar(12) not null,
	fname nvarchar(25) not null,
	lname nvarchar(25) not null,
	gender smallint not null,
	dob date not null,
	email varchar(75) check (email LIKE '%_@__%.__%'),
	phone varchar(12) check (LEN(phone) BETWEEN 10 AND 12 AND ISNUMERIC(phone) = 1) unique,
	is_active bit not null,
	join_date date not null,
	working_days smallint not null,
	created_at datetime default(getdate()),
	update_at datetime null
);
GO

CREATE TABLE class(
	class_id int primary key,
	class_name nvarchar(50) not null,
	subject_id int not null,
	teacher_id int not null,
	classroom_id int not null,
	section varchar(2) not null,
	created_at datetime default(getdate()),
	update_at datetime null
);
GO

CREATE TABLE class_student(
	class_student_id int primary key,
	class_id int not null,
	student_id int not null
);
GO

ALTER TABLE student_guardian
ADD CONSTRAINT sp_guardian_fk FOREIGN KEY(guardian_id) REFERENCES guardian(guardian_id);
GO

ALTER TABLE student_guardian
ADD CONSTRAINT sp_student_fk FOREIGN KEY(student_id) REFERENCES student(student_id);
GO

ALTER TABLE student
ADD CONSTRAINT st_school_fk FOREIGN KEY(school_id) REFERENCES school(school_id);
GO

ALTER TABLE subjects
ADD CONSTRAINT sb_school_fk FOREIGN KEY(school_id) REFERENCES school(school_id);
GO

ALTER TABLE class
ADD CONSTRAINT cl_subject_fk FOREIGN KEY(subject_id) REFERENCES subjects(subject_id);
GO

ALTER TABLE class
ADD CONSTRAINT cl_teacher_fk FOREIGN KEY(teacher_id) REFERENCES teacher(teacher_id);
GO

ALTER TABLE class
ADD CONSTRAINT cl_classroom_fk FOREIGN KEY(classroom_id) REFERENCES classroom(classroom_id);
GO

ALTER TABLE class_student
ADD CONSTRAINT cs_class_fk FOREIGN KEY(class_id) REFERENCES class(class_id);
GO

ALTER TABLE class_student
ADD CONSTRAINT cs_student_fk FOREIGN KEY(student_id) REFERENCES student(student_id);
GO
