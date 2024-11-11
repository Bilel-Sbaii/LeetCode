# Write your MySQL query statement below
select e.name
from employee e
join(
select e1.id
from employee e1
join employee e2
on e1.id=e2.managerId
group by e1.id
having(count(*)>4)
)e0
on e0.id=e.id;