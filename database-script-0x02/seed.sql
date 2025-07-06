-- Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('00000000-0000-0000-0000-000000000001', 'John', 'Hostman', 'john@example.com', 'hashed_pw_1', '0911223344', 'host'),
  ('00000000-0000-0000-0000-000000000002', 'Alice', 'Guestwoman', 'alice@example.com', 'hashed_pw_2', '0911778899', 'guest'),
  ('00000000-0000-0000-0000-000000000003', 'Admin', 'Smith', 'admin@example.com', 'hashed_pw_3', NULL, 'admin');

-- Properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 'Cozy Cottage', 'A peaceful cottage in the countryside.', 'Bahir Dar', 450.00),
  ('10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'City Apartment', 'Modern apartment in downtown.', 'Addis Ababa', 750.00);

-- Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', '2025-07-10', '2025-07-12', 900.00, 'confirmed'),
  ('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', '2025-07-20', '2025-07-22', 1500.00, 'pending');

-- Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  ('30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 900.00, 'credit_card'),
  ('30000000-0000-0000-0000-000000000002', '20000000-0000-0000-0000-000000000002', 1500.00, 'paypal');

-- Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  ('40000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 5, 'Amazing stay, peaceful and clean!'),
  ('40000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', 4, 'Great location, could use better lighting.');

-- Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  ('50000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Hi John, is your cottage available this weekend?'),
  ('50000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Yes! It’s open from Friday to Sunday.');
