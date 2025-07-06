# Airbnb Database Normalization to 3NF

## ✅ Step-by-Step Normalization

### 🔹 First Normal Form (1NF)

**Rules:**

- Atomic values only (no multivalued or composite attributes).
- Unique rows with a primary key.

**Applied to all tables:**

- All attributes are atomic (e.g., `first_name`, `email`, `pricepernight`).
- Each table has a primary key (e.g., `user_id`, `property_id`, `booking_id`).

✅ **1NF is satisfied.**

---

### 🔹 Second Normal Form (2NF)

**Rules:**

- Must be in 1NF.
- No partial dependency on a composite primary key (all non-key attributes fully depend on the whole key).

**Check:**

- All tables use **single-column primary keys** (UUIDs).
- No partial dependencies exist.

✅ **2NF is satisfied.**

---

### 🔹 Third Normal Form (3NF)

**Rules:**

- Must be in 2NF.
- No transitive dependencies (i.e., non-key attribute should not depend on another non-key attribute).

**Review and Optimization:**

### 1. `User` Table

- `role` is an enum — no transitive dependency.
- No redundant data.

✅ In 3NF.

---

### 2. `Property` Table

- `host_id` refers to `User` — good FK usage.
- No other transitive dependencies.

✅ In 3NF.

---

### 3. `Booking` Table

- `total_price` could be derived as `DATEDIFF(end_date - start_date) * property.pricepernight`, but it’s **stored for historical accuracy**, so it's valid.
- No transitive dependency.

✅ In 3NF.

---

### 4. `Payment` Table

- Fully dependent on `booking_id`.
- No redundant payment data (e.g., not storing user or property info again).

✅ In 3NF.

---

### 5. `Review` Table

- `rating` and `comment` are dependent only on the composite (user, property) review context.
- No derived data or transitive dependency.

✅ In 3NF.

---

### 6. `Message` Table

- Sender and recipient are both FKs to `User`.
- Message content and timestamp are atomic and dependent on message_id only.

✅ In 3NF.

---

## 💡 Summary of Improvements

- The schema was already well-structured with **atomic fields**, **proper foreign keys**, and **no derived/redundant attributes**.
- No extra tables were needed to achieve 3NF — only a check was required.
- Optional: If `role`, `status`, or `payment_method` enums are to be dynamic or extensible, consider moving them to separate lookup tables (this is beyond 3NF and goes into normalization for flexibility).

---

## ✅ Final Verdict

The current schema **satisfies 3NF**. No structural changes were required, only validation.
