-- Write your MySQL query statement below
with user_who_rated_most as (
    select u.user_id, u.name as name, count(m.rating) as no_of_rating
    from Users u join MovieRating m
    on u.user_id = m.user_id
    group by u.user_id
    order by no_of_rating desc, u.name asc
),
movie_with_highest_avg_rating as (
    select m1.movie_id, m1.title as title, avg(m2.rating) as average_rating
    from Movies m1 join MovieRating m2
    on m1.movie_id = m2.movie_id
    where month(m2.created_at) = '02' and year(m2.created_at) = '2020'
    group by m1.movie_id
    order by average_rating desc, m1.title asc
)
select name as results
from (
    select name 
    from user_who_rated_most
    limit 1
) as t1

union all

select title as results 
from (
    select title
    from movie_with_highest_avg_rating
    limit 1
) as t2;