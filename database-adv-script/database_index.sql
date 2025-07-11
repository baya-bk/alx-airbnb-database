-- Create index on User email for faster authentication lookups
CREATE INDEX idx_user_email ON User(email);

-- Create index on Booking user_id for quicker JOINs and WHERE filters
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Create index on Booking property_id for improved JOIN performance
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Create index on Property location for efficient search/filtering
CREATE INDEX idx_property_location ON Property(location);

-- Create composite index on Booking(start_date, end_date) to speed up range queries
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
