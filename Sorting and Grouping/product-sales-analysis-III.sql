-- Write your MySQL query statement below
with earliest_sales as (
    select product_id, year, quantity, price, rank() over (
        partition by product_id
        order by year asc
    ) as rnk
    from Sales
    -- group by product_id
)
select product_id, year as first_year, quantity, price
from earliest_sales
where rnk = 1;