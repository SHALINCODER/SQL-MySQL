use functions;

select * from employee;

WITH avgSalary AS (
    SELECT AVG(salary) AS empAvgSala
    FROM employee
)
SELECT e.*
FROM employee e, avgSalary a
WHERE e.salary > a.empAvgSala;



with EmployeeOrder as (
select e.empid, e.name, e.deaprtment, count(o.o_id) as orderCount
from employee e join ordertable o
on e.empid = o.E_id
group by o.E_id)
select * from EmployeeOrder
where orderCount >=2;

