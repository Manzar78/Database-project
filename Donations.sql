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