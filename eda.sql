/*
This file contains the SQL code used to perform exploratory data analysis of the watched YouTube 
videos with AWS Athena.
*/

-- Create the table from the CSV file in the S3 bucket
CREATE EXTERNAL TABLE IF NOT EXISTS `default`.`videosdb` (
  `title` string,
  `date` date,
  `time` string,
  `channel` string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'serialization.format' = ',',
 'field.delim' = ','
)
LOCATION 's3://aws-s3-projects-bucket/projects/youtube_watch_history'
TBLPROPERTIES ('skip.header.line.count'='1')
;

-- Show all the data
SELECT * FROM videosdb;

-- Count the number of entries
SELECT count(*) AS total_videos FROM videosdb;

-- Count the number of videos watched in each month of the timeframe 
SELECT YEAR(videosdb.date) AS year, MONTH(videosdb.date) AS month, COUNT(*) AS total_vids_watched
FROM videosdb
GROUP BY YEAR(videosdb.date), MONTH(videosdb.date)
ORDER BY year, month;

-- Calculate the average number of videos watched in each hour of every day
SELECT hour_of_day, AVG(total_vids_watched) AS average_vids_watched
FROM 
    (SELECT MONTH(videosdb.date) AS month_value, DAY(videosdb.date) AS day_value, HOUR(CAST(videosdb.time AS TIME)) AS hour_of_day, COUNT(*) AS total_vids_watched
    FROM videosdb
    GROUP BY MONTH(videosdb.date), DAY(videosdb.date), HOUR(CAST(videosdb.time AS TIME)))
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- Calculate the top 10 hours of day with the highest average number of videos watched, split by month
SELECT year_value, month_value, hour_of_day, AVG(total_vids_watched) AS average_vids_watched
FROM 
    (SELECT YEAR(videosdb.date) AS year_value, MONTH(videosdb.date) AS month_value, DAY(videosdb.date) AS day_value, HOUR(CAST(videosdb.time AS TIME)) AS hour_of_day, COUNT(*) AS total_vids_watched
    FROM videosdb
    GROUP BY YEAR(videosdb.date), MONTH(videosdb.date), DAY(videosdb.date), HOUR(CAST(videosdb.time AS TIME)))
GROUP BY year_value, month_value, hour_of_day
ORDER BY average_vids_watched DESC, year_value, month_value
LIMIT 10;

-- Display the top 10 most watched channels
SELECT channel, COUNT(*) AS total_vids_watched
FROM videosdb
GROUP BY channel
ORDER BY total_vids_watched DESC
LIMIT 10;