USE SchoolManagementSystem;
GO
-- Insert data into school table
INSERT INTO school (school_id, school_title, level_count, is_active)
VALUES
(1, 'Primary School', 6, 1),
(2, 'Secondary School', 4, 1),
(3, 'High School', 3, 1),
(4, 'International School', 5, 1),
(5, 'Public School', 6, 1),
(6, 'Private School', 4, 1),
(7, 'Grammar School', 5, 1),
(8, 'Charter School', 3, 1),
(9, 'Magnet School', 4, 1),
(10, 'Art School', 2, 1);

-- Insert data into student table
INSERT INTO student (student_id, student_code, fname, lname, gender, dob, email, phone, school_id, stage, section, is_active, join_date)
VALUES
(1, 'S001', 'John', 'Doe', 'Male', '2005-03-15', 'john.doe@example.com', '1234567890', 1, 4, 'A', 1, '2022-01-15'),
(2, 'S002', 'Jane', 'Smith', 'Female', '2006-07-22', 'jane.smith@example.com', '9876543210', 1, 5, 'B', 1, '2022-02-01'),
(3, 'S003', 'Michael', 'Johnson', 'Male', '2004-11-10', 'michael.j@example.com', '5556667777', 2, 3, 'C', 1, '2022-01-20'),
(4, 'S004', 'Emily', 'Williams', 'Female', '2007-05-02', 'emily.w@example.com', '1112223333', 2, 2, 'D', 1, '2022-02-10'),
(5, 'S005', 'William', 'Brown', 'Male', '2003-09-18', 'william.b@example.com', '9990001111', 3, 1, 'A', 1, '2022-01-25'),
(6, 'S006', 'Olivia', 'Miller', 'Female', '2005-01-30', 'olivia.m@example.com', '3334445555', 3, 2, 'B', 1, '2022-02-15'),
(7, 'S007', 'Ethan', 'Jones', 'Male', '2006-12-08', 'ethan.j@example.com', '7778889999', 4, 5, 'C', 1, '2022-01-30'),
(8, 'S008', 'Ava', 'Davis', 'Female', '2004-04-14', 'ava.d@example.com', '4445556666', 4, 4, 'D', 1, '2022-02-20'),
(9, 'S009', 'Daniel', 'Garcia', 'Male', '2007-08-05', 'daniel.g@example.com', '2223334444', 5, 2, 'A', 1, '2022-02-05'),
(10, 'S010', 'Sophia', 'Rodriguez', 'Female', '2003-06-12', 'sophia.r@example.com', '6667778888', 5, 3, 'B', 1, '2022-03-01');

-- Insert data into guardian table
INSERT INTO guardian (guardian_id, guardian_code, fname, lname, email, phone, created_at)
VALUES
(1, 'G001', 'Mark', 'Doe', 'mark.d@example.com', '1112223333', '2022-01-15'),
(2, 'G002', 'Lisa', 'Smith', 'lisa.s@example.com', '4445556666', '2022-02-01'),
(3, 'G003', 'David', 'Johnson', 'david.j@example.com', '7778889999', '2022-01-20'),
(4, 'G004', 'Sophie', 'Williams', 'sophie.w@example.com', '2223334444', '2022-02-10'),
(5, 'G005', 'Robert', 'Brown', 'robert.b@example.com', '5556667777', '2022-01-25'),
(6, 'G006', 'Emma', 'Miller', 'emma.m@example.com', '8889990000', '2022-02-15'),
(7, 'G007', 'Christopher', 'Jones', 'chris.j@example.com', '3334445555', '2022-01-30'),
(8, 'G008', 'Mia', 'Davis', 'mia.d@example.com', '6667778888', '2022-02-20'),
(9, 'G009', 'Andrew', 'Garcia', 'andrew.g@example.com', '9990001111', '2022-02-05'),
(10, 'G010', 'Victoria', 'Rodriguez', 'victoria.r@example.com', '1234567890', '2022-03-01');

INSERT INTO guardian
values(11, 'G011', 'Victoria', 'Emt', 'Emt.r@example.com', '1221567890', '2022-03-01', NULL);

INSERT INTO student_guardian VALUES(11, 1, 11, 'MOM');


-- Insert data into student_guardian table
INSERT INTO student_guardian (student_guardian_id, student_id, guardian_id, relationship)
VALUES
(1, 1, 1, 'Parent'),
(2, 2, 2, 'Parent'),
(3, 3, 3, 'Parent'),
(4, 4, 4, 'Parent'),
(5, 5, 5, 'Parent'),
(6, 6, 6, 'Parent'),
(7, 7, 7, 'Parent'),
(8, 8, 8, 'Parent'),
(9, 9, 9, 'Parent'),
(10, 10, 10, 'Parent');

