--Calculate the numeber of days each user tracked physical activity 

SELECT 
	Id,
	COUNT(ActivityDate) OVER (PARTITION BY Id) AS days_activity_recorded
FROM 
	bellabeat.dbo.daily_Activity
ORDER BY
	days_activity_recorded DESC
--Calculate average minutes for each actitivy 
SELECT 
	ROUND(AVG(VeryActiveMinutes),2) AS AverageVeryActiveMinutes,
	ROUND(AVG(FairlyActiveMinutes),2) AS AverageFairlyActiveMinutes,
	ROUND(AVG(LightlyActiveMinutes)/60,2) AS AverageLightlyActiveHours,
	ROUND(AVG(SedentaryMinutes)/60,2) AS AverageSedentaryHours
FROM 
	bellabeat.dbo.daily_Activity

