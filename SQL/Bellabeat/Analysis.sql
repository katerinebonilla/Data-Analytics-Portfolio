--Calculating number of users and daily averages

--1) Tracking their physical activities
SELECT 
	COUNT(DISTINCT Id) AS users_tracking_activity,
	AVG(TotalSteps) AS average_steps,
	AVG(TotalDistance) AS average_distance,
	AVG(Calories) AS average_calories
FROM 
	bellabeat.dbo.daily_Activity
--2) Tracking heart rate
SELECT 
	COUNT(DISTINCT Id) AS users_tracking_heartRate,
	AVG(Value) AS average_heartrate,
	MIN(Value) AS min_heartrate,
	MAX(Value) AS max_heartrate
FROM 
	bellabeat.dbo.heartrate_seconds
--3) Tracking their Sleep
SELECT 
	COUNT(DISTINCT Id) AS users_tracking_sleep,
	AVG(TotalMinutesAsleep)/60.0 AS average_hours_asleep,
	MIN(TotalMinutesAsleep)/60.0 AS min_hours_asleep,
	MAX(TotalMinutesAsleep)/60.0 AS max_hours_asleep,
	AVG(TotalTimeInBed)/60.0 AS average_hours_inBed
FROM 
	bellabeat.dbo.sleepDay
--4) Tracking their Weight 
SELECT
	COUNT(DISTINCT Id) AS users_tracking_weight,
	AVG(WeightKg) AS average_weight,
	MIN(WeightKg) AS min_weight,
	MAX(WeightKg) AS max_weight
FROM 
	bellabeat.dbo.weightLogInfo