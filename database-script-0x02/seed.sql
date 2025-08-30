USE airbnb;

-- ===============================
-- Insert Users
-- ===============================
INSERT INTO User(first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Youssef', 'Ahmed', 'youssef@example.com', 'hashed_password_1', '0123456789', 'guest'),
('Alice', 'Wonderland', 'alice@example.com', 'hashed_password_2', '9876543210', 'host'),
('Bob', 'Builder', 'bob@example.com', 'hashed_password_3', '5555555555', 'admin');

-- ===============================
-- Insert Properties
-- ===============================
INSERT INTO Property(name, description, location, pricepernight, host_id)
VALUES
('Cozy Apartment', 'A cozy 2-bedroom apartment in Cairo', 'Cairo', 50.00, (SELECT id FROM User WHERE email='alice@example.com')),
('Beach House', 'Beautiful beach house in Alexandria', 'Alexandria', 120.00, (SELECT id FROM User WHERE email='alice@example.com'));

-- ===============================
-- Insert Bookings
-- ===============================
INSERT INTO Booking(start_date, end_date, total_price, status, user_id, property_id)
VALUES
('2025-09-01', '2025-09-05', 200.00, 'confirmed', (SELECT id FROM User WHERE email='youssef@example.com'), (SELECT id FROM Property WHERE name='Cozy Apartment')),
('2025-09-10', '2025-09-12', 240.00, 'pending', (SELECT id FROM User WHERE email='youssef@example.com'), (SELECT id FROM Property WHERE name='Beach House'));

-- ===============================
-- Insert Payments
-- ===============================
INSERT INTO Payment(amount, payment_method, booking_id)
VALUES
(200.00, 'credit_card', (SELECT id FROM Booking WHERE total_price=200.00 AND user_id=(SELECT id FROM User WHERE email='youssef@example.com')));

-- ===============================
-- Insert Reviews
-- ===============================
INSERT INTO Review(rating, comment, property_id, user_id)
VALUES
(5, 'Amazing stay, very clean and comfortable!', (SELECT id FROM Property WHERE name='Cozy Apartment'), (SELECT id FROM User WHERE email='youssef@example.com'));

-- ===============================
-- Insert Messages
-- ===============================
INSERT INTO Message(message_body, sender_id, recipient_id)
VALUES
('Hello! Is the apartment available for next weekend?', (SELECT id FROM User WHERE email='youssef@example.com'), (SELECT id FROM User WHERE email='alice@example.com')),
('Yes, it is available! Looking forward to hosting you.', (SELECT id FROM User WHERE email='alice@example.com'), (SELECT id FROM User WHERE email='youssef@example.com'));
