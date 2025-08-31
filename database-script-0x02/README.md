# Database Seeding

This folder contains SQL scripts for seeding the database of the Airbnb Clone project with sample data. Seeding helps simulate real-world scenarios, test queries, and validate schema design.

--- 

## Purpose of Seeding

**Test Queries:** Quickly validate SELECT, JOIN, and other SQL operations.

**Demo Application:** Populate the app with realistic users, properties, bookings, and payments.

**Schema Validation:** Ensure foreign keys, constraints, and relationships work as expected.

**Iteration:** Speed up development by avoiding manual data entry.

--- 

## Files

**seed.sql**

- Populates the database with sample records for all entities (Users, Properties, Bookings, Payments, Reviews, Messages).


## Sample Data Overview

The seed data reflects real-world usage patterns:

### Users:
Guests and hosts with unique emails and roles.
_Example:_ Kwame Mensah (guest), Ama Owusu (host).

### Properties:

Each linked to a host.

_Example:_ Cozy Apartment in Accra, Beachfront Villa in Cape Coast.

### Bookings:

Guests book properties with start/end dates, total price, and status (pending, confirmed, canceled).

### Payments:

Linked to bookings. Includes full and partial payments.

### Reviews:

Guests leave ratings (1–5) and comments on properties.

### Messages:

Simulates host–guest conversations.

---

## Usage

1. Make sure the schema is created first:
    ```sql
      \i schema.sql
2. Run the seed script:
    ```sql
      \i seeds/seed.sql

---

## Notes

- UUIDs: The script uses gen_random_uuid() (PostgreSQL).

- For MySQL, replace with manual UUID strings (e.g., '550e8400-e29b-41d4-a716-446655440000').

- Timestamps: Use NOW() for created_at/updated_at.

- Indexes: Since seeding uses indexed fields (like email), ensure no duplicates to avoid errors.
