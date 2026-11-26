-- Write your MySQL query statement below
with ranked_employees as  (
    select *, dense_rank() over (
        order by salary desc
    ) as rnk
    from Employee
)
select (
    select salary
    from ranked_employees
    where rnk = 2
    limit 1
) as SecondHighestSalary;