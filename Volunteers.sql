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

Select * from Volunteers;
