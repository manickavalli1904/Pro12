
USE CollegeDB;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    DepartmentID INT,
    FacultyID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID),
    FOREIGN KEY (FacultyID)
        REFERENCES Faculty(FacultyID)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');

INSERT INTO Student VALUES
(101, 'Arun', 1),
(102, 'Priya', 2),
(103, 'Kumar', 1),
(104, 'Divya', 3);

INSERT INTO Faculty VALUES
(201, 'Dr. Ravi', 1),
(202, 'Dr. Meena', 2),
(203, 'Dr. Kumar', 3);

INSERT INTO Course VALUES
(301, 'Database Systems', 1, 201),
(302, 'Data Structures', 1, 201),
(303, 'Mathematics', 2, 202),
(304, 'Physics', 3, 203);

INSERT INTO Enrollment VALUES
(1, 101, 301),
(2, 101, 302),
(3, 102, 303),
(4, 103, 301),
(5, 104, 304);

SELECT
    s.StudentName,
    c.CourseName,
    f.FacultyName,
    d.DepartmentName
FROM Enrollment e
JOIN Student s ON e.StudentID = s.StudentID
JOIN Course c ON e.CourseID = c.CourseID
JOIN Faculty f ON c.FacultyID = f.FacultyID
JOIN Department d ON c.DepartmentID = d.DepartmentID;

