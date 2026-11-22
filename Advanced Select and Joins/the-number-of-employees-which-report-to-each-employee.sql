-- Write your MySQL query statement below
with no_of_reports as (
    select count(*) as reports_count, reports_to, round(avg(age),0) as average_age
    from Employees
    where reports_to is not null
    group by reports_to
)
select e.employee_id, e.name, n.reports_count, n.average_age
from Employees e join no_of_reports n
on e.employee_id = n.reports_to
where n.reports_to is not null
order by e.employee_id;