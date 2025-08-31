-- =========================
-- Seed Data for Airbnb Clone
-- =========================

-- ⚠️ If you’re in PostgreSQL and want UUIDs auto-generated:
-- CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ========== USERS ==========
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  (gen_random_uuid(), 'Kwame', 'Mensah', 'kwame@example.com', 'hashed_pw1', '233201112233', 'guest', NOW()),
  (gen_random_uuid(), 'Ama', 'Owusu', 'ama@example.com', 'hashed_pw2', '233209998877', 'host', NOW()),
  (gen_random_uuid(), 'Kojo', 'Appiah', 'kojo@example.com', 'hashed_pw3', '233244556677', 'guest', NOW()),
  (gen_random_uuid(), 'Akosua', 'Badu', 'akosua@example.com', 'hashed_pw4', '233277334455', 'host', NOW());

-- ========== PROPERTIES ==========
INSERT INTO Properties (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
  (gen_random_uuid(), 
   (SELECT user_id FROM Users WHERE email='ama@example.com'),
   'Cozy Apartment in Accra', '2-bedroom apartment in the city center, WiFi included', 'Accra, Ghana', 70.00, NOW(), NOW()),

  (gen_random_uuid(), 
   (SELECT user_id FROM Users WHERE email='akosua@example.com'),
   'Beachfront Villa', 'Luxury villa with ocean view and swimming pool', 'Cape Coast, Ghana', 250.00, NOW(), NOW());

-- ========== BOOKINGS ==========
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  (gen_random_uuid(),
   (SELECT property_id FROM Properties WHERE name='Cozy Apartment in Accra'),
   (SELECT user_id FROM Users WHERE email='kwame@example.com'),
   '2025-09-05', '2025-09-10', 350.00, 'confirmed', NOW()),

  (gen_random_uuid(),
   (SELECT property_id FROM Properties WHERE name='Beachfront Villa'),
   (SELECT user_id FROM Users WHERE email='kojo@example.com'),
   '2025-09-15', '2025-09-18', 750.00, 'pending', NOW());

-- ========== PAYMENTS ==========
INSERT INTO Payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  (gen_random_uuid(),
   (SELECT booking_id FROM Bookings WHERE total_price=350.00),
   350.00, NOW(), 'credit_card'),

  (gen_random_uuid(),
   (SELECT booking_id FROM Bookings WHERE total_price=750.00),
   200.00, NOW(), 'paypal'); -- Partial upfront payment

-- ========== REVIEWS ==========
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  (gen_random_uuid(),
   (SELECT property_id FROM Properties WHERE name='Cozy Apartment in Accra'),
   (SELECT user_id FROM Users WHERE email='kwame@example.com'),
   5, 'Amazing stay! The apartment was very clean and host was welcoming.', NOW()),

  (gen_random_uuid(),
   (SELECT property_id FROM Properties WHERE name='Beachfront Villa'),
   (SELECT user_id FROM Users WHERE email='kojo@example.com'),
   4, 'Great location, but a bit expensive.', NOW());

-- ========== MESSAGES ==========
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  (gen_random_uuid(),
   (SELECT user_id FROM Users WHERE email='kwame@example.com'),
   (SELECT user_id FROM Users WHERE email='ama@example.com'),
   'Hi Ama, is the apartment available for early check-in?', NOW()),

  (gen_random_uuid(),
   (SELECT user_id FROM Users WHERE email='ama@example.com'),
   (SELECT user_id FROM Users WHERE email='kwame@example.com'),
   'Hi Kwame, yes early check-in is possible. See you soon!', NOW());
