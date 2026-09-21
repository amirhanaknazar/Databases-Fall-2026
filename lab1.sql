CREATE TABLE airport (
    airport_id SERIAL PRIMARY KEY,
    airport_name VARCHAR(100),
    country VARCHAR(100),
    state VARCHAR(100),
    city VARCHAR(100),
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE airline (
    airline_id SERIAL PRIMARY KEY,
    airline_code VARCHAR(10) UNIQUE,
    name VARCHAR(100),
    country VARCHAR(100),
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE passenger (
    passenger_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender VARCHAR(20),
    date_of_birth DATE,
    country_of_citizenship VARCHAR(100),
    country_of_residence VARCHAR(100),
    passport_number VARCHAR(50) UNIQUE,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE flight (
    flight_id SERIAL PRIMARY KEY,
    airline_id INTEGER REFERENCES airline(airline_id),
    departure_airport_id INTEGER REFERENCES airport(airport_id),
    arrival_airport_id INTEGER REFERENCES airport(airport_id),
    departing_gate VARCHAR(20),
    arriving_gate VARCHAR(20),
    scheduled_departure_time TIMESTAMP WITHOUT TIME ZONE,
    scheduled_arrival_time TIMESTAMP WITHOUT TIME ZONE,
    actual_departure_time TIMESTAMP WITHOUT TIME ZONE,
    actual_arrival_time TIMESTAMP WITHOUT TIME ZONE,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE booking (
    booking_id SERIAL PRIMARY KEY,
    flight_id INTEGER REFERENCES flight(flight_id),
    passenger_id INTEGER REFERENCES passenger(passenger_id),
    status VARCHAR(50),
    booking_platform VARCHAR(50),
    ticket_price NUMERIC(10,2),
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE booking_change (
    change_id SERIAL PRIMARY KEY,
    booking_id INTEGER REFERENCES booking(booking_id),
    change_description TEXT,
    changed_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE boarding_pass (
    boarding_pass_id SERIAL PRIMARY KEY,
    booking_id INTEGER UNIQUE REFERENCES booking(booking_id),
    seat VARCHAR(10),
    boarding_time TIMESTAMP WITHOUT TIME ZONE,
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE baggage (
    baggage_id SERIAL PRIMARY KEY,
    booking_id INTEGER REFERENCES booking(booking_id),
    weight_kg NUMERIC(5,2),
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE baggage_check (
    baggage_check_id SERIAL PRIMARY KEY,
    booking_id INTEGER REFERENCES booking(booking_id),
    passenger_id INTEGER REFERENCES passenger(passenger_id),
    check_result VARCHAR(50),
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE security_check (
    security_check_id SERIAL PRIMARY KEY,
    passenger_id INTEGER REFERENCES passenger(passenger_id),
    check_result VARCHAR(50),
    created_at TIMESTAMP WITHOUT TIME ZONE,
    updated_at TIMESTAMP WITHOUT TIME ZONE
);
