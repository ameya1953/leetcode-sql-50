-- Write your MySQL query statement below
with customers_updated as (
    select customer_id, count(distinct product_key) as number_of_unique_items_bought
    from Customer
    group by customer_id
)
select customer_id
from customers_updated
where number_of_unique_items_bought = (select count(*) from Product);