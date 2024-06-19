-- Create the Expenses table to store expense information
CREATE TABLE Expenses (
    expense_id INT PRIMARY KEY,
    project_id INT,
    amount DECIMAL(10, 2),
    date DATE,
    description VARCHAR(255),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

-- Insert sample data into Expenses table
INSERT INTO Expenses VALUES
(1, 1, 200000.00, '2024-01-15', 'Water filtration system'),
(2, 2, 200000.00, '2024-02-15', 'School supplies'),
(3, 3, 200000.00, '2024-04-18', 'Maintainance'),
(4, 4, 1000000.00, '2024-01-19', 'IT sector');

-- List all projects with their total expenses
SELECT p.project_id, p.name, SUM(e.amount) AS TotalExpenses
FROM Projects p
LEFT JOIN Expenses e ON p.project_id = e.project_id
GROUP BY p.project_id, p.name;
