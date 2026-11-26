-- Write your MySQL query statement below
with ordered_persons as (
    select *, row_number() over (
        partition by email
        order by id asc
    ) as rn
    from Person
)
delete from Person
where id in (
    select id
    from ordered_persons
    where rn > 1
);