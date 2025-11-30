CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,  
    first_name VARCHAR(50) NOT NULL,           
    last_name VARCHAR(50) NOT NULL,           
    specialization VARCHAR(100),               
    phone_number VARCHAR(15),                 
    email VARCHAR(100) UNIQUE,                 
    hire_date DATE NOT NULL,                   
    status ENUM('Active', 'Inactive') DEFAULT 'Active'  
);

CREATE TABLE IF NOT EXISTS invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10,2),
    paymentdate TIME,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE IF NOT EXISTS medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate DATETIME,
    doctorid INT,
    diagnosis VARCHAR(255),
    prescription VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners(ownerid, ofirstname, olastname, address, phone, email)
VALUES
(1, 'Maria', 'Santos', '123 Maple St', '0917-000-0001', 'maria.santos@example.com'),
(2, 'Juan', 'Dela Cruz', '45 Rizal Ave', '0917-000-0002', 'juan.delacruz@example.com'),
(3, 'Ana', 'Reyes', '9 Mabini St', '0917-000-0003', 'ana.reyes@example.com'),
(4, 'Liza', 'Gonzales', '78 Bonifacio Rd', '0917-000-0004', 'liza.gonzales@example.com'),
(5, 'Carlos', 'Torres', '11 Mabuhay Ln', '0917-000-0005', 'carlos.torres@example.com'),
(6, 'Rosa', 'Lopez', '200 San Juan', '0917-000-0006', 'rosa.lopez@example.com'),
(7, 'Diego', 'Mendoza', '300 Taft Ave', '0917-000-0007', 'diego.mendoza@example.com'),
(8, 'Grace', 'Velasco', '22 Padre St', '0917-000-0008', 'grace.velasco@example.com'),
(9, 'Nina', 'Cruz', '5 Malvar St', '0917-000-0009', 'nina.cruz@example.com'),
(10, 'Pedro', 'Ilagan', '77 Luna St', '0917-000-0010', 'pedro.ilagan@example.com');

INSERT INTO animals(animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Buddy', 'Dog', 'Labrador', '2020-06-15', 'Male', 'Yellow', 1),
(2, 'Max', 'Dog', 'Beagle', '2019-09-02', 'Male', 'Brown', 2),
(3, 'Bella', 'Dog', 'German Shepherd', '2021-01-20', 'Female', 'Black/Tan', 3),
(4, 'Simba', 'Cat', 'Domestic Shorthair', '2022-03-05', 'Male', 'Orange', 4),
(5, 'Whiskers', 'Cat', 'Siamese', '2018-11-11', 'Female', 'Cream', 1),
(6, 'Shadow', 'Dog', 'Mixed', '2017-12-01', 'Male', 'Black', 5),
(7, 'Lucy', 'Cat', 'Persian', '2020-07-07', 'Female', 'White', 6),
(8, 'Charlie', 'Dog', 'Poodle', '2021-04-04', 'Male', 'White', 7),
(9, 'Milo', 'Cat', 'Tabby', '2019-05-05', 'Male', 'Brown', 8),
(10, 'Luna', 'Dog', 'Bulldog', '2022-10-10', 'Female', 'Brindle', 9);

INSERT INTO appointments(appointid, animalid, appointdate, reason)
VALUES
(1, 1, '2023-01-05 09:00:00', 'Health check'),
(2, 2, '2023-01-10 14:00:00', 'Vaccination'),
(3, 3, '2023-02-02 11:00:00', 'Sprained leg'),
(4, 4, '2023-02-15 13:00:00', 'Dental cleaning'),
(5, 5, '2023-03-10 10:00:00', 'Skin infection'),
(6, 5, '2023-04-12 09:30:00', 'Vaccination'),
(7, 5, '2023-05-02 16:00:00', 'Follow-up'),
(8, 6, '2023-03-10 15:00:00', 'Flea treatment'),
(9, 7, '2023-04-18 08:30:00', 'Spaying'),
(10, 8, '2023-05-20 11:30:00', 'Conjunctivitis');

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@example.com'),
(5, 'Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Carmen', 'Fernandez', 'Ophthalmology Specialist', '333-222-1111', 'carmen@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
(1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
(2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
(3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
(4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
(5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
(6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
(7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
(8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
(9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
(10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD COLUMN registeredDate DATE;

ALTER TABLE your_table_name
CHANGE COLUMN paymentdate paymenttime DATETIME;

DELETE FROM appointments
WHERE petName = 'Simba' AND ownerID = 1;

UPDATE doctors
SET last_name = 'Reyes-Gonzales'
WHERE doctor_id = 1;