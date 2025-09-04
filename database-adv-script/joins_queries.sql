SELECT *
FROM Booking
INNER JOIN User
ON Booking.user_id = User.id;

SELECT *
FROM Property
LEFT JOIN Review
ON Property.id = Review.property_id
ORDER BY Property.id;

SELECT *
FROM User
FULL OUTER JOIN Booking
ON User.id = Booking.user_id;
