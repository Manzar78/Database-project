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


-- List volunteer assignments along with volunteer and project names
SELECT va.*, v.name AS VolunteerName, p.name AS ProjectName
FROM VolunteerAssignments va
JOIN Volunteers v ON va.volunteer_id = v.volunteer_id
JOIN Projects p ON va.project_id = p.project_id;
