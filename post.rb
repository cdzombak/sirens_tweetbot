#encoding: UTF-8

require 'require_relative'
require 'twitter'
require_relative 'twitter_init'

$options = { :tweet => true, :city => false, :county => false, :fun => false }

opt_parser = OptionParser.new do |opt|
  opt.on("--no-tweet", "Do not post anything to Twitter") do
    $options[:tweet] = false
  end

  opt.on("--city", "Post City-specific message") do
    $options[:city] = true
  end

  opt.on("--county", "Post County-specific message") do
    $options[:county] = true
  end

  opt.on("--fun", "Post fun message") do
    $options[:fun] = true
  end
end

opt_parser.parse!

if !$options[:city] && !$options[:county]
  STDERR.puts("[!] Must specify --city or --county.")
  Process.exit(1)
end

def post_tweet(tweet)
  puts("Posting: '" + tweet + "'")
  if $options[:tweet]
    $client.update(tweet)
  else
    puts("[i] Skipped posting to live Twitter due to CLI options")
  end
end

if $options[:city]
  tweet = "Ann Arbor is scheduled to test its outdoor emergency sirens at 1 PM today. Info: https://www.a2gov.org/departments/emergency-management/Pages/Alert-Systems.aspx"
  post_tweet(tweet)
end

if $options[:county]
  tweet = "Washtenaw County is scheduled to test its outdoor emergency sirens at noon today. Info: https://www.washtenaw.org/1785/Washtenaw-County-Outdoor-Warning-Siren-S"
  post_tweet(tweet)
end

if $options[:fun]
  tweet = "SIRENS!!! TAKE COVER!!!"
  post_tweet(tweet)
end
