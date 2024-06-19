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
