SELECT
u.id,
u.name,
r.name AS role,
c.name AS company,
e."startDate"
FROM experiences e
JOIN users u
    ON u.id=50
JOIN roles r
    ON r.id=e."roleId"
JOIN companies c
    ON c.id=e."companyId"
WHERE e."endDate" IS NULL;