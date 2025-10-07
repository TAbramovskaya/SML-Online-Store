/*
Task: Which channel brings the highest LTV (Lifetime Value)?
Compare 30-day customer value across acquisition channels.
*/

with first_30_days as (
	select retention_from.user_id,
		case 
			when orders.order_timestamp - retention_from.day_0 <= 30*interval '1 day' then orders.total_amount 
			else null 
		end as amount
	from (
		select u.user_id, min(us.session_start) as day_0
		from users u 
		left join user_sessions us 
		on u.user_id = us.user_id 
		group by u.user_id
		) as retention_from
	left join orders
	on retention_from.user_id = orders.user_id
	) 
select 
	users.acquisition_channel as channel, 
	round(sum(first_30_days.amount) / count(distinct first_30_days.user_id), 4) as LTV_30d
from first_30_days
left join users
on first_30_days.user_id = users.user_id 
where amount is not null
group by users.acquisition_channel 
order by LTV_30d desc;

/*
Result:
    channel    |ltv_30d  |
    -----------+---------+
    email      |2483.7113|
    organic    |1989.1242|
    social     |1917.6690|
    paid_search|1669.8075|

Although users acquired via email show the highest 30-day LTV, given the dataset size, 
we can conclude that the 30-day LTV across different acquisition channels 
does not differ significantly.
*/
