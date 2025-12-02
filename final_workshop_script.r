# R You Ready for Reddit Data Workshop
# UM Libraries / SSDS / December 2, 2025

# Install and load the RedditExtractoR package
# install.packages("RedditExtractoR")
library(RedditExtractoR)

# 1. How to Search Threads by Keyword: find_thread_urls()
?find_thread_urls # this code pulls up the help menu for that function
# Arguments: keywords, sort_by, subreddit, period
# Let's find threads from the past week about Lane Kiffin
threads_about_lane <- find_thread_urls(keywords = "Lane Kiffin", period = "week")

# this can be hard to see so let's export out as a csv file
# first load the tidyverse to have the write_csv function available
library(tidyverse)
write_csv(threads_about_lane, "threads_about_lane.csv")

# 2. What if we want to find everything a Reddit user has posted? 
?get_user_content # pulls up the help menu
soil_user <- get_user_content("Ok-Soil-5133")
# column out of a df, within a list
soil_user$`Ok-Soil-5133`$threads
soil_comments <- soil_user$`Ok-Soil-5133`$comments
View(soil_comments)
soil_user$`Ok-Soil-5133`$about

soil_comments |> count(subreddit, sort = T) # this tells you where he posts

# 3. Searching for subreddits / communities by keyword
olemiss <- find_subreddits("Ole Miss")
View(olemiss)

# 4. How to grab the comments from a thread
grad_school_hard_comments <- get_thread_content("https://www.reddit.com/r/GradSchool/comments/1ggtvic/is_grad_school_really_that_hard/")
# that creates two lists so you need to pull the comments out the second list
gs_hard_comments <- grad_school_hard_comments$comments
View(gs_hard_comments) # all the comments from that particular post
