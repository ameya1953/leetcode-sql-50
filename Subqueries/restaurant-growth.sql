-- Write your MySQL query statement below
with daily_amount as (
    select visited_on, sum(amount) as daily_amount
    from Customer
    group by visited_on
),
running_amount as (
    select visited_on, sum(daily_amount) over (
        order by visited_on
    ) as total_amount
    from daily_amount
)
select 
t1.visited_on, 
(t1.total_amount - coalesce(t2.total_amount, 0)) as amount, 
round((t1.total_amount - coalesce(t2.total_amount, 0)) / 7, 2) as average_amount
from running_amount t1 
left join running_amount t2 
on t2.visited_on = date_sub(t1.visited_on, interval 7 day)
where t1.visited_on >= (
    select date_add(min(visited_on), interval 6 day)
    from Customer
)
order by t1.visited_on;