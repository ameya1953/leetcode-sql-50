-- Write your MySQL query statement below
select s1.id, (case 
when s1.id % 2 != 0 and s2.id % 2 = 0 and s1.id < s2.id then s2.student 
when s1.id % 2 = 0 and s2.id % 2 != 0 and s1.id > s2.id then s2.student
else s1.student end) as student
from Seat s1 
left join Seat s2 
on (s1.id % 2 != 0 and s2.id = s1.id + 1) or (s1.id % 2 = 0 and s2.id = s1.id - 1);