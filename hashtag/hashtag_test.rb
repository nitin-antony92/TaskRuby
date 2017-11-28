require 'rubygems'
require 'oauth'
require 'json'
class Twitter
  def tweet(argument1,hashtag)
    ARGV[0]=argument1
    ARGV[1]=hashtag
    
raise ArgumentError, 'use -hashtag option with hashtag' unless !ARGV[0].nil?
raise ArgumentError, 'missing -hash_tag' unless !ARGV[1].nil?
raise ArgumentError, 'invalid Argument' unless ARGV[0].to_s == '-hash_tag'


tag="#{hashtag}"

temp= tag.start_with?('#')
if(temp)
tag.slice!(0)
end
# Parse a response from the API and return a  object.
# All requests will be sent to this server.
baseurl = "https://api.twitter.com"

# Verify credentials returns the current user in the body of the response.

address = URI("#{baseurl}/1.1/search/tweets.json?q=%23#{tag}&result_type=mixed&count=50")

# Set up HTTP.
http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# setting user credentials 
consumer_key = OAuth::Consumer.new(
  "8GL8kUSM3GWbiiUS62uJHgpOS",
  "pdIZKdoa4NALoinzH8ddwWaFMvIR5WCwGc266uFcS2gk5IYKGu")
access_token = OAuth::Token.new(
  "328572665-mLrMACjBbjS08hw9wRINkR46n3PLY337qDFm8TgC",
  "px4xIFl9LDPhiKtzfOBm07FH2Yv82wHbzhd7LoY0cjEFG")
# Issue the request.
request = Net::HTTP::Get.new address.request_uri
request.oauth! http, consumer_key, access_token
http.start
response = http.request(request)


  # Check for a successful request
  if response.code == '200'
    tweets =JSON.parse(response.body)
    tweets["statuses"].each do |tweet|
      puts " <#{tweet['text']}>,<#{tweet['created_at']}>,<#{tweet['retweet_count']}>,<#{tweet['user']['name']}>,<#{tweet['user']['profile_image_url']}> "
      puts "\n"
      return true
    end
    
 else
    # There was an error issuing the request.
    puts "Expected a response of 200 but got #{response.code} instead"
return response.code
  end

  
end
end

