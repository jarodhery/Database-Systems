--1. Staff View: This report contains the clinic's patient count along with the number of appointments for each patient, which can be accessed by the clinic staff.
SELECT * FROM VW_ADMIN_PATIENT_APPOINTMENTS;
SELECT * FROM VW_PATIENT_HISTORY;

--2. Staff View: This report includes details of all patient appointments. It provides the patient's personal information such as patient name, patient id, and appointment date and time, as well as the physician's information including name. It also covers the medical advice given during the appointment and any prescriptions issued.
--   Physican can also use this report to review patient's medical history.
SELECT * FROM VW_PATIENT_APPOINTMENTS;

--3. Patient View: This report includes details of appointments for a patient. It provides the patient's personal information such as patient name, patient id, and appointment date and time, as well as the physician's information including name. It also covers the medical advice given during the appointment and any prescriptions issued.
--   Physican can also use this report to review patient's medical history.
SELECT * FROM VW_PATIENT_APPOINTMENTS 
WHERE PATIENT_ID = 1;

--4. Staff View: This  report provides a detailed list of all medical appointments that took place at the clinic. It includes the names of the patients, their appointment dates and times, the nature of their concerns, the current status of their cases, and information about the attending physicians.
SELECT * FROM VW_PHYSICIAN_APPOINTMENTS;

--5. Staff/Physican View: This  report provides a detailed list of all medical appointments that took place at the clinic. It includes the names of the patients, their appointment dates and times, the nature of their concerns, the current status of their cases, and information about the attending physicians.
--   Report is filtered by Physician_ID 
SELECT * FROM VW_PHYSICIAN_APPOINTMENTS
    WHERE PHYSICIAN_ID = 5;

--6. Staff/Physician View: This  report provides a detailed list of all medical appointments that took place at the clinic. It includes the names of the patients, their appointment dates and times, the nature of their concerns, the current status of their cases, and information about the attending physicians.
--   Report is filtered by Physician_ID and Appt_Status = 'Completed'
SELECT * 
FROM VW_PHYSICIAN_APPOINTMENTS
    WHERE PHYSICIAN_ID = 5
    AND UPPER(APPT_STATUS) = 'COMPLETED';
    
--7. Staff/Physician View: This  report provides a detailed list of all medical appointments that took place at the clinic. It includes the names of the patients, their appointment dates and times, the nature of their concerns, the current status of their cases, and information about the attending physicians.
--   Report is filtered by Physician_ID, Appt_Status = 'Scheduled'
SELECT * 
FROM VW_PHYSICIAN_APPOINTMENTS
    WHERE PHYSICIAN_ID = 1
    AND UPPER(APPT_STATUS) = 'SCHEDULED';
    

--8. Staff/Physica View: This  report provides a detailed list of all medical appointments that took place at the clinic. It includes the names of the patients, their appointment dates and times, the nature of their concerns, the current status of their cases, and information about the attending physicians.
--   Report is filtered by Physician_ID and Appt_Status = 'No Show'
SELECT * FROM VW_PHYSICIAN_APPOINTMENTS
    WHERE PHYSICIAN_ID = 5
    AND UPPER(APPT_STATUS) = 'NO SHOW';
        
            
--9. Staff/Physican View: This  report provides a detailed list of all medical appointments that took place at the clinic. It includes the names of the patients, their appointment dates and times, the nature of their concerns, the current status of their cases, and information about the attending physicians.
--   Report is filtered by Physician_ID and Appt_Status = 'Completed'
SELECT * FROM VW_PHYSICIAN_APPOINTMENTS
       WHERE UPPER(APPT_STATUS) = 'COMPLETED';
       
--10. Staff/Physican View: This report provides a detailed list of patient feedback regarding the clinic's services. It includes a rating system where patients can evaluate their physician on a scale from 1 (lowest) to 5 (highest).
--    The clinic can use these feedbacks to improve its service.
SELECT * FROM  VW_PATIENT_FEEDBACK;


--10b. Staff/Phsician View: Ratings (per physician), (all)
SELECT 
    P.PHY_FNAME || ' ' || P.PHY_LNAME AS "Physician Name"
    ,COUNT(FB_RATE) AS "Rating"
FROM 
    VW_PATIENT_FEEDBACK VW
INNER JOIN 
    APPOINTMENTS A ON A.APPT_ID = VW.APPT_ID 
INNER JOIN 
    PHYSICIAN_INFO P ON A.PHYSICIAN_ID = P.PHYSICIAN_ID
--WHERE 
--    P.PHYSICIAN_ID = 4
GROUP BY 
    P.PHY_FNAME
    ,P.PHY_LNAME;


--10c. Staff/Phsician View:  Total Count and Rate (per physician), (all)
SELECT 
    P.PHY_FNAME || ' ' || P.PHY_LNAME AS "Physician Name"
    ,COUNT(FB_RATE) AS "Rate Count"
    ,FB_RATE AS "Ratings"
FROM 
    VW_PATIENT_FEEDBACK VW
INNER JOIN 
    APPOINTMENTS A ON A.APPT_ID = VW.APPT_ID 
INNER JOIN 
    PHYSICIAN_INFO P ON A.PHYSICIAN_ID = P.PHYSICIAN_ID
WHERE 
    P.PHYSICIAN_ID = 4 
AND 
    FB_RATE IS NOT NULL
GROUP BY 
    P.PHY_FNAME
    ,P.PHY_LNAME
    ,FB_RATE 
ORDER BY P.PHY_FNAME || ' ' || P.PHY_LNAME, "Ratings" DESC;


--11. Admin/Physician View: This report contains the schedules of the clinic's upcoming medical appointments, including the dates, times, and specific physician assigned to each appointment.
SELECT * FROM VW_PHYSICIAN_APPOINTMENTS
    WHERE APPT_TIME_DATE >= SYSDATE
    ORDER BY APPT_TIME_DATE ASC;
    






