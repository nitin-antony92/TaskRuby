require 'twitter'
#checking the arguments
raise ArgumentError, 'use -hashtag option with hashtag' unless !ARGV[0].nil?
raise ArgumentError, 'missing -hash_tag' unless !ARGV[1].nil?
raise ArgumentError, 'invalid Argument' unless ARGV[0].to_s == '-hash_tag'
@options =  ARGV[0]
@hashtag = ARGV[1]
# setting the configuration
client = Twitter::REST::Client.new do |config|
	config.consumer_key        = "8GL8kUSM3GWbiiUS62uJHgpOS"
	config.consumer_secret     = "pdIZKdoa4NALoinzH8ddwWaFMvIR5WCwGc266uFcS2gk5IYKGu"
	config.access_token        = "328572665-mLrMACjBbjS08hw9wRINkR46n3PLY337qDFm8TgC"
	config.access_token_secret = "px4xIFl9LDPhiKtzfOBm07FH2Yv82wHbzhd7LoY0cjEFG"
end
#validating into a hashtag
temp= @hashtag.start_with?('#')
if(temp)

else
	@hashtag= "#"+ @hashtag
end

tweets=client.search(@hashtag, lang: "en")
tweets.each do |b|
	#<Tweet text>,<Date Created>,<re tweet count>,<User name>,<User profile image url>
	puts "< #{b.text} >,< #{b.created_at} >, < #{b.retweet_count} >,< #{b.user.name} >,< #{b.user.profile_image_url} > "
	puts "\n"
	
end
