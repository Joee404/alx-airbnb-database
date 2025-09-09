-- Find all properties where the average rating is greater than 4.0
SELECT p.id, p.name
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);
