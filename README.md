# siren_tweetbot

Post alerts to [@ArborWX](https://twitter.com/arborwx) when Ann Arbor or Washtenaw County has a scheduled emergency siren test.

## Setup

1. Sign into [apps.twitter.com](https://apps.twitter.com) with your Twitter credentials
1. Create an application for posting siren tweets
1. Set its permissions to read/write and generate OAuth credentials
1. Create a file named `twitter_init.rb` in this directory with the OAuth credentials
1. Upload to your server
1. `bundle install --path Vendor/bundle`
1. Test it with `bundle exec ruby post.rb --no-tweet`
1. Schedule it to run regularly with cron

### Crontab

**nb.** The server running this should be set to the Eastern timezone (`America/Detroit` or `America/New York` will work), otherwise this scheduling gets more complicated.

```
# The City of Ann Arbor ... sirens are tested every second Tuesday of the month at 1 p.m., with a one-minute wail. Testing of sirens is performed from March through November.
# https://www.a2gov.org/departments/emergency-management/Pages/Alert-Systems.aspx

# m  h    dom   mon    dow  command
59   12   8-14  3-11   *    test $(date +\%u) -eq 2 && cd /home/cdzombak/scripts/siren_tweetbot && /usr/bin/bundle exec /usr/bin/ruby /home/cdzombak/scripts/siren_tweetbot/post.rb --city

# All Washtenaw County operated sirens will be tested at noon on the first Saturday of every month from March through October.
# https://www.washtenaw.org/1785/Washtenaw-County-Outdoor-Warning-Siren-S

# m  h    dom   mon    dow  command
59   11   1-7   3-10   *    test $(date +\%u) -eq 6 && cd /home/cdzombak/scripts/siren_tweetbot && /usr/bin/bundle exec /usr/bin/ruby /home/cdzombak/scripts/siren_tweetbot/post.rb --county
```

## Command-line options

* `--city`: Post the message associated with the City's tests.
* `--county`: Post the message associated with the County's tests.
* `--no-tweet`: Do not post anything to Twitter.
