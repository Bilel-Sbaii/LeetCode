# Write your MySQL query statement below
select p.product_id,case 
                        when(count(case when u.product_id is not null and 
                                u.purchase_date between p.start_date and p.end_date then 1 end)=0
                            )
                        then 0
                        else
                            round(
                                sum(case 
                                        when u.product_id is not null and 
                                            u.purchase_date between p.start_date and
                                            p.end_date 
                                        then p.price*u.units else null end 
                                )/sum(case 
                                        when u.product_id is not null and 
                                            u.purchase_date between p.start_date and
                                            p.end_date 
                                        then u.units else null end 
                                )
                            ,2)
                        end as "average_price"
                            
from Prices p
left join UnitsSold u
on p.product_id=u.product_id
group by p.product_id;