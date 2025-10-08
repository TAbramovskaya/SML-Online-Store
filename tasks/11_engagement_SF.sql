/*
How do DAU/MAU and the Sticky Factor change by month? Is there seasonality?
*/

select 
	to_char(monthly_active_users.session_month, 'yyyy-mm') as month,
	round(sum_daily_active_users.sum_DAU / 
		(monthly_active_users.MAU * 
		extract('day' from (sum_daily_active_users.session_month + interval '1 month - 1 day'))), 4) as SF
from (
	select 
		date_trunc('month', session_date) as session_month, 
		count(distinct user_id) as MAU
	from user_sessions us
	group by date_trunc('month', session_date)
	) as monthly_active_users
inner join (
	select 
		date_trunc('month', daily.session_date) as session_month,
		sum(daily.DAU) as sum_DAU
	from (
	select session_date, count(distinct user_id) as DAU
	from user_sessions us
	group by session_date
	) as daily
	group by date_trunc('month', daily.session_date)
	) as sum_daily_active_users
on monthly_active_users.session_month = sum_daily_active_users.session_month 

/*
Result:
month  |sf    |
-------+------+
2024-01|0.3532|
2024-02|0.3543|
2024-03|0.2948|

I don’t observe any significant difference in SF across the months.
*/
