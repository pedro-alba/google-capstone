# google-capstone

**Scenario**
You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your
team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and  professional data visualizations.

**Business Task Question**

1. How do annual members and casual riders use Cyclistic bikes differently?
</aside>

This case study is referent to the Google Data Analytics Certificate, and the goal is to answer the business question using, in a real-world-like scenario, the data analysis skillset, perfomed as a junior data analyst.

### Asking

The business task is essentially to find out how the types of member differ from each other, in order to design efficient marketing strategies to convert casual members to annual membership.

The first question would be “are annual members really more profitable?” or why that is, but the scenario already suggests the finance team has pretty good explanations for that, so lets consider it truth. 

### Preparing and processing

The dataset used  is provided by Motivate International Inc. It can be found [HERE](https://divvy-tripdata.s3.amazonaws.com/index.html) and is available under [THIS](https://ride.divvybikes.com/data-license-agreement) license. It contains no personal information. I chose to work with one full year - 2022, which is twelve files.

I prepared a way to import and bind the different .csv files.

The files contain 14 columns: ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual. The total row count was, initially, 5,667,717. Thats more than Excel can handle - which is 1,048,576 rows - so I used RStudio for this particular analysis. 

Cleaned the names, and removed multiple missing values. Removed the duplicates(there were no identic row by ride_id, but I noticed what I guess are rides registred two times, with different ids.

Turned the columns member_casual and rideable_types into factors, and the date columns to POSIXct.

Removed the station related columns from the analysis after deciding they would not be very useful.

Added columns for ride’s total duration, day and month, and  hour(which were previously in a single row).

Removed trips with duration of one minute or less, or more than a day. There were 100 rows with the start and end dates exchanged, resulting in negative ride durations. A lot more were 1 second long. 

Used descriptive statistics to find and remove outliers outside 3 standard deviations.

### Analyzing, sharing and acting

The graphs were made with Tableau and can be found here:

https://public.tableau.com/views/cyclistic_16943415600030/pref_tp_bike?:language=pt-BR&:display_count=n&:origin=viz_share_link

Key Findings:

1. **Usage Patterns:**
    - Annual members use the service primarily for commuting, with spikes during rush hours.
    - Casual riders tend to use the service around 18:00, indicating leisure or non-commuting usage.
    - Weekday vs. weekend usage patterns differ significantly, with casual riders dominating on weekends.
2. **Seasonal Trends:** ride numbers correlate with warmer months of the year for both annual members and casual riders. This suggests a seasonal influence on bike usage.
3. **Geographic Differences:** There are geographic differences between where annual members and casual riders tend to ride and dock their bikes. Annual members seem to be more evenly distributed, while casual riders tend to be near the water and have common docking areas.

While the data provided some useful information on how members act differently, it is unsufficient to define the reasons behind it, as well as who the clients are. That said, is best for the company to try and collect more qualitative data to help identify these differences.  

**Questions:**

1. **Customer Surveys:** Consider conducting surveys or interviews with both annual members and casual riders to gain qualitative insights into their motivations and preferences. This would provide more concrete information to guide business decisions.
2. **Why won’t casuals bike to work?** To understand why casual riders predominantly use the service for leisure, you should delve deeper into their demographics and preferences. Are there specific events or attractions near water that attract casual riders?
3. **Seasonal Impact:** Explore how weather and local events may impact seasonal trends. Are there any marketing opportunities to promote annual memberships during peak riding seasons?
4. **Geographic Analysis:** Investigate the geographic differences. Are there areas with potential for increased annual membership conversion? Can the company expand its docking stations or marketing efforts in these areas?
5. **Subscription plans:** how could subscription plans be improved to attend the needs of the bikers? (e.g. monthly, seasonal or weekly subscriptions; or review trip duration limits)
6. **Are casual riders really less viable? why?**

Based only on the gathered information, the suggestions follow:

**Suggestions:**

1. **Targeted Marketing:** Based on the usage patterns, consider creating targeted marketing campaigns. For example, create promotions for annual memberships that emphasize the convenience of daily commuting or explore partnerships with local businesses and events to attract casual riders.
2. **Seasonal Promotions:** To take advantage of the seasonal trends, offer promotions or incentives during peak riding months to encourage casual riders to convert to annual memberships. Incentives for weekend rides could work as well.
3. **Expansion Planning:** Use the geographic insights to guide expansion planning. Evaluate the feasibility of adding docking stations or improving infrastructure in areas with high casual rider concentration.
4. **Feedback Loop:** Establish a feedback loop with customers to continuously gather data on their preferences and needs. This will help in adapting marketing strategies over time.
5. **A/B Testing:** Implement A/B testing for different marketing strategies to determine their effectiveness in converting casual riders into annual members.
