-- Projects table to store project information
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10, 2)
);

-- Data into Projects table
INSERT INTO Projects VALUES
(1, 'Clean Water Initiative', '2023-08-01', '2024-12-31', 50000.00),
(2, 'Education for All', '2024-02-01', '2024-11-30', 100000.00),
(3, 'Rashan' , '2024-07-18','2024-12-01',500000.00),
(4, 'IT sector', '2024-06-17','2024-12-12', 250000.00);

select * from Projects;

-- Get the total budget for all projects
SELECT SUM(budget) AS TotalBudget
FROM Projects;

-- Get the total amount spent on project with project_id 1
SELECT SUM(amount) AS TotalSpent
FROM Expenses
WHERE project_id = 2;

-- Find projects with expenses greater than their budget
SELECT p.project_id, p.name, p.budget, SUM(e.amount) AS TotalExpenses
FROM Projects p
JOIN Expenses e ON p.project_id = e.project_id
GROUP BY p.project_id, p.name, p.budget
HAVING TotalExpenses > p.budget;
