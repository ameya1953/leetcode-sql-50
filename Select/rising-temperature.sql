# Write your MySQL query statement below
select w2.id
from Weather w1 join Weather w2 
on datediff(w1.recordDate, w2.recordDate) = -1
where w2.temperature > w1.temperature;

-- This is a very important example of self-join, where we are joining the 
-- Weather table to itself to compare the temperature of consecutive days. 
-- The query selects the id of the records from the second instance of the 
-- Weather table (w2) where the temperature is higher than the previous day's 
-- temperature (w1).