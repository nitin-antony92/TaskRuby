require_relative '../log'
RSpec.describe "wrting log to server.log file" do 
  let(:demo) { Demo.new }
  context "writing log to an existing bucket" do 
   it "should write log to server.log" do 
          name = 'userscfsfrju11sdfsdfkjuykj' #put bucket name
          region = "us-east-2" #put region
          message = demo.write_log(name, region) 
          expect(message).to eq true
        end
      end
       context "raise error if bucket belongs to other user" do 
   it "should raise error" do 
          name = 'log' #put bucket name
          region = "us-east-2" #put region
          message = demo.write_log(name, region) 
          expect(message).to eql "Sorry Bucket cant be created"
        end
      end
      context "bucket name not valid or wrong region entered " do 
   it "should raise error" do 
          name = 'userscfsfrju11sdfsdfkjuykj' #put bucket name
          region = "us-eastc-2" #put region
          message = demo.write_log(name, region) 
          expect(message).to eql "wrong region name entered or invalid bucket name"
        end
      end
    end
    RSpec.describe "list buckets in a region" do
      let(:demo) { Demo.new }
      context "Check region selected exist?" do 
        it "should return false " do
        region="us-eastc-2" 
          expect(demo.list_buckets(region)).to eq false 
        end
      end 
      context "listing buckets in a region" do 
        it "should return true " do
        region="ap-south-1" 
          expect(demo.list_buckets(region)).to eq true 
        end
      end 
    end