# sirens_tweetbot

Post alerts to [a2mi.social/@siren_test_reminders](https://a2mi.social/@siren_test_reminders) when Ann Arbor or Washtenaw County has a scheduled emergency siren test.

## Setup

**n.b.** The server running this must be set to the Eastern timezone (`America/Detroit` or `America/New York` will work), otherwise you'll need to adjust the scheduling in the provided crontab file.

1. Install [mastodon-post](https://github.com/cdzombak/mastodon-post). If you want to run it via Docker, you'll need to adjust [the provided crontab file](https://github.com/cdzombak/sirens_tweetbot/blob/master/crontab.d/siren-test-reminders.cron) accordingly.
2. Clone this repo to your server.
3. Copy [`.env.template`](https://github.com/cdzombak/sirens_tweetbot/blob/master/.env.template) to `.env` and populate it, following the [instructions for mastodon-post](https://github.com/cdzombak/mastodon-post/blob/main/README.md#credentials-and-server-configuration).
4. Copy the content of [the provided crontab file](https://github.com/cdzombak/sirens_tweetbot/blob/master/crontab.d/siren-test-reminders.cron) into your user's crontab, or place it in `/etc/crontab.d`.
5. Adjust the `SIREN_TEST_REMINDERS_DIR` variable in the crontab to reflect the repo's location on the server. This allows `mastodon-post` to automatically discover the `.env` file and the cron job to read posts from [the `messages` directory](https://github.com/cdzombak/sirens_tweetbot/blob/master/messages).
