-- =========================
-- PATIENT
-- =========================
CREATE TABLE PATIENT (
    Patient_ID        NUMBER PRIMARY KEY,
    Patient_Name      VARCHAR2(100) NOT NULL,
    IC_No             VARCHAR2(20) UNIQUE NOT NULL,
    Phone             VARCHAR2(20),
    Date_Of_Birth     DATE
);

-- =========================
-- DOCTOR
-- =========================
CREATE TABLE DOCTOR (
    Doctor_ID         NUMBER PRIMARY KEY,
    Doctor_Name       VARCHAR2(100) NOT NULL,
    Specialization    VARCHAR2(50)
);


-- =========================
-- APPOINTMENT
-- =========================
CREATE TABLE APPOINTMENT (
    Appointment_ID    NUMBER PRIMARY KEY,
    Appointment_Date  DATE NOT NULL,
    Patient_ID        NUMBER NOT NULL,
    Doctor_ID         NUMBER NOT NULL,
    CONSTRAINT fk_appointment_patient
        FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Patient_ID),
    CONSTRAINT fk_appointment_doctor
        FOREIGN KEY (Doctor_ID) REFERENCES DOCTOR(Doctor_ID)
);

-- =========================
-- SERVICE
-- =========================
CREATE TABLE SERVICE (
    Service_ID        NUMBER PRIMARY KEY,
    Service_Name      VARCHAR2(100) NOT NULL,
    Service_Price     NUMBER(8,2) NOT NULL
);

-- =========================
-- PRODUCT
-- =========================
CREATE TABLE PRODUCT (
    Product_ID        NUMBER PRIMARY KEY,
    Product_Name      VARCHAR2(100) NOT NULL,
    Unit_Price        NUMBER(8,2) NOT NULL,
    Stock_Quantity    NUMBER NOT NULL,
    Expiry_Date       DATE
);

-- =========================
-- INVOICE
-- =========================
CREATE TABLE INVOICE (
    Invoice_ID        NUMBER PRIMARY KEY,
    Invoice_Date      DATE NOT NULL,
    Patient_ID        NUMBER NOT NULL,
    Total_Amount      NUMBER(10,2),
    CONSTRAINT fk_invoice_patient
        FOREIGN KEY (Patient_ID) REFERENCES PATIENT(Patient_ID)
);

-- =========================
-- INVOICE_SERVICE (Bridge)
-- =========================
CREATE TABLE INVOICE_SERVICE (
    Invoice_ID        NUMBER NOT NULL,
    Service_ID        NUMBER NOT NULL,
    Quantity          NUMBER DEFAULT 1 NOT NULL,
    CONSTRAINT pk_invoice_service
        PRIMARY KEY (Invoice_ID, Service_ID),
    CONSTRAINT fk_is_invoice
        FOREIGN KEY (Invoice_ID) REFERENCES INVOICE(Invoice_ID),
    CONSTRAINT fk_is_service
        FOREIGN KEY (Service_ID) REFERENCES SERVICE(Service_ID)
);

-- =========================
-- INVOICE_PRODUCT (Bridge)
-- =========================
CREATE TABLE INVOICE_PRODUCT (
    Invoice_ID        NUMBER NOT NULL,
    Product_ID        NUMBER NOT NULL,
    Quantity          NUMBER NOT NULL,
    CONSTRAINT pk_invoice_product
        PRIMARY KEY (Invoice_ID, Product_ID),
    CONSTRAINT fk_ip_invoice
        FOREIGN KEY (Invoice_ID) REFERENCES INVOICE(Invoice_ID),
    CONSTRAINT fk_ip_product
        FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID)
);