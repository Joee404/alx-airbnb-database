# Partitioning Performance Report

## Objective
Optimize queries on the large `bookings` table by implementing partitioning on the `start_date` column.

## Implementation
We created a partitioned table using **RANGE partitioning** on `YEAR(start_date)`:

```sql
CREATE TABLE bookings_partitioned (
    id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    payment_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    PRIMARY KEY (id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);
