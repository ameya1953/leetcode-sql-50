-- Write your MySQL query statement below
with latest_date_less_than_equal_to_16 as (
    select product_id, max(change_date) as max_date
    from Products
    where change_date <= '2019-08-16'
    group by product_id
),
products_with_date_less_than_or_equal_to_16 as (
    select l.product_id, p.new_price
    from Products p join latest_date_less_than_equal_to_16 l
    on p.product_id = l.product_id
    and p.change_date = l.max_date
),
products_with_date_more_than_16 as (
    select product_id, 10 as new_price
    from Products
    where product_id not in (
        select product_id from products_with_date_less_than_or_equal_to_16
    )
)
select product_id, new_price as price
from products_with_date_less_than_or_equal_to_16
union
select product_id, new_price as price
from products_with_date_more_than_16;