-- Show patient_id, weight, height, isObese from the patients table.
-- Display isObese as a boolean 0 or 1.
-- Obese is defined as weight(kg)/(height(m)2) >= 30.
-- weight is in units kg.
-- height is in units cm.
-- If you divide an int by an int you will get an int. Dividing an int by a float will return a float.
-- That's why you have to divide by 100.0 and not 100.

select patient_id,weight, height,
case when weight/((height/100.0)*(height/100.0)) >= 30 then 1 else 0 end as isObese
 from patients
