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
