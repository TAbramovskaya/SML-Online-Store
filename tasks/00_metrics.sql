-- CPM (Cost per Mille), CPC (Cost per Click), CTR (Click-Through Rate)

with campaign_info as (
	select 
		min(c.campaign_name) as campaign, 
		round(c.total_spend*1000 / c.impressions, 1) as CPM,
		round(avg(cc.cost_per_click), 4) as CPC, 
		floor(min(c.total_spend) / avg(cc.cost_per_click)) as total_clics,
		min(c.impressions) as total_impressions,
		min(c.total_spend) as total_spend
	from campaigns c 
	left join campaign_clicks cc 
	on c.campaign_id = cc.campaign_id 
	group by c.campaign_id 
	)
select 
	campaign, 
	CPM,  
	CPC, 
	round(total_clics / total_impressions, 4) as CTR
from campaign_info
order by cpm;

/*
Result:
    campaign                     |cpm |cpc   |ctr   |
    -----------------------------+----+------+------+
    Display Banner Campaign      |15.0|0.8376|0.0179|
    Facebook Social Campaign     |20.0|1.4352|0.0139|
    Email Remarketing Campaign   |25.0|0.3318|0.0753|
    YouTube Video Campaign       |25.0|0.7704|0.0325|
    Instagram Influencer Campaign|30.0|1.5533|0.0193|
    Q1 Google Search Campaign    |50.0|3.0174|0.0166|
*/

-- Retention Rate: Day 1, Day 7, Day 30 retention.

with return_users as (
	select 
		retention_from.user_id,
		case 
			when user_sessions.session_start - retention_from.day_0 between interval '1 day' and 2*interval '1 day' then 1
			when user_sessions.session_start - retention_from.day_0 between 7*interval '1 day' and 8*interval '1 day' then 7
			when user_sessions.session_start - retention_from.day_0 between 30*interval '1 day' and 31*interval '1 day' then 30
			else null 
		end as day_N
	from (
		select u.user_id, min(us.session_start) as day_0
		from users u 
		left join user_sessions us 
		on u.user_id = us.user_id 
		group by u.user_id
		) as retention_from
	left join user_sessions
	on retention_from.user_id = user_sessions.user_id
	),
	new_users as (select count(*) as total from users)
select 
	day_N,
	round(count(distinct user_id) / min(new_users.total)::numeric, 2) as retention_rate
from return_users
cross join new_users
group by day_N
having day_N is not null;

/* 
Result:
    day_n|retention_rate|
    -----+--------------+
        1|          0.74|
        7|          0.58|
       30|          0.14|
*/

-- Retention Rate per channel: Day 1, Day 7, Day 30 retention.

with return_users as (
	select 
		retention_from.user_id,
		retention_from.channel,
		case 
			when user_sessions.session_start - retention_from.day_0 between interval '1 day' and 2*interval '1 day' then 1
			when user_sessions.session_start - retention_from.day_0 between 7*interval '1 day' and 8*interval '1 day' then 7
			when user_sessions.session_start - retention_from.day_0 between 30*interval '1 day' and 31*interval '1 day' then 30
			else null 
		end as day_N
	from (
		select 
			u.user_id, 
			u.acquisition_channel as channel,
			min(us.session_start) as day_0
		from users u 
		left join user_sessions us 
		on u.user_id = us.user_id 
		group by u.user_id
		) as retention_from
	left join user_sessions
	on retention_from.user_id = user_sessions.user_id
	),
	new_cohort_users as (
		select 
			acquisition_channel as channel,
			count(user_id) as total 
		from users
		group by users.acquisition_channel),
	channel_n_day_cross_data as (
	select 
		return_users.channel,
		day_N,
		round(count(distinct user_id) / min(new_cohort_users.total)::numeric, 2) as retention_rate
	from return_users
	left join new_cohort_users
	on return_users.channel = new_cohort_users.channel
	group by day_N, return_users.channel
	having day_N is not null
	)
select 
	channel,
	max(case when day_N = 1 then retention_rate end) as day_1,
	max(case when day_N = 7 then retention_rate end) as day_7,
	max(case when day_N = 30 then retention_rate end) as day_30
from channel_n_day_cross_data
group by channel;

/*
Result:
    channel    |day_1|day_7|day_30|
    -----------+-----+-----+------+
    email      | 0.80| 0.70|  0.20|
    social     | 0.58| 0.50|  0.08|
    organic    | 0.80| 0.53|  0.13|
    paid_search| 0.77| 0.62|  0.15|
*/
 
