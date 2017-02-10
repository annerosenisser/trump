# Collecting Trump Tweets


Collecting and analysing tweets from [@realDonaldTrump](https://twitter.com/realdonaldtrump). 

The script is based on my earlier work on collecting tweets from [Bosnian politicians](https://github.com/annerosenisser/tweets_bosnia).

Each time the Python script is run, it looks up the 200 latest tweets from [@realDonaldTrump](https://twitter.com/realdonaldtrump) and adds them to the json file in case the tweet is not yet there (no duplication of tweets). This signifies that no Twitter stream is necessary, but that you are very likely to get all relevant tweets if you run the script often enough (I have a cronjob that runs it once a day -- for information on how to set up your own cronjob, check out my [cheatsheet](https://github.com/annerosenisser/cheatsheet#cronjobs-and-crontab)).

The earliest tweet in the dataset is from October 2016; and I will be collecting new tweets continuously throughout the term of Trump's presidency.

