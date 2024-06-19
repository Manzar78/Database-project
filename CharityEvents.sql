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

select * from CharityEvents;
