-- Write your MySQL query statement below
with first_login_table as (
    select player_id, event_date, row_number() over (
        partition by player_id
        order by event_date
    ) as rn
    from Activity
)
select round(count(distinct a.player_id)/(select count(distinct player_id) from Activity),2) as fraction
from first_login_table f join Activity a
on f.player_id = a.player_id
and a.event_date = date_add(f.event_date, interval 1 day)
where f.rn = 1;