
-- Create Department Table
CREATE TABLE Department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create Doctor Table
CREATE TABLE Doctor (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL,
    specialization VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Create Patient Table
CREATE TABLE Patient (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- Create Appointment Table
CREATE TABLE Appointment (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Create Prescription Table
CREATE TABLE Prescription (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    medication TEXT NOT NULL,
    dosage VARCHAR(100),
    instructions TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id)
);

-- Insert sample data into Department
INSERT INTO Department (name) VALUES
('Cardiology'),
('Pediatrics'),
('Orthopedics');

-- Insert sample data into Doctor
INSERT INTO Doctor (full_name, email, phone_number, specialization, department_id) VALUES
('Dr. Alice Njeri', 'alice.njeri@clinic.com', '0712345678', 'Cardiologist', 1),
('Dr. James Otieno', 'james.otieno@clinic.com', '0723456789', 'Pediatrician', 2),
('Dr. Grace Muthoni', 'grace.muthoni@clinic.com', '0734567890', 'Orthopedic Surgeon', 3);

-- Insert sample data into Patient
INSERT INTO Patient (full_name, dob, gender, phone_number, email) VALUES
('John Mwangi', '1990-06-15', 'Male', '0700000001', 'john.mwangi@gmail.com'),
('Mary Achieng', '1985-09-10', 'Female', '0700000002', 'mary.achieng@yahoo.com');

-- Insert sample data into Appointment
INSERT INTO Appointment (patient_id, doctor_id, appointment_date, appointment_time, status, notes) VALUES
(1, 1, '2025-05-20', '10:00:00', 'Scheduled', 'Routine heart check-up'),
(2, 2, '2025-05-21', '11:30:00', 'Scheduled', 'Child fever consultation');

-- Insert sample data into Prescription
INSERT INTO Prescription (appointment_id, medication, dosage, instructions) VALUES
(1, 'Aspirin', '100mg once daily', 'Take with food'),
(2, 'Paracetamol', '500mg every 8 hours', 'Take with water');
