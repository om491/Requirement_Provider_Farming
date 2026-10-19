
# Requirement Provider Farming



A Java-based web application designed to support farming-related

requirements by connecting customers, vendors, and administrators.



## Features



- Customer registration and login

- Vendor registration and login

- Admin login and dashboard

- Vendor stock registration and management

- Customer order placement and order management

- Product management

- Billing and payment pages

- Request and vendor stock viewing



## Technologies Used



- Java

- JSP (JavaServer Pages)

- Servlets

- JDBC

- MySQL

- HTML, CSS and JavaScript

- Apache Tomcat

- Eclipse IDE



## Database Configuration



The application uses a MySQL database named `farmer_db`.



Configure these environment variables before running the application:



- `DB_URL` — JDBC URL for the database

- `DB_USERNAME` — MySQL username

- `DB_PASSWORD` — MySQL password



Do not commit database passwords or other secrets to GitHub.



## How to Run



1. Install a compatible JDK, MySQL Server, and Apache Tomcat.

2. Create and configure the `farmer_db` database.

3. Configure the database environment variables.

4. Import the project into Eclipse as a Dynamic Web Project.

5. Configure the required MySQL JDBC driver.

6. Configure Apache Tomcat in Eclipse.

7. Run the project on the server.



## Note



The database schema and initial data may need to be created separately

because an SQL setup script is not currently included in this repository.

