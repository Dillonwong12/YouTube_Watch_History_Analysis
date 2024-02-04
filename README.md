# YouTube Watch History Analysis
![](https://github.com/Dillonwong12/YouTube_Watch_History_Analysis/blob/main/images/tableau_dashboard.gif)

## Visit the [FINAL INTERACTIVE DASHBOARD](https://public.tableau.com/shared/7XQQH4G5S?:display_count=n&:origin=viz_share_link) here!


## Background
I've always been a huge consumer of YouTube videos. Whether it's listening to music, watching video coding tutorials, or simply passing the time, YouTube is an app that I spend a lot of time on.

As such, I decided to analyse my personal YouTube watch history from Jan 2023 to Jan 2024 to answer a few questions:


## Questions
1. How did my viewing habits change over different periods of the year?
2. Which hours of the day did I spend the most time watching YouTube videos?


## Hypotheses
1. I (hopefully) tend to watch fewer videos around exam periods. I have also recently downloaded a mobile app to limit my screen time (since Jan 2024), so this may have subsequently helped to reduce my video consumption.
2. As a night owl, I typically watch more YouTube videos in the evenings and at night.


## Pre-processing
1. Removed watched ads.
2. Filtered out data from before Jan 2023.
3. Modified timestamps to accurately represent the times of day depending on my geographical location.
4. String manipulation to clean video titles and extract channel names.
5. Converted to CSV.


## Data Analysis
Python was used to programatically upload the data to an Amazon Web Services (AWS) S3 bucket. Next, I used AWS Athena to perform exploratory data analysis with SQL queries. Finally I used Tableau to build an interactive dashboard that would allow me to easily answer the questions posed above. Here are the results:

1. How did my viewing habits change over different periods of the year?
   
![](https://github.com/Dillonwong12/YouTube_Watch_History_Analysis/blob/main/images/20_day_moving_avg.png)

The 20-day moving average of videos watched line graph showed dips in the number of videos watched during exam periods (in June and Nov 2023), which was reassuring! 

![](https://github.com/Dillonwong12/YouTube_Watch_History_Analysis/blob/main/images/1_month_moving_avg.png)

Similarly, the monthly average graph of videos watched displayed the same pattern, albeit with less granularity.

![](https://github.com/Dillonwong12/YouTube_Watch_History_Analysis/blob/main/images/20_day_moving_avg_Jan_2023.png)

![](https://github.com/Dillonwong12/YouTube_Watch_History_Analysis/blob/main/images/20_day_moving_avg_Jan_2024.png)

Interestingly, when comparing the 20-Day moving average graphs of videos watched between Jan 2023 and Jan 2024 (I had installed the screen time control app at the beginning of 2024), I found that I had watched about 200 fewer videos in Jan 2024 than I had in Jan 2023. This seems to show that the app is working to reduce my mindless consumption, but I'll need to collect more data to gain stronger evidence of its efficacy.

2. Which hours of the day did I spend the most time watching YouTube videos?

![](https://github.com/Dillonwong12/YouTube_Watch_History_Analysis/blob/main/images/avg_vids_watched_per_hour.png)

There was a distinct drop in the average number of YouTube videos I watched around 8:00a.m., as I was usually asleep at this time. In contrast, there was a spike in the average number of videos watched around 7:00p.m., which fluctuated around the same level until the early morning. Both observations supported the hypothesis that I tended to watch more YouTube videos towards night time.


## Limitations
1. Google Takeout does not provide video duration, so simply analysing video counts may not be the most accurate representation of consumption habits.
2. As previously mentioned, I also listen to music on YouTube while working. Thus, it is difficult to separate "non-productive" consumption vs. "productive" consumption.
