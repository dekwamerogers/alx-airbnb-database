# Airbnb Clone – Database Schema

## 📌 Overview
This folder contains the **SQL schema definition** and **seed data** for the Airbnb-like booking system.  
The schema is designed following **normalization principles (up to 3NF)** to ensure **data integrity, minimal redundancy, and scalability**.

---

## 🏗️ Entities & Attributes
### 1. Users
- Stores guest, host, and admin details.
- Constraints: `email` unique, `role` ENUM.

### 2. Properties
- Listings created by hosts.
- Linked to `Users (host_id)`.

### 3. Bookings
- Reservations made by users on properties.
- References `Users` and `Properties`.

### 4. Payments
- Tracks booking transactions.
- Linked to `Bookings`.

### 5. Reviews
- User feedback on properties.
- Rating restricted between **1–5**.

### 6. Messages
- Direct communication between users.
- References `Users (sender_id, recipient_id)`.

---

## 🧹 Normalization Process
The schema was normalized in steps:

1. **1NF** – Removed repeating groups, ensured atomic values (e.g., separate `first_name`, `last_name`).  
2. **2NF** – Eliminated partial dependencies by ensuring non-key attributes depend on the full primary key (e.g., booking details tied to `booking_id`).  
3. **3NF** – Removed transitive dependencies (e.g., no derived attributes like `total nights` in booking table).  

📄 See [../normalization.md](../normalization.md) for detailed steps.

---

## 🗂️ Files
- `create_tables.sql` → SQL DDL for schema creation.  
- `seed_data.sql` → Sample test data to simulate bookings, payments, etc.  
- `erd_export.sql` → Schema export for ERD visualization tools.  

---

## ⚡ Indexes
Indexes were added for performance:
- **Users** → `email` (unique lookups)
- **Properties** → `host_id`
- **Bookings** → `property_id`, `user_id`
- **Payments** → `booking_id`
- **Reviews** → `property_id`, `user_id`
- **Messages** → `sender_id`, `recipient_id`

📌 Indexes improve **read/query speed**, especially on joins, at the cost of slightly slower writes.

---

