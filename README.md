# Collecting Trump Tweets


Collecting and analysing tweets from [@realDonaldTrump](https://twitter.com/realdonaldtrump). 

The script is based on my earlier work on collecting tweets from [Bosnian politicians](https://github.com/annerosenisser/tweets_bosnia).

Each time the Python script is run, it looks up the 200 latest tweets from @realDonaldTrump and adds them to the json file in case the tweet is not yet there (no duplication of tweets). This signifies that no Twitter stream is necessary, but that you are very likely to get all relevant tweets if you run the script often enough (I have a cronjob that runs it once a day).
