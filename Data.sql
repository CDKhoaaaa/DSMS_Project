-- Insert data into school table
INSERT INTO school (school_id, school_title, level_count, is_active, created_at, update_at)
VALUES 
    (1, 'ABC School', 10, 1, GETDATE(), NULL),
    (2, 'XYZ School', 8, 1, GETDATE(), NULL),
    (3, '123 School', 12, 1, GETDATE(), NULL);

-- Insert data into student table
INSERT INTO student (student_id, student_code, fname, lname, gender, dob, email, phone, school_id, stage, section, is_active, join_date, created_at, update_at)
VALUES 
    (1, 'S001', 'John', 'Doe', N'Nam', '2000-01-15', 'john.doe@example.com', '1234567890', 1, 10, 'A', 1, '2022-09-01', GETDATE(), NULL),
    (2, 'S002', 'Jane', 'Smith', N'Nữ', '2001-03-20', 'jane.smith@example.com', '9876543210', 2, 8, 'B', 1, '2022-09-01', GETDATE(), NULL),
    (3, 'S003', 'Bob', 'Johnson', N'Nam', '2002-05-12', 'bob.johnson@example.com', '5556667777', 3, 12, 'C', 1, '2022-09-01', GETDATE(), NULL);

-- Insert data into guardian table
INSERT INTO guardian (parent_id, parent_code, fname, lname, email, phone, created_at, update_at)
VALUES 
    (1, 'P001', 'Mary', 'Doe', 'mary.doe@example.com', '1112223333', GETDATE(), NULL),
    (2, 'P002', 'Tom', 'Smith', 'tom.smith@example.com', '4445556666', GETDATE(), NULL),
    (3, 'P003', 'Alice', 'Johnson', 'alice.johnson@example.com', '7778889999', GETDATE(), NULL);

-- Insert data into student_guardian table
INSERT INTO student_guardian (student_parent_id, student_id, parent_id, relationship)
VALUES 
    (1, 1, 1, 'Mother'),
    (2, 2, 2, 'Father'),
    (3, 3, 3, 'Guardian');

-- Insert data into subjects table
INSERT INTO subjects (subject_id, title, school_id, stage, term, carry_mark, created_at, update_at)
VALUES 
    (1, 'Mathematics', 1, 10, 1, 100, GETDATE(), NULL),
    (2, 'Science', 2, 8, 2, 90, GETDATE(), NULL),
    (3, 'English', 3, 12, 1, 80, GETDATE(), NULL);

-- Insert data into classroom table
INSERT INTO classroom (classroom_id, capacity, room_type, class_desc, created_at, update_at)
VALUES 
    (1, 30, 'Standard', 'Classroom for 10th Grade', GETDATE(), NULL),
    (2, 25, 'Laboratory', 'Science Lab', GETDATE(), NULL),
    (3, 40, 'Standard', 'Classroom for 12th Grade', GETDATE(), NULL);

-- Insert data into teacher table
INSERT INTO teacher (teacher_id, teacher_code, fname, lname, gender, dob, email, phone, is_active, join_date, working_days, created_at, update_at)
VALUES 
    (1, 'T001', 'Mr.', 'Anderson', 1, '1975-08-10', 'mr.anderson@example.com', '3334445555', 1, '2020-01-15', 5, GETDATE(), NULL),
    (2, 'T002', 'Mrs.', 'Williams', 0, '1980-02-25', 'mrs.williams@example.com', '6667778888', 1, '2020-03-20', 4, GETDATE(), NULL),
    (3, 'T003', 'Dr.', 'Smith', 1, '1978-11-05', 'dr.smith@example.com', '9990001111', 1, '2021-05-12', 3, GETDATE(), NULL);

-- Insert data into class table
INSERT INTO class (class_id, class_name, subject_id, teacher_id, classroom_id, section, created_at, update_at)
VALUES 
    (1, '10A - Mathematics', 1, 1, 1, 'A', GETDATE(), NULL),
    (2, '8B - Science', 2, 2, 2, 'B', GETDATE(), NULL),
    (3, '12C - English', 3, 3, 3, 'C', GETDATE(), NULL);

-- Insert data into class_student table
INSERT INTO class_student (class_student_id, class_id, student_id)
VALUES 
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);
