--creating three tables 
--employees retalating it to departments and technologies
--technologies and departments

CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE technologies (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO departments (id, name)
VALUES
    (1, 'Engineering'),
    (2, 'Product Management'),
    (3, 'Marketing');

INSERT INTO technologies (id, name)
VALUES
    (1, 'Java'),
    (2, 'Python'),
    (3, 'React'),
    (4, 'UI/UX Design');

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    department_id INT NOT NULL,
    technology_id INT NOT NULL,
    location VARCHAR(255) NOT NULL,
    salary INT NOT NULL,
    age INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (technology_id) REFERENCES technologies(id)
);

INSERT INTO employees (id, name, date_of_birth, department_id, technology_id, location, salary, age)
VALUES 
    (1, 'Andrew Nguyen', '1990-08-22', 1, 1, 'San Francisco', 100000, 32),
    (2, 'Karen Park', '1993-04-05', 2, 3, 'Seattle', 90000, 29),
    (3, 'Justin Lee', '1985-11-12', 3, 4, 'Los Angeles', 80000, 37),
    (4, 'Emily Kim', '1988-02-18', 1, 2, 'New York', 110000, 34),
    (5, 'David Wang', '1995-09-03', 2, 2, 'San Francisco', 95000, 26),
    (6, 'Ashley Kim', '1992-05-10', 1, 3, 'New York', 105000, 29),
    (7, 'Brian Lee', '1989-12-17', 2, 2, 'San Francisco', 95000, 32),
    (8, 'Jessica Chen', '1987-08-08', 1, 2, 'Los Angeles', 100000, 34),
    (9, 'Daniel Kim', '1994-03-01', 3, 4, 'Seattle', 80000, 27),
    (10, 'Tiffany Wong', '1990-11-22', 1, 1, 'New York', 110000, 31),
    (11, 'Kevin Zhang', '1988-04-12', 2, 2, 'San Francisco', 90000, 33),
    (12, 'Christina Park', '1991-02-05', 3, 4, 'Los Angeles', 75000, 30),
    (13, 'Jonathan Lee', '1995-07-29', 1, 2, 'Seattle', 85000, 26),
    (14, 'Alex Kim', '1993-11-14', 2, 4, 'New York', 100000, 28),
    (15, 'Julia Wang', '1990-06-03', 1, 1, 'San Francisco', 120000, 31);

select * from employees;
select * from technologies;
select * from departments;

create procedure fetch_employees 
as
select * from employees;