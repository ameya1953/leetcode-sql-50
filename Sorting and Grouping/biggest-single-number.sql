-- Write your MySQL query statement below
with num_with_count as (
    select num, count(*) as freq
    from MyNumbers
    group by num
    order by num desc
)
select (
    select num
    from num_with_count
    where freq = 1
    limit 1
) as num;
-- concept -> scalar subqueries