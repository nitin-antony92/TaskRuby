require 'aws-sdk'
class Demo
def initialize # Instance variables
 @regions = ["us-east-2", "us-east-1", "us-west-1", "us-west-2", "ap-south-1", "ap-northeast-2", "ap-southeast-1", "ap-southeast-2", "ap-northeast-1", "ca-central-1", "eu-central-1", "eu-west-1", "eu-west-2", "sa-east-1"]
@entry=""
end
def write_log(name, region)
  begin
    s3 = Aws::S3::Resource.new(region: region)
    timestamp = Time.now.getutc
    puts "Enter the log message"
    log_message = gets.chomp
    @entry = "#{timestamp } < #{log_message} >"
    begin
      bucket = s3.bucket(name)
#checking whether bucket exist
      if (bucket.exists?)
        obj = bucket.object('server.log')
#checking whether object exist
        if (obj.exists?)
#getting the data from the file
          previous_data = obj.get.body.string
          #appending data 
          new_data = previous_data + "\n" + @entry
#updating changes
          obj.put({ body: new_data })
        else

          obj.put({ body: entry })
        end

      else
#creating a new bucket    
        s3.create_bucket(bucket: name)
        bucket = s3.bucket(name)
        #creating a new file
        obj = bucket.object('server.log')
        obj.put({ body: @entry })

      end
#displaying the contents of server.log
      puts obj.get.body.string
    rescue Aws::S3::Errors::ServiceError
      return "Sorry Bucket cant be created"
    end

  rescue
    return "wrong region name entered or invalid bucket name"
  end
  return true
end


def list_buckets(region)
  #puts @regions
  a = @regions
  #puts "enter the region name"
  #geting user input 
  selected_region = region
  if a.include? selected_region

    s3 = Aws::S3::Resource.new(region: selected_region)
    s3.buckets.each do |b|

      s3_region = b.client.get_bucket_location(bucket: b.name).location_constraint
  # checking the bucket region

        if (s3_region == selected_region)
  #checking for public permission
          if (!b.acl.grants[1].nil?)

            puts " #{b.name} => #{b.acl.grants[1][1]}"
          else
            puts " #{b.name} => private"
          end

        end

      end

    else
      return false
    end
    return true
  end

end