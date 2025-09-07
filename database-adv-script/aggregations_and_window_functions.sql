SELECT Booking.id, COUNT(User.id) as user_count
FROM User
JOIN Booking 
ON User.id = Booking.user_id
GROUP BY Booking.id
 
SELECT 
    Property.id,
    COUNT(Booking.id) AS total_booking,
    RANK() OVER (ORDER BY COUNT(Booking.id) DESC) AS booking_rank
FROM Property
LEFT JOIN Booking
    ON Property.id = Booking.property_id
GROUP BY Property.id;
