-- Create index on User email
CREATE INDEX idx_user_email ON User(email);

-- Create index on Booking user_id
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Create index on Booking property_id
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Create index on Property location
CREATE INDEX idx_property_location ON Property(location);

-- Create composite index on Booking start and end date
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);

-- Analyze query performance before/after indexing

-- Example: Find all bookings by user (performance test)
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = '123e4567-e89b-12d3-a456-426614174000';

-- Example: Search properties by location
EXPLAIN ANALYZE
SELECT * FROM Property WHERE location = 'Addis Ababa';

-- Example: Search bookings by date range
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';
