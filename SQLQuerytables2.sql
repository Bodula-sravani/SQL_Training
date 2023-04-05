--creating three tables
--studnets 
--courses
--grades relating to courses and grades

CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    department VARCHAR(255) NOT NULL
);

CREATE TABLE courses (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    department VARCHAR(255) NOT NULL
);

CREATE TABLE grades (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade FLOAT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO students (id, name, date_of_birth, department)
VALUES 
    (1, 'John Smith', '2000-01-01', 'Computer Science'),
    (2, 'Jane Doe', '2001-02-02', 'Mathematics'),
    (3, 'Bob Johnson', '1999-03-03', 'Physics'),
    (4, 'Emily Wilson', '1998-04-04', 'Biology'),
    (5, 'Mike Lee', '2002-05-05', 'Psychology');

INSERT INTO courses (id, name, department)
VALUES
    (1, 'Introduction to Programming', 'Computer Science'),
    (2, 'Data Structures and Algorithms', 'Computer Science'),
    (3, 'Linear Algebra', 'Mathematics'),
    (4, 'Calculus', 'Mathematics'),
    (5, 'Classical Mechanics', 'Physics'),
    (6, 'Quantum Mechanics', 'Physics'),
    (7, 'Molecular Biology', 'Biology'),
    (8, 'Ecology', 'Biology'),
    (9, 'Introduction to Psychology', 'Psychology');

INSERT INTO grades (student_id, course_id, grade)
VALUES
    (1, 1, 3.5),
    (1, 2, 4.0),
    (1, 3, 3.2),
    (1, 4, 3.8),
    (2, 3, 3.9),
    (2, 4, 4.2),
    (2, 9, 3.7),
    (3, 5, 3.6),
    (3, 6, 3.2),
    (3, 7, 4.0),
    (4, 7, 4.2),
    (4, 8, 3.8),
    (4, 9, 3.6),
    (5, 1, 3.9),
    (5, 2, 4.0),
    (5, 3, 4.2);

select * from students;
select * from courses;
select * from grades;