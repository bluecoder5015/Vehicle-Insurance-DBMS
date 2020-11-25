-- query 1
select c.*,v.* from T13_CUSTOMER c,T13_VEHICLE v, T13_INCIDENT_REPORT ir
where c.CUST_Id in (select Cust_Id from T13_CLAIM cl where cl.Claim_Status="pending")and c.CUST_Id = v.Cust_Id and v.Vehicle_Id = ir.Vehicle_Id;

-- query 2
select c.* from T13_CUSTOMER c
where (select sum(pp.Premium_Payment_Amount) from T13_PREMIUM_PAYMENT pp, T13_VEHICLE v where c.CUST_Id = v.Cust_Id and v.Vehicle_Id = pp.Vehicle_Id) > 
(select sum(trim(leading 'T13' from cc.CUST_Id)) from T13_CUSTOMER cc);

-- query 3
select c.* from T13_INSURANCE_COMPANY c
where (select count(p.Product_Number) from T13_PRODUCT p where c.Company_Name = p.Company_Name) > (select count(d.Department_Name) from T13_DEPARTMENT d where c.Company_Name = d.Company_Name);

-- query 4
select c.* from T13_CUSTOMER c
where (select count(v.Cust_Id) from T13_VEHICLE v, T13_PREMIUM_PAYMENT pp, T13_INCIDENT_REPORT ir where c.CUST_Id = v.Cust_Id and v.Vehicle_Id = pp.Vehicle_Id and pp.Payment_Status = 'Not Paid' and v.Vehicle_Id = ir.Vehicle_Id and ir.Incident_Type = 'Accident') >= 1;

-- query 5
select v.* from T13_VEHICLE v, T13_PREMIUM_PAYMENT pp
where v.Vehicle_Id = pp.Vehicle_Id and pp.Premium_Payment_Amount > v.Vehicle_Number;

-- query 6
select c.* from T13_CUSTOMER c, T13_CLAIM_SETTLEMENT cs, T13_CLAIM cl, T13_COVERAGE cv
where c.CUST_Id = cs.Cust_Id and cs.Claim_Id = cl.Claim_Id and cs.Coverage_Id = cv.Coverage_Id and cl.Claim_Amount < cv.Coverage_Amount and 
cl.Claim_Amount > (cast(trim(leading 'T13' from cs.Claim_Settlement_Id) as SIGNED) + cast(trim(leading 'T13' from cs.Vehicle_Id) as SIGNED) + cast(trim(leading 'T13' from cs.Claim_Id) as SIGNED) + cast(trim(leading 'T13' from cs.Cust_Id) as SIGNED)); 
