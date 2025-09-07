# Index Performance

## Identified High-Usage Columns
- **Users**
  - `id` (joins)
  - `email` (lookups)

- **Bookings**
  - `user_id` (joins with users)
  - `property_id` (joins with properties)

- **Properties**
  - `id` (joins)
  - `location` (search filters)
  - `pricepernight` (sorting and filtering)

## Created Indexes
```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(pricepernight);
