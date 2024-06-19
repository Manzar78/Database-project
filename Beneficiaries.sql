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

Select * from Beneficiaries;

-- Update the phone number of a specific beneficiary
UPDATE Beneficiaries
SET phone = '03123456789'
WHERE beneficiary_id = 1;

-- Delete a beneficiary with a specific ID
DELETE FROM Beneficiaries
WHERE beneficiary_id = 2;

