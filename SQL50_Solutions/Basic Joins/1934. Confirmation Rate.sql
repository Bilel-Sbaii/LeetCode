select combined.user_id,
    case 
        when (count(case when combined.action="timeout"then 1 end)+
            count(case when combined.action="confirmed" then 1 end)=0)
        then 0
        else
            round(
                count(case when combined.action="confirmed" then 1 end)/
                (count(case when combined.action="timeout"then 1 end)+
                count(case when combined.action="confirmed" then 1 end)),
                2)
        end as "confirmation_rate"
from(
    select s.user_id, c.action
    from signups s
    left join confirmations c
    on c.user_id=s.user_id and c.action="confirmed"
    union all
    select s.user_id, c.action
    from signups s
    left join confirmations c
    on c.user_id=s.user_id and c.action="timeout"
)as combined
group by combined.user_id