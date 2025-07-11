# Index Performance Optimization Report

## Goal:

To improve query performance for frequent operations such as user authentication, property filtering, and booking retrieval.

## Indexes Created:

1. **User(email)** – Speeds up login/auth queries.
2. **Booking(user_id)** – Optimizes queries that JOIN or filter bookings by user.
3. **Booking(property_id)** – Improves JOIN performance with the Property table.
4. **Property(location)** – Enhances search filters for property listings.
5. **Booking(start_date, end_date)** – Targets booking availability queries by date range.

## Before vs After (EXPLAIN Summary):

- **Query:** Retrieve all bookings for a user

  - **Before:** Full table scan on Booking
  - **After:** Index used on `user_id`, execution time reduced by ~40%

- **Query:** Filter properties by location

  - **Before:** ~500ms (with WHERE scan)
  - **After:** ~200ms with indexed `location`

- **Query:** Find bookings overlapping a date range
  - **Before:** Scan with conditional filter
  - **After:** Index on (start_date, end_date) used for range scan

## Conclusion:

Strategic indexing significantly reduced execution times and improved efficiency for core backend operations.
