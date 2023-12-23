USE SchoolManagementSystem;
GO
/* -----------------------------------------TRIGGER------------------------------------------- */

/* Không thêm học sinh vào lớp có phòng học đã đầy. Kiểm tra phòng học bằng cách so tổng số học sinh trong cùng 1 lớp với số lượng ghế trong phòng học (capacity)
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

/*Không cho phép thêm giáo viên vào một lớp nếu giao viên đó đang inactive*/
CREATE TRIGGER TG_isactive ON class
FOR INSERT, UPDATE
AS
BEGIN
DECLARE @teacher_id int, @class_id int, @is_active bit

-- Lấy được class_id và teacher_id từ inserted
SELECT @class_id = class_id FROM inserted
SELECT @teacher_id = t.teacher_id, @is_active = t.is_active FROM class c join teacher t on c.teacher_id = t.teacher_id WHERE @class_id = c.class_id

IF @is_active = 0
	BEGIN
		RAISERROR('This teacher is inactive', 16, 1)
		rollback tran
		return
	END
END;


/* Cập nhật thông tin update_at khi có bất cứ thông tin nào được cập nhật trong bảng student*/
CREATE TRIGGER TG_update_at_student ON student
AFTER UPDATE
AS
BEGIN
-- Lấy mã sinh viên từ inserted 
DECLARE @student_id int 
SELECT @student_id = student_id FROM inserted
	-- Cập nhật update_at tại thời điểm bất kỳ thuộc tính nào được cập nhật trừ update_at
	if UPDATE(update_at)
		BEGIN
			RAISERROR('This property is not allowed to be updated', 16, 1)
			rollback tran
			return
		END
	ELSE
		BEGIN
			UPDATE student
			SET update_at = getdate()
			WHERE @student_id = student_id
		END
END;
GO

/* Cập nhật thông tin update_at khi có bất cứ thông tin nào được cập nhật trong bảng teacher*/
CREATE TRIGGER TG_update_at_teacher ON teacher
AFTER UPDATE
AS
BEGIN
DECLARE @teacher_id int 
SELECT @teacher_id = teacher_id FROM inserted
IF UPDATE(update_at)
	BEGIN
		RAISERROR('This property is not allowed to be updated', 16, 1)
		rollback tran
		return
	END
ELSE
	BEGIN
		UPDATE teacher
		SET update_at = getdate()
		WHERE @teacher_id = teacher_id
	END
END;
GO

/* Cập nhật thông tin update_at khi có bất cứ thông tin nào được cập nhật trong bảng guardian*/
CREATE TRIGGER TG_update_at_guardian ON guardian
AFTER UPDATE
AS
BEGIN
DECLARE @guardian_id int 
SELECT @guardian_id = guardian_id FROM inserted
IF UPDATE(update_at)
	BEGIN
		RAISERROR('This property is not allowed to be updated', 16, 1)
		rollback tran
		return
	END
ELSE
	UPDATE guardian
	SET update_at = getdate()
	WHERE @guardian_id = guardian_id
END;
GO
