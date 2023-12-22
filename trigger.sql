/* TRIGGER */
USE SchoolManagementSystem;
GO

/* -----------------------------------------TRIGGER------------------------------------------- */

/* Không thêm học sinh vào lớp có phòng học đã đầy.
   Bảng: class, classroom, class_student*/
CREATE TRIGGER TG_status_classroom ON class_student
AFTER INSERT, UPDATE
AS
BEGIN

 DECLARE @class_id int, @capacity int, @nos int

 -- Lấy class_id từ bảng inserted
 SELECT @class_id = class_id
 FROM inserted

 -- Lấy tổng số học sinh trong cùng 1 lớp hiện tại
 SELECT @nos = count(student_id)
 FROM class_student
 WHERE @class_id = class_id

 -- Lấy số ghế trong phòng học.
 SELECT @capacity =  clr.capacity 
 FROM classroom clr join class cl on clr.classroom_id = cl.classroom_id
 WHERE @class_id = cl.class_id
 -- Nếu số lượng học sinh trong cùng một lớp học bằng số ghế trong phòng học thì không cho insert nữa
IF (@nos + (SELECT COUNT(*) FROM inserted)) > @capacity
	BEGIN
        RAISERROR('This class was full', 16, 1)
		rollback tran
		return
    END
END;
GO



/* Cập nhật thông tin update_at khi có bất cứ thông tin nào được cập nhất trong bảng student*/
CREATE TRIGGER TG_update_at_student ON dbo.student
AFTER UPDATE
AS
BEGIN
	UPDATE student
	SET update_at = getdate()
	FROM student st join inserted i on i.student_id = st.student_id
END;
GO


CREATE TRIGGER TG_update_at_student ON teacher
AFTER UPDATE
AS
BEGIN
	UPDATE teacher
	SET update_at = getdate()
	FROM teacher st join inserted i on i.student_id = st.student_id
END

