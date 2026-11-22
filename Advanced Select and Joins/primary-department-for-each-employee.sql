-- Write your MySQL query statement below
with emp_with_primary_dept as (
    select employee_id, department_id
    from Employee
    where primary_flag = 'Y'
),
emp_not_with_primary_dept as (
    select employee_id, department_id
    from Employee
    where primary_flag = 'N' and employee_id not in (
        select employee_id from emp_with_primary_dept
    )
)
select * from emp_with_primary_dept
union
select * from emp_not_with_primary_dept;