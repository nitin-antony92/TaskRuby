# Append log 

these scripts do the following

1.append data to server.log file
example 
2017-11-22 02:03:29 UTC < this is my first message >
2017-11-22 02:03:49 UTC < this is my second message >
2.get list of all buckets and display its permission

## Getting Started

To get started
1.create a role which give full s3 access to the ec2 machine you wish to run this code on
Or
2.create a directory /.aws/credentials in the home directory and put the below content
[default]
aws_access_key_id=<your access key>
aws_secret_access_key=<your secret key> 

### Prerequisites

ruby should be installed in the system



### Installing
gem install aws-sdk




## Running the tests

irb -r ./log.rb
d=Demo.new
#calling the bukect name to create or append to server.log
d.write_log('bucket_name','bucket_region')
#the above code either create a bucket or give you the reference to the existing bucket

irb(main):012:0> d.write_log('itsallrelative','ap-south-1')
Enter the log message
this is my first message
2017-11-22 02:03:29 UTC < this is my first message >
=> nil
irb(main):013:0> d.write_log('itsallrealtive','ap-south-1')
Enter the log message
this is my second message
2017-11-22 02:03:29 UTC < this is my first message >
2017-11-22 02:03:49 UTC < this is my second message >


###SECOND FUNCTION ->LISTING BUCKETS
d.list_buckets
enter the region name
ap-south-1
 askjhd1233cdsjsd => private
 assdfsdfkjhd1233cdsjsd => private
 elasticbeanstalk-ap-south-1-169677526148 => private
 hellonitinantony => private
 itsallrealtive => private
 itsmagicnitin1 => private
 logasdasdasdasdas => private
 logasdasdasdasdasasd2sad => private
 logasdasdasdasdasdasd => private
 logjhjjhjhbjhbjhniti => private
 logjsndkfnsdkfjnsdfnsdfnfd => private
 logjsndkfnsdkfjnsdfnsdfnfdsdfsdf => private
 nitinhuyta => private
 sdfsdfsdfsdfsdfsd123d2sf => private
 slkjfnkjdnkjsd => READ
 






