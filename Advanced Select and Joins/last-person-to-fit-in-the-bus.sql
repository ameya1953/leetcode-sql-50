-- Write your MySQL query statement below
with running_weights as (
    select person_id, person_name, sum(weight) over (order by turn) as total_sum, turn
    from Queue
    
)
select person_name
from running_weights
where total_sum <= 1000
order by turn desc
limit 1;