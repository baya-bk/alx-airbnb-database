**ER diagram for your Airbnb-style database** including:

---

## 🧩 **Entities and Attributes**

### 1. **User**

- **user_id** (PK)
- first_name
- last_name
- email (Unique, Indexed)
- password_hash
- phone_number
- role (guest, host, admin)
- created_at

### 2. **Property**

- **property_id** (PK)
- host_id (FK → User.user_id)
- name
- description
- location
- pricepernight
- created_at
- updated_at

### 3. **Booking**

- **booking_id** (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- start_date
- end_date
- total_price
- status (pending, confirmed, canceled)
- created_at

### 4. **Payment**

- **payment_id** (PK)
- booking_id (FK → Booking.booking_id)
- amount
- payment_date
- payment_method (credit_card, paypal, stripe)

### 5. **Review**

- **review_id** (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- rating (1–5)
- comment
- created_at

### 6. **Message**

- **message_id** (PK)
- sender_id (FK → User.user_id)
- recipient_id (FK → User.user_id)
- message_body
- sent_at

---

## 🔗 **Relationships**

- **User → Property**: 1 (host) to many properties.
- **User → Booking**: 1 (guest) to many bookings.
- **User → Review**: 1 (guest) to many reviews.
- **User → Message (as sender/recipient)**: 1 to many messages.
- **Property → Booking**: 1 to many.
- **Property → Review**: 1 to many.
- **Booking → Payment**: 1 to 1.
- **Booking → Property & User**: many-to-1.

---

## ✅ \*\*ER Diagram

`

```
     +-----------+           +-----------+
     |   User    |<--------->|  Message  |
     +-----------+           +-----------+
         | 1                      | 1
         |                       |
         v                      v
+--------------+       +--------------+       +--------------+
|   Property   |<----->|   Booking    |<----->|   Payment    |
+--------------+       +--------------+       +--------------+
       ^ 1                  ^ 1                      ^
       |                    |                        |
       |                    v                        |
       |              +----------+                  |
       +------------->|  Review  |<------------------+
                      +----------+
```
