EXPLAIN SELECT
    b.id AS booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE pay.status = 'completed'
  AND b.start_date >= '2024-01-01';
