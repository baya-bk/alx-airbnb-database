-- partitioning.sql

-- 1. Rename existing table
ALTER TABLE bookings RENAME TO bookings_old;

-- 2. Create partitioned bookings table
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 3. Create partitions for date ranges (example yearly partitions)
CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE bookings_2026 PARTITION OF bookings
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- 4. Create indexes on partitions (for foreign keys and queries)
CREATE INDEX idx_bookings_2024_user_id ON bookings_2024(user_id);
CREATE INDEX idx_bookings_2025_user_id ON bookings_2025(user_id);
CREATE INDEX idx_bookings_2026_user_id ON bookings_2026(user_id);

CREATE INDEX idx_bookings_2024_property_id ON bookings_2024(property_id);
CREATE INDEX idx_bookings_2025_property_id ON bookings_2025(property_id);
CREATE INDEX idx_bookings_2026_property_id ON bookings_2026(property_id);

-- 5. Migrate data from old table to new partitioned table
INSERT INTO bookings
SELECT * FROM bookings_old;

-- 6. Drop old table if desired
-- DROP TABLE bookings_old;


EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2025-06-01' AND '2025-06-30';
