-- Write your MySQL query statement below
with ranked_employees as (
    select *, dense_rank() over (
        partition by departmentId
        order by salary desc
    ) as rnk
    from Employee
    -- group by departmentId
)
select d.name as Department, r.name as Employee, r.salary as Salary
from ranked_employees r join Department d
on r.departmentId = d.id
where rnk <= 3
order by Salary desc;