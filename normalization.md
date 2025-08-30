# Airbnb Database Normalization

## Objective
The goal is to ensure the Airbnb database schema is **normalized to the Third Normal Form (3NF)** to reduce redundancy, avoid anomalies, and improve data integrity.

---

## Step 1: First Normal Form (1NF)

**Requirements for 1NF:**
1. Each table has a primary key.
2. Each column contains atomic (indivisible) values.
3. No repeating groups or arrays.

**Analysis:**
- `User` table: All fields are atomic (`first_name`, `last_name`, `email`, etc.) ✅  
- `Property` table: All fields are atomic (`name`, `description`, `location`, `pricepernight`) ✅  
- `Booking` table: Atomic fields (`start_date`, `end_date`, `total_price`, `status`) ✅  
- `Payment`, `Review`, `Message` tables: All atomic ✅  

**Conclusion:**  
All tables satisfy 1NF.

---

## Step 2: Second Normal Form (2NF)

**Requirements for 2NF:**
1. Must be in 1NF.
2. All **non-key attributes must depend on the entire primary key** (no partial dependency).

**Analysis:**
- All tables have **single-column primary keys** (`id` as `CHAR(36)` UUID), so no partial dependencies exist. ✅  

**Conclusion:**  
All tables satisfy 2NF.

---

## Step 3: Third Normal Form (3NF)

**Requirements for 3NF:**
1. Must be in 2NF.
2. **No transitive dependencies** (non-key attributes must not depend on other non-key attributes).

**Analysis:**
- `User` table: `email`, `first_name`, `last_name`, `role`, `phone_number` all depend **directly on `id`**, no transitive dependencies ✅  
- `Property` table: `name`, `description`, `location`, `pricepernight`, `host_id` depend on `id` ✅  
- `Booking` table: `start_date`, `end_date`, `total_price`, `status`, `user_id`, `property_id` depend directly on `id` ✅  
- `Payment` table: `amount`, `payment_date`, `payment_method`, `booking_id` depend directly on `id` ✅  
- `Review` table: `rating`, `comment`, `property_id`, `user_id` depend directly on `id` ✅  
- `Message` table: `message_body`, `sender_id`, `recipient_id` depend directly on `id` ✅  

**Conclusion:**  
There are **no transitive dependencies** in any table. All tables satisfy 3NF.

---

## Step 4: Summary of Normalization Steps

| Table     | Primary Key | 1NF | 2NF | 3NF | Notes |
|-----------|------------|-----|-----|-----|-------|
| User      | id         | ✅   | ✅   | ✅   | All attributes atomic and fully dependent on PK |
| Property  | id         | ✅   | ✅   | ✅   | host_id FK references User(id) |
| Booking   | id         | ✅   | ✅   | ✅   | user_id & property_id FKs |
| Payment   | id         | ✅   | ✅   | ✅   | booking_id FK |
| Review    | id         | ✅   | ✅   | ✅   | property_id & user_id FKs |
| Message   | id         | ✅   | ✅   | ✅   | sender_id & recipient_id FKs |

**Final Notes:**  
- The database design is normalized to **3NF**.  
- All redundancies are eliminated.  
- Relationships are enforced via **foreign keys**, ensuring referential integrity.

---

### ✅ References
- Database Design: [Airbnb Database Schema](schema.sql)  
- Normalization Principles:  
  - [1NF, 2NF, 3NF](https://www.geeksforgeeks.org/normal-forms-in-dbms/)  
  - [Database Normalization Basics](https://www.studytonight.com/dbms/database-normalization.php)
