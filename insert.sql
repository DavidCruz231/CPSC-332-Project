-- ============================================================
-- Museum Database - insert.sql
-- CPSC 332 | Team: Luis Aldana, Tristan Carreon, Nadia Ghanizada, David Cruz
-- ============================================================

USE MuseumDB;

-- Department
INSERT INTO Department (Dept_ID, Name, Dept_head) VALUES
(1, 'Curatorial',       NULL),
(2, 'Conservation',     NULL),
(3, 'Visitor Services', NULL),
(4, 'Administration',   NULL);

-- Employees
INSERT INTO Employees (Employee_ID, SSN, F_name, MI, L_name, Hire_date, Role, Salary, Dept_ID) VALUES
(1, '111-22-3333', 'Alice',   'M', 'Chen',     '2015-03-10', 'Curator',              75000.00, 1),
(2, '222-33-4444', 'Robert',  'J', 'Martinez', '2017-06-01', 'Conservator',          68000.00, 2),
(3, '333-44-5555', 'Sarah',   'L', 'Johnson',  '2019-09-15', 'Visitor Services Rep', 45000.00, 3),
(4, '444-55-6666', 'James',   'A', 'Lee',      '2012-01-20', 'Director',             95000.00, 4),
(5, '555-66-7777', 'Maria',   'E', 'Garcia',   '2020-02-14', 'Gallery Manager',      58000.00, 1),
(6, '666-77-8888', 'Thomas',  'R', 'Brown',    '2018-07-30', 'Gallery Manager',      57000.00, 2),
(7, '777-88-9999', 'Linda',   'K', 'Wilson',   '2021-04-05', 'Conservator',          62000.00, 2),
(8, '888-99-0000', 'Carlos',  'F', 'Reyes',    '2016-11-11', 'Curator',              72000.00, 1);

UPDATE Department SET Dept_head = 1 WHERE Dept_ID = 1;
UPDATE Department SET Dept_head = 2 WHERE Dept_ID = 2;
UPDATE Department SET Dept_head = 3 WHERE Dept_ID = 3;
UPDATE Department SET Dept_head = 4 WHERE Dept_ID = 4;

-- Gallery
INSERT INTO Gallery (Gallery_ID, Name, Floor, Wing, Capacity, Location, Employee_ID) VALUES
(1, 'Impressionism Hall',    1, 'East',  30, 'Building A', 5),
(2, 'Modern Art Wing',       2, 'West',  25, 'Building A', 6),
(3, 'Ancient Civilizations', 1, 'North', 40, 'Building B', 5),
(4, 'Photography Gallery',   3, 'South', 20, 'Building B', 6);

-- Artist
INSERT INTO Artist (Artist_ID, F_name, MI, L_name, Nationality, Birth_year, Death_year, Bio) VALUES
(1, 'Claude',  NULL, 'Monet',    'French',   1840, 1926, 'Pioneer of the Impressionist movement known for his series paintings.'),
(2, 'Vincent', NULL, 'van Gogh', 'Dutch',    1853, 1890, 'Post-Impressionist painter known for vivid colors and emotional honesty.'),
(3, 'Frida',   NULL, 'Kahlo',    'Mexican',  1907, 1954, 'Known for self-portraits and works inspired by Mexican folk art.'),
(4, 'Pablo',   NULL, 'Picasso',  'Spanish',  1881, 1973, 'Co-founder of Cubism and one of the most influential artists of the 20th century.'),
(5, 'Georgia', NULL, 'OKeeffe',  'American', 1887, 1986, 'Known for enlarged flowers and New Mexico landscapes.');

-- Artwork
INSERT INTO Artwork (Piece_ID, Title, Medium, Year, Artist_ID, Gallery_ID) VALUES
(1, 'Water Lilies',                      'Oil on canvas', 1906, 1, 1),
(2, 'The Starry Night',                  'Oil on canvas', 1889, 2, 1),
(3, 'Self-Portrait with Thorn Necklace', 'Oil on canvas', 1940, 3, 2),
(4, 'Guernica',                          'Oil on canvas', 1937, 4, 2),
(5, 'Black Iris',                        'Oil on canvas', 1926, 5, 3),
(6, 'Haystacks',                         'Oil on canvas', 1890, 1, 3),
(7, 'Irises',                            'Oil on canvas', 1889, 2, 4),
(8, 'The Two Fridas',                    'Oil on canvas', 1939, 3, 4);

-- Exhibition
INSERT INTO Exhibition (EX_ID, Name, S_date, E_date, Gallery_ID) VALUES
(1, 'Impressionism Through the Ages', '2024-01-15', '2024-06-30', 1),
(2, 'Modern Visions',                 '2024-03-01', '2024-08-31', 2),
(3, 'Nature and Form',                '2024-05-01', '2024-10-15', 3);

-- Features
INSERT INTO Features (EX_ID, Piece_ID) VALUES
(1, 1), (1, 2), (1, 6),
(2, 3), (2, 4), (2, 8),
(3, 5), (3, 7);

-- Guests
INSERT INTO Guests (Email, F_name, MI, L_name, Zip) VALUES
('alice.smith@email.com', 'Alice', 'R', 'Smith',  '90210'),
('bob.jones@email.com',   'Bob',   NULL,'Jones',  '10001'),
('carol.white@email.com', 'Carol', 'A', 'White',  '60601'),
('david.kim@email.com',   'David', 'H', 'Kim',    '77001'),
('eva.nguyen@email.com',  'Eva',   'T', 'Nguyen', '94102');

-- MembershipTier
INSERT INTO MembershipTier (Tier, Price) VALUES
('Basic',    50.00),
('Standard', 100.00),
('Premium',  150.00);

-- Membership
INSERT INTO Membership (Member_ID, Email, Tier, Start_date, End_date) VALUES
(1, 'alice.smith@email.com', 'Premium',  '2024-01-01', '2024-12-31'),
(2, 'bob.jones@email.com',   'Basic',    '2024-02-01', '2025-01-31'),
(3, 'carol.white@email.com', 'Standard', '2024-03-15', '2025-03-14'),
(4, 'david.kim@email.com',   'Premium',  '2023-06-01', '2024-05-31'),
(5, 'eva.nguyen@email.com',  'Basic',    '2024-04-01', '2025-03-31');
