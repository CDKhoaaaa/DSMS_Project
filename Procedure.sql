USE SchoolManagementSystem;
GO


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


	
