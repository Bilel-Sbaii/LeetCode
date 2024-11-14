# Write your MySQL query statement below
select query_name, 
        round(avg(rating/position), 2) "quality",
        round(100*count(case when rating<3 then 1 end)/count(*), 2) "poor_query_percentage" 
from queries
where query_name is not null
group by query_name;