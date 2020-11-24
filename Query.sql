
select c.*,v.* from T13_CUSTOMER c,T13_VEHICLE v, T13_INCIDENT_REPORT ir
where c.CUST_Id in (select Cust_Id from T13_CLAIM cl where cl.Claim_Status="pending") and c.CUST_Id = v.Cust_Id and c.CUST_Id = ir.Cust_Id;

select c.* from T13_CUSTOMER c where c.Cust_Id in 
( select p.Cust_Id from T13_PREMIUM_PAYMENT p where p.Premium_Payment_Amount >= 
( select avg(Premium_Payment_Amount) from T13_PREMIUM_PAYMENT ));

