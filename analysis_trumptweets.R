# Analysis of Trump's tweets. 

# (c) Annerose Nisser, 2017-02-08


# Empty workspace
rm(list = ls())
setwd("~/Documents/15-16/Code/trump")

# Displaying Bosnian characters correctly: 
Sys.setlocale("LC_CTYPE", "UTF-8")

# Inspiring links: 
# http://juliasilge.com/blog/Ten-Thousand-Tweets/

# --------------------------- #
# Load required packages ----
require(jsonlite)
# require(lubridate) # for easily cleaning time stamps
# --------------------------- #
# Important: don't have the package rjson loaded!! 
# rjson also has the command fromJSON, which could mask
# the command from jsonlite. 
# fromJSON only works with jsonlite, not rjson! 
detach("package:rjson", unload=TRUE)


tweets_path <- "data/trump_tweets.txt"

tweets <- fromJSON(tweets_path,
                     simplifyDataFrame = T, flatten=TRUE)

# ------------------------------ # 
names(tweets)

# Check whether there are any duplicate tweets (= 
# check that the procedure of NOT adding duplicate 
# tweets to the file effectively works):
length(tweets$id_str)

length(unique(tweets$id_str)) 
# yes, the procedure works efficiently. There is only one 
# duplicate (probably at the beginning of the file?)
tweets[duplicated(tweets$id_str, fromLast = TRUE), ]
tweets[duplicated(tweets$id_str), ]

# Exclude those duplicates: 
tweets <- tweets[!duplicated(tweets$id_str), ]

# ------------------------------ # 
table(tweets$created_at)

table(tweets$user.lang)

table(tweets$lang)
table(tweets$place.country_code)
# ------------------------------ # 
# Plot the temporal distribution of the tweets: 

class(tweets$created_at)

time <- tweets$created_at
# time[200:500]

# Extract the relevant time variable (create function to re-use later): 
time_f <- function(time) {
  time <- paste0(substring(time, 5, 10), ",", substring(time, 26, 30))
  time <- as.Date(time, format = "%b%d, %Y") # see http://www.statmethods.net/input/dates.html
  return(time)
}

time <- time_f(time)
# time <- time[time>=as.Date("2017-01-01")] # subset time just to 2017
head(time)

# hist(time, breaks = 200)
# The temporal distribution looks quite ok. 

# Plot the number of daily tweets
plot(as.Date(names(table(time))), table(time), type = "l", 
     yaxt = "n", xlab = "day", "ylab" = "# daily tweets")
axis(2, at = pretty(table(time)), labels = pretty(table(time)))
abline(v = as.Date("2017-01-20"), col = "red", cex = 2, lty = 2)
text(as.Date("2017-01-20") - 0.5, mean(table(time)), "inauguration day",
     srt = 90, col = "red")

# dev.print(pdf, width = 12, height = 6, file="graphs/num_daily_tweets.pdf")

# ------------------------------ # 
