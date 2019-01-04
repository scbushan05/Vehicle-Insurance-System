CREATE DATABASE vis;

USE vis;

CREATE TABLE authorities(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    authority VARCHAR(255) NOT NULL
);

insert into authorities(id,authority) 
	values(1,'ROLE_ADMIN');
insert into authorities(id,authority) 
	values(2,'ROLE_USER');

CREATE TABLE tbl_user(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    gender VARCHAR(255) NOT NULL,
    nationality VARCHAR(255) NOT NULL,
    licence VARCHAR(255) NOT NULL,
    authority_id INT,
    FOREIGN KEY(authority_id) REFERENCES authorities(id)
);

insert into tbl_user(name, password, gender, nationality, licence, authority_id)
	values('admin','$2a$10$hbxecwitQQ.dDT4JOFzQAulNySFwEpaFLw38jda6Td.Y/cOiRzDFu','Male','Indian','LIC123',1);	-- admin@123 - password

CREATE TABLE tbl_insurance(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    provider VARCHAR(255) NOT NULL,
    insurance_number VARCHAR(255) NOT NULL,
    valid_date VARCHAR(255) NOT NULL,
    user_id INT,
    FOREIGN KEY(user_id) REFERENCES tbl_user(id)
);

CREATE TABLE tbl_vehicles(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    source VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    plate_number VARCHAR(255) NOT NULL,
    manufacture VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    registration_date VARCHAR(255) NOT NULL,
    pending_fines VARCHAR(255) NOT NULL,
    user_id INT,
    FOREIGN KEY(user_id) REFERENCES tbl_user(id)
);