# Performance Monitoring – Airbnb Clone Database

## Objective:

Continuously monitor and refine query performance using `EXPLAIN`, `EXPLAIN ANALYZE`, and index/schema tuning.

---

## 🔍 Tools Used:

- `EXPLAIN`
- `EXPLAIN ANALYZE`
- Index analysis via `SHOW INDEX`
- Query profiling

---

## 🧪 Query 1: Retrieve all bookings for a specific user

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = '123e4567-e89b-12d3-a456-426614174000';
```
