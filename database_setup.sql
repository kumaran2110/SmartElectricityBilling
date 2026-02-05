CREATE DATABASE smart_electricity;
USE smart_electricity;

-- Consumers table
CREATE TABLE consumers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    address VARCHAR(255),
    meter_id VARCHAR(50) UNIQUE
);

-- Meter readings table (simulated data)
CREATE TABLE meter_readings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    meter_id VARCHAR(50),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    consumption_kwh DOUBLE,
    is_peak BOOLEAN
);

-- Bills table
CREATE TABLE bills (
    id INT PRIMARY KEY AUTO_INCREMENT,
    consumer_id INT,
    period_start DATETIME,
    period_end DATETIME,
    total_amount DOUBLE,
    FOREIGN KEY (consumer_id) REFERENCES consumers(id)
);

-- Insert sample data
INSERT INTO consumers (name, address, meter_id)
VALUES ('John Doe', '123 Main St', 'METER001');

INSERT INTO meter_readings (meter_id, consumption_kwh, is_peak)
VALUES 
('METER001', 5.0, FALSE),
('METER001', 10.0, TRUE);
