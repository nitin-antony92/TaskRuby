 require_relative '../hashtag_test'
 RSpec.describe "Displaying tweets with certain hashtags" do 
 	let(:demo) { Twitter.new }
 	context "Displaying tweet " do 
 		it "should return true " do 
 			message= demo.tweet("-hash_tag","ruby")
 			expect(message).to eq true
 		end
 	end
 	context "Displaying error if wrong hashtag argument is given " do 
 		it "should raise error  " do 

 			expect{demo.tweet("hash_tag","da")}.to raise_error(ArgumentError)
 		end
 	end
 	context "Displaying error if second argument is nil " do 
 		it "should raise error  " do 

 			expect{demo.tweet("hash_tag","")}.to raise_error(ArgumentError) 
 		end
 	end

 end
 
