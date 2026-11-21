-- Write your MySQL query statement below
with courses_cte as (
    select class, count(*) as number_of_students
    from Courses
    group by class
)
select class
from courses_cte
where number_of_students >= 5;