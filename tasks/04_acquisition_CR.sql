/*
 Quality vs Quantity: Compare traffic volume and conversion to purchases.
 */

with traffic_conversion as (
	select
		purchases.user_id,
		purchases.amount * 1.0 / traffic.amount as conversion_rate
	from (
		select
			user_id,
			count(order_id) as amount
		from orders
		group by user_id
		) as purchases
	inner join (
		select
			user_id,
			count(session_id) as amount
		from user_sessions
		group by user_id
		) as traffic
	on
		purchases.user_id = traffic.user_id)
select 
	users.acquisition_channel, 
	round(min(tc.conversion_rate), 2) as min_CR, 
	round(max(tc.conversion_rate), 2) as max_CR, 
	round(avg(tc.conversion_rate), 2) as avg_CR
from users 
inner join traffic_conversion as tc
on users.user_id = tc.user_id 
group by users.acquisition_channel;

/*
Result: 

acquisition_channel|min_cr|max_cr|avg_cr|
-------------------+------+------+------+
email              |  0.05|  0.25|  0.13|
organic            |  0.07|  0.27|  0.16|
social             |  0.05|  0.25|  0.15|
paid_search        |  0.03|  0.20|  0.13|

The ratio of the number of user orders to the number of user sessions 
is very consistent across different user acquisition channels. We also 
observe a similar level of consistency in the extreme values of this metric.
*/
