# Prep for R you Ready for Reddit Data Workshop
# https://rpubs.com/tanlan/redditapi

# Give context re: Reddit
# Reddit has millions of subreddits - "r/XYZ"
# How normally you would scrape Reddit
# R Wrapper for the Reddit API. Note the Python Wrapper for the Reddit API is PRAW (Python Reddit API Wrapper)

# Give context to who created the package, etc. 
# How this package is different form other options (i.e, How many you can pull, you don't have to authenticate, etc.)

# install.packages("RedditExtractoR)
library(RedditExtractoR)

# 1. searching for a particular keyword
?find_thread_urls # two options: search by keyword, search by home page
# arguments: keywords, sort_by, subreddit, period
lane_kiffin <- find_thread_urls(keywords = "lane kiffin", period = "week")
View(lane_kiffin)
str(lane_kiffin) # df
# look at the object, sort by # of comments, etc. 
# can also export object with write_csv() function

# 2. what if we wanted to pull an individual's posts? You can do this
# found someone posting about Lane Kiffin and now pulling all his other posts in Reddit
user <- "DawgsNRoses"
Dawgs_content <- get_user_content(user)
# column out of a df, within a list
Dawgs_content$DawgsNRoses$threads
Dawgs_comments <- Dawgs_content$DawgsNRoses$comments
View(Dawgs_comments)
Dawgs_content$DawgsNRoses$about

library(tidyverse)
Dawgs_comments |> count(subreddit, sort = T) # this tells you where he posts

# 3. finding subreddits by keywords
olemiss <- find_subreddits("Ole Miss")
View(olemiss)

# 4. get_thread_content, grabs the comments from a thread
grad_school_hard_comments <- get_thread_content("https://www.reddit.com/r/GradSchool/comments/1ggtvic/is_grad_school_really_that_hard/")
# that creates two lists so I need to pull the comments out the second list
gs_hard_comments <- grad_school_hard_comments$comments
View(gs_hard_comments) # all the comments from that particular post
