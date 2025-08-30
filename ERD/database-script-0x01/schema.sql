CREATE DATABASE airbnb;

USE airbnb;

CREATE TABLE User(
    id CHAR(36) PRIMARY KEY,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email  varchar(50) not null unique,
    password_hash varchar(255) not null,
    phone_number varchar(50) null,
    role ENUM('guest', 'host', 'admin') not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create index index_email on User(email);

CREATE TABLE Property(
    id CHAR(36) PRIMARY KEY,
    name  varchar(50) not null,
    description text not null,
    location varchar(50) not null,
    pricepernight decimal(10, 2) not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    host_id CHAR(36),
    FOREIGN KEY (host_id) REFERENCES User(id)
);

CREATE TABLE Booking(
    id CHAR(36) PRIMARY KEY,
    start_date DATE not null,
    end_date DATE not null,
    total_price decimal(10,2) not null,
    status ENUM('pending', 'confirmed', 'canceled') not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id CHAR(36),
    property_id CHAR(36),
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (property_id) REFERENCES Property(id)
);

CREATE INDEX index_booking_property_id ON Booking(property_id);

create table Payment(
    id CHAR(36) PRIMARY KEY,
    amount decimal(10, 2) not null,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') not null,
    booking_id CHAR(36),
    FOREIGN KEY (booking_id) REFERENCES Booking(id)
);

CREATE INDEX index_payment_booking_id ON Payment(booking_id);


create table Review(
    id CHAR(36) PRIMARY KEY,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment text not null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    property_id CHAR(36),
    user_id CHAR(36),
    FOREIGN KEY (property_id) REFERENCES Property(id),
    FOREIGN KEY (user_id) REFERENCES User(id)
);

create table Message(
    id CHAR(36) PRIMARY KEY,
    message_body text not null,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sender_id CHAR(36),
    recipient_id CHAR(36),
    FOREIGN KEY (sender_id) REFERENCES User(id),
    FOREIGN KEY (recipient_id) REFERENCES User(id)
)
