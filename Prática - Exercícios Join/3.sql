SELECT
u.id,
u.name,
c.name AS course,
s.name AS school,
e."endDate"
FROM educations e
JOIN users u
    ON u.id=30
JOIN courses c
    ON c.id=e."courseId"
JOIN schools s
    ON s.id=e."schoolId"
WHERE e.status='finished';