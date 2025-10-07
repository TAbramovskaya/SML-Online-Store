/*
Which channel is the most efficient by CAC (Customer Acquisition Cost)?
Calculate the customer acquisition cost for each channel.
*/

select 
	channels.type as channel,
	round(coalesce(channels.amount / users_acquired.amount, 0), 2) as CAC
from (
	select campaign_type as type, sum(total_spend) as amount
	from campaigns 
	group by campaign_type
	) as channels
left join (
	select acquisition_channel as channel_type, count(user_id) as amount
	from users
	group by acquisition_channel 
	) as users_acquired
on channels.type = users_acquired.channel_type
order by CAC desc;

/*
Result:
    channel|cac    |
    -------+-------+
    social |2250.00|
    email  | 500.00|
    search |   0.00|
    display|   0.00|

Comments:
According to the data, new users are most effectively acquired through social media. 
However, there are some inconsistencies in the data that may cause the results to 
inaccurately reflect the actual situation.

Among the acquisition channels in the `users` table, there is "organic" one. It can be 
assumed that this means there is no direct link recorded between these users and 
any acquisition campaigns, and therefore no costs were incurred to acquire them.

Let’s look at the number of users (amount) acquired through the different channels.
*/ 

select acquisition_channel as channel, count(user_id) as amount
from users
group by acquisition_channel 
order by amount desc;

/*
Result:
    channel    |amount|
    -----------+------+
    organic    |    15|
    paid_search|    13|
    social     |    12|
    email      |    10|

As we can see, non-organic users still make up the majority (35). Nevertheless, 
30% of users (15 out of 50) were acquired through indirect (combined) marketing efforts. 
The effectiveness of display campaigns cannot be directly assessed, since no users 
are recorded as having visited the site directly after seeing an ad. However, it can 
be assumed that part of the organic user acquisition is related to this channel.

It should also be noted that if we consider the "paid_search" acquisition channel in 
the `users` table as identical to the "search" channel type in the `campaigns` table, 
the results would differ slightly. However, acquiring users through social media 
remains the most effective channel.
*/

select 
	channels.type as channel,
	round(coalesce(channels.amount / users_acquired.amount, 0), 2) as CAC
from (
	select campaign_type as type, sum(total_spend) as amount
	from campaigns 
	group by campaign_type
	) as channels
left join (
	select 
		case 
			when acquisition_channel like '%search%' then 'search'
			else acquisition_channel
		end as channel_type, 
		count(user_id) as amount
	from users
	group by acquisition_channel 
	) as users_acquired
on channels.type = users_acquired.channel_type
order by CAC desc;

/*
    Result: 
    channel|cac    |
    -------+-------+
    social |2250.00|
    search |1923.08|
    email  | 500.00|
    display|   0.00|
*/
