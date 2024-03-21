--Determine Time when users were mostly active
SELECT 
	DISTINCT(CAST(ActivityHour AS TIME))AS activity_time,
	AVG(TotalIntensity) OVER(PARTITION BY DATEPART(HOUR,ActivityHour)) AS average_intesity,
	AVG(CAST(METs AS INT)/10.0) OVER(PARTITION BY DATEPART(HOUR,ActivityHour)) AS average_METs

FROM bellabeat.dbo.hourly_activity AS hourly_activity
JOIN bellabeat.dbo.minuteMETsNarrow AS METs
ON 
	hourly_activity.Id =METs.Id AND
	hourly_activity.ActivityHour= Mets.ActivityMinute
ORDER BY 
	average_intesity DESC