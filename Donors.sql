create database PracticeProject;
use PracticeProject;

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

Select * from Donors;
