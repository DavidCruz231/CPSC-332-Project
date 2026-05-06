-- ============================================================
-- Museum Database - queries.sql
-- CPSC 332 | Team: Luis Aldana, Tristan Carreon, Nadia Ghanizada, David Cruz
-- ============================================================

USE MuseumDB;

-- Use Case 1: Find all employees in a department

SELECT
    e.Employee_ID,
    CONCAT(e.F_name, ' ', IFNULL(e.MI, ''), '. ', e.L_name) AS Employee_Name,
    e.Role,
    e.Hire_date,
    e.Salary,
    d.Name AS Department_Name
FROM Employees e
JOIN Department d ON e.Dept_ID = d.Dept_ID
ORDER BY d.Name, e.L_name;

SELECT
    e.Employee_ID,
    CONCAT(e.F_name, ' ', IFNULL(e.MI, ''), '. ', e.L_name) AS Employee_Name,
    e.Role,
    e.Salary,
    d.Name                                AS Department_Name,
    CONCAT(head.F_name, ' ', head.L_name) AS Department_Head
FROM Employees e
JOIN Department d   ON e.Dept_ID   = d.Dept_ID
JOIN Employees head ON d.Dept_head = head.Employee_ID
WHERE d.Name = 'Curatorial'
ORDER BY e.L_name;

SELECT
    d.Name                                 AS Department_Name,
    COUNT(e.Employee_ID)                   AS Employee_Count,
    CONCAT(head.F_name, ' ', head.L_name) AS Department_Head
FROM Department d
LEFT JOIN Employees e    ON e.Dept_ID   = d.Dept_ID
LEFT JOIN Employees head ON d.Dept_head = head.Employee_ID
GROUP BY d.Dept_ID, d.Name, head.F_name, head.L_name
ORDER BY Employee_Count DESC;

-- Use Case 2: Find all artworks on display per gallery

SELECT
    g.Name                                AS Gallery_Name,
    g.Floor,
    g.Wing,
    aw.Piece_ID,
    aw.Title,
    aw.Medium,
    aw.Year,
    CONCAT(ar.F_name, ' ', ar.L_name)    AS Artist_Name,
    ar.Nationality,
    CONCAT(e.F_name, ' ', e.L_name)      AS Gallery_Manager
FROM Gallery g
JOIN Artwork    aw ON aw.Gallery_ID  = g.Gallery_ID
JOIN Artist     ar ON aw.Artist_ID   = ar.Artist_ID
LEFT JOIN Employees e ON g.Employee_ID = e.Employee_ID
ORDER BY g.Name, aw.Title;

SELECT
    ex.Name                              AS Exhibition_Name,
    ex.S_date,
    ex.E_date,
    aw.Title                             AS Artwork_Title,
    aw.Medium,
    CONCAT(ar.F_name, ' ', ar.L_name)   AS Artist,
    g.Name                               AS Gallery_Name,
    g.Floor,
    g.Wing
FROM Exhibition ex
JOIN Features  f  ON ex.EX_ID     = f.EX_ID
JOIN Artwork   aw ON f.Piece_ID   = aw.Piece_ID
JOIN Artist    ar ON aw.Artist_ID  = ar.Artist_ID
JOIN Gallery   g  ON ex.Gallery_ID = g.Gallery_ID
WHERE ex.Name = 'Impressionism Through the Ages'
ORDER BY aw.Title;

SELECT
    g.Email,
    CONCAT(g.F_name, ' ', g.L_name)  AS Member_Name,
    m.Tier,
    mt.Price,
    m.Start_date,
    m.End_date
FROM Guests g
JOIN Membership     m  ON g.Email = m.Email
JOIN MembershipTier mt ON m.Tier  = mt.Tier
WHERE m.End_date >= CURDATE()
ORDER BY m.Tier, g.L_name;
