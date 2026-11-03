# MediLife Family Clinic Database

A relational database project for a fictional outpatient family clinic, developed as part of a Database Development and Applications assignment. It models patient visits, appointments, clinical services, dispensed products, and billing using Oracle SQL.

## Project overview

MediLife Family Clinic provides consultations, health screenings, blood tests, vaccinations, minor wound care, and medication dispensing. The project addresses common issues with paper- and spreadsheet-based workflows—slow patient-record retrieval, weak inventory tracking, and manual billing errors—by organizing clinic data in a structured relational database.

## What I contributed

My individual contribution was the **Services Used by Patient** reporting query. It accepts a patient ID and joins patient, invoice, invoice-service, and service records to show services provided, unit prices, quantities, and calculated totals, with a subtotal per patient. The report supports reviewing a patient's service history and healthcare spending.

The project was completed collaboratively. The submitted report also documents the group's database design and implementation work, including the ER model and schema, sample records, and SQL reports for patient receipts/spending, invoices over a date range, doctor-issued medicines, and appointment workload/service revenue.

## Database design

The schema contains eight related entities:

- `PATIENT` — patient identity and contact/demographic details
- `DOCTOR` — doctor and specialization details
- `APPOINTMENT` — appointments linked to a patient and doctor
- `SERVICE` — clinic services and prices
- `PRODUCT` — medicines/supplies, prices, stock quantities, and expiry dates
- `INVOICE` — patient billing records
- `INVOICE_SERVICE` — services and quantities on invoices
- `INVOICE_PRODUCT` — products and quantities on invoices

The invoice detail tables model the many-to-many relationships between invoices and billable services/products. The design uses identifiers and foreign-key relationships to connect clinic records.

## Repository contents

- `Create_Tables.sql` — creates the database tables
- `Patient insert.sql`, `Doctor Insert.sql`, `Product Insert.sql`, `Service Insert.sql` — sample master records
- `APPOINTMENT Insert.sql`, `Invoice Insert.sql`, `INVOICE_PRODUCT Insert.sql`, `INVOICE_SERVICE Insert.sql` — sample appointment and billing records
- `Report .pdf` — project report, design documentation, and query examples

## Reports and query capabilities

The report demonstrates Oracle SQL*Plus queries that can:

- Summarize services used and service costs for a selected patient
- Produce patient invoice/receipt details and total healthcare spending
- Filter invoice history by patient and date range
- Review medicines issued in doctor/patient history
- Compare appointment counts and service revenue by doctor/specialization over a reporting period

## Technology

- Oracle SQL / SQL*Plus
- Relational database design and ER modeling

## Running

Run `Create_Tables.sql` in an Oracle SQL environment first, then run the insert scripts to load the sample data. The report queries use SQL*Plus commands such as `ACCEPT`, `COLUMN`, `BREAK`, and `COMPUTE`; execute them in SQL*Plus or a compatible client. Some scripts prompt for IDs or dates at runtime.

> This is an academic demonstration project with sample data, not a production clinic system. The submitted design documents stock quantities, but automated stock deduction and full inventory/expiry workflows are stated as goals rather than demonstrated functionality in the included scripts.