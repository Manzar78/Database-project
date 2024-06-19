create database DbProject;
use DbProject;

-- The Donors table to store donor information
CREATE TABLE Donors (
    donor_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- Data into Donors table
INSERT INTO Donors VALUES
(1, 'Manzar', 'Parhiyar452@gmail.com', '03032288743', 'jamshoro'),
(2, 'Sarmad', 'MSarmad', '03036787872', 'Matli');

-- Donations table to store donation information
CREATE TABLE Donations (
    donation_id INT PRIMARY KEY,
    donor_id INT,
    amount DECIMAL(10, 2),
    date DATE,
    FOREIGN KEY (donor_id) REFERENCES Donors(donor_id)
);

-- Data into Donations table
INSERT INTO Donations VALUES
(01, 01, 1000.00, '2024-05-01'),
(02, 02, 2000.00, '2024-05-04');

-- This query will list all donations along with the donor's information.
-- It joins the Donations table with the Donors table based on donor_id.
SELECT d.donation_id, d.amount, d.date, do.name, do.email
FROM Donations d
JOIN Donors do ON d.donor_id = do.donor_id;

-- This query calculates the total amount of all donations.
-- It uses the SUM function to add up the amount of each donation.
SELECT SUM(amount) AS TotalDonations
FROM Donations;

-- Find the donor who made the highest total donations
SELECT do.name, SUM(d.amount) AS TotalDonated
FROM Donors do
JOIN Donations d ON do.donor_id = d.donor_id
GROUP BY do.name
ORDER BY TotalDonated DESC
LIMIT 1;



-- Create the Beneficiaries(people who take advantage from our trust) table to store beneficiary information
CREATE TABLE Beneficiaries (
    beneficiary_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- Data into Beneficiaries table
INSERT INTO Beneficiaries VALUES
(1, 'Awais', 'Awais@example.com', '03023867373', 'Hyderabad'),
(2, 'Waqas', 'Waqas@example.com', '03473473455', 'TandoAllahyar');


-- Create the CharityEvents table to store charity event information
CREATE TABLE CharityEvents (
    event_id INT PRIMARY KEY,
    name VARCHAR(100),
    date DATE,
    location VARCHAR(255)
);

-- Insert sample data into CharityEvents table
INSERT INTO CharityEvents VALUES
(1, 'Dinner for needy peoples', '2024-03-01', 'National stadium'),
(2, 'Give grocery to poor people', '2024-04-01', 'Our Head Office');



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
(2, 'Education for All', '2024-02-01', '2024-11-30', 100000.00);

-- Get the total budget for all projects
SELECT SUM(budget) AS TotalBudget
FROM Projects;

-- Get the total amount spent on project with project_id 1
SELECT SUM(amount) AS TotalSpent
FROM Expenses
WHERE project_id = 2;



-- Create the Volunteers table to store volunteer information
CREATE TABLE Volunteers (
    volunteer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- Insert sample data into Volunteers table
INSERT INTO Volunteers VALUES
(1, 'Ahsan', 'Ahsan@example.com', '03032887878', 'Kashmir'),
(2, 'Naveed', 'Naveed@example.com', '03163788787', 'Islamabad');

-- Create the VolunteerAssignments table to store volunteer assignment information
CREATE TABLE VolunteerAssignments (
    assignment_id INT PRIMARY KEY,
    volunteer_id INT,
    project_id INT,
    role VARCHAR(100),
    FOREIGN KEY (volunteer_id) REFERENCES Volunteers(volunteer_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

-- Insert sample data into VolunteerAssignments table
INSERT INTO VolunteerAssignments VALUES
(1, 1, 1, 'Coordinator'),
(2, 2, 2, 'Assistant');


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
(1, 1, 1000.00, '2024-01-15', 'Water filtration system'),
(2, 2, 1500.00, '2024-02-15', 'School supplies');

-- List all projects with their total expenses
SELECT p.project_id, p.name, SUM(e.amount) AS TotalExpenses
FROM Projects p
LEFT JOIN Expenses e ON p.project_id = e.project_id
GROUP BY p.project_id, p.name;

-- Create the Sponsors table to store sponsor information
CREATE TABLE Sponsors (
    sponsor_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- Insert sample data into Sponsors table
INSERT INTO Sponsors VALUES
(1, 'Saylani Welfare', 'contact@Saylani.com', '0302838828', 'Bahadurabad Karachi'),
(2, 'JDC ', 'info@JDF.com', '021872387', 'Karachi');

-- Retrieve all sponsors and the total amount they have sponsored
SELECT s.*, COALESCE(SUM(d.amount), 0) AS TotalSponsored
FROM Sponsors s
LEFT JOIN Donations d ON s.sponsor_id = d.donor_id
GROUP BY s.sponsor_id, s.name, s.email, s.phone, s.address;

