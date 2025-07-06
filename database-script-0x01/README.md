✅ Key Highlights
Uses UUIDs for all IDs with uuid_generate_v4() (PostgreSQL).

ENUM values are implemented via VARCHAR + CHECK constraints for portability.

All foreign key relationships use ON DELETE CASCADE for referential integrity.

Indexes created on frequently queried or joined columns (email, property_id, booking_id).
