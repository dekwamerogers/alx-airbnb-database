# Normalization of Database Schema (Airbnb Clone)

This document explains how the database schema has been normalized up to the **Third Normal Form (3NF).**

---

## Step 1: First Normal Form (1NF)
- Each attribute contains **atomic values** (no arrays, lists, or repeating groups).
- Example: `User` table stores one email per user, not multiple emails in a single column.
- ✅ All tables satisfy 1NF.

---

## Step 2: Second Normal Form (2NF)
- Each table has a **single-column primary key** (`UUID`).
- No partial dependencies on a part of a composite key (since none exist).
- ✅ All tables satisfy 2NF.

---

## Step 3: Third Normal Form (3NF)
- All non-key attributes depend **only on the primary key**.
- No transitive dependencies (non-key attributes depending on other non-key attributes).
- Example checks:
  - `User`: All attributes depend on `user_id`.
  - `Property`: Attributes (`name`, `location`, `pricepernight`) depend only on `property_id`.
  - `Booking`: `status`, `dates`, etc., depend only on `booking_id`.
  - ⚠️ `total_price` in `Booking` can be derived from `pricepernight × number_of_nights`.  
    - To achieve strict 3NF, this column can be removed.
    - In practice, it may be kept for performance optimization (denormalization).

---

## Final Conclusion
The schema is normalized to **3NF**.  
- ✅ No repeating groups (1NF).  
- ✅ No partial dependencies (2NF).  
- ✅ No transitive dependencies (3NF).  
- ⚠️ The only consideration is whether to store or derive `total_price`.

This ensures:
- Minimal redundancy
- Consistent data
- Easier maintenance and scalability
