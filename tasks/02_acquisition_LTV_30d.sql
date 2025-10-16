/*
Which channel brings the highest LTV (Lifetime Value)?
Compare 30-day customer value across acquisition channels.
*/

with first_30_days as (
	select 
		users.user_id,
        users.acquisition_channel as channel,
        orders.total_amount as amount
    from users
    inner join orders
    on users.user_id = orders.user_id and
	    orders.order_timestamp - users.registration_date <= 30 * INTERVAL '1 day' and
		orders.status = 'completed'
)
select 
	first_30_days.channel as channel,
    round(sum(first_30_days.amount) / count(DISTINCT first_30_days.user_id), 4) as LTV_30d
from first_30_days
group by first_30_days.channel
order by LTV_30d desc;

/*
Result:
    channel    |ltv_30d  |
    -----------+---------+
    email      |2458.7125|
    organic    |1830.0475|
    social     |1816.7720|
    paid_search|1752.6100|

Although users acquired via email show the highest 30-day LTV, given the dataset size, 
we can conclude that the 30-day LTV across different acquisition channels 
does not differ significantly.
*/
