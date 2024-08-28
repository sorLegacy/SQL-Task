# SQL-Task# 

## Overview
This repository contains SQL queries and scripts designed for managing and querying a student course management database. The repository includes the following files:

- `SQL Task.docx`: A document containing various SQL queries for basic and advanced operations on the student database.
- `SCM.sql`: A SQL script for setting up the schema, tables, and possibly sample data for the student course management system.

## Files

### SQL Task.docx
This document includes:

- **Basic Queries**: Simple `SELECT`, `UPDATE`, and `DELETE` statements to interact with the `Students`, `Courses`, and `Enrollments` tables.
- **Advanced Queries**: More complex queries involving `JOIN`, `GROUP BY`, and `HAVING` clauses to derive meaningful insights from the database.
- **Functions and Stored Procedures**: Definitions for creating stored procedures and functions, including one to calculate the age of a student based on their date of birth.
- **Aggregate Functions and Grouping**: Examples of using aggregate functions to calculate statistics like the average, minimum, and maximum number of enrollments per course.

### SCM.sql
This script includes the SQL commands necessary to create the database schema. It likely contains:

- **Table Definitions**: SQL statements for creating tables like `Students`, `Courses`, `Enrollments`, `Instructors`, and `Ins_to_course`.
- **Sample Data Insertion**: Commands to insert initial data into the tables for testing or demonstration purposes.
- **Indexes and Keys**: Definitions for primary keys, foreign keys, and indexes to ensure data integrity and optimize query performance.

## Getting Started

### Prerequisites
- SQL Server Management Studio (SSMS) or any SQL environment that supports T-SQL.

### Setting Up the Database
1. Run the `SCM.sql` script to create the database schema.
2. Optionally, modify or extend the script to insert additional sample data.

### Running Queries
- Open the `SQL Task.docx` document to explore and run the provided queries against the database.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing
Feel free to submit issues, fork the repository, and make pull requests. Contributions are always welcome!

