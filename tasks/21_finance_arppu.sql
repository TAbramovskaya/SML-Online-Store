/*
ARPU vs ARPPU: How do these metrics change month by month? What share of users make purchases?
*/

/*
Let's first calculate ARPU and ARPPU:
*/

select
	extract('month' from order_date) as month_number,
	round(sum(total_amount) / (select count(*) from users), 1) as ARPU,
	round(sum(total_amount) / count(distinct user_id), 1) as ARPPU
from orders 
where status = 'completed'
group by extract('month' from order_date);
  
/*
Result:
    month_number|arpu |arppu |
    ------------+-----+------+
               1|620.9|1940.4|
               2|803.5|1385.4|
               3|745.3|1242.1|

To the new users per month:
*/

with completed_orders as (
	select 
		user_id, 
		order_id 
	from orders 
	where status = 'completed'
)
select 
	extract('month' from registration_date) as month_number,
	count(distinct u.user_id) as new_users,
	count(distinct co.user_id) as active_user
from users u
left join completed_orders co
on u.user_id = co.user_id
group by extract('month' from registration_date);

/*
Result:
    month_number|new_users|
    ------------+---------+
               1|       20|
               2|       20|
               3|       10|
*/

