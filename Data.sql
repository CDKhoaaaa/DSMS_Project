USE SchoolManagementSystem;
GO

-- Insert data into the 'school' table
INSERT INTO school (school_id, school_title, level_count, is_active, created_at, update_at)
VALUES
(1, 'High School 1', 3, 1, GETDATE(), NULL),
(2, 'Middle School 2', 4, 1, GETDATE(), NULL),
(3, 'Primary School 3', 6, 0, GETDATE(), NULL);

-- Insert data into the 'student' table
INSERT INTO student (student_id, student_code, fname, lname, gender, dob, email, phone, school_id, stage, section, is_active, join_date, created_at, update_at)
VALUES
(1, 'S001', 'John', 'Doe', 'Male', '2000-01-15', 'john.doe@email.com', '1234567890', 1, 10, 'A', 1, '2022-01-01', GETDATE(), NULL),
(2, 'S002', 'Jane', 'Smith', 'Female', '2001-03-20', 'jane.smith@email.com', '9876543210', 2, 8, 'B', 1, '2022-01-05', GETDATE(), NULL),
(3, 'S003', 'Alex', 'Johnson', 'Male', '2002-07-12', 'alex.johnson@email.com', '4567890123', 3, 12, 'C', 1, '2022-02-10', GETDATE(), NULL);

-- Insert data into the 'guardian' table
INSERT INTO guardian (guardian_id, guardian_code, fname, lname, email, phone, created_at, update_at)
VALUES
(1, 'G001', 'Michael', 'Doe', 'michael.doe@email.com', '1112223333', GETDATE(), NULL),
(2, 'G002', 'Susan', 'Smith', 'susan.smith@email.com', '4445556666', GETDATE(), NULL),
(3, 'G003', 'David', 'Johnson', 'david.johnson@email.com', '7778889999', GETDATE(), NULL);

-- Insert data into the 'student_guardian' table
INSERT INTO student_guardian (student_guardian_id, student_id, guardian_id, relationship)
VALUES
(1, 1, 1, 'Parent'),
(2, 2, 2, 'Parent'),
(3, 3, 3, 'Parent');

-- Insert data into the 'subjects' table
INSERT INTO subjects (subject_id, title, school_id, stage, term, carry_mark, created_at, update_at)
VALUES
(1, 'Mathematics', 1, 10, 1, 100, GETDATE(), NULL),
(2, 'Science', 2, 8, 2, 90, GETDATE(), NULL),
(3, 'History', 3, 12, 1, 80, GETDATE(), NULL);

-- Insert data into the 'classroom' table
INSERT INTO classroom (classroom_id, capacity, room_type, class_desc, created_at, update_at)
VALUES
(1, 30, 'Standard', 'Classroom 101', GETDATE(), NULL),
(2, 25, 'Lab', 'Science Lab', GETDATE(), NULL),
(3, 35, 'Standard', 'Classroom 201', GETDATE(), NULL);

-- Insert data into the 'teacher' table
INSERT INTO teacher (teacher_id, teacher_code, fname, lname, gender, dob, email, phone, nos, is_active, join_date, working_days, created_at, update_at)
VALUES
(1, 'T001', 'Mr.', 'Anderson', 1, '1975-05-10', 'mr.anderson@email.com', '9998887777', 3, 1, '2020-03-15', 5, GETDATE(), NULL),
(2, 'T002', 'Mrs.', 'Brown', 2, '1980-08-22', 'mrs.brown@email.com', '6665554444', 4, 1, '2019-07-01', 4, GETDATE(), NULL),
(3, 'T003', 'Dr.', 'Smith', 1, '1985-11-30', 'dr.smith@email.com', '3332221111', 2, 1, '2021-02-20', 3, GETDATE(), NULL);

-- Insert data into the 'class' table
INSERT INTO class (class_id, class_name, subject_id, teacher_id, classroom_id, section, created_at, update_at)
VALUES
(1, 'Math101-A', 1, 1, 1, 'A', GETDATE(), NULL),
(2, 'Science202-B', 2, 2, 2, 'B', GETDATE(), NULL),
(3, 'History301-C', 3, 3, 3, 'C', GETDATE(), NULL);

-- Insert data into the 'class_student' table
INSERT INTO class_student (class_student_id, class_id, student_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);
