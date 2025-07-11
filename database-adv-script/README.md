Task 0

# Complex Join Queries – Airbnb Clone Database

This file explains the SQL join operations used in `joins_queries.sql`:

## Queries:

1. **INNER JOIN**  
   Retrieves all bookings along with the user who made each booking.

2. **LEFT JOIN**  
   Retrieves all properties and any associated reviews. Properties without reviews are still included.

3. **FULL OUTER JOIN**  
   Combines all users and all bookings, including users without bookings and bookings without associated users.  
   A `UNION` of `LEFT JOIN` and `RIGHT JOIN` is used to simulate FULL OUTER JOIN for compatibility with MySQL.

Task 1

# Subqueries – Airbnb Clone Database

This file includes both non-correlated and correlated subqueries.

## Queries:

1. **Average Rating > 4.0 (Subquery with GROUP BY and HAVING):**  
   Retrieves all properties whose average rating exceeds 4.0.

2. **Users with More Than 3 Bookings (Correlated Subquery):**  
   Retrieves users who have made more than 3 bookings using a subquery that runs for each user.

Task 3

# Aggregations and Window Functions – Airbnb Clone Database

This file includes SQL queries that use aggregate functions and window functions.

## Queries:

1. **Total Bookings per User:**  
   Uses `COUNT` with `GROUP BY` to show how many bookings each user has made.

2. **Rank Properties by Bookings:**  
   Uses the `RANK()` window function to assign a rank to each property based on total bookings, from most to least booked.
