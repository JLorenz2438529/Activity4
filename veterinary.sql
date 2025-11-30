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