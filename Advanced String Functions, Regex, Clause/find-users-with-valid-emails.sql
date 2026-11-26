-- Write your MySQL query statement below

-- My attempt: It is giving error that @leetcode.COM is being allowed by the query which is not required by the question.
select user_id, name, mail
from Users
where mail like '%@leetcode.com' and mail regexp ('^[A-Za-z][A-Za-z0-9_.-]*@leetcode[.]com$');

-- Solution which I took from AI:
select user_id, name, mail
from Users
where regexp_like(
    mail,
    '^[A-Za-z][A-Za-z0-9_.-]*@leetcode[.]com$',
    'c'
);