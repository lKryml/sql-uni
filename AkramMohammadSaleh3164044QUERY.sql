create database AkramMohammadSaleh3164044
---------------------------------------
use AkramMohammadSaleh3164044
---------------------------------------
create table Patient(
PatientID int primary key,
Name varchar(255) not null,
Gender int check (Gender IN(1,2)),
RoomID int not null,
DoctorName varchar(255) not null)
---------------------------------------
create table Medicine(
MedicationID varchar(255) primary key CHECK (MedicationID LIKE 'S[0-9]%'),
MedicationName varchar(255) unique not null,
Factory varchar(255) not null)
---------------------------------------
create table Treats(
MedicationID varchar(255) CHECK (MedicationID LIKE 'S[0-9]%') foreign key references Medicine(MedicationID),
PatientID int foreign key references Patient(PatientID),
Quantity int not null,
primary key(MedicationID,PatientID))
---------------------------------------
INSERT INTO Patient (PatientID, Name, Gender, RoomID, DoctorName)
VALUES (313, 'Ahmed', 1, 100, 'Khaled');

INSERT INTO Patient (PatientID, Name, Gender, RoomID, DoctorName)
VALUES (345, 'Mona', 2, 300, 'Areej');

INSERT INTO Patient (PatientID, Name, Gender, RoomID, DoctorName)
VALUES (360, 'Ali', 1, 100, 'Akram');

INSERT INTO Patient (PatientID, Name, Gender, RoomID, DoctorName)
VALUES (422, 'Emily Davis', 2, 104, 'Areej');

INSERT INTO Patient (PatientID, Name, Gender, RoomID, DoctorName)
VALUES (521, 'David Lee', 1, 105, 'Khaled');

INSERT INTO Patient (PatientID, Name, Gender, RoomID, DoctorName)
VALUES (623, 'Sarah Wilson', 2, 106, 'Akram');

INSERT INTO Patient (PatientID, Name, Gender, RoomID, DoctorName)
VALUES (456, 'Daniel Garcia', 1, 107, 'Areej');

INSERT INTO Patient (PatientID, Name, Gender, RoomID, DoctorName)
VALUES (238, 'Olivia Martinez', 2, 108, 'Khaled');

INSERT INTO Patient (PatientID, Name, Gender, RoomID, DoctorName)
VALUES (449, 'Akram Mohamad', 1, 300, 'Areej');

INSERT INTO Patient (PatientID, Name, Gender, RoomID, DoctorName)
VALUES (110, 'Bader Khaled Daoub', 2, 200, 'Khaled');

-----------------------------------------------------

INSERT INTO Medicine (MedicationID, MedicationName, Factory)
VALUES ('S123', 'CONGESTAL', 'HG');

INSERT INTO Medicine (MedicationID, MedicationName, Factory)
VALUES ('S222', 'PAINFREE', 'XYZ');

INSERT INTO Medicine (MedicationID, MedicationName, Factory)
VALUES ('S153', 'PANADOL', 'ABC');

INSERT INTO Medicine (MedicationID, MedicationName, Factory)
VALUES ('S334', 'HEADACHEAWAY', 'GHI');

INSERT INTO Medicine (MedicationID, MedicationName, Factory)
VALUES ('S145', 'SLEEPEASY', 'JKL');

INSERT INTO Medicine (MedicationID, MedicationName, Factory)
VALUES ('S232', 'FEVERFIX', 'MNO');

INSERT INTO Medicine (MedicationID, MedicationName, Factory)
VALUES ('S555', 'ALLERGYSTOP', 'PQR');

INSERT INTO Medicine (MedicationID, MedicationName, Factory)
VALUES ('S777', 'HEARTHEALTH', 'STU');

INSERT INTO Medicine (MedicationID, MedicationName, Factory)
VALUES ('S242', 'INOSITOL', 'PQR');

INSERT INTO Medicine (MedicationID, MedicationName, Factory)
VALUES ('S887', 'COQ10', 'STU');


----------------------------------------------


INSERT INTO Treats (MedicationID, PatientID, Quantity)
VALUES ('S123', 313, 2);

INSERT INTO Treats (MedicationID, PatientID, Quantity)
VALUES ('S123', 360, 1);

INSERT INTO Treats (MedicationID, PatientID, Quantity)
VALUES ('S123', 238, 3);

INSERT INTO Treats (MedicationID, PatientID, Quantity)
VALUES ('S777', 521, 2);

INSERT INTO Treats (MedicationID, PatientID, Quantity)
VALUES ('S555', 422, 1);

INSERT INTO Treats (MedicationID, PatientID, Quantity)
VALUES ('S153', 456, 2);

INSERT INTO Treats (MedicationID, PatientID, Quantity)
VALUES ('S153', 449, 3);

INSERT INTO Treats (MedicationID, PatientID, Quantity)
VALUES ('S153', 110, 1);

INSERT INTO Treats (MedicationID, PatientID, Quantity)
VALUES ('S145', 623, 3);

INSERT INTO Treats (MedicationID, PatientID, Quantity)
VALUES ('S887', 345, 1);

---------------------------------------
SELECT p.Name AS PatientName
FROM Patient p
INNER JOIN Treats t ON p.PatientID = t.PatientID
INNER JOIN Medicine m ON t.MedicationID = m.MedicationID
WHERE p.DoctorName = 'Khaled' AND m.MedicationName = 'CONGESTAL';

---------------------------------------
SELECT m.MedicationName, COUNT(t.PatientID) AS PatientCount
FROM Medicine m
LEFT JOIN Treats t ON m.MedicationID = t.MedicationID
GROUP BY m.MedicationID, m.MedicationName;

---------------------------------------
SELECT *
FROM Patient
WHERE Gender = 2
ORDER BY RoomID ASC;

---------------------------------------
SELECT Name
FROM Patient
WHERE Name LIKE '%a' AND RoomID = 100;

---------------------------------------
SELECT RoomID, COUNT(*) AS PatientCount
FROM Patient
GROUP BY RoomID
HAVING COUNT(*) <= 3;
---------------------------------------
SELECT SUM(Quantity) AS AhmedTotalMedicineQuantity
FROM Treats t
JOIN Patient p ON t.PatientID = p.PatientID
WHERE p.Name = 'Ahmed';
---------------------------------------
UPDATE Patient
SET RoomID = 200
WHERE PatientID = 456;
---------------------------------------

CREATE VIEW PatientMedicineView AS
SELECT p.Name AS PatientName, m.MedicationName
FROM Patient p
JOIN Treats t ON p.PatientID = t.PatientID
JOIN Medicine m ON t.MedicationID = m.MedicationID;

---------------------------------------
SELECT TOP 5 *
FROM Medicine
ORDER BY NEWID();

---------------------------------------
SELECT * 
FROM Patient 
WHERE PatientID NOT IN (
    SELECT PatientID 
    FROM Treats 
    WHERE MedicationID IN (
        SELECT MedicationID 
        FROM Medicine 
        WHERE MedicationName = 'X'
    )
) AND DoctorName != 'Khaled';

-----------------------------------------------

BACKUP DATABASE AkramMohammadSaleh3164044
TO DISK = 'C:\Users\gumim\Desktop\backup.bak';