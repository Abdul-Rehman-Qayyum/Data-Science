create database capstone1;
use capstone1;
select * from medical_examinations;

DELETE FROM `medical_examinations`
WHERE Customer_ID IS NULL OR Customer_ID = '';

DELETE FROM `hospitalisation_details`
WHERE Customer_ID IS NULL OR Customer_ID = '';

DELETE FROM `medical_examinations`
WHERE Customer_ID IN (
  SELECT Customer_ID
  FROM (
    SELECT Customer_ID
    FROM `medical_examinations`
    GROUP BY Customer_ID
    HAVING COUNT(*) > 1
  ) AS duplicates
);

DELETE FROM `hospitalisation_details`
WHERE Customer_ID IN (
  SELECT Customer_ID
  FROM (
    SELECT Customer_ID
    FROM `hospitalisation_details`
    GROUP BY Customer_ID
    HAVING COUNT(*) > 1
  ) AS duplicates
);
ALTER TABLE medical_examinations
MODIFY Customer_ID VARCHAR(20);

ALTER TABLE hospitalisation_details 
MODIFY Customer_ID VARCHAR(20);


ALTER TABLE `medical_examinations`
ADD CONSTRAINT pk_medical PRIMARY KEY (Customer_ID);

ALTER TABLE `hospitalisation_details`
ADD CONSTRAINT pk_hospital PRIMARY KEY (Customer_ID);

CREATE VIEW Final_view AS
SELECT 
  m.Customer_ID,
  m.BMI,
  m.HBA1C,
  m.`Heart Issues`,
  m.`Any Transplants`,
  m.`Cancer history`,
  m.`NumberOfMajorSurgeries`,
  m.smoker,
  h.year,
  h.month,
  h.date,
  h.children,
  h.charges,
  h.`Hospital tier`,
  h.`City tier`,
  h.`State ID`
FROM medical_examinations m
JOIN hospitalisation_details h
  ON m.Customer_ID = h.Customer_ID;
  
  
  -- information about people who are diabetic and have heart problems with their average
   -- age, the average number of dependent children, average BMI, and average hospitalization costs
SELECT
    f.Customer_ID,
    f.BMI,
    f.HBA1C,
    f.`Heart Issues`,
    f.children,
    f.charges,
    (2025 - f.year) AS Age,
    -- Overall averages
    ROUND(AVG(f.BMI) OVER (), 2)                AS Average_BMI_all,
    ROUND(AVG(f.children) OVER (), 2)           AS Average_children_all,
    ROUND(AVG(f.charges) OVER (), 2)            AS Average_charges_all,
    ROUND(AVG(2025 - f.year) OVER (), 1)        AS Averagae_age_all
FROM final_view AS f
WHERE f.HBA1C > 6.5        
  AND f.`Heart Issues` = 'Yes';
  
  -- Average hospitalization cost for each hospital tier and each city level
SELECT 
    `Hospital tier`, 
    `City tier`, 
    ROUND(AVG(charges), 2) AS avg_hospitalization_cost
FROM final_view
WHERE `Hospital tier` <> '?' 
  AND `City tier` <> '?'
GROUP BY `Hospital tier`, `City tier`
ORDER BY `Hospital tier`, `City tier`;

--  number of people who have had major surgery with a history of cancer

SELECT 
  COUNT(*) AS No_of_Patients FROM final_view
WHERE (`NumberOfMajorSurgeries` <> 'No major surgery' 
       AND `NumberOfMajorSurgeries` <> '0')
  AND `Cancer history` = 'Yes';


-- number of tier-1 hospitals in each state

SELECT 
  `State ID`,
  COUNT(*) AS No_of_tier1hospitals FROM final_view
WHERE `Hospital tier` = 'tier - 1' 
  AND 'State ID' <> ' ? ' 
GROUP BY `State ID`
ORDER BY No_of_tier1hospitals DESC;

