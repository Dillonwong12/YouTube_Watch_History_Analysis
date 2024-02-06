# YouTube Watch History Analysis
![](https://github.com/Dillonwong12/YouTube_Watch_History_Analysis/blob/main/images/tableau_dashboard.gif)

## Visit the [FINAL INTERACTIVE DASHBOARD](https://public.tableau.com/shared/7XQQH4G5S?:display_count=n&:origin=viz_share_link) here!


## Background
I've always been a huge consumer of YouTube videos. Whether it's listening to music, watching video coding tutorials, or simply passing the time, YouTube is an app that I spend a lot of time on.

As such, I decided to analyse my personal YouTube watch history from Jan 2023 to Jan 2024 to answer a few questions:


## Questions
**1. How did my viewing habits change over different periods of the year?**

**2. Which hours of the day did I spend the most time watching YouTube videos?**


## Hypotheses
1. I hypothesized that exam periods and the introduction of a screen time control app (since Jan 2024) might have influenced a decrease in video consumption.
2. As a night owl, I typically watch more YouTube videos in the evenings and at night.


## Pre-processing (Python)
1. Removed watched ads.
2. Filtered out data from before Jan 2023.
3. Adjusted timestamps to accurately represent the times of day depending on my geographical location.
4. String manipulation to clean video titles and extract channel names.
5. Converted from JSON to CSV.


## Data Analysis (SQL and Tableau)
Python was used to programmatically upload the data to an Amazon Web Services (AWS) S3 bucket. Next, I used AWS Athena to perform exploratory data analysis with SQL queries. Finally, I used Tableau to build an interactive dashboard that would allow me to easily answer the questions posed above. 

Here are the results:

1. How did my viewing habits change over different periods of the year?
   
![](https://github.com/Dillonwong12/YouTube_Watch_History_Analysis/blob/main/images/20_day_moving_avg.png)

The 20-day moving average of videos watched line graph showed dips in the number of videos watched during exam periods (in June and Nov 2023), which was reassuring! 

![](https://github.com/Dillonwong12/YouTube_Watch_History_Analysis/blob/main/images/1_month_moving_avg.png)

The monthly average graph displayed a similar pattern.

![](https://github.com/Dillonwong12/YouTube_Watch_History_Analysis/blob/main/images/20_day_moving_avg_Jan_2023.png)

![](https://github.com/Dillonwong12/YouTube_Watch_History_Analysis/blob/main/images/20_day_moving_avg_Jan_2024.png)

Interestingly, the 20-day moving average comparison between Jan 2023 and Jan 2024 showed a reduction of about 200 videos in Jan 2024, suggesting the effectiveness of the screen time control app, but I'll need to collect more data to gain stronger evidence.

2. Which hours of the day did I spend the most time watching YouTube videos?

![](https://github.com/Dillonwong12/YouTube_Watch_History_Analysis/blob/main/images/avg_vids_watched_per_hour.png)

There was a distinct drop in the average number of YouTube videos I watched around 8:00a.m., as I was usually asleep at this time. In contrast, there was a spike in the average number of videos watched around 7:00p.m., which fluctuated around the same level until the early morning. Both observations supported the hypothesis that I tended to watch more YouTube videos towards night time.


## Limitations
1. Google Takeout does not provide video duration, so simply analysing video counts may not yield the most accurate representation of consumption habits.
2. As previously mentioned, I also listen to music on YouTube while working. Thus, separating "non-productive" consumption vs. "productive" consumption would introduce another layer of complexity to the analysis.
