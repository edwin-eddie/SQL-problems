# SQL Practice for Hospital Dataset: 50 Qyestions

#Login into https://www.sql-practice.com/
  
#1) Show unique birth years from patients and order them by ascending.
SELECT distinct(year(birth_date)) FROM patients order by birth_date;
