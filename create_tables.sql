--CREATE DATABASE PROJECT;
USE PROJECT;

--TODO : Add NOT NULL CONSTRAINTS

CREATE TABLE login(
    username VARCHAR(20),
    password VARCHAR(20)
);

INSERT INTO login VALUES ('admin','admin');

CREATE TABLE Hostel(
    hostel_id INT,
    hostel_name varchar(20),
    PRIMARY KEY(hostel_id)
);

CREATE TABLE Room(
    room_no INT,
    key_no INT,
    hostel_id INT,
    FOREIGN KEY(hostel_id) REFERENCES Hostel(hostel_id),
    PRIMARY KEY(room_no,hostel_id)
);

CREATE TABLE Student(
    student_id INT,
    first_name varchar(20),
    middle_name varchar(20),
    last_name varchar(20),
    father_first_name varchar(20),
    father_middle_name varchar(20),
    father_last_name varchar(20),
    branch varchar(20),
    DOB date,
    phone_no varchar(20),
    room_no INT,
    hostel_id INT,
    FOREIGN KEY(hostel_id,room_no) REFERENCES Room(hostel_id,room_no) ON DELETE SET NULL,
    PRIMARY KEY(student_id)
);

CREATE TABLE Furniture(
    furniture_id INT,
    furniture_type varchar(20),
    room_no INT,
    hostel_id INT,
    PRIMARY KEY(furniture_id),
    FOREIGN KEY(hostel_id,room_no) REFERENCES Room(hostel_id,room_no) ON DELETE SET NULL
);

CREATE TABLE Warden(
    warden_id INT,
    warden_name varchar(20),
    phone_no varchar(20),
    warden_of INT,
    PRIMARY KEY(warden_id),
    FOREIGN KEY(warden_of) REFERENCES Hostel(hostel_id) ON DELETE CASCADE
);
