CREATE TABLE Students (
    StudentID INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    Major TEXT
);

CREATE TABLE Courses (
    CourseID INTEGER PRIMARY KEY AUTOINCREMENT,
    CourseCode TEXT NOT NULL,
    CourseName TEXT NOT NULL,
    Instructor TEXT NOT NULL,
    Credits INTEGER NOT NULL
);

CREATE TABLE Enrollments (
    EnrollmentID INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentID INTEGER,
    CourseID INTEGER,
    Grade TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Students (FirstName, LastName, Major)
VALUES 
    ('Aaron', 'Balayo', 'Computer Science'),
    ('', '', '');  -- Blank student entry

INSERT INTO Courses (CourseCode, CourseName, Instructor, Credits)
VALUES 
    ('COMP1238', 'Data Management', 'Mark Koudritsky', 3),
    ('COMP1151', 'IT Essentials', 'Ali Shad, Syrus Kamali', 3);

INSERT INTO Enrollments (StudentID, CourseID, Grade)
VALUES 
    (1, 1, 'A'),
    (1, 2, 'B'),
    (2, 2, 'A');

SELECT 
    s.FirstName || ' ' || s.LastName AS StudentName,
    c.CourseCode,
    c.CourseName,
    e.Grade
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

SELECT 
    CourseCode, 
    CourseName, 
    Instructor, 
    Credits
FROM Courses
WHERE CourseCode IN ('COMP1238', 'COMP1151');

SELECT 
    c.CourseCode, 
    c.CourseName, 
    COUNT(e.EnrollmentID) AS EnrollmentCount
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseCode, c.CourseName;

SELECT 
    c.CourseCode,
    c.CourseName,
    AVG(CASE 
            WHEN e.Grade = 'A' THEN 4.0
            WHEN e.Grade = 'B' THEN 3.0
            WHEN e.Grade = 'C' THEN 2.0
            WHEN e.Grade = 'D' THEN 1.0
            ELSE 0
        END) AS AverageGrade
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseCode, c.CourseName;