/*
Which channel is the most efficient by CAC (Customer Acquisition Cost)?
Calculate the customer acquisition cost for each channel.
*/

/*
Comments:
The `campaigns` table contains information on four acquisition channels: "display", 
"email", "search", and "social".
According to the data, there are some inconsistencies in the data that may cause the 
results to  inaccurately reflect the actual situation. Among the acquisition channels 
in the `users` table, there is "organic" one. It can be  assumed that this means there 
is no direct link recorded between these users and  any acquisition campaigns, and 
therefore no costs were incurred to acquire them. 

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
30% of users (15 out of 50) were acquired through indirect (combined) marketing efforts 
("organic" channel). The acquisition channel labeled "organic does not involve any 
direct spending — therefore, its CAC equals zero. Since a third of users were acquired 
through this channel, it can be considered the most efficient one. However, it should be 
noted that all other acquisition channels indirectly influence the organic channel, 
so it cannot be analyzed in isolation. 
The extent to which other channels affect organic acquisition is a promising topic for 
further exploration.
The effectiveness of "display" campaigns cannot be directly assessed, since no users 
are recorded as having visited the site directly after seeing an ad. However, it can 
be assumed that part of the organic user acquisition is related to this channel.

We are going to consider the "paid_search" acquisition channel in  the `users` table as 
identical to the "search" channel type in the `campaigns` table. 
*/

select 
	channels.type as channel,
	round(channels.amount / users_acquired.amount, 2) as CAC
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
order by CAC;

/*
    Result: 
    channel|cac    |
    -------+-------+
    email  | 500.00|
	search |1923.08|
	social |2250.00|
    display|   null|

Thus, since it is currently not possible to determine how various acquisition channels 
influence organic acquisition, we will treat "organic" as the most effective channel 
with zero cost — though this question clearly deserves further study.
Among the channels for which CAC could be directly calculated, the most effective is "email".
For the display channel, the absence of data on acquired users indicates an imperfection 
in data collection from the platforms where ads were placed. To fill this gap, 
it would be useful to improve feedback both from advertising platforms and from new users 
(e.g., through surveys).

*/
