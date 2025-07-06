-- USER Table Indexes
-- email is often queried for login and lookup
CREATE INDEX idx_users_email ON users(email);

-- BOOKING Table Indexes
-- foreign keys and status fields are commonly filtered/joined
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- PROPERTY Table Indexes
-- location and price can appear in filters, and host_id for joins
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_pricepernight ON properties(pricepernight);

-- Example: Analyze bookings by status before indexing
EXPLAIN ANALYZE
SELECT \* FROM bookings WHERE status = 'confirmed';

-- Example: Analyze join performance
EXPLAIN ANALYZE
SELECT
b.booking_id, u.first_name, p.name
FROM
bookings b
JOIN
users u ON b.user_id = u.user_id
JOIN
properties p ON b.property_id = p.property_id
WHERE
b.status = 'confirmed';
