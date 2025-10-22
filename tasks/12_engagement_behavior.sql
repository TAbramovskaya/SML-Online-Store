/*
Device segmentation: Does user behavior differ between mobile and desktop devices?
*/

select 
	device_type, 
	count(session_id) as sessions,
	floor(avg(session_duration_minutes) / 60) || ' hour ' 
		|| round(mod(avg(session_duration_minutes), 60)) || ' minutes' 
		as average_duration_minutes
from user_sessions 
group by device_type 

/*
Result:
device_type|sessions|average_duration_minutes|
-----------+--------+------------------------+
mobile     |     649|1 hour 8 minutes        |
desktop    |     372|1 hour 3 minutes        |
tablet     |      66|1 hour 4 minutes        |

Although the mobile app is used twice as often as the desktop version, 
the average session duration is roughly the same across all devices. 
We can assume that the observed difference in usage frequency between 
devices is not related to the quality of our service on different device 
types, but rather to individual user preferences.

As the next step in analyzing differences in user behavior across devices, 
we should examine what share of orders is placed from each type of device. 
This will allow us to indirectly assess the convenience of viewing the cart, 
placing an order, and completing the payment process on different device types.

*/
