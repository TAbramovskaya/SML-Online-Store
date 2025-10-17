/*
Where is the best ROMI (Return on Marketing Investment)?
Analyze marketing ROMI by campaign type.
*/

/*
Comment: 
The `orders` table has a `campaign_id` field, but its contents (mostly nulls) 
do not allow analyzing ROMI based on it. Therefore, I decided to estimate ROMI 
by campaigns using the acquisition channel of the user who placed the order. 
In this case, it is still not possible to evaluate all campaign types due to 
inconsistencies in the naming. I chose to treat the "search" type as "paid_search".
*/

with spend as (
	select
		campaign_type as channel,
		sum(total_spend) as amount
	from campaigns
	group by campaign_type
	),
	orders_by_channels as (
	select
		case
			when users.acquisition_channel like '%search%' then 'search'
			else users.acquisition_channel
		end as channel,
		orders.total_amount as amount
	from orders
	left join users
	on orders.user_id = users.user_id
	),
	revenue as (
	select
		channel,
		sum(amount) as amount
	from orders_by_channels
	group by channel
	)
select
	coalesce(spend.channel, revenue.channel) as channel,
	round((coalesce(revenue.amount, 0) - coalesce(spend.amount, 0))*100 / coalesce(spend.amount, 100), 4) as "ROMI(%)"
from spend
full join revenue
on spend.channel = revenue.channel
order by "ROMI(%)" desc;

/*
Result:
    channel|ROMI(%) |
    -------+--------+
    organic|    null|    
	email  |427.8926|
    social |-11.0053|
    search |  3.3585|
    display|    -100|

Since we cannot assess the indirect costs of the "organic" acquisition channel, 
we will consider it free and therefore the most effective in terms 
of return on investment. 

For the "display" channel, no users were recorded, which formally makes it 
completely unprofitable. However, before deciding to discontinue this acquisition 
channel, it is important to verify whether there was a communication issue or 
data loss related to this channel.

Such a significantly higher ROMI for user acquisition via email is due to the 
low costs associated with this type of acquisition, while the revenue across 
all channels differs only slightly.
If we replace the main select in the query above with this one:

select
	coalesce(spend.channel, revenue.channel) as channel,
	revenue.amount as revenue,
	spend.amount as spend
from spend 
full join revenue
on spend.channel = revenue.channel

we will get 

channel|revenue |spend   |
-------+--------+--------+
email  |26394.63| 5000.00|
social |24028.58|27000.00|
search |25839.62|25000.00|
display|        |38000.00|
organic|35858.35|        |

Now the reason for such a significant difference in ROMI is obvious.
*/
