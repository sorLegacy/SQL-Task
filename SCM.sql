CREATE DATABASE StudentCourseManagement
USE StudentCourseManagement

CREATE TABLE Students (student_id INT  IDENTITY(1,1) PRIMARY KEY ,
					  first_name VARCHAR(30) ,
					  last_name VARCHAR(30)  ,
					  email VARCHAR(30) ,
					  date_of_birth DATE)

CREATE TABLE Courses (course_id INT  IDENTITY(1,1) PRIMARY KEY ,
					  course_name VARCHAR(30) ,
					  course_description TEXT)				
					  

CREATE TABLE Instructors (instructor_id INT  IDENTITY(1,1) PRIMARY KEY ,
					  first_name VARCHAR(30) ,
					  last_name VARCHAR(30)  ,
					  email VARCHAR(30) )

CREATE TABLE Enrollment (enrollment_id INT IDENTITY(1,1) PRIMARY KEY ,
						 student_id INT ,
						 course_id INT ,
						 enrollment_date DATE ,
						 FOREIGN KEY (student_id) REFERENCES Students(student_id) ,
						 FOREIGN KEY (course_id) REFERENCES Courses (course_id)
						 )

CREATE TABLE Ins_to_course(id INT IDENTITY(1,1) PRIMARY KEY ,
						 instructor_id INT ,
						 course_id INT ,
						 FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id) ,
						 FOREIGN KEY (course_id) REFERENCES Courses (course_id)
						 )

INSERT INTO Students (first_name, last_name, email, date_of_birth) VALUES 
('Ahmed', 'Hassan', 'ahmed_hassan@gmail.com', '2003-11-13'),
('Sarah', 'Ali', 'sarah_ali@gmail.com', '2004-02-15'),
('John', 'Doe', 'john_doe@gmail.com', '2002-07-22'),
('Jane', 'Smith', 'jane_smith@gmail.com', '2003-09-05'),
('Emily', 'Brown', 'emily_brown@gmail.com', '2004-12-18'),
('Michael', 'Johnson', 'michael_johnson@gmail.com', '2001-03-08'),
('Emma', 'Wilson', 'emma_wilson@gmail.com', '2003-04-10'),
('David', 'Miller', 'david_miller@gmail.com', '2002-06-25'),
('Sophia', 'Davis', 'sophia_davis@gmail.com', '2003-10-31'),
('James', 'Garcia', 'james_garcia@gmail.com', '2004-08-20');


INSERT INTO Courses (course_name, course_description) VALUES 
('Introduction to Programming', 'Learn the basics of programming using Python, including variables, control structures, and functions.'),
('Data Structures and Algorithms', 'Explore fundamental data structures (e.g., arrays, lists, trees) and algorithms for efficient data processing.'),
('Database Management Systems', 'Study the principles of database design, SQL, and the management of relational databases.'),
('Machine Learning', 'Introduction to machine learning concepts, including supervised and unsupervised learning, with hands-on projects.'),
('Web Development', 'Learn to build dynamic websites using HTML, CSS, JavaScript, and popular frameworks like React.'),
('Data Science Fundamentals', 'An overview of data science techniques, including data visualization, statistical analysis, and data wrangling.'),
('Cloud Computing', 'Understand the basics of cloud computing, including deployment models, cloud services, and security concerns.');


INSERT INTO Instructors (first_name, last_name, email) VALUES 
('Lionel', 'Messi', 'lmessi10@football.edu'),
('Steph', 'Curry', 'scurry30@basketball.edu'),
('Lamine', 'Yamal', 'lyamal19@football.edu');

INSERT INTO Enrollment (student_id, course_id, enrollment_date) VALUES 
(1, 1, '2024-08-01'),
(1, 3, '2024-08-02'),
(1, 4, '2024-08-03'),
(1, 5, '2024-08-04'),
(2, 2, '2024-08-04'),
(2, 4, '2024-08-06'),
(2, 6, '2024-08-07'),
(3, 1, '2024-08-08'),
(3, 2, '2024-08-08'),
(3, 5, '2024-08-10'),
(4, 3, '2024-08-11'),
(4, 5, '2024-08-12'),
(4, 6, '2024-08-13'),
(5, 2, '2024-08-14'),
(5, 3, '2024-08-14'),
(6, 1, '2024-08-16'),
(6, 4, '2024-08-17'),
(6, 6, '2024-08-18'),
(7, 2, '2024-08-19'),
(7, 3, '2024-08-20'),
(7, 5, '2024-08-21'),
(8, 1, '2024-08-21'),
(2, 1, '2024-08-01'),
(5, 1,'2024-08-01' );

