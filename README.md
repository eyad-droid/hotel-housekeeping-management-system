# Hotel Housekeeping Management System

## Project Overview
The **Hotel Housekeeping Management System** is a relational database project developed using Microsoft SQL Server. It is designed to organize and manage hotel housekeeping operations, including rooms, housekeepers, tasks, schedules, supplies, and inspections.

## Technologies Used
- Microsoft SQL Server
- SQL
- DDL (Data Definition Language)

## Database Structure
The database consists of seven main tables:

1. **Rooms** – Stores hotel room information.
2. **Housekeepers** – Stores housekeeper information.
3. **Tasks** – Stores housekeeping task details.
4. **Supplies** – Stores available housekeeping supplies.
5. **Schedules** – Organizes housekeeping task assignments.
6. **Inspections** – Records inspection information.
7. **TaskSupplies** – Resolves the many-to-many relationship between Tasks and Supplies.

## Database Relationships
- One-to-Many (1:M) relationships between Rooms, Housekeepers, Tasks, and Schedules.
- One-to-Many (1:M) relationship between Schedules and Inspections.
- Many-to-Many (M:N) relationship between Tasks and Supplies, implemented through the TaskSupplies junction table.

## Database Constraints
The project uses several SQL constraints to maintain data integrity:

- PRIMARY KEY
- FOREIGN KEY
- UNIQUE
- CHECK
- DEFAULT
- NOT NULL

## Database Files
The database was configured with:
- MDF – Primary data file.
- NDF – Secondary data file.
- LDF – Transaction log files.

## My Role & Contributions
**Role: Team Leader & Database Designer**

My responsibilities included:
- Leading and coordinating an 8-member team.
- Designing the Entity Relationship Diagram (ERD).
- Creating the Mapping Diagram.
- Collecting and integrating the SQL scripts developed by the team.
- Implementing the Rooms and Inspections tables.
- Helping organize database relationships and integrity constraints.

## Repository Structure
```text
hotel-housekeeping-management-system/
│
├── SQL/
│   └── HotelHousekeeping.sql
│
├── Diagrams/
│   ├── ERD.drawio
│   └── Mapping.drawio
│
├── Screenshots/
│
└── README.md
```

## Project Status
Completed – Database Design and Implementation Phase.

---

**Academic Team Project**
