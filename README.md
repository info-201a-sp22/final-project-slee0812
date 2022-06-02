#  FIFA World Cup Statistics
## INFO 201 "Foundational Skills for Data Science" - Spring 2022

### Authors:

Member 1: Sangmin Lee ([slee1998\@uw.edu](mailto:slee1998@uw.edu))\
Member 2: Yanze Li ([yanzel2\@uw.edu](mailto:yanzel2@uw.edu))\
Member 3: Brian Park ([myungp\@uw.edu](mailto:myungp@uw.edu))\
Member 4: Jiaqi Wang ([jiaqiw18\@uw.edu](mailto:jiaqiw18@uw.edu))


Link: Link to your Shiny App here

Please create the necessary files for your multi-page Shiny app in this GitHub repository. Consult the Canvas assignment for more details. Be sure to publish your app on Shinyapps.io.

When you are finished, please add the text from your introductory and concluding pages below. You might want to use this GitHub repository as part of your digital portfolio, so you want this README.md to offer a brief description of the project and key takeaways.

Feel free to delete these instructions for your final README.md file and to make your GitHub repository public if you would like others to be able to see it.

# Introduction

## FIFA World Cup Statistics 1930 to 2018


![Soccer image 1](https://i.ytimg.com/vi/ILOFwBBcGv4/maxresdefault.jpg)

Image source: https://images.app.goo.gl/LsSH5FrSVes24HsM7

With the upcoming 2022 Qatar FIFA World Cup, the bandwagon of soccer has started to roll again. Before this worldwide festival begins, we would like to explore more about the history of the FIFA World Cup. To better acknowledge the history of the FIFA World Cup, different countries’ performance in the World Cup is definitely an important index representing their national soccer standings. In doing so, our main research question starts off with how the winning percentage differs for each country in the FIFA World Cup. The first World Cup has started in 1930 and lasted until 2018, which was held in various countries for 88 years, although some World Cups were not held in 1942 and 1946 due to World War II. With this exceptional historical event, our goal of this project is to statistically investigate and categorize the world’s festival of the World Cup. Our main questions are:

* What is the winning percentage of different countries over the history of FIFA World Cups?
* Does home advantage in the World Cup actually affects teams to score?
* What is the correlation between matches played and goals scored in the World Cup?

We used two datasets.

First dataset: [World Cup dataset 1930 to 2014](https://www.kaggle.com/datasets/abecklas/fifa-world-cup?select=WorldCupMatches.csv)

Second dataset: [World Cup dataset 2018](https://fixturedownload.com/results/fifa-world-cup-2018)

In the first dataset, a data scientist Andre Becklas collected the data and which was collected from the FIFA World Cup Archive website. In the second dataset, fixturedownload.com collected the data. We found an additional 2018 World Cup dataset because the data for 2018 World Cup data was missing in the first dataset. We combined these two datasets to create World Cup data from 1930 to 2018.

Limitations exist to be considered in this dataset. Organizing data by region and presenting them on a map is more challenging than merely plotting them into different charts. Meanwhile, we are not yet sure about how much we can authentically draw from our analysis, even though the statistics themselves might be already helpful enough. The first World Cup started in 1930, so it has been held only 21 times in its history. According to this fact, it is unreasonable to guarantee absolute precision for the use of future predictions.

Past data may not be appropriate for the new changing environment. Many people and experts set the winning rate of soccer based on existing or past data and predict the victory of a particular soccer team. If a new environment is introduced or variables occur, predictions using existing data may not be correct. Soccer is influenced a lot by soccer players. If a country with a low winning percentage has a good soccer player, the country’s winning percentage rises sharply up.

Moreover, there are cases where the top-ranking players during the regular season of the World Cup year might have suffered from malicious fouls, disciplinary penalties, or in-game red cards that prevented them from entering or winning the finals or other decisive games in the World Cup. It is possible that the occurrence of unexpected injuries or incidents may severely affect the performance of a promising player during the regular season, which also affects the accuracy of the predictions based on our analysis.



![Soccer image 2](https://a3.espncdn.com/combiner/i?img=%2Fphoto%2F2014%2F0304%2Fsoc_g_WCtrophy_d1_1296x729.jpg)

Image source: https://images.app.goo.gl/GMoCNZM5d29rJJYv6


# Conclusion / Summary Takeaways
## Table of Summary Information

| Statistics | Numbers
| -------------     |:-------------:
| Total Games      | 1705
| Highest Winning Percentage (Brazil)      | 70
| Lowest Winning Percentage (Tunisia)      | 13
| Cumulative Attendance in World Cup except 2018      | 37457647
| Most Goals Scored in Single Game (including home team and away team)      | 12

## Three Specific Takeaways

### A. First Takeaway

Through the winning percentage of other countries in the history of the FIFA World Cup, we can see which countries are good at soccer and how many have won. We found that Brazil has the highest winning percentage and has almost 70 percent winning percentage in World Cup history. Also, Tunisia has the lowest winning percentage and has about 13 percent winning percentage. This does not necessarily mean that the country is good at soccer, but we can anticipate from this data whether a country is good at soccer or not since it is already competitive to earn a seat in FIFA World Cup. Meanwhile, it is a analysis of cumulative data so some data are data from Finals, and some are from Semi-Finals. The data from Final rounds and Semi-Final rounds can tell more than matches played in other rounds. Thus, there should not be a directly clear correlation between the winning percentage and the overall

![Soccer image 1](https://imageio.forbes.com/specials-images/imageserve/61c1aa77350ef090aa981514/France-v-Croatia---2018-FIFA-World-Cup-Russia-Final/960x0.jpg?format=jpg&width=960)

Image source: https://www.forbes.com/sites/zakgarnerpurkis/2021/12/21/why-having-a-world-cup-every-two-years-wont-stop-the-european-power-shift/?sh=5798077d519b

![Soccer image 2](https://images.indianexpress.com/2018/06/neymar-75912.jpg)

Image source: https://indianexpress.com/article/fifa/fifa-world-cup-2018-neymars-tears-not-a-sign-of-weakness-says-brazil-coach-5234604/
### B. Second Takeaway

We discovered that 1705 games were played in entire World Cup history. The first World Cup has started in 1930 and lasted until 2018, which was held in various countries for 88 years, although some World Cups were not held in 1942 and 1946 due to World War II. Except 2018 World Cup, the cumulative attendance in World Cup is 37457647 people. This means that the popularity of the World Cup is enormous and that many people are interested.

![Soccer image 3](https://i.cbc.ca/1.2057932.1381895189!/httpImage/image.jpg_gen/derivatives/original_1180/soccer-city-crowd-584.jpg)

Image source: https://www.cbc.ca/sports/soccer/world-cup-attendance-3rd-highest-ever-fifa-1.869297

### C. Third Takeaway

We found something very interesting during our World Cup research. We were curious about how many goals each side scored in a single World Cup match. We found the highest number of goals by combining the home and away team, 12 goals. The general trend between comparison of home scores and away scores show us that places where the matches happen is an important factors in determining the result. In the long history of FIFA world cup, the home scores is generally and significantly higher than away scores. 

![Soccer image 4](https://theworld.org/_next/image?url=https%3A%2F%2Fmedia.pri.org%2Fs3fs-public%2Fstory%2Fimages%2Fgoal2.jpg&w=600&q=75)

Image source: https://theworld.org/stories/2014-06-23/how-can-us-advance-world-cup

## Discussion of the most important insight or thing you learned from your analysis
The most important insight is that I found that a certain country's ability in soccer games is constantly changing. Countries like Brazil, Argentina, and Germany all had their peaks. But there are times they were down. There are times they are strong and times they are weak. For instance, through the dataset, we can see Brazil won the world cup five times and have times tumbled out of the tournament. Soccer players from different countries, generation by generation, inherit glory and spirit from former players and strive to bring honor to their home country. One generation down, next-generation rise. I guess the world cup just exists in a romantic way like this, four years a time, witness the rise and down of the national soccer team, live long and prosper.

## Discussion of the broader implications of this insight

Many people have been enthusiastic about the World Cup, and during the World Cup, attention was focused. There must be a lot of research on the World Cup. It is also expected that during the World Cup, our data will be used when using statistical data in broadcasting or news. For example, when Germany and England play soccer, the news tells how many times Germany and England won and talks about the winning rate together to predict which country will win.

More importantly, the implications of the statistical analysis of our data could help guide the dynamics of the transfer market, as champion players and top scorers in the World Cup become more favored by top clubs. Additionally, the champion team and players would also attract significant investments and commercial opportunities. Therefore, with the support of statistical analysis, investors and businesses could have a deeper understanding of the current performance and future prospects of specific players and teams. Hence, they would be able to allocate and direct their resources and investment in a more accurate and profitable fashion by seizing the capital opportunities brought about by the newly recognized players.
