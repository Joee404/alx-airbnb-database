EXPLAIN SELECT
    b.id AS booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount,
    pay.status
FROM Booking b
JOIN User 
ON Booking.user_id = User.id
JOIN Property
ON Booking.property_id = Property.id
JOIN Payment
ON Booking.payment_id = Payment.id
