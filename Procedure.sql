USE SchoolManagementSystem;
GO

/*Nhập mã lớp, mã phòng học, cho biết số lượng học sinh trong lớp đó có phù hợp để vào phòng học (capacity) đó không (không lấy học sinh nghỉ học)
  Bảng: student, class, classroom, class_student
*/

CREATE PROCEDURE SP_Fit_Classroom
@class_id int,
@class_room int
AS
BEGIN
-- Lấy ra tổng số lượng học sinh trong cùng 1 lớp, không lấy học sinh nghỉ học
DECLARE @total_students int, @capacity int, @class_name nvarchar(50)
SELECT @total_students = count(tt.student_id)
FROM (SELECT student_id FROM student WHERE is_active = 1 ) as tt left join class_student cs on cs.student_id = tt.student_id
WHERE @class_id = class_id

-- Lấy ra tổng số lượng ghế trong cùng lớp học
SELECT @capacity = capacity
FROM classroom
WHERE @class_room = classroom_id

-- Lấy ra tên lớp
SELECT @class_name = class_name
FROM class
WHERE @class_id = class_id

IF @capacity >= @total_students
	BEGIN
		PRINT CONCAT(N'Lớp ',@class_name, N' phù hợp để học tại phòng số ', @class_room)
	END
ELSE
	BEGIN
		PRINT CONCAT(N'Lớp ', @class_name, N' không phù hợp để học tại phòng số ', @class_room)
	END
END;
GO
sp_helptext SP_Fit_Classroom;
GO

/* Test Procedure 
execute SP_Fit_Classroom 1,1;
GO

execute SP_Fit_Classroom 1,2;
GO
*/


/* Nhập vào mã giáo viên. Cho biết giáo viên đó đang dạy môn nào tại lớp nào ở phòng nào 
   Liên kết 4 bảng: teacher, subject, class, classroom
*/
CREATE PROCEDURE SP_subjects_teacher 
@teacher_id int
AS
BEGIN
SELECT CONCAT(t.fname, ' ', t.lname) AS Full_name, s.title, c.class_name, cr.classroom_id, cr.room_type
FROM subjects s JOIN class c ON s.subject_id = c.subject_id
		LEFT JOIN teacher t ON t.teacher_id = c.teacher_id
                LEFT JOIN classroom cr ON cr.classroom_id = c.classroom_id
WHERE @teacher_id = t.teacher_id
END;
GO
sp_helptext SP_subjects_teacher;

/* TEST PROCEDURE SP_subjects_teacher 
execute SP_subjects_teacher 5;
GO

execute SP_subjects_teacher 1;
GO */


/* Nhập vào sinh viên. Cho biết danh sách thân nhân của sinh viên đó bao gồm tên, mối quan hệ 
   Liên kết 3 bảng: student, guardian, student_guardian
*/
CREATE PROCEDURE SP_List_Guardian 
@student_id INT
AS
BEGIN
    SELECT s.student_id, 
           CONCAT(s.fname, ' ', s.lname) AS Fullname_student,
           CONCAT(g.fname, ' ', g.lname) AS Fullname_guardian,
           sg.relationship
    FROM guardian g
    JOIN student_guardian sg ON g.guardian_id = sg.guardian_id
    LEFT JOIN student s ON sg.student_id = s.student_id
    WHERE @student_id = s.student_id
END;
GO
sp_helptext  SP_List_Guardian ;
GO

/* TEST PROCEDURE 
execute SP_List_Guardian  1;
GO
*/



/* Nhập vào mã lớp. Xuất ra danh sách học sinh của lớp đó*/
CREATE PROCEDURE SP_Students_inClassroom
@class_id int
AS
BEGIN
SELECT s.student_id, CONCAT(s.fname, ' ', s.lname) as full_name, ct.class_id, c.class_name
FROM class_student ct join student s on ct.student_id = s.student_id
                      join class c on ct.class_id = c.class_id
WHERE @class_id = ct.class_id
END;

sp_helptext SP_Students_inClassroom;
GO
execute SP_Students_inClassroom  2;


	