INSERT INTO Ins_to_course (instructor_id, course_id) VALUES 
(1, 1),  -- messi teaches Introduction to Programming
(1, 2),  -- messi  teaches Data Structures and Algorithms
(1, 4),  -- messi  teaches Machine Learning
(2, 4),  -- steph  teaches Machine Learning
(2, 1),  -- steph teaches Introduction to Programming
(2, 5),  -- steph teaches Web Development
(3, 5),  -- lamine teaches Web Development
(3, 6)   -- lamine teaches Data Science Fundamentals

-- basic queries
SELECT * FROM Students ;

SELECT * FROM Courses ;

SELECT  e.* , (s.first_name+' '+s.last_name)as full_name ,c.course_name  from Enrollment as e 

 join Students as s 
 on e.student_id = s.student_id 
 join Courses as c 
 on e.course_id = c.course_id
 



 --advanced queries
SELECT c.course_name , (s.first_name+' '+s.last_name)as full_name   from Enrollment as e 
join Students as s 
on e.student_id = s.student_id 
join Courses as c 
on e.course_id = c.course_id
where c.course_id = 1;


SELECT c.course_name , count(e.course_id) as number_of_students from Enrollment as e
join Courses as c 
on c.course_id = e.course_id
group by course_name
having count(e.course_id) > 5;

update Students 
set email = 'ahmedhassanah027724@gmail.com'
where student_id = 1;

delete from Courses 
where course_id not in (
select distinct course_id 
from Enrollment 
);

SELECT AVG(DATEDIFF(year ,   date_of_birth ,  GETDATE())) as average_age from Students ;


SELECT top 1 c.course_name ,count(e.course_id) as number_of_students from Enrollment as e 
join Courses as c
on e.course_id = c.course_id
group by course_name
order by count(e.course_id) desc



SELECT  c.course_name ,count(e.course_id) as number_of_students from Enrollment as e 
join Courses as c
on e.course_id = c.course_id
group by course_name


SELECT s.* , c.course_name from Enrollment AS e 
join Students AS s 
ON e.student_id = s.student_id 
join Courses AS  c 
ON e.course_id = c.course_id


SELECT i.* , c.course_name FROM Ins_to_course AS itc
join Instructors as i 
on itc.instructor_id = i.instructor_id
join Courses as c 
on itc.course_id = c.course_id


SELECT (first_name+' '+last_name) as 'full name' FROM Students 
WHERE student_id NOT IN (SELECT DISTINCT student_id FROM  Enrollment)


SELECT  (s.first_name+' '+s.last_name) as 'full name' , count(e.student_id) AS 'course count' FROM Enrollment AS e
join Students as s 
on e.student_id = s.student_id 
group by s.first_name , s.last_name
having COUNT(e.student_id) >1
	

select c.course_name , i.first_name + ' ' + i.last_name as 'instructor name'  from Ins_to_course as itc 
join Instructors as i 
on itc.instructor_id = i.instructor_id
join Courses as c 
on itc.course_id = c.course_id
where itc.course_id not in (select course_id from Ins_to_course
group by course_id 
having count(course_id)>1) 


select top 3 (s.first_name +' '+s.last_name) as 'student name' , count(e.student_id) as 'number of courses' from Enrollment as e
join Students as s
on e.student_id = s.student_id 
group by s.first_name , s.last_name
order by count(e.student_id) desc


SELECT 
    (first_name +' '+last_name) as 'full name'
FROM 
 Students

UNION

SELECT 
    (first_name +' '+last_name) as 'full name'
FROM 
    Instructors;



CREATE PROCEDURE AddNewStudent
@FirstName NVARCHAR(100),
@LastName NVARCHAR(100),
@Email NVARCHAR(100),
@BirthDate DATE
AS
BEGIN
    INSERT INTO Students (first_name, last_name, email, date_of_birth)
    VALUES (@FirstName, @LastName, @Email, @BirthDate);
END;

EXEC AddNewStudent 'omar' ,'nouh' , 'omar_nouh@gmail.com' , '2004-3-1'

CREATE FUNCTION CalculateAge (@BirthDate DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @BirthDate, GETDATE()) 
           
             END;

SELECT 
    first_name,
    last_name,
    dbo.CalculateAge(date_of_birth) AS Age
FROM 
    Students;

	SELECT 
    COUNT(*) AS TotalNumberOfStudents
FROM 
    Students;

	SELECT 
    AVG(enrollment_count) AS AverageEnrollments,
    MIN(enrollment_count) AS MinimumEnrollments,
    MAX(enrollment_count) AS MaximumEnrollments
FROM (
    SELECT 
        course_id,
        COUNT(student_id) AS enrollment_count
    FROM 
        Enrollment
    GROUP BY 
        course_id
) AS EnrollmentStats;













