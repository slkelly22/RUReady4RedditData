# R You Ready for Reddit Data Workshop
# December 2, 2025

# Install and load the RedditExtractoR package
# install.packages("RedditExtractoR")
library(RedditExtractoR)

# 1. How to Search Threads by Keyword: find_thread_urls()
?find_thread_urls
# Arguments: keywords, sort_by, subreddit, period
# Let's find threads from the past week about Lane Kiffin
threads_about_lane <- find_thread_urls(keywords = "Lane Kiffin", period = "week")

# this can be hard to see so let's export out as a csv file
# first load the tidyverse to have the write_csv function
library(tidyverse)
write_csv(threads_about_lane, "threads_about_lane.csv")

# 2. What if we want to find everything a Reddit user has posted? 
?get_user_content
soil_user <- get_user_content("Ok-Soil-5133")
# column out of a df, within a list
soil_user$`Ok-Soil-5133`$threads
soil_comments <- soil_user$`Ok-Soil-5133`$comments
View(soil_comments)
soil_user$`Ok-Soil-5133`$about

soil_comments |> count(subreddit, sort = T) # this tells you where he posts