-- Insert data into subjects table
INSERT INTO subjects (subject_id, title, school_id, stage, term, carry_mark)
VALUES
(1, 'Mathematics', 1, 4, 1, 100),
(2, 'English', 1, 5, 1, 80),
(3, 'Science', 2, 3, 2, 120),
(4, 'History', 2, 2, 2, 90),
(5, 'Physics', 3, 1, 1, 110),
(6, 'Chemistry', 3, 2, 2, 95),
(7, 'Biology', 4, 5, 1, 100),
(8, 'Art', 4, 4, 2, 75),
(9, 'Physical Education', 5, 2, 1, 85),
(10, 'Music', 5, 3, 2, 70);

-- Insert data into classroom table
INSERT INTO classroom (classroom_id, capacity, room_type, class_desc)
VALUES
(1, 30, 'Standard', 'Standard Classroom A'),
(2, 25, 'Laboratory', 'Science Lab B'),
(3, 35, 'Standard', 'Standard Classroom C'),
(4, 40, 'Library', 'Library Room D'),
(5, 20, 'Art Room', 'Art Room E'),
(6, 30, 'Standard', 'Standard Classroom F'),
(7, 25, 'Laboratory', 'Science Lab G'),
(8, 35, 'Standard', 'Standard Classroom H'),
(9, 40, 'Library', 'Library Room I'),
(10, 20, 'Art Room', 'Art Room J');


-- Insert data into teacher table
INSERT INTO teacher (teacher_id, teacher_code, fname, lname, gender, dob, email, phone, is_active, join_date, working_days)
VALUES
(1, 'T001', 'Mr. James', 'Smith', 1, '1980-05-10', 'james.s@example.com', '1112223333', 1, '2022-01-15', 5),
(2, 'T002', 'Ms. Jennifer', 'Johnson', 2, '1985-09-22', 'jennifer.j@example.com', '4445556666', 1, '2022-02-01', 4),
(3, 'T003', 'Dr. Richard', 'Williams', 1, '1975-11-10', 'richard.w@example.com', '7778889999', 1, '2022-01-20', 3),
(4, 'T004', 'Mrs. Amanda', 'Brown', 2, '1988-05-02', 'amanda.b@example.com', '2223334444', 1, '2022-02-10', 5),
(5, 'T005', 'Mr. Benjamin', 'Miller', 1, '1982-09-18', 'benjamin.m@example.com', '5556667777', 1, '2022-01-25', 4),
(6, 'T006', 'Ms. Olivia', 'Davis', 2, '1987-01-30', 'olivia.d@example.com', '8889990000', 1, '2022-02-15', 4),
(7, 'T007', 'Dr. Samuel', 'Jones', 1, '1978-12-08', 'samuel.j@example.com', '3334445555', 1, '2022-01-30', 3),
(8, 'T008', 'Mrs. Jessica', 'Garcia', 2, '1984-04-14', 'jessica.g@example.com', '6667778888', 1, '2022-02-20', 5),
(9, 'T009', 'Mr. Daniel', 'Rodriguez', 1, '1977-08-05', 'daniel.r@example.com', '9990001111', 1, '2022-02-05', 4),
(10, 'T010', 'Mrs. Sophia', 'Smith', 2, '1981-06-12', 'sophia.s@example.com', '1234567890', 1, '2022-03-01', 5);
=======
-- Insert data into the 'teacher' table
INSERT INTO teacher (teacher_id, teacher_code, fname, lname, gender, dob, email, phone, nos, is_active, join_date, working_days, created_at, update_at)
VALUES
(1, 'T001', 'Mr.', 'Anderson', 1, '1975-05-10', 'mr.anderson@email.com', '9998887777', 3, 1, '2020-03-15', 5, GETDATE(), NULL),
(2, 'T002', 'Mrs.', 'Brown', 2, '1980-08-22', 'mrs.brown@email.com', '6665554444', 4, 1, '2019-07-01', 4, GETDATE(), NULL),
(3, 'T003', 'Dr.', 'Smith', 1, '1985-11-30', 'dr.smith@email.com', '3332221111', 2, 1, '2021-02-20', 3, GETDATE(), NULL);
>>>>>>> c0a150341bea7de8ad143c9ebce9fc012a39fdba

-- Insert data into class table
INSERT INTO class (class_id, class_name, subject_id, teacher_id, classroom_id, section)
VALUES
(1, 'Math Class A', 1, 1, 1, 'A'),
(2, 'English Class B', 2, 2, 2, 'B'),
(3, 'Science Class C', 3, 3, 3, 'C'),
(4, 'History Class D', 4, 4, 4, 'D'),
(5, 'Physics Class E', 5, 5, 5, 'A'),
(6, 'Chemistry Class F', 6, 6, 6, 'B'),
(7, 'Biology Class G', 7, 7, 7, 'C'),
(8, 'Art Class H', 8, 8, 8, 'D'),
(9, 'PE Class I', 9, 9, 9, 'A'),
(10, 'Music Class J', 10, 10, 10, 'B');

-- Insert data into class_student table
INSERT INTO class_student (class_student_id, class_id, student_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);
