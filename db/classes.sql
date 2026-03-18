IF OBJECT_ID('dbo.Subjects', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Subjects (
        subject_id INT IDENTITY(1,1) PRIMARY KEY,
        subject_name NVARCHAR(100) NOT NULL,
        description NVARCHAR(255),
        duration INT
    );
END;

IF OBJECT_ID('dbo.Classes', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Classes (
        class_id INT IDENTITY(1,1) PRIMARY KEY,
        class_name NVARCHAR(100) NOT NULL,
        teacher_id INT NOT NULL,
        schedule NVARCHAR(100),
        room NVARCHAR(50),
        CONSTRAINT FK_Classes_Teachers FOREIGN KEY (teacher_id) REFERENCES dbo.Teachers(user_id)
    );
END;

IF OBJECT_ID('dbo.ClassSubjects', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.ClassSubjects (
        id INT IDENTITY(1,1) PRIMARY KEY,
        class_id INT NOT NULL,
        subject_id INT NOT NULL,
        CONSTRAINT FK_ClassSubjects_Class FOREIGN KEY (class_id) REFERENCES dbo.Classes(class_id),
        CONSTRAINT FK_ClassSubjects_Subject FOREIGN KEY (subject_id) REFERENCES dbo.Subjects(subject_id)
    );
END;

IF OBJECT_ID('dbo.Enrollments', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Enrollments (
        enroll_id INT IDENTITY(1,1) PRIMARY KEY,
        student_id INT NOT NULL,
        class_id INT NOT NULL,
        CONSTRAINT FK_Enrollments_Students FOREIGN KEY (student_id) REFERENCES dbo.Students(user_id),
        CONSTRAINT FK_Enrollments_Classes FOREIGN KEY (class_id) REFERENCES dbo.Classes(class_id)
    );
END;
