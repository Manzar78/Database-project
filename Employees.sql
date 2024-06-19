-- Create the Employees table to store employee information
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- Insert sample data into Employees table
INSERT INTO Employees VALUES
(1, 'Anwar', 'Manager', 60000.00),
(2, 'Sarmad', 'Accountant', 50000.00);
