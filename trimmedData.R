# chart 1
library(dplyr)
library(ddpcr)
library(stringr)
library(ggplot2)

# dataframe ~2014
soccer_df <- distinct(read.csv("data/WorldCupMatches.csv"))
ff_data <- distinct(read.csv(file = 'data/WorldCupMatches.csv'))


# Create goal difference
soccer_df <- soccer_df %>%
  mutate(goal_diff = Home.Team.Goals - Away.Team.Goals) %>%
  mutate(winner = "")


# sub_df ~2014 Non-Penalties
sub_df <- soccer_df %>%
  filter(winner != "Penalties") %>%
  filter(goal_diff != 0)

sub_df$winner <- ifelse(sub_df$goal_diff > 0, sub_df$Home.Team.Name, sub_df$Away.Team.Name)

sub_df <- sub_df %>%
  select(MatchID, winner)


# sub_df2 ~2014 Draw
sub_df2 <- soccer_df %>%
  filter(winner != "Penalties") %>%
  filter(goal_diff == 0)

sub_df2["winner"][sub_df2["winner"] == ""] <- "Draw"

sub_df2 <- sub_df2 %>%
  select(MatchID, winner)


# sub_df3 ~2014 Penalties
sub_df3 <- soccer_df %>%
  filter(str_detect(Win.conditions, "penalties") == TRUE) %>%
  filter(goal_diff == 0)

sub_df3$winner <- ifelse(str_detect(sub_df3$Win.conditions, sub_df3$Home.Team.Name) == TRUE, sub_df3$Home.Team.Name, sub_df3$Away.Team.Name)

sub_df3 <- sub_df3 %>%
  select(MatchID, winner)


# merge ~2014
soccer_df <- merge_dfs_overwrite_col(soccer_df, sub_df, by = "MatchID")
soccer_df <- merge_dfs_overwrite_col(soccer_df, sub_df2, by = "MatchID")
soccer_df <- merge_dfs_overwrite_col(soccer_df, sub_df3, by = "MatchID")


# wins ~2014
wins_df <- soccer_df %>%
  filter(winner != "Draw") %>%
  group_by(winner) %>%
  summarize(total_wins = n())

colnames(wins_df)[1] <- "country"


# total games ~2014
total_home_games_df <- soccer_df %>%
  group_by(Home.Team.Name) %>%
  summarize(total_home_games = n())

colnames(total_home_games_df)[1] <- "country"

total_away_games_df <- soccer_df %>%
  group_by(Away.Team.Name) %>%
  summarize(total_away_games = n())

colnames(total_away_games_df)[1] <- "country"

wins_df <- left_join(wins_df, total_home_games_df, by = "country")
wins_df <- left_join(wins_df, total_away_games_df, by = "country")


## dataframe 2018
df_2018 <- read.csv("data/world_cup_2018_stats.csv")

df_2018 <- df_2018 %>%
  distinct(Game, .keep_all = TRUE) %>% 
  mutate(winner = "")

df_2018$winner <- ifelse(df_2018$WDL == "D", "Draw", "")


# sub_df 2018 Draw
sub_2018_df <- df_2018 %>%
  filter(WDL != "D")

sub_2018_df$winner <- ifelse(sub_2018_df$WDL == "W", sub_2018_df$Team, sub_2018_df$Opponent)

sub_2018_df <- sub_2018_df %>%
  select(Game, winner)

df_2018 <- merge_dfs_overwrite_col(df_2018, sub_2018_df, by = "Game")


# sub_df 2018 has winner
wins_2018_df <- df_2018 %>%
  filter(winner != "Draw") %>%
  group_by(winner) %>%
  summarize(total_wins_2018 = n())

colnames(wins_2018_df)[1] <- "country"

# total games 2018
total_home_games_2018_df <- df_2018 %>%
  group_by(Team) %>%
  summarize(total_home_2018_games = n())

colnames(total_home_games_2018_df)[1] <- "country"

total_away_games_2018_df <- df_2018 %>%
  group_by(Opponent) %>%
  summarize(total_away_2018_games = n())

colnames(total_away_games_2018_df)[1] <- "country"

wins_2018_df <- left_join(wins_2018_df, total_home_games_2018_df, by = "country")
wins_2018_df <- left_join(wins_2018_df, total_away_games_2018_df, by = "country")


# total wins
wins_df <- left_join(wins_df, wins_2018_df, by = "country")
wins_df[is.na(wins_df)] <- 0

wins_df <- wins_df %>%
  mutate(total_games = total_away_games + total_home_games + total_away_2018_games + total_home_2018_games) %>% 
  mutate(total_wins_final = total_wins + total_wins_2018) %>% 
  mutate(winning_perc = 100 * total_wins_final / total_games)

options(digits = 4)

wins_df <- wins_df %>%
  select(country, total_wins_final, total_games, winning_perc)

# 2014
ff_data <- ff_data %>%
  mutate(total_goals = Home.Team.Goals + Away.Team.Goals)


# 2018
ff_data_2018 <- read.csv("data/world_cup_2018_stats.csv")
ff_data_2018 <- ff_data_2018 %>% 
  distinct(Game, .keep_all = TRUE)

ff_data_2018 <- ff_data_2018 %>% 
  mutate(total_goals_scored = Goals.For + Goals.Against)

total_goals_2014 <- max(ff_data$total_goals)

total_goals_2018 <- max(ff_data_2018$total_goals_scored)

total_goals <- max(total_goals_2014, total_goals_2018)

# Table
table_df <- list()

table_df$total_games <- sum(wins_df$total_games)

table_df$highest_winning_perc <- round(wins_df %>% 
                                         filter(winning_perc == max(winning_perc)) %>% 
                                         pull(winning_perc), digits = 0)

table_df$lowest_winning_perc <- round(wins_df %>% 
                                        filter(winning_perc == min(winning_perc)) %>% 
                                        pull(winning_perc), digits = 0)

table_df$cumulative_attendance <- sum(ff_data$Attendance, na.rm = TRUE)

table_df$most_goals_scored <- max(total_goals_2014, total_goals_2018)


# HS/AS
WorldCup <- read.csv("data/WorldCups.csv")
fff_data <- read.csv(file = "data/WorldCupMatches.csv")
fff_data_2018 <- read.csv(file = "data/world_cup_2018_stats.csv")

fff_data_2018 <- fff_data_2018 %>%
  distinct(Game, .keep_all = TRUE)


goals <- fff_data %>%
  group_by(Year) %>%
  summarise(Home_goals = sum(Home.Team.Goals), Away_goals = sum(Away.Team.Goals))

goals_2018 <- fff_data_2018 %>%
  summarize(Home_goals_2018 = sum(Goals.For), Away_goals_2018 = sum(Goals.Against))

goals[21, 1] <- 2018
goals[21, 2] <- goals_2018 %>%
  pull(Home_goals_2018)
goals[21, 3] <- goals_2018 %>%
  pull(Away_goals_2018)


goals_home_max <- goals %>%
  filter(Home_goals == max(Home_goals)) %>%
  pull(Year)

goals_away_max <- goals %>%
  filter(Away_goals == max(Away_goals)) %>%
  pull(Year)