-- Write your MySQL query statement below
with id_counter as (
    select requester_id as id
    from RequestAccepted
    union all
    select accepter_id as id
    from RequestAccepted
)
select id, count(id) as num
from id_counter
group by id
order by num desc
limit 1;