select round(
        100*count(case when d.order_date=d.customer_pref_delivery_date then 1 end)/
        count(*),2
        ) as "immediate_percentage"
from(
    select d1.customer_id,d1.order_date,d1.customer_pref_delivery_date
    from delivery d1
    join(
        select customer_id, min(order_date) "min_order_date"
        from delivery
        group by customer_id
    )d2
    on d2.customer_id=d1.customer_id and d1.order_date=d2.min_order_date
)d
;