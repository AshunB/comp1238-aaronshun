-- Insert sample data into courses
INSERT INTO courses (course_name, semester, lab_time) VALUES
('IT Essentials', '2024', 'Friday 12:00 PM'),
('Web Development', '2024', 'Thursday 2:00 PM'),
('Database Management', '2024', 'Friday 3:00 PM');

-- Exerciseq 1
SELECT course_name || ' - ' || semester AS course_info
FROM courses;

-- Exerciseq 2
SELECT course_id, course_name, lab_time
FROM courses
WHERE lab_time LIKE '%Friday%';

-- Create the assignments table
CREATE TABLE assignments (
    assignment_id INTEGER PRIMARY KEY,
    assignment_title TEXT NOT NULL,
    due_date DATE,
    status TEXT
);

-- Insert sample data into assignments
INSERT INTO assignments (assignment_title, due_date, status) VALUES
('Assignment 1', '2024-09-15', 'Not Started'),
('Assignment 2', '2024-09-22', 'In Progress'),
('Assignment 3', NULL, 'Completed');

-- Exerciseq 3
SELECT assignment_title, due_date
FROM assignments
WHERE due_date > DATE('now');

-- Exerciseq 4
SELECT status, COUNT(*) AS assignment_count
FROM assignments
GROUP BY status;

-- Exerciseq 5: Find the course with the longest course_name
SELECT course_name, LENGTH(course_name) AS name_length
FROM courses
ORDER BY name_length DESC
LIMIT 1;

-- Optional Exerciseq 5
-- Step 1: Find maximum length of course_name
SELECT MAX(LENGTH(course_name)) AS max_length
FROM courses;

-- Step 2: Find course(s) w/ maximum length
SELECT course_name
FROM courses
WHERE LENGTH(course_name) = (SELECT MAX(LENGTH(course_name)) FROM courses);

-- Exerciseq 6
SELECT UPPER(course_name) AS uppercase_name
FROM courses;

-- Exerciseq 7
SELECT assignment_title, due_date
FROM assignments
WHERE due_date LIKE '%-09-%';

-- Exerciseq 8
SELECT assignment_title
FROM assignments
WHERE due_date IS NULL;