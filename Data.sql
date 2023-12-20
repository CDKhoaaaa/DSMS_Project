-- Insert data into School table
INSERT INTO school (school_id, school_title, level_count, is_active, created_at)
VALUES 
  (1, 'ABC School', 3, 1, GETDATE()),
  (2, 'XYZ School', 2, 1, GETDATE()),
  (3, '123 School', 4, 1, GETDATE());

-- Insert data into Student table
INSERT INTO student (student_id, student_code, fullname, gender, dob, email, phone, school_id, stage, section, is_active, join_date, created_at)
VALUES 
  (1, 'S001', 'John Doe', N'Nam', '2000-01-15', 'john.doe@email.com', '1234567890', 1, 10, 'A', 1, '2022-01-01', GETDATE()),
  (2, 'S002', 'Jane Smith', N'Nữ', '2001-03-20', 'jane.smith@email.com', '9876543210', 2, 8, 'B', 1, '2022-02-01', GETDATE()),
  (3, 'S003', 'Bob Johnson', N'Nữ', '2002-05-10', 'bob.johnson@email.com', '5556667777', 1, 12, 'C', 1, '2022-03-01', GETDATE());

-- Insert data into Parent table
INSERT INTO parent (parent_id, parent_code, parent_full_name, email, phone, created_at)
VALUES 
  (1, 'P001', 'Alice Doe', 'alice.doe@email.com', '1112223333', GETDATE()),
  (2, 'P002', 'Bob Smith', 'bob.smith@email.com', '4445556666', GETDATE()),
  (3, 'P003', 'Charlie Johnson', 'charlie.johnson@email.com', '7778889999', GETDATE());

-- Insert data into Student_Parent table
INSERT INTO student_parent (student_parent_id, student_id, parent_id, relationship)
VALUES 
  (1, 1, 1, 'Mother'),
  (2, 2, 2, 'Father'),
  (3, 3, 3, 'Guardian');

-- Insert data into Subjects table
INSERT INTO subjects (subject_id, title, school_id, stage, term, carry_mark, created_at)
VALUES 
  (1, 'Math', 1, 10, 1, 100, GETDATE()),
  (2, 'English', 2, 8, 2, 80, GETDATE()),
  (3, 'Science', 1, 12, 1, 120, GETDATE());

-- Insert data into Classroom table
INSERT INTO classroom (classroom_id, capacity, room_type, class_desc, created_at)
VALUES 
  (1, 30, 'Standard', 'Classroom A', GETDATE()),
  (2, 25, 'Lab', 'Science Lab', GETDATE()),
  (3, 40, 'Standard', 'Classroom B', GETDATE());

-- Insert data into Teacher table
INSERT INTO teacher (teacher_id, teacher_code, teacher_full_name, gender, dob, email, phone, is_active, join_date, working_days, created_at)
VALUES 
  (1, 'T001', 'Mr. Johnson', 1, '1975-08-25', 'johnson@email.com', '9998887777', 1, '2020-01-15', 5, GETDATE()),
  (2, 'T002', 'Mrs. Smith', 2, '1980-03-10', 'smith@email.com', '6667778888', 1, '2019-12-01', 4, GETDATE()),
  (3, 'T003', 'Ms. Davis', 2, '1985-11-18', 'davis@email.com', '3334445555', 1, '2021-02-20', 3, GETDATE());

-- Insert data into Class table
INSERT INTO class (class_id, class_name, subject_id, teacher_id, classroom_id, section, created_at)
VALUES 
  (1, 'Math Class 10A', 1, 1, 1, 'A', GETDATE()),
  (2, 'English Class 8B', 2, 2, 2, 'B', GETDATE()),
  (3, 'Science Class 12C', 3, 3, 3, 'C', GETDATE());

-- Insert data into Class_Student table
INSERT INTO class_student (class_student_id, class_id, student_id)
VALUES 
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3);
