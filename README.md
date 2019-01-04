# Vehicle Insurance System

__Vehicle Insurance__ System is a Web Application developed using Spring MVC and Hibernate. The goal of the application is to provide a dashboard to the Insurance company where they can keep track of their customers.

## Roles

1. Admin Role
2. User Role

### Roles Description 

1. **Admin Role**

Admin is responsible for managing the users, insurance, vehicle details and also search the user details based in name, licence number and plate number.

2. **User Role**

User can search other users and view their details.

## Modules

1. User module
2. Insurance module
3. Vehicle module
4. Search module

### Modules Description

1. **User Module**

User module contains the user details like name, password, gender, nationality, role and licence no and admin can only add/create the users. Admin can also edit and delete the users later.

2. **Insurance Module**

Insurance module contains the insurance details like insurance provider, insurance number, insurance validity and user id. Admin can add the insurance details to each user. Admin can also edit and delete the insurance later.

3. **Vehicle Module**

Vehicle module contains the vehicle details like type, color, plate number, registration date and user id. Admin can add the vehicle details to each user. Admin can also edit and delete the vehicle later.

4. **Search Module**

Search module allows the user and admin to search the user details based on the name, licence number and plate number. 

## Tools and Technologies used

* Java 1.8
* Spring MVC 4.3.6
* Hibernate 5.2.7
* Spring Security 4.2.8
* Apache tomcat 8.0
* MySQL
* Maven 3.1
* JSTL taglib 1.2
* Bootstrap 3
* jQuery 3
* jQuery datatables
* Eclipse oxygen
* Java EE 8.0

## Steps to install

1. **Clone the application**

	```bash
	git clone https://github.com/scbushan05/Vehicle-Insurance-System.git
	```

2. **Create a MySQL Database**

	```bash
	create database vis
	```

3. **Create tables or Run the SQL Script File**

	```sql
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
	```

4. **Change MySQL Username and Password as per your MySQL Installation**

	+ open `src/main/java/HibernateConfig.java` file.
	
	+ change `DATABASE_USERNAME` and `DATABASE_PASSWORD` as per your installation
	
5. **Build and Run the application**

	```bash
	mvn spring:run
	```
	
6. **Add the Admin Credentials**

	```sql
	insert into tbl_user(name, password, gender, nationality, licence, authority_id)
	values('admin','$2a$10$hbxecwitQQ.dDT4JOFzQAulNySFwEpaFLw38jda6Td.Y/cOiRzDFu','Male','Indian','LIC123',1);
	```

> NOTE: password - admin@123

The server will start on port 8080. Open the browser and type the url `http://localhost:8037/vis` to access the application.

For More Awesome Projects Subscribe to My Youtube channel [B2 Tech](https://www.youtube.com/b2tech) 

If you find any difficulty in installing the application then reach me @ [Bushan Sirgur](http://BushanSirgur.in)