/*
ARPU vs ARPPU: How do these metrics change month by month? What share 
of users make purchases?
*/

/*
Below we calculate the monthly ARPU and ARPPU values, the average monthly 
order value, and the share of paying users among all users registered to date.
*/

with monthly_registrations as (
	select
		extract('month' from registration_date) as month_id,
		count(*) as monthly_count
	from users
	group by extract('month' from registration_date)
	),
	running_total_registrations as (
	select
		month_id,
		monthly_count,
		sum(monthly_count) over (order by month_id) as running_total
	from monthly_registrations
	order by month_id
	)
select
	extract('month' from order_date) as month_number,
	round(sum(total_amount) / (select count(*) from users), 1) as ARPU,
	round(sum(total_amount) / count(distinct orders.user_id), 1) as ARPPU,
	round(count(distinct orders.user_id) / min(rt.running_total), 2) as paying_user_rate
from orders
left join running_total_registrations rt
on extract('month' from order_date) = rt.month_id
where orders.status = 'completed'
group by extract('month' from order_date);
  
/*
Result:
		month_number|arpu |arppu |avg_order_amount|paying_user_rate|
		------------+-----+------+----------------+----------------+
		           1|620.9|1940.4|            1071|            0.80|
		           2|803.5|1385.4|             758|            0.73|
		           3|745.3|1242.1|             745|            0.60|


We can see that ARPU, ARPPU, the share of paying users and the average order value 
are declining. Attention should be paid to the issue of user retention — 
the current data suggest that retaining users has not been very successful so far. 
The drop in the average order value, even with active user acquisition, 
indicates a need to stimulate users to make their first purchase. This can be 
achieved through initiatives such as first-order discounts, free delivery guarantees, 
or similar incentives that encourage users to explore the product range and take 
advantage of the welcome offer.
*/

