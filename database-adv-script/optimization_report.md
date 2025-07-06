EXPLAIN ANALYZE
SELECT
b.booking_id,
b.start_date,
b.end_date,
b.total_price,
b.status,
u.user_id,
u.first_name,
u.last_name,
u.email,
p.property_id,
p.name AS property_name,
p.location,
p.pricepernight,
pay.payment_id,
pay.amount,
pay.payment_method,
pay.payment_date
FROM
bookings b
JOIN
users u ON b.user_id = u.user_id
JOIN
properties p ON b.property_id = p.property_id
LEFT JOIN
payments pay ON b.booking_id = pay.booking_id;

-- Refactored query with performance in mind
SELECT
b.booking_id,
b.start_date,
b.end_date,
b.total_price,
b.status,
u.first_name || ' ' || u.last_name AS full_name,
u.email,
p.name AS property_name,
p.location,
pay.amount,
pay.payment_method
FROM
bookings b
JOIN
users u ON b.user_id = u.user_id
JOIN
properties p ON b.property_id = p.property_id
LEFT JOIN
payments pay ON b.booking_id = pay.booking_id;

CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);
