CREATE DATABASE SchoolManagementSystem;
GO
USE SchoolManagementSystem;
GO


CREATE TABLE school(
	school_id int primary key,
	school_title varchar(50) not null, 
	level_count tinyint not null,
	is_active bit not null,
	created_at DATETIME default(getdate())
);
GO

CREATE TABLE student(
	student_id int primary key,
	student_code varchar(12) not null,
	fullname nvarchar(50) not null,
	gender  nvarchar(5) not null,
	dob DATE not null,
	email varchar(75) CHECK (email LIKE '%_@__%.__%'),
	phone varchar(12) check(len(phone) between 10 and 12),
	school_id int not null,
	stage int not null,
	section char(2) not null,
	is_active bit not null,
	join_date date not null,
	created_at datetime default(getdate())
);
GO

CREATE TABLE parent(
	parent_id int primary key,
	parent_code varchar(12) not null,
	parent_full_name nvarchar(50) not null,
	email varchar(75) CHECK (email LIKE '%_@__%.__%'),
	phone varchar(12) check(len(phone) between 10 and 12),
	created_at datetime default(getdate())
);
GO

CREATE TABLE student_parent(
	student_parent_id int primary key,
	student_id int not null,
	parent_id int not null,
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
	created_at datetime default(getdate())
);
GO

CREATE TABLE classroom(
	classroom_id int primary key,
	capacity int not null,
	room_type nvarchar(30) not null,
	class_desc nvarchar(100) not null,
	created_at datetime default(getdate())
);
GO

CREATE TABLE teacher(
	teacher_id int primary key,
	teacher_code varchar(12) not null,
	teacher_full_name varchar(75),
	gender smallint not null,
	dob date not null,
	email varchar(75) CHECK (email LIKE '%_@__%.__%'),
	phone varchar(12) check(len(phone) between 10 and 12),
	is_active bit not null,
	join_date date not null,
	working_days smallint not null,
	created_at datetime default(getdate())
);
GO

CREATE TABLE class(
	class_id int primary key,
	class_name nvarchar(50) not null,
	subject_id int not null,
	teacher_id int not null,
	classroom_id int not null,
	section varchar(2) not null,
	created_at datetime default(getdate())
);
GO

CREATE TABLE class_student(
	class_student_id int primary key,
	class_id int not null,
	student_id int not null
);
GO


ALTER TABLE student_parent
ADD CONSTRAINT sp_parent_fk FOREIGN KEY(parent_id) REFERENCES parent(parent_id);
GO

ALTER TABLE student_parent
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