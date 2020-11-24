
select c.*,v.* from T13_CUSTOMER c,T13_VEHICLE v where c.CUST_Id in (select Cust_Id from T13_CLAIM cl where cl.Claim_Status="pending");
