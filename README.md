# Airline-Management-System
This project is an Oracle PL/SQL database designed to build and manage a complete operating system for an airline.
It includes a comprehensive database to handle all key operations, from flight scheduling and passenger reservations to employee management and automated business rules.

The system is designed to manage:
- Airplanes, Airports, and Flights
- Passengers and Reservations
- Employees and Crew Assignments
- Baggage and Passenger Check-in
- System Users and Security

## 🗂️ Project Structure & Key Features

### 1. Database Schema
The system is built on 10 interconnected tables to manage all airline data:
- `AVION`: Stores airplane models, capacity, and type.
- `AEROPORT`: Manages airport details (name, city, country).
- `VOL`: Contains all flight information (dates, times, routes, and assigned plane).
- `PASSAGER`: Holds passenger personal and contact information.
- `RESERVATION`: Links passengers to specific flights with a booking status.
- `EMPLOYE`: Stores all employee details, including their job title (poste).
- `ASSIGNATION_EQUIPAGE`: Assigns employees (crew) to specific flights.
- `BAGAGE`: Tracks passenger baggage, linked to a reservation.
- `PRESENCE_VOL`: Tracks if a passenger was present for their flight.
- `UTILISATEUR`: Manages the system's user accounts, passwords, and roles.

### 2. Business Logic (PL/SQL)
The database enforces key business rules using PL/SQL procedures and constraints:
- **Procedures:** Includes procedures like `enregistrer_reservation` to properly add a new passenger booking into the system with a default 'En attente' status.
- **Constraints:** Enforces data integrity, such as a check constraint (`chk_poids_bagage`) to ensure no single piece of baggage weighs more than 32kg.

### 3. Automation (Triggers)
The database uses triggers to automate key processes and ensure data integrity:
- **Automatic Baggage Creation:** A trigger (`TRIG_CREATION_BAGAGE`) automatically creates a new, empty baggage record for a passenger as soon as their reservation is created.
- **Employee Conflict Prevention:** A trigger (`TRIG_CONFLIT_VOLS_EMPLOYE`) prevents a crew member from being assigned to two different flights that occur at the same time. It raises an error if a scheduling conflict is detected.

### 4. Security & Roles
- **Role-Based Access:** The system creates three distinct roles: `administrateur`, `agent_reservation`, and `personnel_navigant`.
- **User Management:** Users are created and assigned to these roles to limit their access and privileges.
- **Schema Sharing:** The database uses roles and synonyms to allow different user schemas (e.g., `AGENT_SCHEMA`) to securely access or modify data in the main `SYSTEM` tables (like `VOL` and `RESERVATION`).

### 5. Business Queries
The project includes pre-built SQL queries to answer key operational questions, such as:
- **Passenger No-Shows:** Identifying all passengers who had a reservation but were *not* marked as 'Présent' for the flight.
- **Flight Occupation Rate:** Calculating the load factor (percentage of seats filled) for every flight by comparing the number of "Present" passengers against the airplane's total capacity.

---

## 🚀 Installation & Usage
To deploy this project, you will need an Oracle Database environment.
1.  **Clone the Repository:**
    ```bash
    git https://github.com/MoKhalilNafati/Airline-Management-System.git
    ```
2.  **Run SQL Scripts:** Execute the scripts in your Oracle environment in the following order:
    1.  Run the **Table Creation** scripts (`CREATE TABLE ...`).
    2.  Run the **Data Insertion** scripts (`INSERT INTO ...`).
    3.  Run the **Security** scripts (`CREATE ROLE ...`, `CREATE USER ...`, `GRANT ...`).
    4.  Run the **PL/SQL** scripts to compile the Procedures, Triggers, and Sequences.
3.  **Interact with the Database:** Once installed, you can use the provided Business Query scripts to retrieve data or interact with the system as one of the created users.
